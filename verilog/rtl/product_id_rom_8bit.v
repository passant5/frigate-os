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

// This module represents an unprogrammed mask revision
// block that is configured with via programming on the
// chip top level.  This value is passed to the block as
// a parameter

/// sta-blackbox
module product_id_rom_8bit #(
    parameter PRODUCT_ID = 8'h41
) (
`ifdef USE_POWER_PINS
    inout VPWR,
    inout VGND,
`endif
    output [7:0] gpio_defaults
);
    wire [7:0] product_id_high;
    wire [7:0] product_id_low;

    // For the mask revision input, use an array of digital constant logic cells

    sky130_fd_sc_hd__conb_1 mask_rev_value [7:0] (
`ifdef USE_POWER_PINS
            .VPWR(VPWR),
            .VPB(VPWR),
            .VNB(VGND),
            .VGND(VGND),
`endif
            .HI(product_id_high),
            .LO(product_id_low)
    );

    genvar i;
    generate
    for (i = 0; i < 8; i = i+1) begin
        assign gpio_defaults[i] = (PRODUCT_ID & (8'h01 << i)) ?
            product_id_high[i] : product_id_low[i];
    end
    endgenerate

endmodule
`default_nettype wire
