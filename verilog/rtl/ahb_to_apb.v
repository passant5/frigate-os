// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`timescale 			1ns/1ps
`default_nettype 	none

//-----------------------------------------------------------------------------
// Abstract : Simple AHB to APB bridge
//-----------------------------------------------------------------------------
// The bridge requires PCLK to be synchronised to HCLK
// PCLK could be a fraction of HCLK frequency

module ahb_to_apb #(
    parameter       ADDRWIDTH = 32,
                    REGISTER_RDATA = 1,
                    REGISTER_WDATA = 1,
                    CLK_RATIO = 2
  )(
    input  wire                 HCLK,      // Clock
    input  wire                 HRESETn,   // Reset

    input  wire                 HSEL,      // Device select
    input  wire [ADDRWIDTH-1:0] HADDR,     // Address
    input  wire           [1:0] HTRANS,    // Transfer control
    input  wire           [2:0] HSIZE,     // Transfer size
    input  wire                 HWRITE,    // Write control
    input  wire                 HREADY,    // Transfer phase done
    input  wire          [31:0] HWDATA,    // Write data

    output reg                  HREADYOUT, // Device ready
    output wire          [31:0] HRDATA,    // Read data output
    // APB Output
    output wire [ADDRWIDTH-1:0] PADDR,     // APB Address
    output wire                 PENABLE,   // APB Enable
    output wire                 PWRITE,    // APB Write
    output wire          [31:0] PWDATA,    // APB write data
    output wire                 PSEL,      // APB Select

    // APB Input
    input  wire          [31:0] PRDATA,    // Read data for each APB slave
    input  wire                 PREADY    // Ready for each APB slave
  );

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------

  wire                   PSLVERR = 1'b0;
  reg  [ADDRWIDTH-3:0]   addr_reg;    // Address sample register
  reg                    wr_reg;      // Write control sample register
  reg            [2:0]   state_reg;   // State for finite state machine

  wire                   apb_select;   // APB bridge is selected
  wire                   apb_tran_end; // Transfer is completed on APB
  reg            [2:0]   next_state;   // Next state for finite state machine
  reg           [31:0]   rwdata_reg;   // Read/Write data sample register

  wire                   reg_rdata_cfg; // REGISTER_RDATA paramater
  wire                   reg_wdata_cfg; // REGISTER_WDATA paramater

  reg                    sample_wdata_reg; // Control signal to sample HWDATA

  wire                   PCLKEN;

  // -------------------------------------------------------------------------
  // State machine
  // -------------------------------------------------------------------------
  localparam [2:0] ST_IDLE      = 3'b000; // Idle waiting for transaction
  localparam [2:0] ST_APB_WAIT  = 3'b001; // Wait APB transfer
  localparam [2:0] ST_APB_TRNF  = 3'b010; // Start APB transfer
  localparam [2:0] ST_APB_TRNF2 = 3'b011; // Second APB transfer cycle
  localparam [2:0] ST_APB_ENDOK = 3'b100; // Ending cycle for OKAY
  localparam [2:0] ST_APB_ERR1  = 3'b101; // First cycle for Error response
  localparam [2:0] ST_APB_ERR2  = 3'b110; // Second cycle for Error response
  localparam [2:0] ST_ILLEGAL   = 3'b111; // Illegal state

  // PCLKEN Logic
  reg [2:0] pclken_cntr;
  always @(posedge HCLK, negedge HRESETn)
    if(!HRESETn)
      pclken_cntr <= 3'h0;
    else
      if(pclken_cntr == 3'h0)
        pclken_cntr <= CLK_RATIO - 1'b1;
      else
        pclken_cntr <= pclken_cntr - 1'b1;

  assign PCLKEN = (pclken_cntr == 3'h0);

  assign reg_rdata_cfg = (REGISTER_RDATA==0) ? 1'b0 : 1'b1;
  assign reg_wdata_cfg = (REGISTER_WDATA==0) ? 1'b0 : 1'b1;

  // Generate APB bridge select
  assign apb_select = HSEL & HTRANS[1] & HREADY;
  // Generate APB transfer ended
  assign apb_tran_end = (state_reg==3'b011) & PREADY;

  // Sample control signals
  always @(posedge HCLK or negedge HRESETn)begin
    if (~HRESETn)
    begin
      addr_reg  <= {(ADDRWIDTH-2){1'b0}};
      wr_reg    <= 1'b0;
    end
    else if (apb_select) // Capture transfer information at the end of AHB address phase
    begin
      addr_reg  <= HADDR[ADDRWIDTH-1:2];
      wr_reg    <= HWRITE;
    end
  end

  // Sample write data control signal
  // Assert after write address phase, deassert after PCLKEN=1
  wire sample_wdata_set = apb_select & HWRITE & reg_wdata_cfg;
  wire sample_wdata_clr = sample_wdata_reg & PCLKEN;

  always @(posedge HCLK or negedge HRESETn)begin
    if (~HRESETn)
      sample_wdata_reg <= 1'b0;
    else if (sample_wdata_set | sample_wdata_clr)
      sample_wdata_reg <= sample_wdata_set;
  end

  // Generate next state for FSM
  // Note : case 3'b111 is not used.  The design has been checked that
  //        this illegal state cannot be entered using formal verification.
  always @(state_reg or PREADY or PSLVERR or apb_select or reg_rdata_cfg or
             PCLKEN or reg_wdata_cfg or HWRITE)
  begin
    case (state_reg)
      // Idle
      ST_IDLE :
      begin
        if (PCLKEN & apb_select & ~(reg_wdata_cfg & HWRITE))
          next_state = ST_APB_TRNF; // Start APB transfer in next cycle
        else if (apb_select)
          next_state = ST_APB_WAIT; // Wait for start of APB transfer at PCLKEN high
        else
          next_state = ST_IDLE; // Remain idle
      end
      // Transfer announced on AHB, but PCLKEN was low, so waiting
      ST_APB_WAIT :
      begin
        if (PCLKEN)
          next_state = ST_APB_TRNF; // Start APB transfer in next cycle
        else
          next_state = ST_APB_WAIT; // Wait for start of APB transfer at PCLKEN high
      end
      // First APB transfer cycle
      ST_APB_TRNF :
      begin
        if (PCLKEN)
          next_state = ST_APB_TRNF2;   // Change to second cycle of APB transfer
        else
          next_state = ST_APB_TRNF;   // Change to state-2
      end
      // Second APB transfer cycle
      ST_APB_TRNF2 :
      begin
        if (PREADY & PSLVERR & PCLKEN) // Error received - Generate two cycle
          // Error response on AHB by
          next_state = ST_APB_ERR1; // Changing to state-5 and 6
        else if (PREADY & (~PSLVERR) & PCLKEN) // Okay received
        begin
          if (reg_rdata_cfg)
            // Registered version
            next_state = ST_APB_ENDOK; // Generate okay response in state 4
          else
            // Non-registered version
            next_state = {2'b00, apb_select}; // Terminate transfer
        end
        else // Slave not ready
          next_state = ST_APB_TRNF2; // Unchange
      end
      // Ending cycle for OKAY (registered response)
      ST_APB_ENDOK :
      begin
        if (PCLKEN & apb_select & ~(reg_wdata_cfg & HWRITE))
          next_state = ST_APB_TRNF; // Start APB transfer in next cycle
        else if (apb_select)
          next_state = ST_APB_WAIT; // Wait for start of APB transfer at PCLKEN high
        else
          next_state = ST_IDLE; // Remain idle
      end
      // First cycle for Error response
      ST_APB_ERR1 :
        next_state = ST_APB_ERR2; // Goto 2nd cycle of error response
      // Second cycle for Error response
      ST_APB_ERR2 :
      begin
        if (PCLKEN & apb_select & ~(reg_wdata_cfg & HWRITE))
          next_state = ST_APB_TRNF; // Start APB transfer in next cycle
        else if (apb_select)
          next_state = ST_APB_WAIT; // Wait for start of APB transfer at PCLKEN high
        else
          next_state = ST_IDLE; // Remain idle
      end
      default : // Not used
        next_state = 3'bxxx; // X-Propagation
    endcase
  end

  // Registering state machine
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      state_reg <= 3'b000;
    else
      state_reg <= next_state;
  end

  // Sample PRDATA or HWDATA
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      rwdata_reg <= {32{1'b0}};
    else
      if (sample_wdata_reg & reg_wdata_cfg & PCLKEN)
        rwdata_reg <= HWDATA;
      else if (apb_tran_end & reg_rdata_cfg & PCLKEN)
        rwdata_reg <= PRDATA;
  end

  // Connect outputs to top level
  assign PADDR   = {addr_reg, 2'b00}; // from sample register
  assign PWRITE  = wr_reg;            // from sample register
  assign PWDATA  = (reg_wdata_cfg) ? rwdata_reg : HWDATA;
  assign PSEL    = (state_reg==ST_APB_TRNF) | (state_reg==ST_APB_TRNF2);
  assign PENABLE = (state_reg==ST_APB_TRNF2);

  // Generate HREADYOUT
  always @(state_reg or reg_rdata_cfg or PREADY or PSLVERR or PCLKEN)
  begin
    case (state_reg)
      ST_IDLE      :
        HREADYOUT = 1'b1; // Idle
      ST_APB_WAIT  :
        HREADYOUT = 1'b0; // Transfer announced on AHB, but PCLKEN was low, so waiting
      ST_APB_TRNF  :
        HREADYOUT = 1'b0; // First APB transfer cycle
      ST_APB_TRNF2 :
        HREADYOUT = (~reg_rdata_cfg) & PREADY & (~PSLVERR) & PCLKEN;
      ST_APB_ENDOK :
        HREADYOUT = reg_rdata_cfg; // Ending cycle for OKAY (registered response only)
      ST_APB_ERR1  :
        HREADYOUT = 1'b0; // First cycle for Error response
      ST_APB_ERR2  :
        HREADYOUT = 1'b1; // Second cycle for Error response
      default:
        HREADYOUT = 1'bx; // x propagation (note :3'b111 is illegal state)
    endcase
  end

  // From sample register or from PRDATA directly
  assign HRDATA = (reg_rdata_cfg) ? rwdata_reg : PRDATA;

endmodule
