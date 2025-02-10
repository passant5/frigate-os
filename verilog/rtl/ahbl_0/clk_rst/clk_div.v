/*
	Copyright 2020 Mohamed Shalan (mshalan@aucegypt.edu)
	
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

`timescale 			1ns/1ps
`default_nettype 	none

/*
        A clock divider with a jitter supperssor

*/
module clk_div (
    input   wire        rst_n,
    input   wire        clki,
    input   wire [1:0]  div_sel,
    input   wire        div_en,
    output  wire        clko
);

    // Clock Divider
    reg [3:0]   clkdiv;
    always@(posedge clki or negedge rst_n)
	if(!rst_n)
		clkdiv <= 4'b0000;
	else
        clkdiv <= clkdiv + 1'b1;

    wire    clk_2   = clkdiv[0];
    wire    clk_4   = clkdiv[1];
    wire    clk_8   = clkdiv[2];
    wire    clk_16  = clkdiv[3];
    wire    clk_div_mux;

    // DIV Select Clock MUX
    clkmux_4x1 CLK_DIV_MUX (
        .rst_n(rst_n),
        .clk0(clk_2), 
        .clk1(clk_4), 
        .clk2(clk_8),
        .clk3(clk_16),
        .sel(div_sel),
        .clko(clk_div_mux)
    );

    // Jitter Supperessor
    reg clk_div_mux_reg;
    always@(posedge clki or negedge rst_n)
	if(!rst_n)
        clk_div_mux_reg <= 1'b0;
	else
        clk_div_mux_reg <= clk_div_mux;

    // DIV Bypass CLock MUX
    clkmux_2x1 DIV_BYPASS_MUX (
        .rst_n(rst_n),
        .clk0(clki), 
        .clk1(clk_div_mux_reg), 
        .sel(div_en),
        .clko(clko)
    );

endmodule