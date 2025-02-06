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

// The output is asserted asynchronously when the input is asserted,
// but deasserted synchronously when clocked with the input deasserted.
// Input and output are both active-low.

module reset_sync #(
	parameter N_CYCLES = 2 // must be >= 2
) (
	input  wire clk,
	input  wire rst_n_in,
	output wire rst_n_out
);

(* keep = 1'b1 *) reg [N_CYCLES-1:0] delay;

always @ (posedge clk or negedge rst_n_in)
	if (!rst_n_in)
		delay <= {N_CYCLES{1'b0}};
	else
		delay <= {delay[N_CYCLES-2:0], 1'b1};

assign rst_n_out = delay[N_CYCLES-1];

endmodule
