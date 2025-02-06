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

`timescale              1ns/1ps
`default_nettype        none

//-----------------------------------------------------------
// Housekeeping interface for Caravel
//-----------------------------------------------------------
// Written by Tim Edwards
// efabless, inc. September 27, 2020
//-----------------------------------------------------------

//-----------------------------------------------------------
// This is a standalone slave SPI for the caravel chip that is
// intended to be independent of the picosoc and independent
// of all IP blocks except the power-on-reset.  This SPI has
// register outputs controlling the functions that critically
// affect operation of the picosoc and so cannot be accessed
// from the picosoc itself.  This includes the PLL enables,
// mode, and trim.  It also has a general reset for the picosoc,
// an IRQ input, a bypass for the entire crystal oscillator
// and PLL chain, the manufacturer and product IDs and product
// revision number.
//
// Updated and revised, 10/13/2021:
// This module now comprises what was previously split into
// the housekeeping SPI, the mprj_ctrl block (control over
// the GPIO), and sysctrl (redirection of certain internal
// signals to the GPIO);  and additionally manages the SPI
// flash signals and pass-through mode.  Essentially all
// aspects of the system related to the use and configuration
// of the GPIO has been shifted to this module.  This allows
// GPIO to be configured from either the management SoC
// through the wishbone interface, or externally through the
// SPI interface.  It allows essentially any processor to
// take the place of the PicoRV32 as long as that processor
// can access memory-mapped space via the wishbone bus.
//-----------------------------------------------------------

//------------------------------------------------------------
// Caravel defined registers (by SPI address):
// See:  doc/memory_map.txt
//------------------------------------------------------------

module housekeeping #(
    parameter GPIO_BASE_ADR = 32'h2600_0000,
    parameter SPI_BASE_ADR = 32'h2610_0000,
    parameter IO_CTRL_BITS = 16
) (
`ifdef USE_POWER_PINS
    inout VPWR,
    inout VGND,
`endif

    // Wishbone interface to management SoC
    input wire wb_clk_i,
    input wire wb_rstn_i,
    input wire [31:0] wb_adr_i,
    input wire [31:0] wb_dat_i,
    input wire [3:0] wb_sel_i,
    input wire wb_we_i,
    input wire wb_cyc_i,
    input wire wb_stb_i,
    output reg wb_ack_o,
    output reg [31:0] wb_dat_o,

    // Primary reset
    input wire porb,

    // External (originating from SPI and pad) IRQ and reset
    output wire irq, // ONLY ONE BIT IS USED (SPI)
    output wire reset,

    // GPIO serial loader programming interface
    output wire serial_clock,
    output wire serial_load,
    output wire serial_resetn,
    output wire serial_data_1,
    output wire serial_data_2,

    // GPIO data management (to padframe)---three-pin interface

    output wire hk_spi_sdo,
    input wire hk_spi_sdi,
    input wire hk_spi_csb,
    input wire hk_spi_sck,

    // Mask revision/User project ID
    input wire [31:0] mask_rev_in,
    input wire [7:0] prod_id,

    // SPI flash management (management SoC side)
    input wire spimemio_flash_csb,
    input wire spimemio_flash_clk,
    input wire spimemio_flash_io0_oeb,
    input wire spimemio_flash_io1_oeb,
    input wire spimemio_flash_io2_oeb,
    input wire spimemio_flash_io3_oeb,
    input wire spimemio_flash_io0_do,
    input wire spimemio_flash_io1_do,
    input wire spimemio_flash_io2_do,
    input wire spimemio_flash_io3_do,
    output wire spimemio_flash_io0_di,
    output wire spimemio_flash_io1_di,
    output wire spimemio_flash_io2_di,
    output wire spimemio_flash_io3_di,


    // SPI flash management (padframe side)
    // (io2 and io3 are part of GPIO array, not dedicated pads)
    output wire pad_flash_csb,
    output wire pad_flash_csb_oeb,
    output wire pad_flash_clk,
    output wire pad_flash_clk_oeb,
    output wire pad_flash_io0_oeb,
    output wire pad_flash_io1_oeb,
    output wire pad_flash_io2_oeb,
    output wire pad_flash_io3_oeb,
    output wire pad_flash_io0_ieb,
    output wire pad_flash_io1_ieb,
    output wire pad_flash_io2_ieb,
    output wire pad_flash_io3_ieb,
    output wire pad_flash_io0_do,
    output wire pad_flash_io1_do,
    output wire pad_flash_io2_do,
    output wire pad_flash_io3_do,
    input wire pad_flash_io0_di,
    input wire pad_flash_io1_di,
    input wire pad_flash_io2_di,
    input wire pad_flash_io3_di
);

    // Internal registers
    reg reset_reg;
    reg irq_spi;
    reg serial_bb_clock;
    reg serial_bb_load;
    reg serial_bb_resetn;
    reg serial_bb_data_1;
    reg serial_bb_data_2;
    reg serial_bb_enable;
    reg serial_xfer;
    reg hkspi_disable;
