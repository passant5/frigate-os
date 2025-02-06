/*
	Copyright 2022 Efabless Corp.

	Author: Harald Pretl (None)

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

module iic_audiodac_APB (
	input wire          PCLK,
                                        input wire          PRESETn,
                                        input wire          PWRITE,
                                        input wire [31:0]   PWDATA,
                                        input wire [31:0]   PADDR,
                                        input wire          PENABLE,
                                        input wire          PSEL,
                                        output wire         PREADY,
                                        output wire [31:0]  PRDATA,
                                        output wire         IRQ
,
`ifdef USE_POWER_PINS
	inout	wire	[1-1:0]	vccd1,
	inout	wire	[1-1:0]	vssd1,
`endif
	output	wire	[1-1:0]	ds_o,
	output	wire	[1-1:0]	ds_n_o
);

	localparam	DATA_REG_OFFSET = 16'h0000;
	localparam	FRDY_REG_OFFSET = 16'h0004;
	localparam	FACK_REG_OFFSET = 16'h0008;
	localparam	CFG_REG_OFFSET = 16'h000C;
	localparam	TST_FIFO_LOOP_REG_OFFSET = 16'h0010;
	localparam	IM_REG_OFFSET = 16'hFF00;
	localparam	MIS_REG_OFFSET = 16'hFF04;
	localparam	RIS_REG_OFFSET = 16'hFF08;
	localparam	IC_REG_OFFSET = 16'hFF0C;
	wire		clk_i = PCLK;
	wire		rst_n_i = PRESETn;


	wire		apb_valid   = PSEL & PENABLE;
                                        wire		apb_we	    = PWRITE & apb_valid;
                                        wire		apb_re	    = ~PWRITE & apb_valid;

	wire [16-1:0]	fifo_i;
	wire [1-1:0]	fifo_rdy_i;
	wire [1-1:0]	fifo_ack_o;
	wire [1-1:0]	fifo_full_o;
	wire [1-1:0]	fifo_empty_o;
	wire [1-1:0]	mode_i;
	wire [4-1:0]	volume_i;
	wire [2-1:0]	osr_i;
	wire [1-1:0]	tst_fifo_loop_i;

	// Register Definitions
	reg [15:0]	DATA_REG;
	//assign	fifo_i = DATA_REG;
	assign	fifo_i = PWDATA[15:0];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) DATA_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==DATA_REG_OFFSET))
                                            DATA_REG <= PWDATA[16-1:0];

	reg [0:0]	FRDY_REG;
	//assign	fifo_rdy_i = FRDY_REG;
	assign	fifo_rdy_i = (apb_we & (PADDR[15:0]==DATA_REG_OFFSET));

	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) FRDY_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==FRDY_REG_OFFSET))
                                            FRDY_REG <= PWDATA[1-1:0];

	wire [1-1:0]	FACK_WIRE;
	assign	FACK_WIRE = fifo_ack_o;

	reg [6:0]	CFG_REG;
	assign	mode_i	=	CFG_REG[0 : 0];
	assign	volume_i	=	CFG_REG[4 : 1];
	assign	osr_i	=	CFG_REG[6 : 5];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) CFG_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==CFG_REG_OFFSET))
                                            CFG_REG <= PWDATA[7-1:0];

	reg [0:0]	TST_FIFO_LOOP_REG;
	assign	tst_fifo_loop_i = TST_FIFO_LOOP_REG;
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) TST_FIFO_LOOP_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==TST_FIFO_LOOP_REG_OFFSET))
                                            TST_FIFO_LOOP_REG <= PWDATA[1-1:0];

	reg [1:0] IM_REG;
	reg [1:0] IC_REG;
	reg [1:0] RIS_REG;

	wire[2-1:0]      MIS_REG	= RIS_REG & IM_REG;
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) IM_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==IM_REG_OFFSET))
                                            IM_REG <= PWDATA[2-1:0];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) IC_REG <= 2'b0;
                                        else if(apb_we & (PADDR[16-1:0]==IC_REG_OFFSET))
                                            IC_REG <= PWDATA[2-1:0];
                                        else
                                            IC_REG <= 2'd0;

	wire [0:0] FE = fifo_empty_o;
	wire [0:0] FF = fifo_full_o;


	integer _i_;
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) RIS_REG <= 0; else begin
		for(_i_ = 0; _i_ < 1; _i_ = _i_ + 1) begin
			if(IC_REG[_i_]) RIS_REG[_i_] <= 1'b0; else if(FE[_i_ - 0] == 1'b1) RIS_REG[_i_] <= 1'b1;
		end
		for(_i_ = 1; _i_ < 2; _i_ = _i_ + 1) begin
			if(IC_REG[_i_]) RIS_REG[_i_] <= 1'b0; else if(FF[_i_ - 1] == 1'b1) RIS_REG[_i_] <= 1'b1;
		end
	end

	assign IRQ = |MIS_REG;

	audiodac instance_to_wrap (
		.clk_i(clk_i),
		.rst_n_i(rst_n_i),
		.fifo_i(fifo_i),
		.fifo_rdy_i(fifo_rdy_i),
		.fifo_ack_o(fifo_ack_o),
		.fifo_full_o(fifo_full_o),
		.fifo_empty_o(fifo_empty_o),
		.mode_i(mode_i),
		.volume_i(volume_i),
		.osr_i(osr_i),
		.tst_fifo_loop_i(tst_fifo_loop_i),
		`ifdef USE_POWER_PINS
		.vccd1(vccd1),
		.vssd1(vssd1),
		`endif
		.ds_o(ds_o),
		.ds_n_o(ds_n_o)
	);

	assign	PRDATA = 
			(PADDR[16-1:0] == DATA_REG_OFFSET)	? DATA_REG :
			(PADDR[16-1:0] == FRDY_REG_OFFSET)	? FRDY_REG :
			(PADDR[16-1:0] == FACK_REG_OFFSET)	? FACK_WIRE :
			(PADDR[16-1:0] == CFG_REG_OFFSET)	? CFG_REG :
			(PADDR[16-1:0] == TST_FIFO_LOOP_REG_OFFSET)	? TST_FIFO_LOOP_REG :
			(PADDR[16-1:0] == IM_REG_OFFSET)	? IM_REG :
			(PADDR[16-1:0] == MIS_REG_OFFSET)	? MIS_REG :
			(PADDR[16-1:0] == RIS_REG_OFFSET)	? RIS_REG :
			(PADDR[16-1:0] == IC_REG_OFFSET)	? IC_REG :
			32'hDEADBEEF;

	assign	PREADY = 1'b1;

endmodule
