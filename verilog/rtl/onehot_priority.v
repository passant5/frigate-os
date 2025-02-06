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

// Input a bitmap. The output will have at most 1 bit set, which will
// be the least-significant set bit of the input.
// e.g. 'b011100 -> 'b000100
// If HIGHEST_WINS is 1, it will instead be the most-significant bit of the output.

module onehot_priority #(
	parameter W_INPUT = 8,
	parameter HIGHEST_WINS = 0
) (
	input wire [W_INPUT-1:0] in,
	output reg [W_INPUT-1:0] out
);

integer i;
reg deny;

always @ (*) begin
	deny = 1'b0;
	if (HIGHEST_WINS) begin
		for (i = W_INPUT - 1; i >= 0; i = i - 1) begin
			out[i] = in[i] && !deny;
			deny = deny || in[i];
		end
	end else begin
		for (i = 0; i < W_INPUT; i = i + 1) begin
			out[i] = in[i] && !deny;
			deny = deny || in[i];
		end
	end
end

endmodule
