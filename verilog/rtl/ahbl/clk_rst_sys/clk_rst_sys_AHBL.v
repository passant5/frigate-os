/*
	Copyright 2024 Efabless Corp.

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

/*
	Copyright 2020 AUCOHL

    Author: Mohamed Shalan (mshalan@aucegypt.edu)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

module clk_rst_sys_AHBL (
	`ifdef USE_POWER_PINS 
		input   wire        VPWR, 
		input   wire        VGND, 
	`endif // USE_POWER_PINS
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
	input	wire	[1-1:0]	xclk,
	input	wire	[1-1:0]	rcosc_500k,
	input	wire	[1-1:0]	rcosc_16m,
	input	wire	[1-1:0]	hsxo,
	input	wire	[1-1:0]	lsxo,
	input	wire	[1-1:0]	xrst_n,
	input	wire	[1-1:0]	por_n,
	input	wire	[1-1:0]	hkrst_n,
	output	wire	[1-1:0]	clk,
    output  wire    [1-1:0] pclk,           // clock for apb sys 
	output	wire	[1-1:0]	clk_mon,
	output	wire	[1-1:0]	usb_clk,
	output	wire	[1-1:0]	user_clk,
	output	wire	[1-1:0]	rst_n,

	output	wire	[1-1:0]	rcosc_500k_en_tf,
	output	wire	[1-1:0]	rcosc_16m_en_tf,
	output	wire	[1-1:0]	hsxo_en_tf,
	output	wire	[1-1:0]	lsxo_en_tf,
	output	wire	[1-1:0]	lsxo_standby_tf,
	output	wire	[1-1:0]	hsxo_standby_tf
);

	localparam	dll_ctrl_REG_OFFSET = 16'h0000;
	localparam	dll_ext_trim_REG_OFFSET = 16'h0004;
	localparam	clk_src_en_REG_OFFSET = 16'h0008;
	localparam	clk_mon_sel_REG_OFFSET = 16'h000C;
	localparam	mux_ctrl_REG_OFFSET = 16'h0010;
	localparam	clk_div_REG_OFFSET = 16'h0014;
	localparam	xo_standby_REG_OFFSET = 16'h0020;

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

	wire [1-1:0]	dll_en;
	wire [8-1:0]	dll_div;
	wire [1-1:0]	dll_dco;
	wire [26-1:0]	dll_ext_trim;
	wire [1-1:0]	rcosc_500k_en;
	wire [1-1:0]	rcosc_16m_en;
	wire [1-1:0]	hsxo_en;
	wire [1-1:0]	lsxo_en;
	wire [1-1:0]	lsxo_standby;
	wire [1-1:0]	hsxo_standby;
	wire [3-1:0]	clk_mon_sel;
	wire [1-1:0]	sel_mux0;
	wire [1-1:0]	sel_mux1;
	wire [1-1:0]	sel_mux2;
	wire [1-1:0]	sel_mux3;
	wire [1-1:0]	sel_mux4;
	wire [1-1:0]	sel_mux5;
	wire [3-1:0]	sel_clkdiv0;
	wire [3-1:0]	sel_clkdiv1;
	wire [3-1:0]	sel_clkdiv2;

	// Register Definitions
	reg [9:0]	dll_ctrl_REG;
	assign	dll_en	=	dll_ctrl_REG[0 : 0];
	assign	dll_dco	=	dll_ctrl_REG[1 : 1];
	assign	dll_div	=	dll_ctrl_REG[9 : 2];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) dll_ctrl_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==dll_ctrl_REG_OFFSET))
                                            dll_ctrl_REG <= HWDATA[10-1:0];

	reg [25:0]	dll_ext_trim_REG;
	assign	dll_ext_trim = dll_ext_trim_REG;
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) dll_ext_trim_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==dll_ext_trim_REG_OFFSET))
                                            dll_ext_trim_REG <= HWDATA[26-1:0];

	reg [3:0]	clk_src_en_REG;
	assign	rcosc_500k_en	=	clk_src_en_REG[0 : 0];
	assign	rcosc_16m_en	=	clk_src_en_REG[1 : 1];
	assign	hsxo_en	=	clk_src_en_REG[2 : 2];
	assign	lsxo_en	=	clk_src_en_REG[3 : 3];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) clk_src_en_REG <= 'h1;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==clk_src_en_REG_OFFSET))
                                            clk_src_en_REG <= HWDATA[4-1:0];

	reg [2:0]	clk_mon_sel_REG;
	assign	clk_mon_sel = clk_mon_sel_REG;
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) clk_mon_sel_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==clk_mon_sel_REG_OFFSET))
                                            clk_mon_sel_REG <= HWDATA[3-1:0];

	reg [5:0]	mux_ctrl_REG;
	assign	sel_mux0	=	mux_ctrl_REG[0 : 0];
	assign	sel_mux1	=	mux_ctrl_REG[1 : 1];
	assign	sel_mux2	=	mux_ctrl_REG[2 : 2];
	assign	sel_mux3	=	mux_ctrl_REG[3 : 3];
	assign	sel_mux4	=	mux_ctrl_REG[4 : 4];
	assign	sel_mux5	=	mux_ctrl_REG[5 : 5];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) mux_ctrl_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==mux_ctrl_REG_OFFSET))
                                            mux_ctrl_REG <= HWDATA[6-1:0];

	reg [8:0]	clk_div_REG;
	assign	sel_clkdiv0	=	clk_div_REG[2 : 0];
	assign	sel_clkdiv1	=	clk_div_REG[5 : 3];
	assign	sel_clkdiv2	=	clk_div_REG[8 : 6];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) clk_div_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==clk_div_REG_OFFSET))
                                            clk_div_REG <= HWDATA[9-1:0];

	reg [1:0]	xo_standby_REG;
	assign	lsxo_standby	=	xo_standby_REG[0 : 0];
	assign	hsxo_standby	=	xo_standby_REG[1 : 1];
	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) xo_standby_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==xo_standby_REG_OFFSET))
                                            xo_standby_REG <= HWDATA[2-1:0];


	wire    dll_clk;
	wire    dll_clk90;
	wire   	clk_mux1;
	
	clk_rst_sys instance_to_wrap (
	`ifdef USE_POWER_PINS
		.VPWR(VPWR),
		.VGND(VGND),
	`endif
		.dll_clk(dll_clk),
		.dll_clk90(dll_clk90),
		.clk_mux1_out(clk_mux1),
		.rcosc_500k_en(rcosc_500k_en),
		.rcosc_16m_en(rcosc_16m_en),
		.hsxo_en(hsxo_en),
		.lsxo_en(lsxo_en),
		.lsxo_standby(lsxo_standby),
		.hsxo_standby(hsxo_standby),
		.clk_mon_sel(clk_mon_sel),
		.sel_mux0(sel_mux0),
		.sel_mux1(sel_mux1),
		.sel_mux2(sel_mux2),
		.sel_mux3(sel_mux3),
		.sel_mux4(sel_mux4),
		.sel_mux5(sel_mux5),
		.sel_clkdiv0(sel_clkdiv0),
		.sel_clkdiv1(sel_clkdiv1),
		.sel_clkdiv2(sel_clkdiv2),
		.xclk(xclk),
		.rcosc_500k(rcosc_500k),
		.rcosc_16m(rcosc_16m),
		.hsxo(hsxo),
		.lsxo(lsxo),
		.xrst_n(xrst_n),
		.por_n(por_n),
		.hkrst_n(hkrst_n),
		.clk(clk),
		.pclk(pclk),
		.clk_mon(clk_mon),
		.usb_clk(usb_clk),
		.user_clk(user_clk),
		.rst_n(rst_n),
		.rcosc_500k_en_tf(rcosc_500k_en_tf),
		.rcosc_16m_en_tf(rcosc_16m_en_tf),
		.hsxo_en_tf(hsxo_en_tf),
		.lsxo_en_tf(lsxo_en_tf),
		.lsxo_standby_tf(lsxo_standby_tf),
		.hsxo_standby_tf(hsxo_standby_tf)
	);
	
// The DLL and its bypass Clock MUX
    dll dll (
	`ifdef USE_POWER_PINS
		.VPWR(VPWR),
		.VGND(VGND),
	`endif
        .resetb(rst_n),
        .enable(dll_en),
        .osc(clk_mux1),
        .clockp({dll_clk, dll_clk90}),
        .div(dll_div),
        .dco(dll_dco),
        .ext_trim(dll_ext_trim)
    );

	assign	HRDATA = 
			(last_HADDR[16-1:0] == dll_ctrl_REG_OFFSET)	? dll_ctrl_REG :
			(last_HADDR[16-1:0] == dll_ext_trim_REG_OFFSET)	? dll_ext_trim_REG :
			(last_HADDR[16-1:0] == clk_src_en_REG_OFFSET)	? clk_src_en_REG :
			(last_HADDR[16-1:0] == clk_mon_sel_REG_OFFSET)	? clk_mon_sel_REG :
			(last_HADDR[16-1:0] == mux_ctrl_REG_OFFSET)	? mux_ctrl_REG :
			(last_HADDR[16-1:0] == clk_div_REG_OFFSET)	? clk_div_REG :
			(last_HADDR[16-1:0] == xo_standby_REG_OFFSET)	? xo_standby_REG :
			32'hDEADBEEF;

	assign	HREADYOUT = 1'b1;

endmodule
