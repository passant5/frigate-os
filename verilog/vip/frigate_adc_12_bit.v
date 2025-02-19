/*
	Copyright 2023 Efabless Corp.

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
`timescale			1ns/1ns
`default_nettype	none

//`define FPGA

module frigate_adc_12_bit (
`ifndef FPGA
    input real          VDD,
    input real          VSS,
    input real          DVDD,
    input real          DVSS,

    input real          VH,
    input real          VL,

    input real in0,
    input real in1,
    input real in2,
    input real in3,
    input real in4,
    input real in5,
    input real in6,
    input real in7,
    
`else
    input wire          VDD,
    input wire          VSS,
    input wire          DVDD,
    input wire          DVSS,
    
    input wire          VH,
    input wire          VL,

    input wire [0:7]    VIN ,

`endif

    
    input wire          HOLD,
    input wire          RST,
    input wire          EN,
    
    input wire [0:2]    B,
    
    input wire [0:11]   DATA,
        
    output wire         CMP

);

`ifndef FPGA
    
    // wire real a_mux =   (B==0) ? in0 :
    //                     (B==1) ? in1 :
    //                     (B==2) ? in2 :
    //                     (B==3) ? in3 :
    //                     (B==4) ? in4 :
    //                     (B==5) ? in5 :
    //                     (B==6) ? in6 : 
    //                              in7;


    real held_value;
    real dac_out;
    initial begin
        held_value <= 0;
    end
    always @(posedge HOLD)
        held_value = in0;


    //always @(negedge RST)
    assign dac_out = DATA * (VH-VL)/4096;

    assign CMP = (held_value > dac_out) ? 1'b1 : 1'b0;

`else

    assign CMP = 1'b1;
    
`endif

endmodule