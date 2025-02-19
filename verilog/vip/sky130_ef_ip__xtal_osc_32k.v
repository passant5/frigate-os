/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
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

`timescale          1ns/1ps
`default_nettype    none

module sky130_ef_ip__xtal_osc_32k (
`ifdef USE_POWER_PINS
    input   wire    avdd,
    input   wire    avss,
    input   wire    dvdd,
    input   wire    dvss,
`endif
    input   wire    xin,
    input   wire    ena,
    input   wire    standby,
    input   wire    ibias,
    output  wire    xout,
    output  wire    dout
);

    reg os_clk = 0;
    reg stdby_flag = 1;
    reg startup = 1;
    
    // period/2
    real period = 15_258.8;
    real startup_time = 10_000_000;
    real stdby_time = 160_000;

    always @(posedge ena) begin
        `ifndef COCOTB_SIM
        #startup_time;
        `endif 
        startup = 0;
    end

    always @(negedge standby) begin
        #stdby_time;
        stdby_flag = 0;
    end

    always @(negedge ena) startup = 1;

    always @(posedge standby) stdby_flag = 1;

    always #period os_clk = (!os_clk & ena & !startup);

    assign dout = os_clk & !stdby_flag;

endmodule