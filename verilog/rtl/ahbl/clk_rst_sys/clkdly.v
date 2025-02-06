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

`timescale              1ns/1ps
`default_nettype        none

module clkdly #(
    parameter integer N = 3
    ) (
        `ifdef USE_POWER_PINS
        input VPWR,
        input VGND,
        `endif
        input wire clk_in,
        output wire clk_out
    );

wire [N:0] dly;

genvar i;
assign dly[0] = clk_in;
generate
    for (i=1; i<=N; i=i+1) begin : gen_dlygen
        (* keep *) sky130_fd_sc_hd__clkdlybuf4s18_2 dlygen (`ifdef USE_POWER_PINS .VPWR(VPWR), .VGND(VGND), `endif .X(dly[i]), .A(dly[i-1]));
    end
endgenerate
(* keep *) sky130_fd_sc_hd__clkbuf_8 dly_clkbuf (`ifdef USE_POWER_PINS .VPWR(VPWR), .VGND(VGND), `endif .X(clk_out), .A(dly[N]));
endmodule
