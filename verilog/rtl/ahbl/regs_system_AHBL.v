/*
	Copyright 2023 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

/* THIS FILE IS GENERATED, DO NOT EDIT */

`timescale			1ns/1ps
`default_nettype	none

module regs_system_AHBL (
	input wire          HCLK,
                                        input wire          HRESETn,
                                        input wire          HWRITE,
                                        input wire [31:0]   HWDATA,
                                        input wire [31:0]   HADDR,
                                        input wire [1:0]    HTRANS,
                                        input wire          HSEL,
                                        input wire          HREADY,
                                        output wire         HREADYOUT,
                                        output wire [31:0]  HRDATA,
                                        output wire         IRQ
,
   	output	wire	[1-1:0] vref_e_vrefgen_en,
   	output	wire	[1-1:0] vref_w_vrefgen_en,
   	output	wire	[5-1:0] vref_e_ref_sel,
   	output	wire	[5-1:0] vref_w_ref_sel,
	output	wire	[1-1:0]	muxsplit_se_switch_aa_sl,
	output	wire	[1-1:0]	muxsplit_se_switch_aa_s0,
	output	wire	[1-1:0]	muxsplit_se_switch_bb_s0,
	output	wire	[1-1:0]	muxsplit_se_switch_bb_sl,
	output	wire	[1-1:0]	muxsplit_se_switch_bb_sr,
	output	wire	[1-1:0]	muxsplit_se_switch_aa_sr,
	output	wire	[1-1:0]	muxsplit_sw_switch_aa_sl,
	output	wire	[1-1:0]	muxsplit_sw_switch_aa_s0,
	output	wire	[1-1:0]	muxsplit_sw_switch_bb_s0,
	output	wire	[1-1:0]	muxsplit_sw_switch_bb_sl,
	output	wire	[1-1:0]	muxsplit_sw_switch_bb_sr,
	output	wire	[1-1:0]	muxsplit_sw_switch_aa_sr,
	output	wire	[1-1:0]	muxsplit_ne_switch_aa_sl,
	output	wire	[1-1:0]	muxsplit_ne_switch_aa_s0,
	output	wire	[1-1:0]	muxsplit_ne_switch_bb_s0,
	output	wire	[1-1:0]	muxsplit_ne_switch_bb_sl,
	output	wire	[1-1:0]	muxsplit_ne_switch_bb_sr,
	output	wire	[1-1:0]	muxsplit_ne_switch_aa_sr,
	output	wire	[1-1:0]	muxsplit_nw_switch_aa_sl,
	output	wire	[1-1:0]	muxsplit_nw_switch_aa_s0,
	output	wire	[1-1:0]	muxsplit_nw_switch_bb_s0,
	output	wire	[1-1:0]	muxsplit_nw_switch_bb_sl,
	output	wire	[1-1:0]	muxsplit_nw_switch_bb_sr,
	output	wire	[1-1:0]	muxsplit_nw_switch_aa_sr,
	output	wire	[1-1:0]	user_ahb_enable,
	output	wire	[16-1:0]	user_irqs_enable,
	output	wire	[6-1:0]	sio_cfg,
	input	wire	[1-1:0]	mgmt_select
);

	localparam	muxsplit_control_REG_OFFSET = 16'h0000;
	localparam	user_ahb_enable_REG_OFFSET = 16'h0004;
	localparam	user_irqs_enable_REG_OFFSET = 16'h0008;
	localparam	sio_cfg_REG_OFFSET = 16'h000C;
	localparam	mgmt_select_REG_OFFSET = 16'h0010;
	localparam	vref_control_REG_OFFSET = 16'h0014;
	wire		clk = HCLK;
	wire		rst_n = HRESETn;


	reg  last_HSEL, last_HWRITE; reg [31:0] last_HADDR; reg [1:0] last_HTRANS;
                                        always@ (posedge HCLK or negedge HRESETn) begin
					   if(~HRESETn) begin
					       last_HSEL       <= 1'b0;
					       last_HADDR      <= 1'b0;
					       last_HWRITE     <= 1'b0;
					       last_HTRANS     <= 1'b0;
				            end else if(HREADY) begin
                                                last_HSEL       <= HSEL;
                                                last_HADDR      <= HADDR;
                                                last_HWRITE     <= HWRITE;
                                                last_HTRANS     <= HTRANS;
                                            end
                                        end
                                        wire    ahbl_valid	= last_HSEL & last_HTRANS[1];
	                                    wire	ahbl_we	= last_HWRITE & ahbl_valid;
	                                    wire	ahbl_re	= ~last_HWRITE & ahbl_valid;

	wire [1-1:0]	bus_vref_e_vrefgen_en;
	wire [1-1:0]	bus_vref_w_vrefgen_en;
	wire [5-1:0]	bus_vref_e_ref_sel;
	wire [5-1:0]	bus_vref_w_ref_sel;
	wire [1-1:0]	bus_muxsplit_se_switch_aa_sl;
	wire [1-1:0]	bus_muxsplit_se_switch_aa_s0;
	wire [1-1:0]	bus_muxsplit_se_switch_bb_s0;
	wire [1-1:0]	bus_muxsplit_se_switch_bb_sl;
	wire [1-1:0]	bus_muxsplit_se_switch_bb_sr;
	wire [1-1:0]	bus_muxsplit_se_switch_aa_sr;
	wire [1-1:0]	bus_muxsplit_sw_switch_aa_sl;
	wire [1-1:0]	bus_muxsplit_sw_switch_aa_s0;
	wire [1-1:0]	bus_muxsplit_sw_switch_bb_s0;
	wire [1-1:0]	bus_muxsplit_sw_switch_bb_sl;
	wire [1-1:0]	bus_muxsplit_sw_switch_bb_sr;
	wire [1-1:0]	bus_muxsplit_sw_switch_aa_sr;
	wire [1-1:0]	bus_muxsplit_ne_switch_aa_sl;
	wire [1-1:0]	bus_muxsplit_ne_switch_aa_s0;
	wire [1-1:0]	bus_muxsplit_ne_switch_bb_s0;
	wire [1-1:0]	bus_muxsplit_ne_switch_bb_sl;
	wire [1-1:0]	bus_muxsplit_ne_switch_bb_sr;
	wire [1-1:0]	bus_muxsplit_ne_switch_aa_sr;
	wire [1-1:0]	bus_muxsplit_nw_switch_aa_sl;
	wire [1-1:0]	bus_muxsplit_nw_switch_aa_s0;
	wire [1-1:0]	bus_muxsplit_nw_switch_bb_s0;
	wire [1-1:0]	bus_muxsplit_nw_switch_bb_sl;
	wire [1-1:0]	bus_muxsplit_nw_switch_bb_sr;
	wire [1-1:0]	bus_muxsplit_nw_switch_aa_sr;
	wire [1-1:0]	bus_user_ahb_enable;
	wire [16-1:0]	bus_user_irqs_enable;
	wire [6-1:0]	bus_sio_cfg;
	wire [1-1:0]	bus_mgmt_select;

	// Register Definitions
	reg [27:0]	muxsplit_control_REG;
	assign	bus_muxsplit_se_switch_aa_sl	=	muxsplit_control_REG[0 : 0];
	assign	bus_muxsplit_se_switch_aa_s0	=	muxsplit_control_REG[1 : 1];
	assign	bus_muxsplit_se_switch_bb_s0	=	muxsplit_control_REG[2 : 2];
	assign	bus_muxsplit_se_switch_bb_sl	=	muxsplit_control_REG[3 : 3];
	assign	bus_muxsplit_se_switch_bb_sr	=	muxsplit_control_REG[4 : 4];
	assign	bus_muxsplit_se_switch_aa_sr	=	muxsplit_control_REG[5 : 5];
	assign	bus_muxsplit_sw_switch_aa_sl	=	muxsplit_control_REG[8 : 8];
	assign	bus_muxsplit_sw_switch_aa_s0	=	muxsplit_control_REG[9 : 9];
	assign	bus_muxsplit_sw_switch_bb_s0	=	muxsplit_control_REG[10 : 10];
	assign	bus_muxsplit_sw_switch_bb_sl	=	muxsplit_control_REG[11 : 11];
	assign	bus_muxsplit_sw_switch_bb_sr	=	muxsplit_control_REG[12 : 12];
	assign	bus_muxsplit_sw_switch_aa_sr	=	muxsplit_control_REG[13 : 13];
	assign	bus_muxsplit_ne_switch_aa_sl	=	muxsplit_control_REG[16 : 16];
	assign	bus_muxsplit_ne_switch_aa_s0	=	muxsplit_control_REG[17 : 17];
	assign	bus_muxsplit_ne_switch_bb_s0	=	muxsplit_control_REG[18 : 18];
	assign	bus_muxsplit_ne_switch_bb_sl	=	muxsplit_control_REG[19 : 19];
	assign	bus_muxsplit_ne_switch_bb_sr	=	muxsplit_control_REG[20 : 20];
	assign	bus_muxsplit_ne_switch_aa_sr	=	muxsplit_control_REG[21 : 21];
	assign	bus_muxsplit_nw_switch_aa_sl	=	muxsplit_control_REG[22 : 22];
	assign	bus_muxsplit_nw_switch_aa_s0	=	muxsplit_control_REG[23 : 23];
	assign	bus_muxsplit_nw_switch_bb_s0	=	muxsplit_control_REG[24 : 24];
	assign	bus_muxsplit_nw_switch_bb_sl	=	muxsplit_control_REG[25 : 25];
	assign	bus_muxsplit_nw_switch_bb_sr	=	muxsplit_control_REG[26 : 26];
	assign	bus_muxsplit_nw_switch_aa_sr	=	muxsplit_control_REG[27 : 27];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) muxsplit_control_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==muxsplit_control_REG_OFFSET))
                                            muxsplit_control_REG <= HWDATA[28-1:0];

	reg [12-1:0]	vref_control_REG;
	assign	bus_vref_e_vrefgen_en	=	vref_control_REG[0 : 0];
	assign	bus_vref_w_vrefgen_en	=	vref_control_REG[1 : 1];
	assign	bus_vref_e_ref_sel	=	vref_control_REG[6 : 2];
	assign	bus_vref_w_ref_sel	=	vref_control_REG[11 : 7];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) vref_control_REG <= 12'b000000000011;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==vref_control_REG_OFFSET))
                                            vref_control_REG <= HWDATA[12-1:0];
	reg [0:0]	user_ahb_enable_REG;
	assign	bus_user_ahb_enable = user_ahb_enable_REG;
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) user_ahb_enable_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==user_ahb_enable_REG_OFFSET))
                                            user_ahb_enable_REG <= HWDATA[1-1:0];

	reg [15:0]	user_irqs_enable_REG;
	assign	bus_user_irqs_enable = user_irqs_enable_REG;
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) user_irqs_enable_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==user_irqs_enable_REG_OFFSET))
                                            user_irqs_enable_REG <= HWDATA[16-1:0];

	reg [5:0]	sio_cfg_REG;
	assign	bus_sio_cfg = sio_cfg_REG;
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) sio_cfg_REG <= 6'b100000;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==sio_cfg_REG_OFFSET))
                                            sio_cfg_REG <= HWDATA[6-1:0];

	wire [1-1:0]	mgmt_select_WIRE;
	assign	mgmt_select_WIRE = bus_mgmt_select;

	regs_system instance_to_wrap (
		.clk(clk),
		.rst_n(rst_n),
		.bus_muxsplit_se_switch_aa_sl(bus_muxsplit_se_switch_aa_sl),
		.bus_muxsplit_se_switch_aa_s0(bus_muxsplit_se_switch_aa_s0),
		.bus_muxsplit_se_switch_bb_s0(bus_muxsplit_se_switch_bb_s0),
		.bus_muxsplit_se_switch_bb_sl(bus_muxsplit_se_switch_bb_sl),
		.bus_muxsplit_se_switch_bb_sr(bus_muxsplit_se_switch_bb_sr),
		.bus_muxsplit_se_switch_aa_sr(bus_muxsplit_se_switch_aa_sr),
		.bus_muxsplit_sw_switch_aa_sl(bus_muxsplit_sw_switch_aa_sl),
		.bus_muxsplit_sw_switch_aa_s0(bus_muxsplit_sw_switch_aa_s0),
		.bus_muxsplit_sw_switch_bb_s0(bus_muxsplit_sw_switch_bb_s0),
		.bus_muxsplit_sw_switch_bb_sl(bus_muxsplit_sw_switch_bb_sl),
		.bus_muxsplit_sw_switch_bb_sr(bus_muxsplit_sw_switch_bb_sr),
		.bus_muxsplit_sw_switch_aa_sr(bus_muxsplit_sw_switch_aa_sr),
		.bus_muxsplit_ne_switch_aa_sl(bus_muxsplit_ne_switch_aa_sl),
		.bus_muxsplit_ne_switch_aa_s0(bus_muxsplit_ne_switch_aa_s0),
		.bus_muxsplit_ne_switch_bb_s0(bus_muxsplit_ne_switch_bb_s0),
		.bus_muxsplit_ne_switch_bb_sl(bus_muxsplit_ne_switch_bb_sl),
		.bus_muxsplit_ne_switch_bb_sr(bus_muxsplit_ne_switch_bb_sr),
		.bus_muxsplit_ne_switch_aa_sr(bus_muxsplit_ne_switch_aa_sr),
		.bus_muxsplit_nw_switch_aa_sl(bus_muxsplit_nw_switch_aa_sl),
		.bus_muxsplit_nw_switch_aa_s0(bus_muxsplit_nw_switch_aa_s0),
		.bus_muxsplit_nw_switch_bb_s0(bus_muxsplit_nw_switch_bb_s0),
		.bus_muxsplit_nw_switch_bb_sl(bus_muxsplit_nw_switch_bb_sl),
		.bus_muxsplit_nw_switch_bb_sr(bus_muxsplit_nw_switch_bb_sr),
		.bus_muxsplit_nw_switch_aa_sr(bus_muxsplit_nw_switch_aa_sr),
		.bus_vref_e_vrefgen_en(bus_vref_e_vrefgen_en),
		.bus_vref_w_vrefgen_en(bus_vref_w_vrefgen_en),
		.bus_vref_e_ref_sel(bus_vref_e_ref_sel),
		.bus_vref_w_ref_sel(bus_vref_w_ref_sel),
		.bus_user_ahb_enable(bus_user_ahb_enable),
		.bus_user_irqs_enable(bus_user_irqs_enable),
		.bus_sio_cfg(bus_sio_cfg),
		.bus_mgmt_select(bus_mgmt_select),
		.muxsplit_se_switch_aa_sl(muxsplit_se_switch_aa_sl),
		.muxsplit_se_switch_aa_s0(muxsplit_se_switch_aa_s0),
		.muxsplit_se_switch_bb_s0(muxsplit_se_switch_bb_s0),
		.muxsplit_se_switch_bb_sl(muxsplit_se_switch_bb_sl),
		.muxsplit_se_switch_bb_sr(muxsplit_se_switch_bb_sr),
		.muxsplit_se_switch_aa_sr(muxsplit_se_switch_aa_sr),
		.muxsplit_sw_switch_aa_sl(muxsplit_sw_switch_aa_sl),
		.muxsplit_sw_switch_aa_s0(muxsplit_sw_switch_aa_s0),
		.muxsplit_sw_switch_bb_s0(muxsplit_sw_switch_bb_s0),
		.muxsplit_sw_switch_bb_sl(muxsplit_sw_switch_bb_sl),
		.muxsplit_sw_switch_bb_sr(muxsplit_sw_switch_bb_sr),
		.muxsplit_sw_switch_aa_sr(muxsplit_sw_switch_aa_sr),
		.muxsplit_ne_switch_aa_sl(muxsplit_ne_switch_aa_sl),
		.muxsplit_ne_switch_aa_s0(muxsplit_ne_switch_aa_s0),
		.muxsplit_ne_switch_bb_s0(muxsplit_ne_switch_bb_s0),
		.muxsplit_ne_switch_bb_sl(muxsplit_ne_switch_bb_sl),
		.muxsplit_ne_switch_bb_sr(muxsplit_ne_switch_bb_sr),
		.muxsplit_ne_switch_aa_sr(muxsplit_ne_switch_aa_sr),
		.muxsplit_nw_switch_aa_sl(muxsplit_nw_switch_aa_sl),
		.muxsplit_nw_switch_aa_s0(muxsplit_nw_switch_aa_s0),
		.muxsplit_nw_switch_bb_s0(muxsplit_nw_switch_bb_s0),
		.muxsplit_nw_switch_bb_sl(muxsplit_nw_switch_bb_sl),
		.muxsplit_nw_switch_bb_sr(muxsplit_nw_switch_bb_sr),
		.muxsplit_nw_switch_aa_sr(muxsplit_nw_switch_aa_sr),
		.vref_e_vrefgen_en(vref_e_vrefgen_en),
		.vref_w_vrefgen_en(vref_w_vrefgen_en),
		.vref_e_ref_sel(vref_e_ref_sel),
		.vref_w_ref_sel(vref_w_ref_sel),
		.user_ahb_enable(user_ahb_enable),
		.user_irqs_enable(user_irqs_enable),
		.sio_cfg(sio_cfg),
		.mgmt_select(mgmt_select)
	);

	assign HRDATA = 
		~HSEL ? 32'b0:
		(last_HADDR[16-1:0] == muxsplit_control_REG_OFFSET)	? muxsplit_control_REG :
		(last_HADDR[16-1:0] == user_ahb_enable_REG_OFFSET)	? user_ahb_enable_REG :
		(last_HADDR[16-1:0] == user_irqs_enable_REG_OFFSET)	? user_irqs_enable_REG :
		(last_HADDR[16-1:0] == sio_cfg_REG_OFFSET)	? sio_cfg_REG :
		(last_HADDR[16-1:0] == mgmt_select_REG_OFFSET)	? mgmt_select_WIRE :
		32'hDEADBEEF
		;

	assign	HREADYOUT = 1'b1;

endmodule
