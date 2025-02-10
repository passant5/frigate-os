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
	A 4x1 glitch-less clock mux 
*/

module clkmux_4x1 (
    input   wire        rst_n,
    input   wire        clk0, 
    input   wire        clk1, 
    input   wire        clk2, 
    input   wire        clk3,
    input   wire [1:0]  sel,
    output  wire        clko
);

    wire clko1, clko2;

    clkmux_2x1 m1(  
                    .rst_n(rst_n),
                    .clk0(clk0), 
                    .clk1(clk1), 
                    .clko(clko1), 
                    .sel(sel[0])
                );
    clkmux_2x1 m2(  
                    .rst_n(rst_n),
                    .clk0(clk2), 
                    .clk1(clk3), 
                    .clko(clko2), 
                    .sel(sel[0])
                );
    clkmux_2x1 m3(  
                    .rst_n(rst_n),
                    .clk0(clko1), 
                    .clk1(clko2), 
                    .clko(clko), 
                    .sel(sel[1])
                );
    
endmodule