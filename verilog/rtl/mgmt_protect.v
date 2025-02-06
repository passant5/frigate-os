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

/*----------------------------------------------------------------------*/
/* Buffers protecting the management region from the user region.       */
/* This mainly consists of tristate buffers that are enabled by a       */
/* "logic 1" output connected to the user's VCCD domain.  This ensures  */
/* that the buffer is disabled and the output high-impedence when the   */
/* user 1.8V supply is absent.                                          */
/*----------------------------------------------------------------------*/
/* Because there is no tristate buffer with a non-inverted enable, a    */
/* tristate inverter with non-inverted enable is used in series with    */
/* another (normal) inverter.                                           */
/*----------------------------------------------------------------------*/
/* For the sake of placement/routing, one conb (logic 1) cell is used   */
/* for every buffer.                                                    */
/*----------------------------------------------------------------------*/
/* 10/3/2022:  Removed tri-state buffers in favor of AND gates;  i.e.,  */
/* if the user project is powered down, then the outputs are grounded   */
/* rather than tristated.  Other explicitly-referenced gates removed    */
/* with the assumption that all outputs will be buffered as needed by   */
/* the synthesis tools.  Therefore the only restrictions needed on the  */
/* synthesis tools is the list of input signals that must not be        */
/* buffered because they are allowed to be floating.                    */
/*----------------------------------------------------------------------*/

module mgmt_protect (
`ifdef USE_POWER_PINS
    inout  vccd0,
    inout  vssd0,
    inout  vccd1,
    inout  vssd1,
`endif

    input wire   frigate_HCLK,
    input wire   frigate_HRESETn,

    // Exported AHB bus
    input   wire           mprj_AHB_Ena,
    input   wire           mprj_HSEL_core,
    input   wire [31:0]    mprj_HADDR_core,
    input   wire [31:0]    mprj_HWDATA_core,
    input   wire           mprj_HREADY_core,
    input   wire           mprj_HWRITE_core,
    input   wire [1:0]     mprj_HTRANS_core,
    input   wire [2:0]     mprj_HSIZE_core,
    output  wire [31:0]    mprj_HRDATA_core,
    output  wire           mprj_HREADYOUT_core,

    output wire [15:0]      user_irq_core,


    // All signal in/out directions are the reverse of the signal
    // names at the buffer intrface.

    input  wire [15:0]  user_irq_ena,

    output wire  user_HCLK,
    output wire  user_HRESETn,

    // Exported AHB bus

    output wire             mprj_HSEL_user,
    output wire [31:0]      mprj_HADDR_user,
    output wire [31:0]      mprj_HWDATA_user,
    output wire             mprj_HREADY_user,
    output wire             mprj_HWRITE_user,
    output wire [1:0]       mprj_HTRANS_user,
    output wire [2:0]       mprj_HSIZE_user,
    input  wire [31:0]      mprj_HRDATA_user,
    input  wire             mprj_HREADYOUT_user,

    input wire [15:0]       user_irq
);

    wire [90:0] mprj_logic1;

    wire [15:0] user_irq_bar;

    wire [15:0] user_irq_enable;
    wire        ahb_in_enable;

    wire [31:0] mprj_dat_i_core_bar;
    wire        mprj_ack_i_core_bar;

    vccd1_tie_high mprj_logic_high_inst (
`ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
`endif
        .HI(mprj_logic1)
    );

    // Buffering from the user side to the management side.
    // NOTE:  This is intended to be better protected, by a full
    // chain of an lv-to-hv buffer followed by an hv-to-lv buffer.
    // This serves as a placeholder until that configuration is
    // checked and characterized.  The function below forces the
    // data input to the management core to be a solid logic 0 when
    // the user project is powered down.

    // Protection, similar to the above, for the three user IRQ lines

    assign user_irq_enable = user_irq_ena & mprj_logic1[90:75];

    sky130_fd_sc_hd__nand2_4 irq_gates [15:0] (
`ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        .VPB(vccd0),
        .VNB(vssd0),
`endif
        .Y(user_irq_bar),
        .A(user_irq),        // may be floating
        .B(user_irq_enable)
    );

    assign user_irq_core = ~user_irq_bar;

    // Protection, similar to the above, for the return
    // signals from user area to managment on the wishbone/AHB bus

    assign ahb_in_enable = mprj_AHB_Ena & mprj_logic1[74];

    sky130_fd_sc_hd__nand2_4 wb_hrdata_gates [31:0] (
`ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        .VPB(vccd0),
        .VNB(vssd0),
`endif
        .Y(mprj_dat_i_core_bar),
        .A(mprj_HRDATA_user),        // may be floating
        .B(ahb_in_enable)
    );

    assign mprj_HRDATA_core = ~mprj_dat_i_core_bar;

    sky130_fd_sc_hd__nand2_4 hreadyout_ack_gate (
`ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        .VPB(vccd0),
        .VNB(vssd0),
`endif
        .Y(mprj_ack_i_core_bar),
        .A(mprj_HREADYOUT_user),        // may be floating
        .B(ahb_in_enable)
    );

    assign mprj_HREADYOUT_core = ~mprj_ack_i_core_bar;

    // The remaining circuitry guards against the management
    // SoC dumping current into the user project area when
    // the user project area is powered down.

    assign user_HCLK    = frigate_HCLK    & mprj_logic1[0];
    assign user_HRESETn = frigate_HRESETn & mprj_logic1[1];

    assign mprj_HSEL_user = mprj_HSEL_core & mprj_logic1[2];
    assign mprj_HREADY_user = mprj_HREADY_core & mprj_logic1[3];
    assign mprj_HWRITE_user  = mprj_HWRITE_core  & mprj_logic1[4];
    assign mprj_HSIZE_user = mprj_HSIZE_core & mprj_logic1[7:5];
    assign mprj_HADDR_user = mprj_HADDR_core & mprj_logic1[39:8];
    assign mprj_HWDATA_user = mprj_HWDATA_core & mprj_logic1[71:40];
    assign mprj_HTRANS_user = mprj_HTRANS_core & mprj_logic1[73:72];

endmodule
`default_nettype wire