`ifdef IO_CFG_FSM
    `ifdef FPGA
    reg [IO_CTRL_BITS-1:0] gpio_configure [0:`MPRJ_IO_PADS];
    `else
    reg [IO_CTRL_BITS-1:0] gpio_configure [`MPRJ_IO_PADS];
    `endif
`endif // IO_CFG_FSM

    wire [7:0] odata;
    wire [7:0] idata;
    wire [7:0] iaddr;

    wire rdstb;
    wire wrstb;
    wire pass_thru_mgmt;        // Mode detected by housekeeping_spi
    wire pass_thru_mgmt_delay;
    wire pass_thru_user;        // Mode detected by housekeeping_spi
    wire pass_thru_user_delay;
    wire pass_thru_mgmt_reset;
    wire pass_thru_user_reset;
    wire sdo;
    wire sdo_enb;

    wire [7:0]  caddr;  // Combination of SPI address and back door address
    wire [7:0]  cdata;  // Combination of SPI data and back door data
    wire        cwstb;  // Combination of SPI write strobe and back door write strobe
    wire        csclk;  // Combination of SPI SCK and back door access trigger

    // Output clock signals buffer wires
    wire pad_flash_clk_prebuff;

    // Pass-through mode handling.  Signals may only be applied when the
    // core processor is in reset.

    assign reset = (pass_thru_mgmt_reset) ? 1'b1 : reset_reg;

    // Invert wb_rstn_i
    wire wb_rst_i;
    assign wb_rst_i = ~wb_rstn_i;

    // Pass-through mode.  Housekeeping SPI signals get inserted
    // between the management SoC and the flash SPI I/O.

    assign pad_flash_csb = (pass_thru_mgmt_delay) ? hk_spi_csb : spimemio_flash_csb;
    assign pad_flash_csb_oeb = (pass_thru_mgmt_delay) ? 1'b0 : (~porb ? 1'b1 : 1'b0);
    assign pad_flash_clk_prebuff = (pass_thru_mgmt) ? hk_spi_sck : spimemio_flash_clk;
    assign pad_flash_clk_oeb = (pass_thru_mgmt) ? 1'b0 : (~porb ? 1'b1 : 1'b0);
    // io0
    assign pad_flash_io0_oeb = (pass_thru_mgmt_delay) ? 1'b0 : spimemio_flash_io0_oeb;
    assign pad_flash_io0_ieb = (pass_thru_mgmt_delay) ? 1'b1 : ~spimemio_flash_io0_oeb;
    assign spimemio_flash_io0_di = (pass_thru_mgmt_delay) ? 1'b0 : pad_flash_io0_di;
    assign pad_flash_io0_do = (pass_thru_mgmt_delay) ? hk_spi_sdi : spimemio_flash_io0_do;
    // io1
    assign pad_flash_io1_oeb = (pass_thru_mgmt) ? 1'b1 : spimemio_flash_io1_oeb;
    assign pad_flash_io1_ieb = (pass_thru_mgmt) ? 1'b0 : ~spimemio_flash_io1_oeb;
    assign spimemio_flash_io1_di = (pass_thru_mgmt) ? 1'b0 : pad_flash_io1_di;
    assign pad_flash_io1_do = (pass_thru_mgmt_delay) ? 1'b0 :spimemio_flash_io1_do;
    // io2
    assign pad_flash_io2_oeb = (pass_thru_mgmt) ? 1'b1 : spimemio_flash_io2_oeb;
    assign pad_flash_io2_ieb = (pass_thru_mgmt) ? 1'b0 : ~spimemio_flash_io2_oeb;
    assign spimemio_flash_io2_di = (pass_thru_mgmt) ? 1'b0 : pad_flash_io2_di;
    assign pad_flash_io2_do = (pass_thru_mgmt_delay) ? 1'b0 :spimemio_flash_io2_do;
    // io3
    assign pad_flash_io3_oeb = (pass_thru_mgmt) ? 1'b1 : spimemio_flash_io3_oeb;
    assign pad_flash_io3_ieb = (pass_thru_mgmt) ? 1'b0 : ~spimemio_flash_io3_oeb;
    assign spimemio_flash_io3_di = (pass_thru_mgmt) ? 1'b0 : pad_flash_io3_di;
    assign pad_flash_io3_do = (pass_thru_mgmt_delay) ? 1'b0 :spimemio_flash_io3_do;


`ifdef FPGA
    assign pad_flash_clk = pad_flash_clk_prebuff;
`else 
(* keep *) sky130_fd_sc_hd__clkbuf_8 pad_flashh_clk_buff_inst (
`ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
`endif
    .A(pad_flash_clk_prebuff),
    .X(pad_flash_clk));
`endif 

    wire [11:0] mfgr_id;
    wire [31:0] mask_rev;

    reg serial_busy;

    // Wishbone bus "back door" to SPI registers.  This section of code
    // (1) Maps SPI byte addresses to memory map 32-bit addresses
    // (2) Applies signals to the housekeeping SPI to mux in the SPI address,
    //     clock, and write strobe.  This is done carefully and slowly to
    //     avoid glitching on the SCK line and to avoid forcing the
    //     housekeeping module to keep up with the core clock timing.

    wire        gpio_select;    // GPIO configuration memory map address selected
    wire        spi_select;     // SPI back door memory map address selected

    // Wishbone Back Door.  This is a simple interface making use of the
    // housekeeping SPI protocol.  The housekeeping SPI uses byte-wide
    // data, so this interface will stall the processor by holding wb_ack_o
    // low until all bytes have been transferred between the processor and
    // housekeeping SPI.

    reg [3:0]   wbbd_state;
    reg [7:0]   wbbd_addr;  /* SPI address translated from WB */
    reg [7:0]   wbbd_data;  /* SPI data translated from WB */
    reg         wbbd_sck;   /* wishbone access trigger (back-door clock) */
    reg         wbbd_write; /* wishbone write trigger (back-door strobe) */
    reg         wbbd_busy;  /* Raised during a wishbone read or write */

    // This defines a state machine that accesses the SPI registers through
    // the back door wishbone interface.  The process is relatively slow
    // since the SPI data are byte-wide, so four individual accesses are
    // made to read 4 bytes from the SPI to fill data on the wishbone bus
    // before sending ACK and letting the processor continue.

    `define WBBD_IDLE   4'h0    /* Back door access is idle */
    `define WBBD_SETUP0 4'h1    /* Apply address and data for byte 1 of 4 */
    `define WBBD_RW0    4'h2    /* Latch data for byte 1 of 4 */
    `define WBBD_SETUP1 4'h3    /* Apply address and data for byte 2 of 4 */
    `define WBBD_RW1    4'h4    /* Latch data for byte 2 of 4 */
    `define WBBD_SETUP2 4'h5    /* Apply address and data for byte 3 of 4 */
    `define WBBD_RW2    4'h6    /* Latch data for byte 3 of 4 */
    `define WBBD_SETUP3 4'h7    /* Apply address and data for byte 4 of 4 */
    `define WBBD_RW3    4'h8    /* Latch data for byte 4 of 4 */
    `define WBBD_DONE   4'h9    /* Send ACK back to wishbone */
    `define WBBD_RESET  4'ha    /* Clock once to reset the transfer bit */

    assign gpio_select = (wb_adr_i[31:12] == GPIO_BASE_ADR[31:12]);
    assign spi_select = (wb_adr_i[31:8] == SPI_BASE_ADR[31:8]);

    /* Register bit to SPI address mapping */

    function [7:0] fdata(input [7:0] address);
    begin
    case (address)
        /* Housekeeping SPI Protocol */
        8'h00 : fdata = 8'h00;                  // SPI status (fixed)

        /* Status and Identification */
        8'h01 : fdata = {4'h0, mfgr_id[11:8]};  // Manufacturer ID (fixed)
        8'h02 : fdata = mfgr_id[7:0];           // Manufacturer ID (fixed)
        8'h03 : fdata = prod_id;                // Product ID (fixed)
        8'h04 : fdata = mask_rev[31:24];        // Mask rev (via programmed)
        8'h05 : fdata = mask_rev[23:16];        // Mask rev (via programmed)
        8'h06 : fdata = mask_rev[15:8];         // Mask rev (via programmed)
        8'h07 : fdata = mask_rev[7:0];          // Mask rev (via programmed)

        /* Clocking control */
        8'h0a : fdata = {7'b0000000, irq_spi};
        8'h0b : fdata = {7'b0000000, reset};
        // GPIO Control (bit bang and automatic)
        // NOTE: "serial_busy" is the read-back signal occupying the same
        // address/bit as "serial_xfer".
        8'h13 : fdata = {1'b0, serial_data_2, serial_data_1, serial_bb_clock,
                serial_bb_load, serial_bb_resetn, serial_bb_enable,
                serial_busy};

        // // Housekeeping SPI system disable
        8'h14 : fdata = {7'b0000000, hkspi_disable};

`ifdef IO_CFG_FSM
        /* GPIO Configuration */
        8'h1d : fdata = {gpio_configure[0][15:8]};
        8'h1e : fdata = gpio_configure[0][7:0];
        8'h1f : fdata = {gpio_configure[1][15:8]};
        8'h20 : fdata = gpio_configure[1][7:0];
        8'h21 : fdata = {gpio_configure[2][15:8]};
        8'h22 : fdata = gpio_configure[2][7:0];
        8'h23 : fdata = {gpio_configure[3][15:8]};
        8'h24 : fdata = gpio_configure[3][7:0];
        8'h25 : fdata = {gpio_configure[4][15:8]};
        8'h26 : fdata = gpio_configure[4][7:0];
        8'h27 : fdata = {gpio_configure[5][15:8]};
        8'h28 : fdata = gpio_configure[5][7:0];
        8'h29 : fdata = {gpio_configure[6][15:8]};
        8'h2a : fdata = gpio_configure[6][7:0];
        8'h2b : fdata = {gpio_configure[7][15:8]};
        8'h2c : fdata = gpio_configure[7][7:0];
        8'h2d : fdata = {gpio_configure[8][15:8]};
        8'h2e : fdata = gpio_configure[8][7:0];
        8'h2f : fdata = {gpio_configure[9][15:8]};
        8'h30 : fdata = gpio_configure[9][7:0];
        8'h31 : fdata = {gpio_configure[10][15:8]};
        8'h32 : fdata = gpio_configure[10][7:0];
        8'h33 : fdata = {gpio_configure[11][15:8]};
        8'h34 : fdata = gpio_configure[11][7:0];
        8'h35 : fdata = {gpio_configure[12][15:8]};
        8'h36 : fdata = gpio_configure[12][7:0];
        8'h37 : fdata = {gpio_configure[13][15:8]};
        8'h38 : fdata = gpio_configure[13][7:0];
        8'h39 : fdata = {gpio_configure[14][15:8]};
        8'h3a : fdata = gpio_configure[14][7:0];
        8'h3b : fdata = {gpio_configure[15][15:8]};
        8'h3c : fdata = gpio_configure[15][7:0];
        8'h3d : fdata = {gpio_configure[16][15:8]};
        8'h3e : fdata = gpio_configure[16][7:0];
        8'h3f : fdata = {gpio_configure[17][15:8]};
        8'h40 : fdata = gpio_configure[17][7:0];
        8'h41 : fdata = {gpio_configure[18][15:8]};
        8'h42 : fdata = gpio_configure[18][7:0];
        8'h43 : fdata = {gpio_configure[19][15:8]};
        8'h44 : fdata = gpio_configure[19][7:0];
        8'h45 : fdata = {gpio_configure[20][15:8]};
        8'h46 : fdata = gpio_configure[20][7:0];
        8'h47 : fdata = {gpio_configure[21][15:8]};
        8'h48 : fdata = gpio_configure[21][7:0];
        8'h49 : fdata = {gpio_configure[22][15:8]};
        8'h4a : fdata = gpio_configure[22][7:0];
        8'h4b : fdata = {gpio_configure[23][15:8]};
        8'h4c : fdata = gpio_configure[23][7:0];
        8'h4d : fdata = {gpio_configure[24][15:8]};
        8'h4e : fdata = gpio_configure[24][7:0];
        8'h4f : fdata = {gpio_configure[25][15:8]};
        8'h50 : fdata = gpio_configure[25][7:0];
        8'h51 : fdata = {gpio_configure[26][15:8]};
        8'h52 : fdata = gpio_configure[26][7:0];
        8'h53 : fdata = {gpio_configure[27][15:8]};
        8'h54 : fdata = gpio_configure[27][7:0];
        8'h55 : fdata = {gpio_configure[28][15:8]};
        8'h56 : fdata = gpio_configure[28][7:0];
        8'h57 : fdata = {gpio_configure[29][15:8]};
        8'h58 : fdata = gpio_configure[29][7:0];
        8'h59 : fdata = {gpio_configure[30][15:8]};
        8'h5a : fdata = gpio_configure[30][7:0];
        8'h5b : fdata = {gpio_configure[31][15:8]};
        8'h5c : fdata = gpio_configure[31][7:0];
        8'h5d : fdata = {gpio_configure[32][15:8]};
        8'h5e : fdata = gpio_configure[32][7:0];
        8'h5f : fdata = {gpio_configure[33][15:8]};
        8'h60 : fdata = gpio_configure[33][7:0];
        8'h61 : fdata = {gpio_configure[34][15:8]};
        8'h62 : fdata = gpio_configure[34][7:0];
        8'h63 : fdata = {gpio_configure[35][15:8]};
        8'h64 : fdata = gpio_configure[35][7:0];
        8'h65 : fdata = {gpio_configure[36][15:8]};
        8'h66 : fdata = gpio_configure[36][7:0];
        8'h67 : fdata = {gpio_configure[37][15:8]};
        8'h68 : fdata = gpio_configure[37][7:0];
        8'h69 : fdata = {gpio_configure[38][15:8]};
        8'h6a : fdata = gpio_configure[38][7:0];
        8'h6b : fdata = {gpio_configure[39][15:8]};
        8'h6c : fdata = gpio_configure[39][7:0];
        8'h6d : fdata = {gpio_configure[40][15:8]};
        8'h6e : fdata = gpio_configure[40][7:0];
        8'h6f : fdata = {gpio_configure[41][15:8]};
        8'h70 : fdata = gpio_configure[41][7:0];
        8'h71 : fdata = {gpio_configure[42][15:8]};
        8'h72 : fdata = gpio_configure[42][7:0];
        8'h73 : fdata = {gpio_configure[43][15:8]};
        8'h74 : fdata = gpio_configure[43][7:0];
        8'h75 : fdata = {gpio_configure[44][15:8]};
        8'h76 : fdata = gpio_configure[44][7:0];
        8'h77 : fdata = {gpio_configure[45][15:8]};
        8'h78 : fdata = gpio_configure[45][7:0];
        8'h79 : fdata = {gpio_configure[46][15:8]};
        8'h7a : fdata = gpio_configure[46][7:0];
        8'h7b : fdata = {gpio_configure[47][15:8]};
        8'h7c : fdata = gpio_configure[47][7:0];
        8'h7d : fdata = {gpio_configure[48][15:8]};
        8'h7e : fdata = gpio_configure[48][7:0];
        8'h7f : fdata = {gpio_configure[49][15:8]};
        8'h80 : fdata = gpio_configure[49][7:0];
        8'h81 : fdata = {gpio_configure[50][15:8]};
        8'h82 : fdata = gpio_configure[50][7:0];
        8'h83 : fdata = {gpio_configure[51][15:8]};
        8'h84 : fdata = gpio_configure[51][7:0];
        8'h85 : fdata = {gpio_configure[52][15:8]};
        8'h86 : fdata = gpio_configure[52][7:0];
        8'h87 : fdata = {gpio_configure[53][15:8]};
        8'h88 : fdata = gpio_configure[53][7:0];
        8'h89 : fdata = {gpio_configure[54][15:8]};
        8'h8a : fdata = gpio_configure[54][7:0];
        8'h8b : fdata = {gpio_configure[55][15:8]};
        8'h8c : fdata = gpio_configure[55][7:0];
        8'h8d : fdata = {gpio_configure[56][15:8]};
        8'h8e : fdata = gpio_configure[56][7:0];
        8'h8f : fdata = {gpio_configure[57][15:8]};
        8'h90 : fdata = gpio_configure[57][7:0];
        8'h91 : fdata = {gpio_configure[58][15:8]};
        8'h92 : fdata = gpio_configure[58][7:0];
        8'h93 : fdata = {gpio_configure[59][15:8]};
        8'h94 : fdata = gpio_configure[59][7:0];
        8'h95 : fdata = {gpio_configure[60][15:8]};
        8'h96 : fdata = gpio_configure[60][7:0];
        8'h97 : fdata = {gpio_configure[61][15:8]};
        8'h98 : fdata = gpio_configure[61][7:0];
        8'h99 : fdata = {gpio_configure[62][15:8]};
        8'h9a : fdata = gpio_configure[62][7:0];
        8'h9b : fdata = {gpio_configure[63][15:8]};
        8'h9c : fdata = gpio_configure[63][7:0];
        8'h9d : fdata = {gpio_configure[64][15:8]};
        8'h9e : fdata = gpio_configure[64][7:0];
        8'h9f : fdata = {gpio_configure[65][15:8]};
        8'ha0 : fdata = gpio_configure[65][7:0];
`endif // IO_CFG_FSM
        default: fdata = 8'h00;
    endcase
    end
    endfunction

    /* Memory map address to SPI address translation for back door access */
    /* (see doc/memory_map.txt)*/

    wire [13:0] gpio_adr = GPIO_BASE_ADR[23:10];
    wire [13:0] spi_adr = SPI_BASE_ADR[23:10];

    function [7:0] spiaddr(input [31:0] wbaddress);
    begin
    /* Address taken from lower 8 bits and upper 4 bits of the 32-bit */
    /* wishbone address.*/
    case ({wbaddress[23:20], wbaddress[9:0]})
        spi_adr  | 14'h000 : spiaddr = 8'h00;   // SPI status (reserved)
        spi_adr  | 14'h004 : spiaddr = 8'h03;   // product ID
        spi_adr  | 14'h005 : spiaddr = 8'h02;   // Manufacturer ID (low)
        spi_adr  | 14'h006 : spiaddr = 8'h01;   // Manufacturer ID (high)
        spi_adr  | 14'h008 : spiaddr = 8'h07;   // User project ID (low)
        spi_adr  | 14'h009 : spiaddr = 8'h06;   // User project ID .
        spi_adr  | 14'h00a : spiaddr = 8'h05;   // User project ID .
        spi_adr  | 14'h00b : spiaddr = 8'h04;   // User project ID (high)

        spi_adr  | 14'h014 : spiaddr = 8'h0a;    // IRQ
        spi_adr  | 14'h018 : spiaddr = 8'h0b;    // Reset
        spi_adr  | 14'h01c : spiaddr = 8'h14;    // Housekeeping SPI disable

        gpio_adr | 14'h000 : spiaddr = 8'h13;    // GPIO control


        gpio_adr | 14'h025 : spiaddr = 8'h1d;    // GPIO configuration
        gpio_adr | 14'h024 : spiaddr = 8'h1e;
        gpio_adr | 14'h029 : spiaddr = 8'h1f;
        gpio_adr | 14'h028 : spiaddr = 8'h20;
        gpio_adr | 14'h02d : spiaddr = 8'h21;
        gpio_adr | 14'h02c : spiaddr = 8'h22;
        gpio_adr | 14'h031 : spiaddr = 8'h23;
        gpio_adr | 14'h030 : spiaddr = 8'h24;
        gpio_adr | 14'h035 : spiaddr = 8'h25;
        gpio_adr | 14'h034 : spiaddr = 8'h26;
        gpio_adr | 14'h039 : spiaddr = 8'h27;
        gpio_adr | 14'h038 : spiaddr = 8'h28;
        gpio_adr | 14'h03d : spiaddr = 8'h29;
        gpio_adr | 14'h03c : spiaddr = 8'h2a;
        gpio_adr | 14'h041 : spiaddr = 8'h2b;
        gpio_adr | 14'h040 : spiaddr = 8'h2c;
        gpio_adr | 14'h045 : spiaddr = 8'h2d;
        gpio_adr | 14'h044 : spiaddr = 8'h2e;
        gpio_adr | 14'h049 : spiaddr = 8'h2f;
        gpio_adr | 14'h048 : spiaddr = 8'h30;
        gpio_adr | 14'h04d : spiaddr = 8'h31;
        gpio_adr | 14'h04c : spiaddr = 8'h32;
        gpio_adr | 14'h051 : spiaddr = 8'h33;
        gpio_adr | 14'h050 : spiaddr = 8'h34;
        gpio_adr | 14'h055 : spiaddr = 8'h35;
        gpio_adr | 14'h054 : spiaddr = 8'h36;
        gpio_adr | 14'h059 : spiaddr = 8'h37;
        gpio_adr | 14'h058 : spiaddr = 8'h38;
        gpio_adr | 14'h05d : spiaddr = 8'h39;
        gpio_adr | 14'h05c : spiaddr = 8'h3a;
        gpio_adr | 14'h061 : spiaddr = 8'h3b;
        gpio_adr | 14'h060 : spiaddr = 8'h3c;
        gpio_adr | 14'h065 : spiaddr = 8'h3d;
        gpio_adr | 14'h064 : spiaddr = 8'h3e;
        gpio_adr | 14'h069 : spiaddr = 8'h3f;
        gpio_adr | 14'h068 : spiaddr = 8'h40;
        gpio_adr | 14'h06d : spiaddr = 8'h41;
        gpio_adr | 14'h06c : spiaddr = 8'h42;
        gpio_adr | 14'h071 : spiaddr = 8'h43;
        gpio_adr | 14'h070 : spiaddr = 8'h44;
        gpio_adr | 14'h075 : spiaddr = 8'h45;
        gpio_adr | 14'h074 : spiaddr = 8'h46;
        gpio_adr | 14'h079 : spiaddr = 8'h47;
        gpio_adr | 14'h078 : spiaddr = 8'h48;
        gpio_adr | 14'h07d : spiaddr = 8'h49;
        gpio_adr | 14'h07c : spiaddr = 8'h4a;
        gpio_adr | 14'h081 : spiaddr = 8'h4b;
        gpio_adr | 14'h080 : spiaddr = 8'h4c;
        gpio_adr | 14'h085 : spiaddr = 8'h4d;
        gpio_adr | 14'h084 : spiaddr = 8'h4e;
        gpio_adr | 14'h089 : spiaddr = 8'h4f;
        gpio_adr | 14'h088 : spiaddr = 8'h50;
        gpio_adr | 14'h08d : spiaddr = 8'h51;
        gpio_adr | 14'h08c : spiaddr = 8'h52;
        gpio_adr | 14'h091 : spiaddr = 8'h53;
        gpio_adr | 14'h090 : spiaddr = 8'h54;
        gpio_adr | 14'h095 : spiaddr = 8'h55;
        gpio_adr | 14'h094 : spiaddr = 8'h56;
        gpio_adr | 14'h099 : spiaddr = 8'h57;
        gpio_adr | 14'h098 : spiaddr = 8'h58;
        gpio_adr | 14'h09d : spiaddr = 8'h59;
        gpio_adr | 14'h09c : spiaddr = 8'h5a;
        gpio_adr | 14'h0a1 : spiaddr = 8'h5b;
        gpio_adr | 14'h0a0 : spiaddr = 8'h5c;
        gpio_adr | 14'h0a5 : spiaddr = 8'h5d;
        gpio_adr | 14'h0a4 : spiaddr = 8'h5e;
        gpio_adr | 14'h0a9 : spiaddr = 8'h5f;
        gpio_adr | 14'h0a8 : spiaddr = 8'h60;
        gpio_adr | 14'h0ad : spiaddr = 8'h61;
        gpio_adr | 14'h0ac : spiaddr = 8'h62;
        gpio_adr | 14'h0b1 : spiaddr = 8'h63;
        gpio_adr | 14'h0b0 : spiaddr = 8'h64;
        gpio_adr | 14'h0b5 : spiaddr = 8'h65;
        gpio_adr | 14'h0b4 : spiaddr = 8'h66;
        gpio_adr | 14'h0b9 : spiaddr = 8'h67;
        gpio_adr | 14'h0b8 : spiaddr = 8'h68;
        gpio_adr | 14'h0bd : spiaddr = 8'h69;
        gpio_adr | 14'h0bc : spiaddr = 8'h6a;
        gpio_adr | 14'h0c1 : spiaddr = 8'h6b;
        gpio_adr | 14'h0c0 : spiaddr = 8'h6c;
        gpio_adr | 14'h0c5 : spiaddr = 8'h6d;
        gpio_adr | 14'h0c4 : spiaddr = 8'h6e;
        gpio_adr | 14'h0c9 : spiaddr = 8'h6f;
        gpio_adr | 14'h0c8 : spiaddr = 8'h70;
        gpio_adr | 14'h0cd : spiaddr = 8'h71;
        gpio_adr | 14'h0cc : spiaddr = 8'h72;
        gpio_adr | 14'h0d1 : spiaddr = 8'h73;
        gpio_adr | 14'h0d0 : spiaddr = 8'h74;
        gpio_adr | 14'h0d5 : spiaddr = 8'h75;
        gpio_adr | 14'h0d4 : spiaddr = 8'h76;
        gpio_adr | 14'h0d9 : spiaddr = 8'h77;
        gpio_adr | 14'h0d8 : spiaddr = 8'h78;
        gpio_adr | 14'h0dd : spiaddr = 8'h79;
        gpio_adr | 14'h0dc : spiaddr = 8'h7a;
        gpio_adr | 14'h0e1 : spiaddr = 8'h7b;
        gpio_adr | 14'h0e0 : spiaddr = 8'h7c;
        gpio_adr | 14'h0e5 : spiaddr = 8'h7d;
        gpio_adr | 14'h0e4 : spiaddr = 8'h7e;
        gpio_adr | 14'h0e9 : spiaddr = 8'h7f;
        gpio_adr | 14'h0e8 : spiaddr = 8'h80;
        gpio_adr | 14'h0ed : spiaddr = 8'h81;
        gpio_adr | 14'h0ec : spiaddr = 8'h82;
        gpio_adr | 14'h0f1 : spiaddr = 8'h83;
        gpio_adr | 14'h0f0 : spiaddr = 8'h84;
        gpio_adr | 14'h0f5 : spiaddr = 8'h85;
        gpio_adr | 14'h0f4 : spiaddr = 8'h86;
        gpio_adr | 14'h0f9 : spiaddr = 8'h87;
        gpio_adr | 14'h0f8 : spiaddr = 8'h88;
        gpio_adr | 14'h0fd : spiaddr = 8'h89;
        gpio_adr | 14'h0fc : spiaddr = 8'h8a;
        gpio_adr | 14'h101 : spiaddr = 8'h8b;
        gpio_adr | 14'h100 : spiaddr = 8'h8c;
        gpio_adr | 14'h105 : spiaddr = 8'h8d;
        gpio_adr | 14'h104 : spiaddr = 8'h8e;
        gpio_adr | 14'h109 : spiaddr = 8'h8f;
        gpio_adr | 14'h108 : spiaddr = 8'h90;
        gpio_adr | 14'h10d : spiaddr = 8'h91;
        gpio_adr | 14'h10c : spiaddr = 8'h92;
        gpio_adr | 14'h111 : spiaddr = 8'h93;
        gpio_adr | 14'h110 : spiaddr = 8'h94;
        gpio_adr | 14'h115 : spiaddr = 8'h95;
        gpio_adr | 14'h114 : spiaddr = 8'h96;
        gpio_adr | 14'h119 : spiaddr = 8'h97;
        gpio_adr | 14'h118 : spiaddr = 8'h98;
        gpio_adr | 14'h11d : spiaddr = 8'h99;
        gpio_adr | 14'h11c : spiaddr = 8'h9a;
        gpio_adr | 14'h121 : spiaddr = 8'h9b;
        gpio_adr | 14'h120 : spiaddr = 8'h9c;
        gpio_adr | 14'h125 : spiaddr = 8'h9d;
        gpio_adr | 14'h124 : spiaddr = 8'h9e;
        gpio_adr | 14'h129 : spiaddr = 8'h9f;
        gpio_adr | 14'h128 : spiaddr = 8'ha0;
        default : spiaddr = 8'h00;
    endcase
    end
    endfunction

    // SPI is considered active when the GPIO for CSB is set to input and
    // CSB is low.  SPI is considered "busy" when rdstb or wrstb are high,
    // indicating that the SPI will read or write a byte on the next SCK
    // transition.

    // mgmt enable so CSB is connect to gpio 3
`ifdef IO_CFG_FSM
    wire spi_is_enabled = (gpio_configure[3][0]) & (~hkspi_disable);
`else
    wire spi_is_enabled = (~hkspi_disable);
`endif // IO_CFG_FSM

    wire spi_is_active = spi_is_enabled && (hk_spi_csb == 1'b0);
    wire spi_is_busy = spi_is_active && (rdstb || wrstb);

    /* Wishbone back-door state machine and address translation */

    always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if (wb_rst_i) begin
        wbbd_sck <= 1'b0;
        wbbd_write <= 1'b0;
        wbbd_addr <= 8'd0;
        wbbd_data <= 8'd0;
        wbbd_busy <= 1'b0;
        wb_ack_o <= 1'b0;
        wbbd_state <= `WBBD_IDLE;
    end else begin
        case (wbbd_state)
        `WBBD_IDLE: begin
            wbbd_sck <= 1'b0;
            wbbd_busy <= 1'b0;
            if ((gpio_select | spi_select) && wb_cyc_i && wb_stb_i) begin
                wb_ack_o <= 1'b0;
                wbbd_state <= `WBBD_SETUP0;
            end
        end
        `WBBD_SETUP0: begin
            wbbd_sck <= 1'b0;
            wbbd_addr <= spiaddr(wb_adr_i);
            if (wb_sel_i[0] & wb_we_i) begin
                wbbd_data <= wb_dat_i[7:0];
            end
            wbbd_write <= wb_sel_i[0] & wb_we_i;
            wbbd_busy <= 1'b1;

            // If the SPI is being accessed and about to read or
            // write a byte, then stall until the SPI is ready.
            if (!spi_is_busy) begin
                wbbd_state <= `WBBD_RW0;
            end
        end
        `WBBD_RW0: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b1;
            wb_dat_o[7:0] <= odata;
            wbbd_state <= `WBBD_SETUP1;
        end
        `WBBD_SETUP1: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b0;
            wbbd_addr <= spiaddr(wb_adr_i + 1);
            if (wb_sel_i[1] & wb_we_i) begin
                wbbd_data <= wb_dat_i[15:8];
            end
            wbbd_write <= wb_sel_i[1] & wb_we_i;
            if (!spi_is_busy) begin
                wbbd_state <= `WBBD_RW1;
            end
        end
        `WBBD_RW1: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b1;
            wb_dat_o[15:8] <= odata;
            wbbd_state <= `WBBD_SETUP2;
        end
        `WBBD_SETUP2: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b0;
            wbbd_addr <= spiaddr(wb_adr_i + 2);
            if (wb_sel_i[2] & wb_we_i) begin
                wbbd_data <= wb_dat_i[23:16];
            end
            wbbd_write <= wb_sel_i[2] & wb_we_i;
            if (!spi_is_busy) begin
                wbbd_state <= `WBBD_RW2;
            end
        end
        `WBBD_RW2: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b1;
            wb_dat_o[23:16] <= odata;
            wbbd_state <= `WBBD_SETUP3;
        end
        `WBBD_SETUP3: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b0;
            wbbd_addr <= spiaddr(wb_adr_i + 3);
            if (wb_sel_i[3] & wb_we_i) begin
                wbbd_data <= wb_dat_i[31:24];
            end
            wbbd_write <= wb_sel_i[3] & wb_we_i;
            if (!spi_is_busy) begin
                wbbd_state <= `WBBD_RW3;
            end
        end
        `WBBD_RW3: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b1;
            wb_dat_o[31:24] <= odata;
            wb_ack_o <= 1'b1;    // Release hold on wishbone bus
            wbbd_state <= `WBBD_DONE;
        end
        `WBBD_DONE: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b0;
            wb_ack_o <= 1'b0;    // Reset for next access
            wbbd_write <= 1'b0;
            wbbd_state <= `WBBD_RESET;
        end
        `WBBD_RESET: begin
            wbbd_busy <= 1'b1;
            wbbd_sck <= 1'b1;
            wb_ack_o <= 1'b0;
            wbbd_write <= 1'b0;
            wbbd_state <= `WBBD_IDLE;
        end
        endcase
    end
    end

    // Instantiate the SPI interface protocol module

    housekeeping_spi hkspi (
        .reset(~porb),
        .SCK(hk_spi_sck),
        .SDI(hk_spi_sdi),
        .CSB((spi_is_enabled) ? hk_spi_csb : 1'b1),
        .SDO(sdo),
        .sdoenb(sdo_enb),
        .idata(odata),
        .odata(idata),
        .oaddr(iaddr),
        .rdstb(rdstb),
        .wrstb(wrstb),
        .pass_thru_mgmt(pass_thru_mgmt),
        .pass_thru_mgmt_delay(pass_thru_mgmt_delay),
        .pass_thru_user(pass_thru_user),
        .pass_thru_user_delay(pass_thru_user_delay),
        .pass_thru_mgmt_reset(pass_thru_mgmt_reset),
        .pass_thru_user_reset(pass_thru_user_reset)
    );



    // GPIO data handling to and from the management SoC


    assign hk_spi_sdo = (pass_thru_mgmt) ? pad_flash_io1_di : ((spi_is_active) ? sdo : 1'b0);


    assign irq = irq_spi;
    // GPIO serial loader and GPIO management control

    `define GPIO_IDLE   2'b00
    `define GPIO_START  2'b01
    `define GPIO_XBYTE  2'b10
    `define GPIO_LOAD   2'b11

    reg [4:0]   xfer_count;
    reg [6:0]   pad_count_1;
    reg [6:0]   pad_count_2;
    reg [1:0]   xfer_state;

    reg serial_clock_pre;
    reg serial_resetn_pre;
    reg serial_load_pre;
    reg [IO_CTRL_BITS-1:0] serial_data_staging_1;
    reg [IO_CTRL_BITS-1:0] serial_data_staging_2;

    assign serial_clock = (serial_bb_enable == 1'b1) ?
            serial_bb_clock : serial_clock_pre;
    assign serial_resetn = (serial_bb_enable == 1'b1) ?
            serial_bb_resetn : serial_resetn_pre;
    assign serial_load = (serial_bb_enable == 1'b1) ?
            serial_bb_load : serial_load_pre;

    assign serial_data_1 = (serial_bb_enable == 1'b1) ?
            serial_bb_data_1 : serial_data_staging_1[IO_CTRL_BITS-1];
    assign serial_data_2 = (serial_bb_enable == 1'b1) ?
            serial_bb_data_2 : serial_data_staging_2[IO_CTRL_BITS-1];

    always @(posedge wb_clk_i or negedge porb) begin
        if (porb == 1'b0) begin
            xfer_state <= `GPIO_IDLE;
            xfer_count <= 5'd0;
            /* NOTE:  This assumes that MPRJ_IO_PADS_1 and MPRJ_IO_PADS_2 are
                * equal, because they get clocked the same number of cycles by
                * the same clock signal.  pad_count_2 gates the count for both.
                */
            pad_count_1 <= `MPRJ_IO_PADS_1 - 1;
            pad_count_2 <= `MPRJ_IO_PADS_1;
            serial_resetn_pre <= 1'b0;
            serial_clock_pre <= 1'b0;
            serial_load_pre <= 1'b0;
            serial_data_staging_1 <= 0;
            serial_data_staging_2 <= 0;
            serial_busy <= 1'b0;
        end else begin
            serial_resetn_pre <= 1'b1;
`ifdef IO_CFG_FSM
            case (xfer_state)
                `GPIO_IDLE: begin
                    pad_count_1 <= `MPRJ_IO_PADS_1 - 1;
                    pad_count_2 <= `MPRJ_IO_PADS_1;
                    serial_clock_pre <= 1'b0;
                    serial_load_pre <= 1'b0;
                    if (serial_xfer == 1'b1) begin
                        xfer_state <= `GPIO_START;
                        serial_busy <= 1'b1;
                    end else begin
                        serial_busy <= 1'b0;
                    end
                end
                `GPIO_START: begin
                    serial_clock_pre <= 1'b0;
                    serial_load_pre <= 1'b0;
                    xfer_count <= 5'd0;
                    pad_count_1 <= pad_count_1 - 1;
                    pad_count_2 <= pad_count_2 + 1;
                    xfer_state <= `GPIO_XBYTE;
                    serial_data_staging_1 <= gpio_configure[pad_count_1];
                    serial_data_staging_2 <= gpio_configure[pad_count_2];
                end
                `GPIO_XBYTE: begin
                    serial_clock_pre <= ~serial_clock;
                    serial_load_pre <= 1'b0;
                    if (serial_clock == 1'b0) begin
                        if (xfer_count == IO_CTRL_BITS - 1) begin
                            xfer_count <= 5'd0;
                            if (pad_count_2 == `MPRJ_IO_PADS) begin
                                xfer_state <= `GPIO_LOAD;
                            end else begin
                                xfer_state <= `GPIO_START;
                            end
                        end else begin
                            xfer_count <= xfer_count + 1;
                        end
                    end else begin
                        serial_data_staging_1 <= {serial_data_staging_1[IO_CTRL_BITS-2:0], 1'b0};
                        serial_data_staging_2 <= {serial_data_staging_2[IO_CTRL_BITS-2:0], 1'b0};
                    end
                end
                `GPIO_LOAD: begin
                    xfer_count <= xfer_count + 1;
                    /* Load sequence:  Pulse clock for final data shift in;
                    * Pulse the load strobe.
                    * Return to idle mode.
                    */
                    if (xfer_count == 5'd0) begin
                        serial_clock_pre <= 1'b0;
                        serial_load_pre <= 1'b0;
                    end else if (xfer_count == 5'd1) begin
                        serial_clock_pre <= 1'b0;
                        serial_load_pre <= 1'b1;
                    end else if (xfer_count == 5'd2) begin
                    serial_busy <= 1'b0;
                        serial_clock_pre <= 1'b0;
                        serial_load_pre <= 1'b0;
                        xfer_state <= `GPIO_IDLE;
                    end
                end
            endcase
`endif // IO_CFG_FSM
        end
    end

    // SPI Identification
    assign mfgr_id = 12'h456;       // Hard-coded
    assign mask_rev = mask_rev_in;  // Copy in to out.

    // SPI Data transfer protocol.  The wishbone back door may only be
    // used if the front door is closed (CSB is high or the CSB pin is
    // not an input).  The time to apply values for the back door access
    // is limited to the clock cycle around the read or write from the
    // wbbd state machine (see below).

    assign caddr = (wbbd_busy) ? wbbd_addr : iaddr;
    assign csclk = (wbbd_busy) ? wbbd_sck : ((spi_is_active) ? hk_spi_sck : 1'b0);
    assign cdata = (wbbd_busy) ? wbbd_data : idata;
    assign cwstb = (wbbd_busy) ? wbbd_write : wrstb;

    assign odata = fdata(caddr);

    // Register mapping and I/O to SPI interface module

    integer j;

    always @(posedge csclk or negedge porb) begin
        if (porb == 1'b0) begin
            irq_spi <= 1'b0;
            reset_reg <= 1'b0;
            // configuration for GPIOs with fixed reset
`ifdef IO_CFG_FSM
            gpio_configure[0]   <= 16'h8c01;// INPUT_PULLDOWN : // debug | in
            gpio_configure[1]   <= 16'h9809;// OUTPUT         : // spi sdo | out
            gpio_configure[2]   <= 16'h8c01;// INPUT_PULLDOWN : // spi sdi | in
            gpio_configure[3]   <= 16'h8801;// INPUT_PULLUP   : // spi csb | out
            gpio_configure[4]   <= 16'h8c01;// INPUT_PULLDOWN : // spi sck | out
            gpio_configure[5]   <= 16'h9801;// BIDIRECTIONAL  : // usb D+  | in/out
            gpio_configure[6]   <= 16'h9801;// BIDIRECTIONAL  : // usb D-  | in/out
            gpio_configure[7]   <= 16'h8c01;// INPUT_PULLDOWN : // test | in
`endif // IO_CFG_FSM
            serial_bb_enable    <= 1'b0;
            serial_bb_load      <= 1'b0;
            serial_bb_data_1    <= 1'b0;
            serial_bb_data_2    <= 1'b0;
            serial_bb_clock     <= 1'b0;
            serial_bb_resetn    <= 1'b0;
            serial_xfer         <= 1'b0;
            hkspi_disable       <= 1'b0;
            // configure reset for rest of GPIOs
    `ifdef IO_CFG_FSM
            for (j = 8; j < `MPRJ_IO_PADS; j = j + 1) begin
                gpio_configure[j] <= 16'h9803;
            end
    `endif // IO_CFG_FSM
        end else begin
            if (cwstb == 1'b1) begin
                case (caddr)
                    8'h0a: irq_spi <= cdata[0];
                    8'h0b: reset_reg <= cdata[0];
                    8'h13: begin
                        serial_bb_data_2 <= cdata[6];
                        serial_bb_data_1 <= cdata[5];
                        serial_bb_clock  <= cdata[4];
                        serial_bb_load   <= cdata[3];
                        serial_bb_resetn <= cdata[2];
                        serial_bb_enable <= cdata[1];
                        serial_xfer <= cdata[0];
                    end
                    8'h14: hkspi_disable <= cdata[0];
`ifdef IO_CFG_FSM
                    8'h1d: gpio_configure[0][15:8]  <= cdata;
                    8'h1e: gpio_configure[0][7:0]   <= cdata;
                    8'h1f: gpio_configure[1][15:8]  <= cdata;
                    8'h20: gpio_configure[1][7:0]   <= cdata;
                    8'h21: gpio_configure[2][15:8]  <= cdata;
                    8'h22: gpio_configure[2][7:0]   <= cdata;
                    8'h23: gpio_configure[3][15:8]  <= cdata;
                    8'h24: gpio_configure[3][7:0]   <= cdata;
                    8'h25: gpio_configure[4][15:8]  <= cdata;
                    8'h26: gpio_configure[4][7:0]   <= cdata;
                    8'h27: gpio_configure[5][15:8]  <= cdata;
                    8'h28: gpio_configure[5][7:0]   <= cdata;
                    8'h29: gpio_configure[6][15:8]  <= cdata;
                    8'h2a: gpio_configure[6][7:0]   <= cdata;
                    8'h2b: gpio_configure[7][15:8]  <= cdata;
                    8'h2c: gpio_configure[7][7:0]   <= cdata;
                    8'h2d: gpio_configure[8][15:8]  <= cdata;
                    8'h2e: gpio_configure[8][7:0]   <= cdata;
                    8'h2f: gpio_configure[9][15:8]  <= cdata;
                    8'h30: gpio_configure[9][7:0]   <= cdata;
                    8'h31: gpio_configure[10][15:8] <= cdata;
                    8'h32: gpio_configure[10][7:0]  <= cdata;
                    8'h33: gpio_configure[11][15:8] <= cdata;
                    8'h34: gpio_configure[11][7:0]  <= cdata;
                    8'h35: gpio_configure[12][15:8] <= cdata;
                    8'h36: gpio_configure[12][7:0]  <= cdata;
                    8'h37: gpio_configure[13][15:8] <= cdata;
                    8'h38: gpio_configure[13][7:0]  <= cdata;
                    8'h39: gpio_configure[14][15:8] <= cdata;
                    8'h3a: gpio_configure[14][7:0]  <= cdata;
                    8'h3b: gpio_configure[15][15:8] <= cdata;
                    8'h3c: gpio_configure[15][7:0]  <= cdata;
                    8'h3d: gpio_configure[16][15:8] <= cdata;
                    8'h3e: gpio_configure[16][7:0]  <= cdata;
                    8'h3f: gpio_configure[17][15:8] <= cdata;
                    8'h40: gpio_configure[17][7:0]  <= cdata;
                    8'h41: gpio_configure[18][15:8] <= cdata;
                    8'h42: gpio_configure[18][7:0]  <= cdata;
                    8'h43: gpio_configure[19][15:8] <= cdata;
                    8'h44: gpio_configure[19][7:0]  <= cdata;
                    8'h45: gpio_configure[20][15:8] <= cdata;
                    8'h46: gpio_configure[20][7:0]  <= cdata;
                    8'h47: gpio_configure[21][15:8] <= cdata;
                    8'h48: gpio_configure[21][7:0]  <= cdata;
                    8'h49: gpio_configure[22][15:8] <= cdata;
                    8'h4a: gpio_configure[22][7:0]  <= cdata;
                    8'h4b: gpio_configure[23][15:8] <= cdata;
                    8'h4c: gpio_configure[23][7:0]  <= cdata;
                    8'h4d: gpio_configure[24][15:8] <= cdata;
                    8'h4e: gpio_configure[24][7:0]  <= cdata;
                    8'h4f: gpio_configure[25][15:8] <= cdata;
                    8'h50: gpio_configure[25][7:0]  <= cdata;
                    8'h51: gpio_configure[26][15:8] <= cdata;
                    8'h52: gpio_configure[26][7:0]  <= cdata;
                    8'h53: gpio_configure[27][15:8] <= cdata;
                    8'h54: gpio_configure[27][7:0]  <= cdata;
                    8'h55: gpio_configure[28][15:8] <= cdata;
                    8'h56: gpio_configure[28][7:0]  <= cdata;
                    8'h57: gpio_configure[29][15:8] <= cdata;
                    8'h58: gpio_configure[29][7:0]  <= cdata;
                    8'h59: gpio_configure[30][15:8] <= cdata;
                    8'h5a: gpio_configure[30][7:0]  <= cdata;
                    8'h5b: gpio_configure[31][15:8] <= cdata;
                    8'h5c: gpio_configure[31][7:0]  <= cdata;
                    8'h5d: gpio_configure[32][15:8] <= cdata;
                    8'h5e: gpio_configure[32][7:0]  <= cdata;
                    8'h5f: gpio_configure[33][15:8] <= cdata;
                    8'h60: gpio_configure[33][7:0]  <= cdata;
                    8'h61: gpio_configure[34][15:8] <= cdata;
                    8'h62: gpio_configure[34][7:0]  <= cdata;
                    8'h63: gpio_configure[35][15:8] <= cdata;
                    8'h64: gpio_configure[35][7:0]  <= cdata;
                    8'h65: gpio_configure[36][15:8] <= cdata;
                    8'h66: gpio_configure[36][7:0]  <= cdata;
                    8'h67: gpio_configure[37][15:8] <= cdata;
                    8'h68: gpio_configure[37][7:0]  <= cdata;
                    8'h69: gpio_configure[38][15:8] <= cdata;
                    8'h6a: gpio_configure[38][7:0]  <= cdata;
                    8'h6b: gpio_configure[39][15:8] <= cdata;
                    8'h6c: gpio_configure[39][7:0]  <= cdata;
                    8'h6d: gpio_configure[40][15:8] <= cdata;
                    8'h6e: gpio_configure[40][7:0]  <= cdata;
                    8'h6f: gpio_configure[41][15:8] <= cdata;
                    8'h70: gpio_configure[41][7:0]  <= cdata;
                    8'h71: gpio_configure[42][15:8] <= cdata;
                    8'h72: gpio_configure[42][7:0]  <= cdata;
                    8'h73: gpio_configure[43][15:8] <= cdata;
                    8'h74: gpio_configure[43][7:0]  <= cdata;
                    8'h75: gpio_configure[44][15:8] <= cdata;
                    8'h76: gpio_configure[44][7:0]  <= cdata;
                    8'h77: gpio_configure[45][15:8] <= cdata;
                    8'h78: gpio_configure[45][7:0]  <= cdata;
                    8'h79: gpio_configure[46][15:8] <= cdata;
                    8'h7a: gpio_configure[46][7:0]  <= cdata;
                    8'h7b: gpio_configure[47][15:8] <= cdata;
                    8'h7c: gpio_configure[47][7:0]  <= cdata;
                    8'h7d: gpio_configure[48][15:8] <= cdata;
                    8'h7e: gpio_configure[48][7:0]  <= cdata;
                    8'h7f: gpio_configure[49][15:8] <= cdata;
                    8'h80: gpio_configure[49][7:0]  <= cdata;
                    8'h81: gpio_configure[50][15:8] <= cdata;
                    8'h82: gpio_configure[50][7:0]  <= cdata;
                    8'h83: gpio_configure[51][15:8] <= cdata;
                    8'h84: gpio_configure[51][7:0]  <= cdata;
                    8'h85: gpio_configure[52][15:8] <= cdata;
                    8'h86: gpio_configure[52][7:0]  <= cdata;
                    8'h87: gpio_configure[53][15:8] <= cdata;
                    8'h88: gpio_configure[53][7:0]  <= cdata;
                    8'h89: gpio_configure[54][15:8] <= cdata;
                    8'h8a: gpio_configure[54][7:0]  <= cdata;
                    8'h8b: gpio_configure[55][15:8] <= cdata;
                    8'h8c: gpio_configure[55][7:0]  <= cdata;
                    8'h8d: gpio_configure[56][15:8] <= cdata;
                    8'h8e: gpio_configure[56][7:0]  <= cdata;
                    8'h8f: gpio_configure[57][15:8] <= cdata;
                    8'h90: gpio_configure[57][7:0]  <= cdata;
                    8'h91: gpio_configure[58][15:8] <= cdata;
                    8'h92: gpio_configure[58][7:0]  <= cdata;
                    8'h93: gpio_configure[59][15:8] <= cdata;
                    8'h94: gpio_configure[59][7:0]  <= cdata;
                    8'h95: gpio_configure[60][15:8] <= cdata;
                    8'h96: gpio_configure[60][7:0]  <= cdata;
                    8'h97: gpio_configure[61][15:8] <= cdata;
                    8'h98: gpio_configure[61][7:0]  <= cdata;
                    8'h99: gpio_configure[62][15:8] <= cdata;
                    8'h9a: gpio_configure[62][7:0]  <= cdata;
                    8'h9b: gpio_configure[63][15:8] <= cdata;
                    8'h9c: gpio_configure[63][7:0]  <= cdata;
                    8'h9d: gpio_configure[64][15:8] <= cdata;
                    8'h9e: gpio_configure[64][7:0]  <= cdata;
                    8'h9f: gpio_configure[65][15:8] <= cdata;
                    8'ha0: gpio_configure[65][7:0]  <= cdata;
    `endif // IO_CFG_FSM
                endcase // (caddr)
            end else begin
                serial_xfer <= 1'b0;    // Serial transfer is self-resetting
                irq_spi <= 1'b0;        // IRQ is self-resetting
            end
        end
    end
endmodule   // housekeeping

`default_nettype wire
