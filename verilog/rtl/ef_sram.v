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

`ifdef USE_POWER_PINS
    `define USE_PG_PIN 
`endif

//for WB

module ef_sram #(
  parameter integer RAM_BLOCKS = 2
  )
  (DO, ScanOutCC, AD, BEN, CLKin, DI, EN, R_WB, ScanInCC, ScanInDL, ScanInDR, SM, TM, WLBI, WLOFF, vgnd, vnb, vpb, vpwra, vpwrac, vpwrm, vpwrp, vpwrpc);
    localparam integer AW = $ceil($clog2(RAM_BLOCKS))+10;
    output wire [31:0] DO;
    output wire ScanOutCC;
    input wire [31:0] DI;
    input wire [31:0] BEN;
    input wire [AW-1:0] AD;
    input wire EN;
    input wire R_WB;
    input wire CLKin;
    input wire WLBI;
    input wire WLOFF;
    input wire TM;
    input wire SM;
    input wire ScanInCC;
    input wire ScanInDL;
    input wire ScanInDR;
    input wire vpwrac;
    input wire vpwrpc;
    inout wire vgnd;
    inout wire vpwrm;


`ifdef EF_SRAM_PA_SIM
  inout wire vpwra;
`else
  input wire vpwra;
`endif


`ifdef EF_SRAM_PA_SIM
  inout wire vpwrp;
`else
  input wire vpwrp;
`endif

    input wire vnb;
    input wire vpb;

reg [AW-10-1:0] RAM_sel;
wire [31:0] DO_rams [RAM_BLOCKS-1:0];

// assign RAM_sel = AD[AW-1:10];
always@(posedge CLKin)
    RAM_sel <= AD[AW-1:10];

assign DO = DO_rams[RAM_sel];
assign ScanOutCC = 1'b0;

genvar i;
generate
    for (i = 0; i < RAM_BLOCKS; i = i + 1)
    begin
      EF_SRAM_1024x32 SRAM (
        .DO(DO_rams[i]),
        // .ScanOutCC(),
        .AD(AD[9:0]),
        .BEN(BEN),
        .CLKin(CLKin),
        .DI(DI),
        .EN(EN && (AD[AW-1:10]==i)),
        .R_WB(R_WB),
        .ScanInCC(ScanInCC),
        .ScanInDL(ScanInDL),
        .ScanInDR(ScanInDR),
        .SM(SM),
        .TM(TM),
        .WLBI(WLBI),
        .WLOFF(WLOFF),
        `ifdef USE_PG_PIN
        .vgnd(vgnd),
        .vnb(vnb),
        .vpb(vpb),
        .vpwra(vpwra),
        `endif
        .vpwrac(vpwrac),
        `ifdef USE_PG_PIN
        .vpwrm(vpwrm),
        .vpwrp(vpwrp),
        `endif
        .vpwrpc(vpwrpc)
      );
    end
endgenerate

endmodule