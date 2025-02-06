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

/*
 *---------------------------------------------------------------------
 * See gpio_control_block for description.  This module is like
 * gpio_contro_block except that it has an additional two management-
 * Soc-facing pins, which are the out_enb line and the output line.
 * If the chip is configured for output with the oeb control
 * register = 1, then the oeb line is controlled by the additional
 * signal from the management SoC.  If the oeb control register = 0,
 * then the output is disabled completely.  The "io" line is input
 * only in this module.
 *
 *---------------------------------------------------------------------
 */

/*
 *---------------------------------------------------------------------
 *
 * This module instantiates a shift register chain that passes through
 * each gpio cell.  These are connected end-to-end around the padframe
 * periphery.  The purpose is to avoid a massive number of control
 * wires between the digital core and I/O, passing through the user area.
 *
 * See mprj_ctrl.v for the module that registers the data for each
 * I/O and drives the input to the shift register.
 *
 * Modified 7/24/2022 by Tim Edwards
 * Replaced the data delay with a negative edge-triggered flop
 * so that the serial data bit out from the module only changes on
 * the clock half cycle.  This avoids the need to fine-tune the clock
 * skew between GPIO blocks.
 *
 * Modified 10/05/2022 by Tim Edwards
 *
 *---------------------------------------------------------------------
 */

