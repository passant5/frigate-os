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

module ctu_can_APB(
	input  wire         can_rx,
	output wire         can_tx,
	output wire         irq,
	input wire          PCLK,
	input wire          PRESETn,
	input wire          PWRITE,
	input wire [31:0]   PWDATA,
	input wire [31:0]   PADDR,
	input wire          PENABLE,
	input wire          PSEL,
	output wire         PREADY,
	output wire [31:0]  PRDATA
);
// Access Port
	localparam	GCLK_REG_OFFSET = 16'hFF10;
	reg [0:0] GCLK_REG;
	wire GCLK_REG_SEL = PWRITE & PSEL & PENABLE & (PADDR[15:0]==GCLK_REG_OFFSET);
	always @(posedge PCLK or negedge PRESETn)
		if(~PRESETn)
			GCLK_REG <= 0;
		else if(GCLK_REG_SEL)
			GCLK_REG <= PWDATA[1-1:0];
	wire clk_g;
    wire clk_gated_en = GCLK_REG[0];
    ef_util_gating_cell clk_gate_cell(
        .clk(PCLK),
        .clk_en(clk_gated_en),
        .clk_o(clk_g)
    );

wire [63:0] timestamp = 64'd18446744073709551615;
wire bus_rd;
wire bus_wr;
wire bus_cs;
wire bus_access;

assign bus_access = ~GCLK_REG_SEL & PSEL;
assign bus_rd = bus_access & ~PWRITE & ~PENABLE; // read data is ready at first cycle
assign bus_wr = bus_access & PWRITE & PENABLE; // write data is ready at second cycle
assign bus_cs = (bus_rd |  bus_wr)  & ~GCLK_REG_SEL;

ctu_can ctu_can(
	.adress(PADDR[15:0]),
	.can_rx(can_rx),
	.clk_sys(clk_g),
	.data_in(PWDATA),
	.res_n(PRESETn),
	.sbe(4'hF),
	.scs(bus_cs),
	.srd(bus_rd),
	.swr(bus_wr),
	.timestamp(timestamp),
	.can_tx(can_tx),
	.data_out(PRDATA),

	.int_(irq)
);
assign PREADY = 1'b1;

endmodule


