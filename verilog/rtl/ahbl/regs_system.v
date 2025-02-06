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

module regs_system (

    input   wire         clk,
    input   wire         rst_n,
    input wire  bus_muxsplit_se_switch_aa_sl,
    input wire  bus_muxsplit_se_switch_aa_s0,
    input wire  bus_muxsplit_se_switch_bb_s0,
    input wire  bus_muxsplit_se_switch_bb_sl,
    input wire  bus_muxsplit_se_switch_bb_sr,
    input wire  bus_muxsplit_se_switch_aa_sr,
    input wire  bus_muxsplit_sw_switch_aa_sl,
    input wire  bus_muxsplit_sw_switch_aa_s0,
    input wire  bus_muxsplit_sw_switch_bb_s0,
    input wire  bus_muxsplit_sw_switch_bb_sl,
    input wire  bus_muxsplit_sw_switch_bb_sr,
    input wire  bus_muxsplit_sw_switch_aa_sr,
    input wire  bus_muxsplit_ne_switch_aa_sl,
    input wire  bus_muxsplit_ne_switch_aa_s0,
    input wire  bus_muxsplit_ne_switch_bb_s0,
    input wire  bus_muxsplit_ne_switch_bb_sl,
    input wire  bus_muxsplit_ne_switch_bb_sr,
    input wire  bus_muxsplit_ne_switch_aa_sr,
    input wire  bus_muxsplit_nw_switch_aa_sl,
    input wire  bus_muxsplit_nw_switch_aa_s0,
    input wire  bus_muxsplit_nw_switch_bb_s0,
    input wire  bus_muxsplit_nw_switch_bb_sl,
    input wire  bus_muxsplit_nw_switch_bb_sr,
    input wire  bus_muxsplit_nw_switch_aa_sr,
    input wire	bus_vref_e_vrefgen_en,
   	input wire	bus_vref_w_vrefgen_en,
   	input wire	[4:0] bus_vref_e_ref_sel,
   	input wire	[4:0] bus_vref_w_ref_sel,
    input wire  bus_user_ahb_enable,
    input wire [15:0] bus_user_irqs_enable,
    input wire	[5:0]	bus_sio_cfg,
	output wire	bus_mgmt_select,

    output wire  muxsplit_se_switch_aa_sl,
    output wire  muxsplit_se_switch_aa_s0,
    output wire  muxsplit_se_switch_bb_s0,
    output wire  muxsplit_se_switch_bb_sl,
    output wire  muxsplit_se_switch_bb_sr,
    output wire  muxsplit_se_switch_aa_sr,
    output wire  muxsplit_sw_switch_aa_sl,
    output wire  muxsplit_sw_switch_aa_s0,
    output wire  muxsplit_sw_switch_bb_s0,
    output wire  muxsplit_sw_switch_bb_sl,
    output wire  muxsplit_sw_switch_bb_sr,
    output wire  muxsplit_sw_switch_aa_sr,
    output wire  muxsplit_ne_switch_aa_sl,
    output wire  muxsplit_ne_switch_aa_s0,
    output wire  muxsplit_ne_switch_bb_s0,
    output wire  muxsplit_ne_switch_bb_sl,
    output wire  muxsplit_ne_switch_bb_sr,
    output wire  muxsplit_ne_switch_aa_sr,
    output wire  muxsplit_nw_switch_aa_sl,
    output wire  muxsplit_nw_switch_aa_s0,
    output wire  muxsplit_nw_switch_bb_s0,
    output wire  muxsplit_nw_switch_bb_sl,
    output wire  muxsplit_nw_switch_bb_sr,
    output wire  muxsplit_nw_switch_aa_sr,
    output wire	 vref_e_vrefgen_en,
   	output wire	 vref_w_vrefgen_en,
   	output wire	 [4:0] vref_e_ref_sel,
   	output wire	 [4:0] vref_w_ref_sel,
    output wire  user_ahb_enable,
    output wire [15:0] user_irqs_enable,
    output	wire	[5:0]	sio_cfg,
	input	wire	mgmt_select
);

    assign muxsplit_se_switch_aa_sl = bus_muxsplit_se_switch_aa_sl;
    assign muxsplit_se_switch_aa_s0 = bus_muxsplit_se_switch_aa_s0;
    assign muxsplit_se_switch_bb_s0 = bus_muxsplit_se_switch_bb_s0;
    assign muxsplit_se_switch_bb_sl = bus_muxsplit_se_switch_bb_sl;
    assign muxsplit_se_switch_bb_sr = bus_muxsplit_se_switch_bb_sr;
    assign muxsplit_se_switch_aa_sr = bus_muxsplit_se_switch_aa_sr;
    assign muxsplit_sw_switch_aa_sl = bus_muxsplit_sw_switch_aa_sl;
    assign muxsplit_sw_switch_aa_s0 = bus_muxsplit_sw_switch_aa_s0;
    assign muxsplit_sw_switch_bb_s0 = bus_muxsplit_sw_switch_bb_s0;
    assign muxsplit_sw_switch_bb_sl = bus_muxsplit_sw_switch_bb_sl;
    assign muxsplit_sw_switch_bb_sr = bus_muxsplit_sw_switch_bb_sr;
    assign muxsplit_sw_switch_aa_sr = bus_muxsplit_sw_switch_aa_sr;
    assign muxsplit_ne_switch_aa_sl = bus_muxsplit_ne_switch_aa_sl;
    assign muxsplit_ne_switch_aa_s0 = bus_muxsplit_ne_switch_aa_s0;
    assign muxsplit_ne_switch_bb_s0 = bus_muxsplit_ne_switch_bb_s0;
    assign muxsplit_ne_switch_bb_sl = bus_muxsplit_ne_switch_bb_sl;
    assign muxsplit_ne_switch_bb_sr = bus_muxsplit_ne_switch_bb_sr;
    assign muxsplit_ne_switch_aa_sr = bus_muxsplit_ne_switch_aa_sr;
    assign muxsplit_nw_switch_aa_sl = bus_muxsplit_nw_switch_aa_sl;
    assign muxsplit_nw_switch_aa_s0 = bus_muxsplit_nw_switch_aa_s0;
    assign muxsplit_nw_switch_bb_s0 = bus_muxsplit_nw_switch_bb_s0;
    assign muxsplit_nw_switch_bb_sl = bus_muxsplit_nw_switch_bb_sl;
    assign muxsplit_nw_switch_bb_sr = bus_muxsplit_nw_switch_bb_sr;
    assign muxsplit_nw_switch_aa_sr = bus_muxsplit_nw_switch_aa_sr;
    assign vref_e_vrefgen_en = bus_vref_e_vrefgen_en;
    assign vref_w_vrefgen_en = bus_vref_w_vrefgen_en;
    assign vref_e_ref_sel = bus_vref_e_ref_sel;
    assign vref_w_ref_sel = bus_vref_w_ref_sel;
    assign user_ahb_enable = bus_user_ahb_enable;
    assign user_irqs_enable = bus_user_irqs_enable;
    assign sio_cfg = bus_sio_cfg;
    assign bus_mgmt_select = mgmt_select;

endmodule