module gpio_control_block #(
    parameter PAD_CTRL_BITS = 16
) (
    `ifdef USE_POWER_PINS
         inout vccd,
         inout vssd,
         inout vccd1,
         inout vssd1,
    `endif

    // Power-on defaults
    input wire [PAD_CTRL_BITS-1:0] gpio_defaults,

    // Management Soc-facing signals
    input  wire     resetn,             // Global reset, locally propagated
    output wire     resetn_out,
    input  wire     serial_clock,       // Global clock, locally propatated
    output wire     serial_clock_out,
    input  wire     serial_load,        // Register load strobe
    output wire     serial_load_out,

    output wire     mgmt_gpio_in,       // Management from pad (input only)
    input  wire     mgmt_gpio_out,      // Management to pad (output only)
    input  wire     mgmt_gpio_oeb,      // Management to pad (output only)

    // Serial data chain for pad configuration
    input  wire     serial_data_in,
    output reg      serial_data_out,

    // User-facing signals
    input  wire     user_gpio_out,      // User space to pad
    input  wire     user_gpio_oeb,      // Output enable (user)
    output wire     user_gpio_in,       // Pad to user space

    // Pad-facing signals (Pad GPIOv2)
    output wire       pad_gpio_holdover,
    output wire       pad_gpio_slow_sel,
    output wire       pad_gpio_vtrip_sel,
    output wire       pad_gpio_inenb,
    output wire       pad_gpio_ib_mode_sel,
    output wire       pad_gpio_ana_en,
    output wire       pad_gpio_ana_sel,
    output wire       pad_gpio_ana_pol,
    output wire [2:0] pad_gpio_dm,
    output wire       pad_gpio_outenb,
    output wire       pad_gpio_out,
    output wire [1:0] pad_gpio_slew_ctl,
    output wire       pad_gpio_hys_trim,
    input  wire       pad_gpio_in
);

    /* Parameters defining the bit offset of each function in the chain */
    localparam MGMT_EN = 0;
    localparam OEB = 1;
    localparam HLDH = 2;
    localparam INP_DIS = 3;
    localparam MOD_SEL = 4;
    localparam AN_EN = 5;
    localparam AN_SEL = 6;
    localparam AN_POL = 7;
    localparam SLOW = 8;
    localparam TRIP = 9;
    localparam DM = 10;
    localparam SLEW_CTL = 13;
    localparam HYS_T = 15;


    /* Internally registered signals */
    reg         mgmt_ena;       // Enable management SoC to access pad
    reg         gpio_holdover;
    reg         gpio_slow_sel;
    reg         gpio_vtrip_sel;
    reg         gpio_inenb;
    reg         gpio_ib_mode_sel;
    reg         gpio_outenb;
    reg [2:0]   gpio_dm;
    reg         gpio_ana_en;
    reg         gpio_ana_sel;
    reg         gpio_ana_pol;
    reg [1:0]   gpio_slew_ctl;
    reg         gpio_hys_trim;

    wire gpio_logic1;

    /* Serial shift for the above (latched) values */
    reg [PAD_CTRL_BITS-1:0] shift_register;

    /* Latch the output on the clock negative edge */
    always @(negedge serial_clock or negedge resetn) begin
        if (resetn == 1'b0) begin
            /* Clear the shift register output */
            serial_data_out <= 1'b0;
        end else begin
            serial_data_out <= shift_register[PAD_CTRL_BITS-1];
        end
    end

    /* Propagate the clock and reset signals so that they aren't wired  */
    /* all over the chip, but are just wired between the blocks.        */
    (* keep *) sky130_fd_sc_hd__clkbuf_8 BUF[2:0] (
    `ifdef USE_POWER_PINS
            .VPWR(vccd),
            .VGND(vssd),
            .VPB(vccd),
            .VNB(vssd),
    `endif
        .A({serial_clock, resetn, serial_load}),
        .X({serial_clock_out, resetn_out, serial_load_out})
    );

    always @(posedge serial_clock or negedge resetn) begin
        if (resetn == 1'b0) begin
            /* Clear shift register */
            shift_register <= 'd0;
        end else begin
            /* Shift data in */
            shift_register <= {shift_register[PAD_CTRL_BITS-2:0], serial_data_in};
        end
    end

    always @(posedge serial_load or negedge resetn) begin
        if (resetn == 1'b0) begin
            /* Initial state on reset depends on applied defaults */
            mgmt_ena            <= gpio_defaults[MGMT_EN];
            gpio_holdover       <= gpio_defaults[HLDH];
            gpio_slow_sel       <= gpio_defaults[SLOW];
            gpio_vtrip_sel      <= gpio_defaults[TRIP];
            gpio_ib_mode_sel    <= gpio_defaults[MOD_SEL];
            gpio_inenb          <= gpio_defaults[INP_DIS];
            gpio_outenb         <= gpio_defaults[OEB];
            gpio_dm             <= gpio_defaults[DM+2:DM];
            gpio_ana_en         <= gpio_defaults[AN_EN];
            gpio_ana_sel        <= gpio_defaults[AN_SEL];
            gpio_ana_pol        <= gpio_defaults[AN_POL];
            gpio_slew_ctl       <= gpio_defaults[SLEW_CTL];
            gpio_hys_trim       <= gpio_defaults[HYS_T];
        end else begin
            /* Load data */
            mgmt_ena            <= shift_register[MGMT_EN];
            gpio_outenb         <= shift_register[OEB];
            gpio_holdover       <= shift_register[HLDH];
            gpio_inenb          <= shift_register[INP_DIS];
            gpio_ib_mode_sel    <= shift_register[MOD_SEL];
            gpio_ana_en         <= shift_register[AN_EN];
            gpio_ana_sel        <= shift_register[AN_SEL];
            gpio_ana_pol        <= shift_register[AN_POL];
            gpio_slow_sel       <= shift_register[SLOW];
            gpio_vtrip_sel      <= shift_register[TRIP];
            gpio_dm             <= shift_register[DM+2:DM];
            gpio_slew_ctl       <= shift_register[SLEW_CTL];
            gpio_hys_trim       <= shift_register[HYS_T];
        end
    end

    /* These pad configuration signals are static and do not change */
    /* after setup.                                                 */

    assign pad_gpio_holdover    = gpio_holdover;
    assign pad_gpio_slow_sel    = gpio_slow_sel;
    assign pad_gpio_vtrip_sel   = gpio_vtrip_sel;
    assign pad_gpio_ib_mode_sel = gpio_ib_mode_sel;
    assign pad_gpio_ana_en      = gpio_ana_en;
    assign pad_gpio_ana_sel     = gpio_ana_sel;
    assign pad_gpio_ana_pol     = gpio_ana_pol;
    assign pad_gpio_dm          = gpio_dm;
    assign pad_gpio_inenb       = gpio_inenb;
    assign pad_gpio_slew_ctl    = gpio_slew_ctl;
    assign pad_gpio_hys_trim    = gpio_hys_trim;

    /* Implement pad control behavior depending on state of mgmt_ena    */

    /* The pad value always goes back to the housekeeping module        */

    assign mgmt_gpio_in = (mgmt_ena) ? pad_gpio_in : 1'b0;

    assign pad_gpio_outenb = (mgmt_ena) ? mgmt_gpio_oeb : user_gpio_oeb;
    assign pad_gpio_out = (mgmt_ena) ? mgmt_gpio_out : user_gpio_out;

    /* Buffer user_gpio_in with an enable that is set by the user domain vccd */

    gpio_logic_high gpio_logic_high (
`ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
`endif
        .gpio_logic1(gpio_logic1)
    );

    /* If user project area is powered down, zero the pad input value   */
    /* going to the user project.                                       */
    assign user_gpio_in = pad_gpio_in & gpio_logic1;

endmodule
`default_nettype wire
