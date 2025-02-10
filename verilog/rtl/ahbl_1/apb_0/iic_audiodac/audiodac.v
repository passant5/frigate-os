/*
* SPDX-FileCopyrightText: 2022 Harald Pretl
* Johannes Kepler University, Institute for Integrated Circuits
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* SPDX-License-Identifier: Apache-2.0
*
* AUDIODAC -- 16b Delta-Sigma Modulator with Single-Bit Output
*
* This delta-sigma modulator includes an input-side FIFO for easy connection
* to a host system, volume control in 6dB steps, and configurable OSR
* (32/64/128/256). The modulator can be configured to first or second order.
*
* The clock for the modulator is required to be clk = audio_sample_rate * OSR
* e.g. for 44.1kHz and OSR=128 then clk=5.6448MHz
*
* The audio input data must be 16b UINT!
*
* In order to write into the FIFO
* 	(1) assert the data at fifo_i[15:0] (fifo_rdy_i=0)
* 	(2) signal that data is ready with transition fifo_rdy_i=0->1
* 	(3) wait that data is accepted by waiting for fifo_ack_o=0->1
* 	(4) de-assert fifo_rdy_i=1->0 (this is followed by fifo_ack_o=1->0)
*
* Data is only accepted if the FIFO is not full (fifo_full_o=0). Using fifo_full_o
* and fifo_empty_o an interrupt service routine can be constructed:
* 	(1) fifo_empty_o=0->1 triggers the ISR
* 	(2) the ISR writes data into the FIFO until it is full (fifo_full_o=0->1)
* 	(3) exit the ISR
* 
* Ideas for future extension:
* 	-- Implement a higher-order (e.g. 5th order) modulator.
*	-- Potentially substitute register-based FIFO by a dual-port RAM.
*/

`timescale              1ns/1ps
`default_nettype        none

`ifndef __AUDIODAC
`define __AUDIODAC

module audiodac (
`ifdef USE_POWER_PINS
	inout wire			vccd1,
	inout wire			vssd1,
`endif
	// FIFO interface
	input  wire		[15:0]	fifo_i,
	input  wire			    fifo_rdy_i,
	output wire 			fifo_ack_o,
	output wire			    fifo_full_o,
	output wire			    fifo_empty_o,
	
    // clock and reset
	input wire			    rst_n_i,
	input wire			    clk_i,
	
    // configuration bits
	input wire			    mode_i, 	// 0 = 1st, 1 = 2nd order SD-mod
	input wire 		[3:0]	volume_i,	// 0 = off, 1 = min volume, 15 = max volume
	input wire		[1:0]	osr_i, 		// 0 = 32; 1 = 64, 2 = 128, 3 = 256
	
    // ds-modulator outputs
	output wire			    ds_o,		// single-bit SD-modulator output
	output wire 			    ds_n_o,		//  plus the complementary output
	
    // test modes
	input wire				tst_fifo_loop_i,

	// Output Enable
	input wire				oe
);

	wire		[15:0]	data_audio;
	wire			    audio_rd;		// not used status output

	wire		ds, ds_n;
	reg			ds_reg, ds_n_reg;

	assign		ds_o = ds;
	assign		ds_n_o = ds_n;

	always @(posedge clk_i or negedge rst_n_i)
		if(!rst_n_i) begin
			ds_reg <= 0;
			ds_n_reg <= 0;
		end else if(oe) begin
			ds_reg <= ds;
			ds_n_reg <= ds_n;
		end

	wire [15:0] data = data_audio; 
    //tst_sinegen_en_i ? data_sine : data_audio;

	audiodac_fifo fifo (
		.fifo_data_i(fifo_i),
		.fifo_rdy_i(fifo_rdy_i),
		.fifo_ack_o(fifo_ack_o),
		.fifo_full_o(fifo_full_o),
		.fifo_empty_o(fifo_empty_o),
		.audio_data_o(data_audio),
		.audio_rd_i(audio_rd),
		.rst_n_i(rst_n_i),
		.clk_i(clk_i),
		.tst_fifo_loop_i(tst_fifo_loop_i)
	);

	audiodac_dsmod dsmod (	
		.audio_i(data),
		.audio_rd_o(audio_rd),
		.rst_n_i(rst_n_i),
		.clk_i(clk_i),
		.mode_i(mode_i),
		.volume_i(volume_i),
		.osr_i(osr_i),
		.ds_o(ds),
		.ds_n_o(ds_n)
	);
    
endmodule // audiodac

`endif
`default_nettype wire
