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
 *-------------------------------------------------------------
 *
 * frigate_core
 *
 *-------------------------------------------------------------
 */

module frigate_core (
`ifdef USE_POWER_PINS
    inout wire vccd0,    // Common 1.8V supply
    inout wire vccd1,    // User area 1 1.8V supply
    inout wire vccd2,    // User area 2 1.8v supply
    inout wire vssd0,    // Common digital ground
    inout wire vssd1,    // User area 1 digital ground
    inout wire vssd2,    // User area 2 digital ground
    inout wire vdda0,    // User area 0 3.3V supply
    inout wire vdda1,    // User area 1 3.3V supply
    inout wire vdda2,    // User area 2 3.3V supply
    inout wire vdda3,    // timing frontend 3.3V supply
    inout wire vssa0,    // User area 0 analog ground
    inout wire vssa1,    // User area 1 analog ground
    inout wire vssa2,    // User area 2 analog ground
    inout wire vssa3,    // timing frontend analog ground
    inout wire vddio,
    inout wire vssio,
`endif

    /* Signals exported from the frame area to the user project */
    /* The user may elect to use any of these inputs.        */

    input  wire   select_tie_lo_esd,
    input  wire   select_in,
    input  wire   select_tie_hi_esd,
    output wire   select_enable_vddio,
    output wire   select_slow,
    inout  wire   select_pad_a_esd_0_h,
    inout  wire   select_pad_a_esd_1_h,
    inout  wire   select_pad_a_noesd_h,
    output wire   select_analog_en,
    output wire   select_analog_pol,
    output wire   select_inp_dis,
    output wire   select_enable_inp_h,
    output wire   select_enable_h,
    output wire   select_hld_h_n,
    output wire   select_analog_sel,
    output wire   [2:0]    select_dm,
    output wire   select_hld_ovr,
    output wire   select_out,
    output wire   select_enable_vswitch_h,
    output wire   select_enable_vdda_h,
    output wire   select_vtrip_sel,
    output wire   select_ib_mode_sel,
    output wire   select_oe_n,
    output wire   select_in_h,
    input  wire  select_zero,
    input  wire  select_one,
    input  wire  resetb_tie_weak_hi_h,
    output wire   resetb_disable_pullup_h,
    input  wire  resetb_tie_hi_esd,
    input  wire  resetb_xres_h_n,
    input  wire  resetb_tie_lo_esd,
    output wire   resetb_inp_sel_h,
    output wire   resetb_en_vddio_sig_h,
    output wire   resetb_filt_in_h,
    output wire  resetb_pad_a_esd_h,
    output wire   resetb_pullup_h,
    output wire   resetb_enable_h,
    output wire   resetb_enable_vddio,
    input  wire  gpio8_0_tie_lo_esd,
    input  wire  gpio8_0_in,
    input  wire  gpio8_0_tie_hi_esd,
    output wire   gpio8_0_enable_vddio,
    output wire   gpio8_0_slow,
    inout  wire  gpio8_0_pad_a_esd_0_h,
    inout  wire  gpio8_0_pad_a_esd_1_h,
    inout  wire  gpio8_0_pad_a_noesd_h,
    output wire   gpio8_0_analog_en,
    output wire   gpio8_0_analog_pol,
    output wire   gpio8_0_inp_dis,
    output wire   gpio8_0_enable_inp_h,
    output wire   gpio8_0_enable_h,
    output wire   gpio8_0_hld_h_n,
    output wire   gpio8_0_analog_sel,
    output wire   [2:0]    gpio8_0_dm,
    output wire   gpio8_0_hld_ovr,
    output wire   gpio8_0_out,
    output wire   gpio8_0_enable_vswitch_h,
    output wire   gpio8_0_enable_vdda_h,
    output wire   gpio8_0_vtrip_sel,
    output wire   gpio8_0_ib_mode_sel,
    output wire   gpio8_0_oe_n,
    output wire   gpio8_0_in_h,
    input  wire  gpio8_0_zero,
    input  wire  gpio8_0_one,
    input  wire  gpio8_1_tie_lo_esd,
    input  wire  gpio8_1_in,
    input  wire  gpio8_1_tie_hi_esd,
    output wire   gpio8_1_enable_vddio,
    output wire   gpio8_1_slow,
    inout  wire  gpio8_1_pad_a_esd_0_h,
    inout  wire  gpio8_1_pad_a_esd_1_h,
    inout  wire  gpio8_1_pad_a_noesd_h,
    output wire   gpio8_1_analog_en,
    output wire   gpio8_1_analog_pol,
    output wire   gpio8_1_inp_dis,
    output wire   gpio8_1_enable_inp_h,
    output wire   gpio8_1_enable_h,
    output wire   gpio8_1_hld_h_n,
    output wire   gpio8_1_analog_sel,
    output wire   [2:0]    gpio8_1_dm,
    output wire   gpio8_1_hld_ovr,
    output wire   gpio8_1_out,
    output wire   gpio8_1_enable_vswitch_h,
    output wire   gpio8_1_enable_vdda_h,
    output wire   gpio8_1_vtrip_sel,
    output wire   gpio8_1_ib_mode_sel,
    output wire   gpio8_1_oe_n,
    output wire   gpio8_1_in_h,
    input  wire  gpio8_1_zero,
    input  wire  gpio8_1_one,
    input  wire  gpio8_2_tie_lo_esd,
    input  wire  gpio8_2_in,
    input  wire  gpio8_2_tie_hi_esd,
    output wire   gpio8_2_enable_vddio,
    output wire   gpio8_2_slow,
    inout  wire  gpio8_2_pad_a_esd_0_h,
    inout  wire  gpio8_2_pad_a_esd_1_h,
    inout  wire  gpio8_2_pad_a_noesd_h,
    output wire   gpio8_2_analog_en,
    output wire   gpio8_2_analog_pol,
    output wire   gpio8_2_inp_dis,
    output wire   gpio8_2_enable_inp_h,
    output wire   gpio8_2_enable_h,
    output wire   gpio8_2_hld_h_n,
    output wire   gpio8_2_analog_sel,
    output wire   [2:0]    gpio8_2_dm,
    output wire   gpio8_2_hld_ovr,
    output wire   gpio8_2_out,
    output wire   gpio8_2_enable_vswitch_h,
    output wire   gpio8_2_enable_vdda_h,
    output wire   gpio8_2_vtrip_sel,
    output wire   gpio8_2_ib_mode_sel,
    output wire   gpio8_2_oe_n,
    output wire   gpio8_2_in_h,
    input  wire  gpio8_2_zero,
    input  wire  gpio8_2_one,
    input  wire  gpio8_3_tie_lo_esd,
    input  wire  gpio8_3_in,
    input  wire  gpio8_3_tie_hi_esd,
    output wire   gpio8_3_enable_vddio,
    output wire   gpio8_3_slow,
    inout  wire  gpio8_3_pad_a_esd_0_h,
    inout  wire  gpio8_3_pad_a_esd_1_h,
    inout  wire  gpio8_3_pad_a_noesd_h,
    output wire   gpio8_3_analog_en,
    output wire   gpio8_3_analog_pol,
    output wire   gpio8_3_inp_dis,
    output wire   gpio8_3_enable_inp_h,
    output wire   gpio8_3_enable_h,
    output wire   gpio8_3_hld_h_n,
    output wire   gpio8_3_analog_sel,
    output wire   [2:0]    gpio8_3_dm,
    output wire   gpio8_3_hld_ovr,
    output wire   gpio8_3_out,
    output wire   gpio8_3_enable_vswitch_h,
    output wire   gpio8_3_enable_vdda_h,
    output wire   gpio8_3_vtrip_sel,
    output wire   gpio8_3_ib_mode_sel,
    output wire   gpio8_3_oe_n,
    output wire   gpio8_3_in_h,
    input  wire  gpio8_3_zero,
    input  wire  gpio8_3_one,
    inout  wire  xi0_core,
    inout  wire  xo0_core,
    inout  wire  xi1_core,
    inout  wire  xo1_core,
    input  wire  gpio8_4_tie_lo_esd,
    input  wire  gpio8_4_in,
    input  wire  gpio8_4_tie_hi_esd,
    output wire   gpio8_4_enable_vddio,
    output wire   gpio8_4_slow,
    inout  wire  gpio8_4_pad_a_esd_0_h,
    inout  wire  gpio8_4_pad_a_esd_1_h,
    inout  wire  gpio8_4_pad_a_noesd_h,
    output wire   gpio8_4_analog_en,
    output wire   gpio8_4_analog_pol,
    output wire   gpio8_4_inp_dis,
    output wire   gpio8_4_enable_inp_h,
    output wire   gpio8_4_enable_h,
    output wire   gpio8_4_hld_h_n,
    output wire   gpio8_4_analog_sel,
    output wire   [2:0]    gpio8_4_dm,
    output wire   gpio8_4_hld_ovr,
    output wire   gpio8_4_out,
    output wire   gpio8_4_enable_vswitch_h,
    output wire   gpio8_4_enable_vdda_h,
    output wire   gpio8_4_vtrip_sel,
    output wire   gpio8_4_ib_mode_sel,
    output wire   gpio8_4_oe_n,
    output wire   gpio8_4_in_h,
    input  wire  gpio8_4_zero,
    input  wire  gpio8_4_one,
    input  wire  gpio8_5_tie_lo_esd,
    input  wire  gpio8_5_in,
    input  wire  gpio8_5_tie_hi_esd,
    output wire   gpio8_5_enable_vddio,
    output wire   gpio8_5_slow,
    inout  wire  gpio8_5_pad_a_esd_0_h,
    inout  wire  gpio8_5_pad_a_esd_1_h,
    inout  wire  gpio8_5_pad_a_noesd_h,
    output wire   gpio8_5_analog_en,
    output wire   gpio8_5_analog_pol,
    output wire   gpio8_5_inp_dis,
    output wire   gpio8_5_enable_inp_h,
    output wire   gpio8_5_enable_h,
    output wire   gpio8_5_hld_h_n,
    output wire   gpio8_5_analog_sel,
    output wire   [2:0]    gpio8_5_dm,
    output wire   gpio8_5_hld_ovr,
    output wire   gpio8_5_out,
    output wire   gpio8_5_enable_vswitch_h,
    output wire   gpio8_5_enable_vdda_h,
    output wire   gpio8_5_vtrip_sel,
    output wire   gpio8_5_ib_mode_sel,
    output wire   gpio8_5_oe_n,
    output wire   gpio8_5_in_h,
    input  wire  gpio8_5_zero,
    input  wire  gpio8_5_one,
    input  wire  gpio8_6_tie_lo_esd,
    input  wire  gpio8_6_in,
    input  wire  gpio8_6_tie_hi_esd,
    output wire   gpio8_6_enable_vddio,
    output wire   gpio8_6_slow,
    inout  wire  gpio8_6_pad_a_esd_0_h,
    inout  wire  gpio8_6_pad_a_esd_1_h,
    inout  wire  gpio8_6_pad_a_noesd_h,
    output wire   gpio8_6_analog_en,
    output wire   gpio8_6_analog_pol,
    output wire   gpio8_6_inp_dis,
    output wire   gpio8_6_enable_inp_h,
    output wire   gpio8_6_enable_h,
    output wire   gpio8_6_hld_h_n,
    output wire   gpio8_6_analog_sel,
    output wire   [2:0]    gpio8_6_dm,
    output wire   gpio8_6_hld_ovr,
    output wire   gpio8_6_out,
    output wire   gpio8_6_enable_vswitch_h,
    output wire   gpio8_6_enable_vdda_h,
    output wire   gpio8_6_vtrip_sel,
    output wire   gpio8_6_ib_mode_sel,
    output wire   gpio8_6_oe_n,
    output wire   gpio8_6_in_h,
    input  wire  gpio8_6_zero,
    input  wire  gpio8_6_one,
    input  wire  gpio8_7_tie_lo_esd,
    input  wire  gpio8_7_in,
    input  wire  gpio8_7_tie_hi_esd,
    output wire   gpio8_7_enable_vddio,
    output wire   gpio8_7_slow,
    inout  wire  gpio8_7_pad_a_esd_0_h,
    inout  wire  gpio8_7_pad_a_esd_1_h,
    inout  wire  gpio8_7_pad_a_noesd_h,
    output wire   gpio8_7_analog_en,
    output wire   gpio8_7_analog_pol,
    output wire   gpio8_7_inp_dis,
    output wire   gpio8_7_enable_inp_h,
    output wire   gpio8_7_enable_h,
    output wire   gpio8_7_hld_h_n,
    output wire   gpio8_7_analog_sel,
    output wire   [2:0]    gpio8_7_dm,
    output wire   gpio8_7_hld_ovr,
    output wire   gpio8_7_out,
    output wire   gpio8_7_enable_vswitch_h,
    output wire   gpio8_7_enable_vdda_h,
    output wire   gpio8_7_vtrip_sel,
    output wire   gpio8_7_ib_mode_sel,
    output wire   gpio8_7_oe_n,
    output wire   gpio8_7_in_h,
    input  wire  gpio8_7_zero,
    input  wire  gpio8_7_one,
    input  wire  pwrdet_out2_vddio_hv,
    input  wire  pwrdet_out1_vddd_hv,
    output wire   pwrdet_in1_vddio_hv,
    output wire   pwrdet_in2_vddd_hv,
    output wire   pwrdet_in1_vddd_hv,
    input  wire  pwrdet_out1_vddio_hv,
    input  wire  pwrdet_out2_vddd_hv,
    input  wire  pwrdet_out3_vddd_hv,
    input  wire  pwrdet_vddio_present_vddd_hv,
    input  wire  pwrdet_out3_vddio_hv,
    input  wire  pwrdet_tie_lo_esd,
    output wire   pwrdet_in3_vddd_hv,
    input  wire  pwrdet_vddd_present_vddio_hv,
    output wire   pwrdet_in2_vddio_hv,
    output wire   pwrdet_in3_vddio_hv,
    output wire   pwrdet_rst_por_hv_n,
    output wire   sio_vinref_dft,
    output wire   sio_voutref_dft,
    output wire   [1:0]    sio_vref_sel,
    output wire   sio_enable_vdda_h,
    output wire   sio_dft_refgen,
    output wire   [2:0]    sio_voh_sel,
    inout  wire   sio_amuxbus_b, // Analog connection
    inout  wire   sio_amuxbus_a, // Analog connection
    output wire   sio_vreg_en_refgen,
    output wire   sio_ibuf_sel_refgen,
    inout  wire   sio_vohref, // Analog connection
    output wire   sio_hld_h_n_refgen,
    output wire   sio_vtrip_sel_refgen,
    inout  wire   [1:0]    sio_pad_a_esd_0_h, // Analog connection
    inout  wire   [1:0]    sio_pad_a_noesd_h, // Analog connection
    output wire   [1:0]    sio_inp_dis,
    input  wire   [1:0]    sio_tie_lo_esd,
    output wire   [1:0]    sio_out,
    output wire   [1:0]    sio_vtrip_sel,
    output wire   [1:0]    sio_ibuf_sel,
    output wire   [1:0]    sio_hld_h_n,
    output wire   [1:0]    sio_hld_ovr,
    input  wire   [1:0]    sio_in,
    input  wire   [1:0]    sio_in_h,
    output wire   [1:0]    sio_oe_n,
    output wire   [1:0]    sio_slow,
    output wire   [1:0]    sio_vreg_en,
    output wire   sio_enable_h,
    output wire   [2:0]    sio_dm1,
    inout  wire   [1:0]    sio_pad_a_esd_1_h, // Analog connection
    output wire   [2:0]    sio_dm0,
    output wire   muxsplit_se_hld_vdda_h_n,
    output wire   muxsplit_se_enable_vdda_h,
    output wire   muxsplit_se_switch_aa_sl,
    output wire   muxsplit_se_switch_aa_s0,
    output wire   muxsplit_se_switch_bb_s0,
    output wire   muxsplit_se_switch_bb_sl,
    output wire   muxsplit_se_switch_bb_sr,
    output wire   muxsplit_se_switch_aa_sr,
    input  wire  gpio0_0_tie_lo_esd,
    input  wire  gpio0_0_in,
    input  wire  gpio0_0_tie_hi_esd,
    output wire   gpio0_0_enable_vddio,
    output wire   gpio0_0_slow,
    inout  wire  gpio0_0_pad_a_esd_0_h,
    inout  wire  gpio0_0_pad_a_esd_1_h,
    inout  wire  gpio0_0_pad_a_noesd_h,
    output wire   gpio0_0_analog_en,
    output wire   gpio0_0_analog_pol,
    output wire   gpio0_0_inp_dis,
    output wire   gpio0_0_enable_inp_h,
    output wire   gpio0_0_enable_h,
    output wire   gpio0_0_hld_h_n,
    output wire   gpio0_0_analog_sel,
    output wire   [2:0]    gpio0_0_dm,
    output wire   gpio0_0_hld_ovr,
    output wire   gpio0_0_out,
    output wire   gpio0_0_enable_vswitch_h,
    output wire   gpio0_0_enable_vdda_h,
    output wire   gpio0_0_vtrip_sel,
    output wire   gpio0_0_ib_mode_sel,
    output wire   gpio0_0_oe_n,
    input  wire  gpio0_0_in_h,
    input  wire  gpio0_0_zero,
    input  wire  gpio0_0_one,
    input  wire  gpio0_1_tie_lo_esd,
    input  wire  gpio0_1_in,
    input  wire  gpio0_1_tie_hi_esd,
    output wire   gpio0_1_enable_vddio,
    output wire   gpio0_1_slow,
    inout  wire  gpio0_1_pad_a_esd_0_h,
    inout  wire  gpio0_1_pad_a_esd_1_h,
    inout  wire  gpio0_1_pad_a_noesd_h,
    output wire   gpio0_1_analog_en,
    output wire   gpio0_1_analog_pol,
    output wire   gpio0_1_inp_dis,
    output wire   gpio0_1_enable_inp_h,
    output wire   gpio0_1_enable_h,
    output wire   gpio0_1_hld_h_n,
    output wire   gpio0_1_analog_sel,
    output wire   [2:0]    gpio0_1_dm,
    output wire   gpio0_1_hld_ovr,
    output wire   gpio0_1_out,
    output wire   gpio0_1_enable_vswitch_h,
    output wire   gpio0_1_enable_vdda_h,
    output wire   gpio0_1_vtrip_sel,
    output wire   gpio0_1_ib_mode_sel,
    output wire   gpio0_1_oe_n,
    input  wire  gpio0_1_in_h,
    input  wire  gpio0_1_zero,
    input  wire  gpio0_1_one,
    input  wire  gpio0_2_tie_lo_esd,
    input  wire  gpio0_2_in,
    input  wire  gpio0_2_tie_hi_esd,
    output wire   gpio0_2_enable_vddio,
    output wire   gpio0_2_slow,
    inout  wire  gpio0_2_pad_a_esd_0_h,
    inout  wire  gpio0_2_pad_a_esd_1_h,
    inout  wire  gpio0_2_pad_a_noesd_h,
    output wire   gpio0_2_analog_en,
    output wire   gpio0_2_analog_pol,
    output wire   gpio0_2_inp_dis,
    output wire   gpio0_2_enable_inp_h,
    output wire   gpio0_2_enable_h,
    output wire   gpio0_2_hld_h_n,
    output wire   gpio0_2_analog_sel,
    output wire   [2:0]    gpio0_2_dm,
    output wire   gpio0_2_hld_ovr,
    output wire   gpio0_2_out,
    output wire   gpio0_2_enable_vswitch_h,
    output wire   gpio0_2_enable_vdda_h,
    output wire   gpio0_2_vtrip_sel,
    output wire   gpio0_2_ib_mode_sel,
    output wire   gpio0_2_oe_n,
    input  wire  gpio0_2_in_h,
    input  wire  gpio0_2_zero,
    input  wire  gpio0_2_one,
    input  wire  gpio0_3_tie_lo_esd,
    input  wire  gpio0_3_in,
    input  wire  gpio0_3_tie_hi_esd,
    output wire   gpio0_3_enable_vddio,
    output wire   gpio0_3_slow,
    inout  wire  gpio0_3_pad_a_esd_0_h,
    inout  wire  gpio0_3_pad_a_esd_1_h,
    inout  wire  gpio0_3_pad_a_noesd_h,
    output wire   gpio0_3_analog_en,
    output wire   gpio0_3_analog_pol,
    output wire   gpio0_3_inp_dis,
    output wire   gpio0_3_enable_inp_h,
    output wire   gpio0_3_enable_h,
    output wire   gpio0_3_hld_h_n,
    output wire   gpio0_3_analog_sel,
    output wire   [2:0]    gpio0_3_dm,
    output wire   gpio0_3_hld_ovr,
    output wire   gpio0_3_out,
    output wire   gpio0_3_enable_vswitch_h,
    output wire   gpio0_3_enable_vdda_h,
    output wire   gpio0_3_vtrip_sel,
    output wire   gpio0_3_ib_mode_sel,
    output wire   gpio0_3_oe_n,
    input  wire  gpio0_3_in_h,
    input  wire  gpio0_3_zero,
    input  wire  gpio0_3_one,
    input  wire  gpio0_4_tie_lo_esd,
    input  wire  gpio0_4_in,
    input  wire  gpio0_4_tie_hi_esd,
    output wire   gpio0_4_enable_vddio,
    output wire   gpio0_4_slow,
    inout  wire  gpio0_4_pad_a_esd_0_h,
    inout  wire  gpio0_4_pad_a_esd_1_h,
    inout  wire  gpio0_4_pad_a_noesd_h,
    output wire   gpio0_4_analog_en,
    output wire   gpio0_4_analog_pol,
    output wire   gpio0_4_inp_dis,
    output wire   gpio0_4_enable_inp_h,
    output wire   gpio0_4_enable_h,
    output wire   gpio0_4_hld_h_n,
    output wire   gpio0_4_analog_sel,
    output wire   [2:0]    gpio0_4_dm,
    output wire   gpio0_4_hld_ovr,
    output wire   gpio0_4_out,
    output wire   gpio0_4_enable_vswitch_h,
    output wire   gpio0_4_enable_vdda_h,
    output wire   gpio0_4_vtrip_sel,
    output wire   gpio0_4_ib_mode_sel,
    output wire   gpio0_4_oe_n,
    input  wire  gpio0_4_in_h,
    input  wire  gpio0_4_zero,
    input  wire  gpio0_4_one,
    input  wire  gpio0_5_tie_lo_esd,
    input  wire  gpio0_5_in,
    input  wire  gpio0_5_tie_hi_esd,
    output wire   gpio0_5_enable_vddio,
    output wire   gpio0_5_slow,
    inout  wire  gpio0_5_pad_a_esd_0_h,
    inout  wire  gpio0_5_pad_a_esd_1_h,
    inout  wire  gpio0_5_pad_a_noesd_h,
    output wire   gpio0_5_analog_en,
    output wire   gpio0_5_analog_pol,
    output wire   gpio0_5_inp_dis,
    output wire   gpio0_5_enable_inp_h,
    output wire   gpio0_5_enable_h,
    output wire   gpio0_5_hld_h_n,
    output wire   gpio0_5_analog_sel,
    output wire   [2:0]    gpio0_5_dm,
    output wire   gpio0_5_hld_ovr,
    output wire   gpio0_5_out,
    output wire   gpio0_5_enable_vswitch_h,
    output wire   gpio0_5_enable_vdda_h,
    output wire   gpio0_5_vtrip_sel,
    output wire   gpio0_5_ib_mode_sel,
    output wire   gpio0_5_oe_n,
    input  wire  gpio0_5_in_h,
    input  wire  gpio0_5_zero,
    input  wire  gpio0_5_one,
    input  wire  gpio0_6_tie_lo_esd,
    input  wire  gpio0_6_in,
    input  wire  gpio0_6_tie_hi_esd,
    output wire   gpio0_6_enable_vddio,
    output wire   gpio0_6_slow,
    inout  wire  gpio0_6_pad_a_esd_0_h,
    inout  wire  gpio0_6_pad_a_esd_1_h,
    inout  wire  gpio0_6_pad_a_noesd_h,
    output wire   gpio0_6_analog_en,
    output wire   gpio0_6_analog_pol,
    output wire   gpio0_6_inp_dis,
    output wire   gpio0_6_enable_inp_h,
    output wire   gpio0_6_enable_h,
    output wire   gpio0_6_hld_h_n,
    output wire   gpio0_6_analog_sel,
    output wire   [2:0]    gpio0_6_dm,
    output wire   gpio0_6_hld_ovr,
    output wire   gpio0_6_out,
    output wire   gpio0_6_enable_vswitch_h,
    output wire   gpio0_6_enable_vdda_h,
    output wire   gpio0_6_vtrip_sel,
    output wire   gpio0_6_ib_mode_sel,
    output wire   gpio0_6_oe_n,
    input  wire  gpio0_6_in_h,
    input  wire  gpio0_6_zero,
    input  wire  gpio0_6_one,
    input  wire  gpio0_7_tie_lo_esd,
    input  wire  gpio0_7_in,
    input  wire  gpio0_7_tie_hi_esd,
    output wire   gpio0_7_enable_vddio,
    output wire   gpio0_7_slow,
    inout  wire  gpio0_7_pad_a_esd_0_h,
    inout  wire  gpio0_7_pad_a_esd_1_h,
    inout  wire  gpio0_7_pad_a_noesd_h,
    output wire   gpio0_7_analog_en,
    output wire   gpio0_7_analog_pol,
    output wire   gpio0_7_inp_dis,
    output wire   gpio0_7_enable_inp_h,
    output wire   gpio0_7_enable_h,
    output wire   gpio0_7_hld_h_n,
    output wire   gpio0_7_analog_sel,
    output wire   [2:0]    gpio0_7_dm,
    output wire   gpio0_7_hld_ovr,
    output wire   gpio0_7_out,
    output wire   gpio0_7_enable_vswitch_h,
    output wire   gpio0_7_enable_vdda_h,
    output wire   gpio0_7_vtrip_sel,
    output wire   gpio0_7_ib_mode_sel,
    output wire   gpio0_7_oe_n,
    input  wire  gpio0_7_in_h,
    input  wire  gpio0_7_zero,
    input  wire  gpio0_7_one,
    input  wire  gpio1_0_tie_hi_esd,
    output wire   [2:0]    gpio1_0_dm,
    output wire   gpio1_0_slow,
    output wire   gpio1_0_oe_n,
    input  wire  gpio1_0_tie_lo_esd,
    output wire   gpio1_0_inp_dis,
    output wire   gpio1_0_enable_vddio,
    output wire   gpio1_0_vtrip_sel,
    output wire   [1:0]    gpio1_0_ib_mode_sel,
    output wire   gpio1_0_out,
    output wire   [1:0]    gpio1_0_slew_ctl,
    output wire   gpio1_0_analog_pol,
    output wire   gpio1_0_analog_sel,
    output wire   gpio1_0_hys_trim,
    output wire   gpio1_0_vinref,
    output wire   gpio1_0_hld_ovr,
    input  wire  gpio1_0_in_h,
    output wire   gpio1_0_enable_h,
    input  wire  gpio1_0_in,
    output wire   gpio1_0_hld_h_n,
    output wire   gpio1_0_enable_vdda_h,
    output wire   gpio1_0_analog_en,
    output wire   gpio1_0_enable_inp_h,
    output wire   gpio1_0_enable_vswitch_h,
    inout  wire  gpio1_0_pad_a_noesd_h,
    inout  wire  gpio1_0_pad_a_esd_0_h,
    inout  wire  gpio1_0_pad_a_esd_1_h,
    input  wire  gpio1_0_zero,
    input  wire  gpio1_0_one,
    input  wire  gpio1_1_tie_hi_esd,
    output wire   [2:0]    gpio1_1_dm,
    output wire   gpio1_1_slow,
    output wire   gpio1_1_oe_n,
    input  wire  gpio1_1_tie_lo_esd,
    output wire   gpio1_1_inp_dis,
    output wire   gpio1_1_enable_vddio,
    output wire   gpio1_1_vtrip_sel,
    output wire   [1:0]    gpio1_1_ib_mode_sel,
    output wire   gpio1_1_out,
    output wire   [1:0]    gpio1_1_slew_ctl,
    output wire   gpio1_1_analog_pol,
    output wire   gpio1_1_analog_sel,
    output wire   gpio1_1_hys_trim,
    output wire   gpio1_1_vinref,
    output wire   gpio1_1_hld_ovr,
    input  wire  gpio1_1_in_h,
    output wire   gpio1_1_enable_h,
    input  wire  gpio1_1_in,
    output wire   gpio1_1_hld_h_n,
    output wire   gpio1_1_enable_vdda_h,
    output wire   gpio1_1_analog_en,
    output wire   gpio1_1_enable_inp_h,
    output wire   gpio1_1_enable_vswitch_h,
    inout  wire  gpio1_1_pad_a_noesd_h,
    inout  wire  gpio1_1_pad_a_esd_0_h,
    inout  wire  gpio1_1_pad_a_esd_1_h,
    input  wire  gpio1_1_zero,
    input  wire  gpio1_1_one,
    input  wire  gpio1_2_tie_hi_esd,
    output wire   [2:0]    gpio1_2_dm,
    output wire   gpio1_2_slow,
    output wire   gpio1_2_oe_n,
    input  wire  gpio1_2_tie_lo_esd,
    output wire   gpio1_2_inp_dis,
    output wire   gpio1_2_enable_vddio,
    output wire   gpio1_2_vtrip_sel,
    output wire   [1:0]    gpio1_2_ib_mode_sel,
    output wire   gpio1_2_out,
    output wire   [1:0]    gpio1_2_slew_ctl,
    output wire   gpio1_2_analog_pol,
    output wire   gpio1_2_analog_sel,
    output wire   gpio1_2_hys_trim,
    output wire   gpio1_2_vinref,
    output wire   gpio1_2_hld_ovr,
    input  wire  gpio1_2_in_h,
    output wire   gpio1_2_enable_h,
    input  wire  gpio1_2_in,
    output wire   gpio1_2_hld_h_n,
    output wire   gpio1_2_enable_vdda_h,
    output wire   gpio1_2_analog_en,
    output wire   gpio1_2_enable_inp_h,
    output wire   gpio1_2_enable_vswitch_h,
    inout  wire  gpio1_2_pad_a_noesd_h,
    inout  wire  gpio1_2_pad_a_esd_0_h,
    inout  wire  gpio1_2_pad_a_esd_1_h,
    input  wire  gpio1_2_zero,
    input  wire  gpio1_2_one,
    input  wire  gpio1_3_tie_hi_esd,
    output wire   [2:0]    gpio1_3_dm,
    output wire   gpio1_3_slow,
    output wire   gpio1_3_oe_n,
    input  wire  gpio1_3_tie_lo_esd,
    output wire   gpio1_3_inp_dis,
    output wire   gpio1_3_enable_vddio,
    output wire   gpio1_3_vtrip_sel,
    output wire   [1:0]    gpio1_3_ib_mode_sel,
    output wire   gpio1_3_out,
    output wire   [1:0]    gpio1_3_slew_ctl,
    output wire   gpio1_3_analog_pol,
    output wire   gpio1_3_analog_sel,
    output wire   gpio1_3_hys_trim,
    output wire   gpio1_3_vinref,
    output wire   gpio1_3_hld_ovr,
    input  wire  gpio1_3_in_h,
    output wire   gpio1_3_enable_h,
    input  wire  gpio1_3_in,
    output wire   gpio1_3_hld_h_n,
    output wire   gpio1_3_enable_vdda_h,
    output wire   gpio1_3_analog_en,
    output wire   gpio1_3_enable_inp_h,
    output wire   gpio1_3_enable_vswitch_h,
    inout  wire  gpio1_3_pad_a_noesd_h,
    inout  wire  gpio1_3_pad_a_esd_0_h,
    inout  wire  gpio1_3_pad_a_esd_1_h,
    input  wire  gpio1_3_zero,
    input  wire  gpio1_3_one,
    output wire   [4:0]    vref_e_ref_sel,
    output wire   vref_e_enable_h,
    output wire   vref_e_hld_h_n,
    output wire   vref_e_vrefgen_en,
    input  wire  gpio1_4_tie_hi_esd,
    output wire   [2:0]    gpio1_4_dm,
    output wire   gpio1_4_slow,
    output wire   gpio1_4_oe_n,
    input  wire  gpio1_4_tie_lo_esd,
    output wire   gpio1_4_inp_dis,
    output wire   gpio1_4_enable_vddio,
    output wire   gpio1_4_vtrip_sel,
    output wire   [1:0]    gpio1_4_ib_mode_sel,
    output wire   gpio1_4_out,
    output wire   [1:0]    gpio1_4_slew_ctl,
    output wire   gpio1_4_analog_pol,
    output wire   gpio1_4_analog_sel,
    output wire   gpio1_4_hys_trim,
    output wire   gpio1_4_vinref,
    output wire   gpio1_4_hld_ovr,
    input  wire  gpio1_4_in_h,
    output wire   gpio1_4_enable_h,
    input  wire  gpio1_4_in,
    output wire   gpio1_4_hld_h_n,
    output wire   gpio1_4_enable_vdda_h,
    output wire   gpio1_4_analog_en,
    output wire   gpio1_4_enable_inp_h,
    output wire   gpio1_4_enable_vswitch_h,
    inout  wire  gpio1_4_pad_a_noesd_h,
    inout  wire  gpio1_4_pad_a_esd_0_h,
    inout  wire  gpio1_4_pad_a_esd_1_h,
    input  wire  gpio1_4_zero,
    input  wire  gpio1_4_one,
    input  wire  gpio1_5_tie_hi_esd,
    output wire   [2:0]    gpio1_5_dm,
    output wire   gpio1_5_slow,
    output wire   gpio1_5_oe_n,
    input  wire  gpio1_5_tie_lo_esd,
    output wire   gpio1_5_inp_dis,
    output wire   gpio1_5_enable_vddio,
    output wire   gpio1_5_vtrip_sel,
    output wire   [1:0]    gpio1_5_ib_mode_sel,
    output wire   gpio1_5_out,
    output wire   [1:0]    gpio1_5_slew_ctl,
    output wire   gpio1_5_analog_pol,
    output wire   gpio1_5_analog_sel,
    output wire   gpio1_5_hys_trim,
    output wire   gpio1_5_vinref,
    output wire   gpio1_5_hld_ovr,
    input  wire  gpio1_5_in_h,
    output wire   gpio1_5_enable_h,
    input  wire  gpio1_5_in,
    output wire   gpio1_5_hld_h_n,
    output wire   gpio1_5_enable_vdda_h,
    output wire   gpio1_5_analog_en,
    output wire   gpio1_5_enable_inp_h,
    output wire   gpio1_5_enable_vswitch_h,
    inout  wire  gpio1_5_pad_a_noesd_h,
    inout  wire  gpio1_5_pad_a_esd_0_h,
    inout  wire  gpio1_5_pad_a_esd_1_h,
    input  wire  gpio1_5_zero,
    input  wire  gpio1_5_one,
    input  wire  gpio1_6_tie_hi_esd,
    output wire   [2:0]    gpio1_6_dm,
    output wire   gpio1_6_slow,
    output wire   gpio1_6_oe_n,
    input  wire  gpio1_6_tie_lo_esd,
    output wire   gpio1_6_inp_dis,
    output wire   gpio1_6_enable_vddio,
    output wire   gpio1_6_vtrip_sel,
    output wire   [1:0]    gpio1_6_ib_mode_sel,
    output wire   gpio1_6_out,
    output wire   [1:0]    gpio1_6_slew_ctl,
    output wire   gpio1_6_analog_pol,
    output wire   gpio1_6_analog_sel,
    output wire   gpio1_6_hys_trim,
    output wire   gpio1_6_vinref,
    output wire   gpio1_6_hld_ovr,
    input  wire  gpio1_6_in_h,
    output wire   gpio1_6_enable_h,
    input  wire  gpio1_6_in,
    output wire   gpio1_6_hld_h_n,
    output wire   gpio1_6_enable_vdda_h,
    output wire   gpio1_6_analog_en,
    output wire   gpio1_6_enable_inp_h,
    output wire   gpio1_6_enable_vswitch_h,
    inout  wire  gpio1_6_pad_a_noesd_h,
    inout  wire  gpio1_6_pad_a_esd_0_h,
    inout  wire  gpio1_6_pad_a_esd_1_h,
    input  wire  gpio1_6_zero,
    input  wire  gpio1_6_one,
    input  wire  gpio1_7_tie_hi_esd,
    output wire   [2:0]    gpio1_7_dm,
    output wire   gpio1_7_slow,
    output wire   gpio1_7_oe_n,
    input  wire  gpio1_7_tie_lo_esd,
    output wire   gpio1_7_inp_dis,
    output wire   gpio1_7_enable_vddio,
    output wire   gpio1_7_vtrip_sel,
    output wire   [1:0]    gpio1_7_ib_mode_sel,
    output wire   gpio1_7_out,
    output wire   [1:0]    gpio1_7_slew_ctl,
    output wire   gpio1_7_analog_pol,
    output wire   gpio1_7_analog_sel,
    output wire   gpio1_7_hys_trim,
    output wire   gpio1_7_vinref,
    output wire   gpio1_7_hld_ovr,
    input  wire  gpio1_7_in_h,
    output wire   gpio1_7_enable_h,
    input  wire  gpio1_7_in,
    output wire   gpio1_7_hld_h_n,
    output wire   gpio1_7_enable_vdda_h,
    output wire   gpio1_7_analog_en,
    output wire   gpio1_7_enable_inp_h,
    output wire   gpio1_7_enable_vswitch_h,
    inout  wire  gpio1_7_pad_a_noesd_h,
    inout  wire  gpio1_7_pad_a_esd_0_h,
    inout  wire  gpio1_7_pad_a_esd_1_h,
    input  wire  gpio1_7_zero,
    input  wire  gpio1_7_one,
    input  wire  gpio2_0_tie_lo_esd,
    input  wire  gpio2_0_in,
    input  wire  gpio2_0_tie_hi_esd,
    output wire   gpio2_0_enable_vddio,
    output wire   gpio2_0_slow,
    inout  wire  gpio2_0_pad_a_esd_0_h,
    inout  wire  gpio2_0_pad_a_esd_1_h,
    inout  wire  gpio2_0_pad_a_noesd_h,
    output wire   gpio2_0_analog_en,
    output wire   gpio2_0_analog_pol,
    output wire   gpio2_0_inp_dis,
    output wire   gpio2_0_enable_inp_h,
    output wire   gpio2_0_enable_h,
    output wire   gpio2_0_hld_h_n,
    output wire   gpio2_0_analog_sel,
    output wire   [2:0]    gpio2_0_dm,
    output wire   gpio2_0_hld_ovr,
    output wire   gpio2_0_out,
    output wire   gpio2_0_enable_vswitch_h,
    output wire   gpio2_0_enable_vdda_h,
    output wire   gpio2_0_vtrip_sel,
    output wire   gpio2_0_ib_mode_sel,
    output wire   gpio2_0_oe_n,
    input  wire  gpio2_0_in_h,
    input  wire  gpio2_0_zero,
    input  wire  gpio2_0_one,
    input  wire  gpio2_1_tie_lo_esd,
    input  wire  gpio2_1_in,
    input  wire  gpio2_1_tie_hi_esd,
    output wire   gpio2_1_enable_vddio,
    output wire   gpio2_1_slow,
    inout  wire  gpio2_1_pad_a_esd_0_h,
    inout  wire  gpio2_1_pad_a_esd_1_h,
    inout  wire  gpio2_1_pad_a_noesd_h,
    output wire   gpio2_1_analog_en,
    output wire   gpio2_1_analog_pol,
    output wire   gpio2_1_inp_dis,
    output wire   gpio2_1_enable_inp_h,
    output wire   gpio2_1_enable_h,
    output wire   gpio2_1_hld_h_n,
    output wire   gpio2_1_analog_sel,
    output wire   [2:0]    gpio2_1_dm,
    output wire   gpio2_1_hld_ovr,
    output wire   gpio2_1_out,
    output wire   gpio2_1_enable_vswitch_h,
    output wire   gpio2_1_enable_vdda_h,
    output wire   gpio2_1_vtrip_sel,
    output wire   gpio2_1_ib_mode_sel,
    output wire   gpio2_1_oe_n,
    input  wire  gpio2_1_in_h,
    input  wire  gpio2_1_zero,
    input  wire  gpio2_1_one,
    input  wire  gpio2_2_tie_lo_esd,
    input  wire  gpio2_2_in,
    input  wire  gpio2_2_tie_hi_esd,
    output wire   gpio2_2_enable_vddio,
    output wire   gpio2_2_slow,
    inout  wire  gpio2_2_pad_a_esd_0_h,
    inout  wire  gpio2_2_pad_a_esd_1_h,
    inout  wire  gpio2_2_pad_a_noesd_h,
    output wire   gpio2_2_analog_en,
    output wire   gpio2_2_analog_pol,
    output wire   gpio2_2_inp_dis,
    output wire   gpio2_2_enable_inp_h,
    output wire   gpio2_2_enable_h,
    output wire   gpio2_2_hld_h_n,
    output wire   gpio2_2_analog_sel,
    output wire   [2:0]    gpio2_2_dm,
    output wire   gpio2_2_hld_ovr,
    output wire   gpio2_2_out,
    output wire   gpio2_2_enable_vswitch_h,
    output wire   gpio2_2_enable_vdda_h,
    output wire   gpio2_2_vtrip_sel,
    output wire   gpio2_2_ib_mode_sel,
    output wire   gpio2_2_oe_n,
    input  wire  gpio2_2_in_h,
    input  wire  gpio2_2_zero,
    input  wire  gpio2_2_one,
    input  wire  gpio2_3_tie_lo_esd,
    input  wire  gpio2_3_in,
    input  wire  gpio2_3_tie_hi_esd,
    output wire   gpio2_3_enable_vddio,
    output wire   gpio2_3_slow,
    inout  wire  gpio2_3_pad_a_esd_0_h,
    inout  wire  gpio2_3_pad_a_esd_1_h,
    inout  wire  gpio2_3_pad_a_noesd_h,
    output wire   gpio2_3_analog_en,
    output wire   gpio2_3_analog_pol,
    output wire   gpio2_3_inp_dis,
    output wire   gpio2_3_enable_inp_h,
    output wire   gpio2_3_enable_h,
    output wire   gpio2_3_hld_h_n,
    output wire   gpio2_3_analog_sel,
    output wire   [2:0]    gpio2_3_dm,
    output wire   gpio2_3_hld_ovr,
    output wire   gpio2_3_out,
    output wire   gpio2_3_enable_vswitch_h,
    output wire   gpio2_3_enable_vdda_h,
    output wire   gpio2_3_vtrip_sel,
    output wire   gpio2_3_ib_mode_sel,
    output wire   gpio2_3_oe_n,
    input  wire  gpio2_3_in_h,
    input  wire  gpio2_3_zero,
    input  wire  gpio2_3_one,
    input  wire  gpio2_4_tie_lo_esd,
    input  wire  gpio2_4_in,
    input  wire  gpio2_4_tie_hi_esd,
    output wire   gpio2_4_enable_vddio,
    output wire   gpio2_4_slow,
    inout  wire  gpio2_4_pad_a_esd_0_h,
    inout  wire  gpio2_4_pad_a_esd_1_h,
    inout  wire  gpio2_4_pad_a_noesd_h,
    output wire   gpio2_4_analog_en,
    output wire   gpio2_4_analog_pol,
    output wire   gpio2_4_inp_dis,
    output wire   gpio2_4_enable_inp_h,
    output wire   gpio2_4_enable_h,
    output wire   gpio2_4_hld_h_n,
    output wire   gpio2_4_analog_sel,
    output wire   [2:0]    gpio2_4_dm,
    output wire   gpio2_4_hld_ovr,
    output wire   gpio2_4_out,
    output wire   gpio2_4_enable_vswitch_h,
    output wire   gpio2_4_enable_vdda_h,
    output wire   gpio2_4_vtrip_sel,
    output wire   gpio2_4_ib_mode_sel,
    output wire   gpio2_4_oe_n,
    input  wire  gpio2_4_in_h,
    input  wire  gpio2_4_zero,
    input  wire  gpio2_4_one,
    input  wire  gpio2_5_tie_lo_esd,
    input  wire  gpio2_5_in,
    input  wire  gpio2_5_tie_hi_esd,
    output wire   gpio2_5_enable_vddio,
    output wire   gpio2_5_slow,
    inout  wire  gpio2_5_pad_a_esd_0_h,
    inout  wire  gpio2_5_pad_a_esd_1_h,
    inout  wire  gpio2_5_pad_a_noesd_h,
    output wire   gpio2_5_analog_en,
    output wire   gpio2_5_analog_pol,
    output wire   gpio2_5_inp_dis,
    output wire   gpio2_5_enable_inp_h,
    output wire   gpio2_5_enable_h,
    output wire   gpio2_5_hld_h_n,
    output wire   gpio2_5_analog_sel,
    output wire   [2:0]    gpio2_5_dm,
    output wire   gpio2_5_hld_ovr,
    output wire   gpio2_5_out,
    output wire   gpio2_5_enable_vswitch_h,
    output wire   gpio2_5_enable_vdda_h,
    output wire   gpio2_5_vtrip_sel,
    output wire   gpio2_5_ib_mode_sel,
    output wire   gpio2_5_oe_n,
    input  wire  gpio2_5_in_h,
    input  wire  gpio2_5_zero,
    input  wire  gpio2_5_one,
    input  wire  gpio2_6_tie_lo_esd,
    input  wire  gpio2_6_in,
    input  wire  gpio2_6_tie_hi_esd,
    output wire   gpio2_6_enable_vddio,
    output wire   gpio2_6_slow,
    inout  wire  gpio2_6_pad_a_esd_0_h,
    inout  wire  gpio2_6_pad_a_esd_1_h,
    inout  wire  gpio2_6_pad_a_noesd_h,
    output wire   gpio2_6_analog_en,
    output wire   gpio2_6_analog_pol,
    output wire   gpio2_6_inp_dis,
    output wire   gpio2_6_enable_inp_h,
    output wire   gpio2_6_enable_h,
    output wire   gpio2_6_hld_h_n,
    output wire   gpio2_6_analog_sel,
    output wire   [2:0]    gpio2_6_dm,
    output wire   gpio2_6_hld_ovr,
    output wire   gpio2_6_out,
    output wire   gpio2_6_enable_vswitch_h,
    output wire   gpio2_6_enable_vdda_h,
    output wire   gpio2_6_vtrip_sel,
    output wire   gpio2_6_ib_mode_sel,
    output wire   gpio2_6_oe_n,
    input  wire  gpio2_6_in_h,
    input  wire  gpio2_6_zero,
    input  wire  gpio2_6_one,
    input  wire  gpio2_7_tie_lo_esd,
    input  wire  gpio2_7_in,
    input  wire  gpio2_7_tie_hi_esd,
    output wire   gpio2_7_enable_vddio,
    output wire   gpio2_7_slow,
    inout  wire  gpio2_7_pad_a_esd_0_h,
    inout  wire  gpio2_7_pad_a_esd_1_h,
    inout  wire  gpio2_7_pad_a_noesd_h,
    output wire   gpio2_7_analog_en,
    output wire   gpio2_7_analog_pol,
    output wire   gpio2_7_inp_dis,
    output wire   gpio2_7_enable_inp_h,
    output wire   gpio2_7_enable_h,
    output wire   gpio2_7_hld_h_n,
    output wire   gpio2_7_analog_sel,
    output wire   [2:0]    gpio2_7_dm,
    output wire   gpio2_7_hld_ovr,
    output wire   gpio2_7_out,
    output wire   gpio2_7_enable_vswitch_h,
    output wire   gpio2_7_enable_vdda_h,
    output wire   gpio2_7_vtrip_sel,
    output wire   gpio2_7_ib_mode_sel,
    output wire   gpio2_7_oe_n,
    input  wire  gpio2_7_in_h,
    input  wire  gpio2_7_zero,
    input  wire  gpio2_7_one,
    output wire   muxsplit_ne_hld_vdda_h_n,
    output wire   muxsplit_ne_enable_vdda_h,
    output wire   muxsplit_ne_switch_aa_sl,
    output wire   muxsplit_ne_switch_aa_s0,
    output wire   muxsplit_ne_switch_bb_s0,
    output wire   muxsplit_ne_switch_bb_sl,
    output wire   muxsplit_ne_switch_bb_sr,
    output wire   muxsplit_ne_switch_aa_sr,
    input  wire  gpio3_0_tie_lo_esd,
    input  wire  gpio3_0_in,
    input  wire  gpio3_0_tie_hi_esd,
    output wire   gpio3_0_enable_vddio,
    output wire   gpio3_0_slow,
    inout  wire  gpio3_0_pad_a_esd_0_h,
    inout  wire  gpio3_0_pad_a_esd_1_h,
    inout  wire  gpio3_0_pad_a_noesd_h,
    output wire   gpio3_0_analog_en,
    output wire   gpio3_0_analog_pol,
    output wire   gpio3_0_inp_dis,
    output wire   gpio3_0_enable_inp_h,
    output wire   gpio3_0_enable_h,
    output wire   gpio3_0_hld_h_n,
    output wire   gpio3_0_analog_sel,
    output wire   [2:0]    gpio3_0_dm,
    output wire   gpio3_0_hld_ovr,
    output wire   gpio3_0_out,
    output wire   gpio3_0_enable_vswitch_h,
    output wire   gpio3_0_enable_vdda_h,
    output wire   gpio3_0_vtrip_sel,
    output wire   gpio3_0_ib_mode_sel,
    output wire   gpio3_0_oe_n,
    output wire   gpio3_0_in_h,
    input  wire  gpio3_0_zero,
    input  wire  gpio3_0_one,
    input  wire  gpio3_1_tie_lo_esd,
    input  wire  gpio3_1_in,
    input  wire  gpio3_1_tie_hi_esd,
    output wire   gpio3_1_enable_vddio,
    output wire   gpio3_1_slow,
    inout  wire  gpio3_1_pad_a_esd_0_h,
    inout  wire  gpio3_1_pad_a_esd_1_h,
    inout  wire  gpio3_1_pad_a_noesd_h,
    output wire   gpio3_1_analog_en,
    output wire   gpio3_1_analog_pol,
    output wire   gpio3_1_inp_dis,
    output wire   gpio3_1_enable_inp_h,
    output wire   gpio3_1_enable_h,
    output wire   gpio3_1_hld_h_n,
    output wire   gpio3_1_analog_sel,
    output wire   [2:0]    gpio3_1_dm,
    output wire   gpio3_1_hld_ovr,
    output wire   gpio3_1_out,
    output wire   gpio3_1_enable_vswitch_h,
    output wire   gpio3_1_enable_vdda_h,
    output wire   gpio3_1_vtrip_sel,
    output wire   gpio3_1_ib_mode_sel,
    output wire   gpio3_1_oe_n,
    output wire   gpio3_1_in_h,
    input  wire  gpio3_1_zero,
    input  wire  gpio3_1_one,
    input  wire  gpio3_2_tie_lo_esd,
    input  wire  gpio3_2_in,
    input  wire  gpio3_2_tie_hi_esd,
    output wire   gpio3_2_enable_vddio,
    output wire   gpio3_2_slow,
    inout  wire  gpio3_2_pad_a_esd_0_h,
    inout  wire  gpio3_2_pad_a_esd_1_h,
    inout  wire  gpio3_2_pad_a_noesd_h,
    output wire   gpio3_2_analog_en,
    output wire   gpio3_2_analog_pol,
    output wire   gpio3_2_inp_dis,
    output wire   gpio3_2_enable_inp_h,
    output wire   gpio3_2_enable_h,
    output wire   gpio3_2_hld_h_n,
    output wire   gpio3_2_analog_sel,
    output wire   [2:0]    gpio3_2_dm,
    output wire   gpio3_2_hld_ovr,
    output wire   gpio3_2_out,
    output wire   gpio3_2_enable_vswitch_h,
    output wire   gpio3_2_enable_vdda_h,
    output wire   gpio3_2_vtrip_sel,
    output wire   gpio3_2_ib_mode_sel,
    output wire   gpio3_2_oe_n,
    output wire   gpio3_2_in_h,
    input  wire  gpio3_2_zero,
    input  wire  gpio3_2_one,
    input  wire  gpio3_3_tie_lo_esd,
    input  wire  gpio3_3_in,
    input  wire  gpio3_3_tie_hi_esd,
    output wire   gpio3_3_enable_vddio,
    output wire   gpio3_3_slow,
    inout  wire  gpio3_3_pad_a_esd_0_h,
    inout  wire  gpio3_3_pad_a_esd_1_h,
    inout  wire  gpio3_3_pad_a_noesd_h,
    output wire   gpio3_3_analog_en,
    output wire   gpio3_3_analog_pol,
    output wire   gpio3_3_inp_dis,
    output wire   gpio3_3_enable_inp_h,
    output wire   gpio3_3_enable_h,
    output wire   gpio3_3_hld_h_n,
    output wire   gpio3_3_analog_sel,
    output wire   [2:0]    gpio3_3_dm,
    output wire   gpio3_3_hld_ovr,
    output wire   gpio3_3_out,
    output wire   gpio3_3_enable_vswitch_h,
    output wire   gpio3_3_enable_vdda_h,
    output wire   gpio3_3_vtrip_sel,
    output wire   gpio3_3_ib_mode_sel,
    output wire   gpio3_3_oe_n,
    output wire   gpio3_3_in_h,
    input  wire  gpio3_3_zero,
    input  wire  gpio3_3_one,
    input  wire  gpio3_4_tie_lo_esd,
    input  wire  gpio3_4_in,
    input  wire  gpio3_4_tie_hi_esd,
    output wire   gpio3_4_enable_vddio,
    output wire   gpio3_4_slow,
    inout  wire  gpio3_4_pad_a_esd_0_h,
    inout  wire  gpio3_4_pad_a_esd_1_h,
    inout  wire  gpio3_4_pad_a_noesd_h,
    output wire   gpio3_4_analog_en,
    output wire   gpio3_4_analog_pol,
    output wire   gpio3_4_inp_dis,
    output wire   gpio3_4_enable_inp_h,
    output wire   gpio3_4_enable_h,
    output wire   gpio3_4_hld_h_n,
    output wire   gpio3_4_analog_sel,
    output wire   [2:0]    gpio3_4_dm,
    output wire   gpio3_4_hld_ovr,
    output wire   gpio3_4_out,
    output wire   gpio3_4_enable_vswitch_h,
    output wire   gpio3_4_enable_vdda_h,
    output wire   gpio3_4_vtrip_sel,
    output wire   gpio3_4_ib_mode_sel,
    output wire   gpio3_4_oe_n,
    output wire   gpio3_4_in_h,
    input  wire  gpio3_4_zero,
    input  wire  gpio3_4_one,
    input  wire  gpio3_5_tie_lo_esd,
    input  wire  gpio3_5_in,
    input  wire  gpio3_5_tie_hi_esd,
    output wire   gpio3_5_enable_vddio,
    output wire   gpio3_5_slow,
    inout  wire  gpio3_5_pad_a_esd_0_h,
    inout  wire  gpio3_5_pad_a_esd_1_h,
    inout  wire  gpio3_5_pad_a_noesd_h,
    output wire   gpio3_5_analog_en,
    output wire   gpio3_5_analog_pol,
    output wire   gpio3_5_inp_dis,
    output wire   gpio3_5_enable_inp_h,
    output wire   gpio3_5_enable_h,
    output wire   gpio3_5_hld_h_n,
    output wire   gpio3_5_analog_sel,
    output wire   [2:0]    gpio3_5_dm,
    output wire   gpio3_5_hld_ovr,
    output wire   gpio3_5_out,
    output wire   gpio3_5_enable_vswitch_h,
    output wire   gpio3_5_enable_vdda_h,
    output wire   gpio3_5_vtrip_sel,
    output wire   gpio3_5_ib_mode_sel,
    output wire   gpio3_5_oe_n,
    output wire   gpio3_5_in_h,
    input  wire  gpio3_5_zero,
    input  wire  gpio3_5_one,
    input  wire  gpio3_6_tie_lo_esd,
    input  wire  gpio3_6_in,
    input  wire  gpio3_6_tie_hi_esd,
    output wire   gpio3_6_enable_vddio,
    output wire   gpio3_6_slow,
    inout  wire  gpio3_6_pad_a_esd_0_h,
    inout  wire  gpio3_6_pad_a_esd_1_h,
    inout  wire  gpio3_6_pad_a_noesd_h,
    output wire   gpio3_6_analog_en,
    output wire   gpio3_6_analog_pol,
    output wire   gpio3_6_inp_dis,
    output wire   gpio3_6_enable_inp_h,
    output wire   gpio3_6_enable_h,
    output wire   gpio3_6_hld_h_n,
    output wire   gpio3_6_analog_sel,
    output wire   [2:0]    gpio3_6_dm,
    output wire   gpio3_6_hld_ovr,
    output wire   gpio3_6_out,
    output wire   gpio3_6_enable_vswitch_h,
    output wire   gpio3_6_enable_vdda_h,
    output wire   gpio3_6_vtrip_sel,
    output wire   gpio3_6_ib_mode_sel,
    output wire   gpio3_6_oe_n,
    output wire   gpio3_6_in_h,
    input  wire  gpio3_6_zero,
    input  wire  gpio3_6_one,
    input  wire  gpio3_7_tie_lo_esd,
    input  wire  gpio3_7_in,
    input  wire  gpio3_7_tie_hi_esd,
    output wire   gpio3_7_enable_vddio,
    output wire   gpio3_7_slow,
    inout  wire  gpio3_7_pad_a_esd_0_h,
    inout  wire  gpio3_7_pad_a_esd_1_h,
    inout  wire  gpio3_7_pad_a_noesd_h,
    output wire   gpio3_7_analog_en,
    output wire   gpio3_7_analog_pol,
    output wire   gpio3_7_inp_dis,
    output wire   gpio3_7_enable_inp_h,
    output wire   gpio3_7_enable_h,
    output wire   gpio3_7_hld_h_n,
    output wire   gpio3_7_analog_sel,
    output wire   [2:0]    gpio3_7_dm,
    output wire   gpio3_7_hld_ovr,
    output wire   gpio3_7_out,
    output wire   gpio3_7_enable_vswitch_h,
    output wire   gpio3_7_enable_vdda_h,
    output wire   gpio3_7_vtrip_sel,
    output wire   gpio3_7_ib_mode_sel,
    output wire   gpio3_7_oe_n,
    output wire   gpio3_7_in_h,
    input  wire  gpio3_7_zero,
    input  wire  gpio3_7_one,
    inout  wire  analog_0_core,
    inout  wire  analog_1_core,
    input  wire  gpio4_0_tie_lo_esd,
    input  wire  gpio4_0_in,
    input  wire  gpio4_0_tie_hi_esd,
    output wire   gpio4_0_enable_vddio,
    output wire   gpio4_0_slow,
    inout  wire  gpio4_0_pad_a_esd_0_h,
    inout  wire  gpio4_0_pad_a_esd_1_h,
    inout  wire  gpio4_0_pad_a_noesd_h,
    output wire   gpio4_0_analog_en,
    output wire   gpio4_0_analog_pol,
    output wire   gpio4_0_inp_dis,
    output wire   gpio4_0_enable_inp_h,
    output wire   gpio4_0_enable_h,
    output wire   gpio4_0_hld_h_n,
    output wire   gpio4_0_analog_sel,
    output wire   [2:0]    gpio4_0_dm,
    output wire   gpio4_0_hld_ovr,
    output wire   gpio4_0_out,
    output wire   gpio4_0_enable_vswitch_h,
    output wire   gpio4_0_enable_vdda_h,
    output wire   gpio4_0_vtrip_sel,
    output wire   gpio4_0_ib_mode_sel,
    output wire   gpio4_0_oe_n,
    output wire   gpio4_0_in_h,
    input  wire  gpio4_0_zero,
    input  wire  gpio4_0_one,
    input  wire  gpio4_1_tie_lo_esd,
    input  wire  gpio4_1_in,
    input  wire  gpio4_1_tie_hi_esd,
    output wire   gpio4_1_enable_vddio,
    output wire   gpio4_1_slow,
    inout  wire  gpio4_1_pad_a_esd_0_h,
    inout  wire  gpio4_1_pad_a_esd_1_h,
    inout  wire  gpio4_1_pad_a_noesd_h,
    output wire   gpio4_1_analog_en,
    output wire   gpio4_1_analog_pol,
    output wire   gpio4_1_inp_dis,
    output wire   gpio4_1_enable_inp_h,
    output wire   gpio4_1_enable_h,
    output wire   gpio4_1_hld_h_n,
    output wire   gpio4_1_analog_sel,
    output wire   [2:0]    gpio4_1_dm,
    output wire   gpio4_1_hld_ovr,
    output wire   gpio4_1_out,
    output wire   gpio4_1_enable_vswitch_h,
    output wire   gpio4_1_enable_vdda_h,
    output wire   gpio4_1_vtrip_sel,
    output wire   gpio4_1_ib_mode_sel,
    output wire   gpio4_1_oe_n,
    output wire   gpio4_1_in_h,
    input  wire  gpio4_1_zero,
    input  wire  gpio4_1_one,
    input  wire  gpio4_2_tie_lo_esd,
    input  wire  gpio4_2_in,
    input  wire  gpio4_2_tie_hi_esd,
    output wire   gpio4_2_enable_vddio,
    output wire   gpio4_2_slow,
    inout  wire  gpio4_2_pad_a_esd_0_h,
    inout  wire  gpio4_2_pad_a_esd_1_h,
    inout  wire  gpio4_2_pad_a_noesd_h,
    output wire   gpio4_2_analog_en,
    output wire   gpio4_2_analog_pol,
    output wire   gpio4_2_inp_dis,
    output wire   gpio4_2_enable_inp_h,
    output wire   gpio4_2_enable_h,
    output wire   gpio4_2_hld_h_n,
    output wire   gpio4_2_analog_sel,
    output wire   [2:0]    gpio4_2_dm,
    output wire   gpio4_2_hld_ovr,
    output wire   gpio4_2_out,
    output wire   gpio4_2_enable_vswitch_h,
    output wire   gpio4_2_enable_vdda_h,
    output wire   gpio4_2_vtrip_sel,
    output wire   gpio4_2_ib_mode_sel,
    output wire   gpio4_2_oe_n,
    output wire   gpio4_2_in_h,
    input  wire  gpio4_2_zero,
    input  wire  gpio4_2_one,
    input  wire  gpio4_3_tie_lo_esd,
    input  wire  gpio4_3_in,
    input  wire  gpio4_3_tie_hi_esd,
    output wire   gpio4_3_enable_vddio,
    output wire   gpio4_3_slow,
    inout  wire  gpio4_3_pad_a_esd_0_h,
    inout  wire  gpio4_3_pad_a_esd_1_h,
    inout  wire  gpio4_3_pad_a_noesd_h,
    output wire   gpio4_3_analog_en,
    output wire   gpio4_3_analog_pol,
    output wire   gpio4_3_inp_dis,
    output wire   gpio4_3_enable_inp_h,
    output wire   gpio4_3_enable_h,
    output wire   gpio4_3_hld_h_n,
    output wire   gpio4_3_analog_sel,
    output wire   [2:0]    gpio4_3_dm,
    output wire   gpio4_3_hld_ovr,
    output wire   gpio4_3_out,
    output wire   gpio4_3_enable_vswitch_h,
    output wire   gpio4_3_enable_vdda_h,
    output wire   gpio4_3_vtrip_sel,
    output wire   gpio4_3_ib_mode_sel,
    output wire   gpio4_3_oe_n,
    output wire   gpio4_3_in_h,
    input  wire  gpio4_3_zero,
    input  wire  gpio4_3_one,
    input  wire  gpio4_4_tie_lo_esd,
    input  wire  gpio4_4_in,
    input  wire  gpio4_4_tie_hi_esd,
    output wire   gpio4_4_enable_vddio,
    output wire   gpio4_4_slow,
    inout  wire  gpio4_4_pad_a_esd_0_h,
    inout  wire  gpio4_4_pad_a_esd_1_h,
    inout  wire  gpio4_4_pad_a_noesd_h,
    output wire   gpio4_4_analog_en,
    output wire   gpio4_4_analog_pol,
    output wire   gpio4_4_inp_dis,
    output wire   gpio4_4_enable_inp_h,
    output wire   gpio4_4_enable_h,
    output wire   gpio4_4_hld_h_n,
    output wire   gpio4_4_analog_sel,
    output wire   [2:0]    gpio4_4_dm,
    output wire   gpio4_4_hld_ovr,
    output wire   gpio4_4_out,
    output wire   gpio4_4_enable_vswitch_h,
    output wire   gpio4_4_enable_vdda_h,
    output wire   gpio4_4_vtrip_sel,
    output wire   gpio4_4_ib_mode_sel,
    output wire   gpio4_4_oe_n,
    output wire   gpio4_4_in_h,
    input  wire  gpio4_4_zero,
    input  wire  gpio4_4_one,
    input  wire  gpio4_5_tie_lo_esd,
    input  wire  gpio4_5_in,
    input  wire  gpio4_5_tie_hi_esd,
    output wire   gpio4_5_enable_vddio,
    output wire   gpio4_5_slow,
    inout  wire  gpio4_5_pad_a_esd_0_h,
    inout  wire  gpio4_5_pad_a_esd_1_h,
    inout  wire  gpio4_5_pad_a_noesd_h,
    output wire   gpio4_5_analog_en,
    output wire   gpio4_5_analog_pol,
    output wire   gpio4_5_inp_dis,
    output wire   gpio4_5_enable_inp_h,
    output wire   gpio4_5_enable_h,
    output wire   gpio4_5_hld_h_n,
    output wire   gpio4_5_analog_sel,
    output wire   [2:0]    gpio4_5_dm,
    output wire   gpio4_5_hld_ovr,
    output wire   gpio4_5_out,
    output wire   gpio4_5_enable_vswitch_h,
    output wire   gpio4_5_enable_vdda_h,
    output wire   gpio4_5_vtrip_sel,
    output wire   gpio4_5_ib_mode_sel,
    output wire   gpio4_5_oe_n,
    output wire   gpio4_5_in_h,
    input  wire  gpio4_5_zero,
    input  wire  gpio4_5_one,
    input  wire  gpio4_6_tie_lo_esd,
    input  wire  gpio4_6_in,
    input  wire  gpio4_6_tie_hi_esd,
    output wire   gpio4_6_enable_vddio,
    output wire   gpio4_6_slow,
    inout  wire  gpio4_6_pad_a_esd_0_h,
    inout  wire  gpio4_6_pad_a_esd_1_h,
    inout  wire  gpio4_6_pad_a_noesd_h,
    output wire   gpio4_6_analog_en,
    output wire   gpio4_6_analog_pol,
    output wire   gpio4_6_inp_dis,
    output wire   gpio4_6_enable_inp_h,
    output wire   gpio4_6_enable_h,
    output wire   gpio4_6_hld_h_n,
    output wire   gpio4_6_analog_sel,
    output wire   [2:0]    gpio4_6_dm,
    output wire   gpio4_6_hld_ovr,
    output wire   gpio4_6_out,
    output wire   gpio4_6_enable_vswitch_h,
    output wire   gpio4_6_enable_vdda_h,
    output wire   gpio4_6_vtrip_sel,
    output wire   gpio4_6_ib_mode_sel,
    output wire   gpio4_6_oe_n,
    output wire   gpio4_6_in_h,
    input  wire  gpio4_6_zero,
    input  wire  gpio4_6_one,
    input  wire  gpio4_7_tie_lo_esd,
    input  wire  gpio4_7_in,
    input  wire  gpio4_7_tie_hi_esd,
    output wire   gpio4_7_enable_vddio,
    output wire   gpio4_7_slow,
    inout  wire  gpio4_7_pad_a_esd_0_h,
    inout  wire  gpio4_7_pad_a_esd_1_h,
    inout  wire  gpio4_7_pad_a_noesd_h,
    output wire   gpio4_7_analog_en,
    output wire   gpio4_7_analog_pol,
    output wire   gpio4_7_inp_dis,
    output wire   gpio4_7_enable_inp_h,
    output wire   gpio4_7_enable_h,
    output wire   gpio4_7_hld_h_n,
    output wire   gpio4_7_analog_sel,
    output wire   [2:0]    gpio4_7_dm,
    output wire   gpio4_7_hld_ovr,
    output wire   gpio4_7_out,
    output wire   gpio4_7_enable_vswitch_h,
    output wire   gpio4_7_enable_vdda_h,
    output wire   gpio4_7_vtrip_sel,
    output wire   gpio4_7_ib_mode_sel,
    output wire   gpio4_7_oe_n,
    output wire   gpio4_7_in_h,
    input  wire  gpio4_7_zero,
    input  wire  gpio4_7_one,
    output wire   muxsplit_nw_hld_vdda_h_n,
    output wire   muxsplit_nw_enable_vdda_h,
    output wire   muxsplit_nw_switch_aa_sl,
    output wire   muxsplit_nw_switch_aa_s0,
    output wire   muxsplit_nw_switch_bb_s0,
    output wire   muxsplit_nw_switch_bb_sl,
    output wire   muxsplit_nw_switch_bb_sr,
    output wire   muxsplit_nw_switch_aa_sr,
    input  wire  gpio5_0_tie_lo_esd,
    input  wire  gpio5_0_in,
    input  wire  gpio5_0_tie_hi_esd,
    output wire   gpio5_0_enable_vddio,
    output wire   gpio5_0_slow,
    inout  wire  gpio5_0_pad_a_esd_0_h,
    inout  wire  gpio5_0_pad_a_esd_1_h,
    inout  wire  gpio5_0_pad_a_noesd_h,
    output wire   gpio5_0_analog_en,
    output wire   gpio5_0_analog_pol,
    output wire   gpio5_0_inp_dis,
    output wire   gpio5_0_enable_inp_h,
    output wire   gpio5_0_enable_h,
    output wire   gpio5_0_hld_h_n,
    output wire   gpio5_0_analog_sel,
    output wire   [2:0]    gpio5_0_dm,
    output wire   gpio5_0_hld_ovr,
    output wire   gpio5_0_out,
    output wire   gpio5_0_enable_vswitch_h,
    output wire   gpio5_0_enable_vdda_h,
    output wire   gpio5_0_vtrip_sel,
    output wire   gpio5_0_ib_mode_sel,
    output wire   gpio5_0_oe_n,
    input  wire  gpio5_0_in_h,
    input  wire  gpio5_0_zero,
    input  wire  gpio5_0_one,
    input  wire  gpio5_1_tie_lo_esd,
    input  wire  gpio5_1_in,
    input  wire  gpio5_1_tie_hi_esd,
    output wire   gpio5_1_enable_vddio,
    output wire   gpio5_1_slow,
    inout  wire  gpio5_1_pad_a_esd_0_h,
    inout  wire  gpio5_1_pad_a_esd_1_h,
    inout  wire  gpio5_1_pad_a_noesd_h,
    output wire   gpio5_1_analog_en,
    output wire   gpio5_1_analog_pol,
    output wire   gpio5_1_inp_dis,
    output wire   gpio5_1_enable_inp_h,
    output wire   gpio5_1_enable_h,
    output wire   gpio5_1_hld_h_n,
    output wire   gpio5_1_analog_sel,
    output wire   [2:0]    gpio5_1_dm,
    output wire   gpio5_1_hld_ovr,
    output wire   gpio5_1_out,
    output wire   gpio5_1_enable_vswitch_h,
    output wire   gpio5_1_enable_vdda_h,
    output wire   gpio5_1_vtrip_sel,
    output wire   gpio5_1_ib_mode_sel,
    output wire   gpio5_1_oe_n,
    input  wire  gpio5_1_in_h,
    input  wire  gpio5_1_zero,
    input  wire  gpio5_1_one,
    input  wire  gpio5_2_tie_lo_esd,
    input  wire  gpio5_2_in,
    input  wire  gpio5_2_tie_hi_esd,
    output wire   gpio5_2_enable_vddio,
    output wire   gpio5_2_slow,
    inout  wire  gpio5_2_pad_a_esd_0_h,
    inout  wire  gpio5_2_pad_a_esd_1_h,
    inout  wire  gpio5_2_pad_a_noesd_h,
    output wire   gpio5_2_analog_en,
    output wire   gpio5_2_analog_pol,
    output wire   gpio5_2_inp_dis,
    output wire   gpio5_2_enable_inp_h,
    output wire   gpio5_2_enable_h,
    output wire   gpio5_2_hld_h_n,
    output wire   gpio5_2_analog_sel,
    output wire   [2:0]    gpio5_2_dm,
    output wire   gpio5_2_hld_ovr,
    output wire   gpio5_2_out,
    output wire   gpio5_2_enable_vswitch_h,
    output wire   gpio5_2_enable_vdda_h,
    output wire   gpio5_2_vtrip_sel,
    output wire   gpio5_2_ib_mode_sel,
    output wire   gpio5_2_oe_n,
    input  wire  gpio5_2_in_h,
    input  wire  gpio5_2_zero,
    input  wire  gpio5_2_one,
    input  wire  gpio5_3_tie_lo_esd,
    input  wire  gpio5_3_in,
    input  wire  gpio5_3_tie_hi_esd,
    output wire   gpio5_3_enable_vddio,
    output wire   gpio5_3_slow,
    inout  wire  gpio5_3_pad_a_esd_0_h,
    inout  wire  gpio5_3_pad_a_esd_1_h,
    inout  wire  gpio5_3_pad_a_noesd_h,
    output wire   gpio5_3_analog_en,
    output wire   gpio5_3_analog_pol,
    output wire   gpio5_3_inp_dis,
    output wire   gpio5_3_enable_inp_h,
    output wire   gpio5_3_enable_h,
    output wire   gpio5_3_hld_h_n,
    output wire   gpio5_3_analog_sel,
    output wire   [2:0]    gpio5_3_dm,
    output wire   gpio5_3_hld_ovr,
    output wire   gpio5_3_out,
    output wire   gpio5_3_enable_vswitch_h,
    output wire   gpio5_3_enable_vdda_h,
    output wire   gpio5_3_vtrip_sel,
    output wire   gpio5_3_ib_mode_sel,
    output wire   gpio5_3_oe_n,
    input  wire  gpio5_3_in_h,
    input  wire  gpio5_3_zero,
    input  wire  gpio5_3_one,
    input  wire  gpio5_4_tie_lo_esd,
    input  wire  gpio5_4_in,
    input  wire  gpio5_4_tie_hi_esd,
    output wire   gpio5_4_enable_vddio,
    output wire   gpio5_4_slow,
    inout  wire  gpio5_4_pad_a_esd_0_h,
    inout  wire  gpio5_4_pad_a_esd_1_h,
    inout  wire  gpio5_4_pad_a_noesd_h,
    output wire   gpio5_4_analog_en,
    output wire   gpio5_4_analog_pol,
    output wire   gpio5_4_inp_dis,
    output wire   gpio5_4_enable_inp_h,
    output wire   gpio5_4_enable_h,
    output wire   gpio5_4_hld_h_n,
    output wire   gpio5_4_analog_sel,
    output wire   [2:0]    gpio5_4_dm,
    output wire   gpio5_4_hld_ovr,
    output wire   gpio5_4_out,
    output wire   gpio5_4_enable_vswitch_h,
    output wire   gpio5_4_enable_vdda_h,
    output wire   gpio5_4_vtrip_sel,
    output wire   gpio5_4_ib_mode_sel,
    output wire   gpio5_4_oe_n,
    input  wire  gpio5_4_in_h,
    input  wire  gpio5_4_zero,
    input  wire  gpio5_4_one,
    input  wire  gpio5_5_tie_lo_esd,
    input  wire  gpio5_5_in,
    input  wire  gpio5_5_tie_hi_esd,
    output wire   gpio5_5_enable_vddio,
    output wire   gpio5_5_slow,
    inout  wire  gpio5_5_pad_a_esd_0_h,
    inout  wire  gpio5_5_pad_a_esd_1_h,
    inout  wire  gpio5_5_pad_a_noesd_h,
    output wire   gpio5_5_analog_en,
    output wire   gpio5_5_analog_pol,
    output wire   gpio5_5_inp_dis,
    output wire   gpio5_5_enable_inp_h,
    output wire   gpio5_5_enable_h,
    output wire   gpio5_5_hld_h_n,
    output wire   gpio5_5_analog_sel,
    output wire   [2:0]    gpio5_5_dm,
    output wire   gpio5_5_hld_ovr,
    output wire   gpio5_5_out,
    output wire   gpio5_5_enable_vswitch_h,
    output wire   gpio5_5_enable_vdda_h,
    output wire   gpio5_5_vtrip_sel,
    output wire   gpio5_5_ib_mode_sel,
    output wire   gpio5_5_oe_n,
    input  wire  gpio5_5_in_h,
    input  wire  gpio5_5_zero,
    input  wire  gpio5_5_one,
    input  wire  gpio5_6_tie_lo_esd,
    input  wire  gpio5_6_in,
    input  wire  gpio5_6_tie_hi_esd,
    output wire   gpio5_6_enable_vddio,
    output wire   gpio5_6_slow,
    inout  wire  gpio5_6_pad_a_esd_0_h,
    inout  wire  gpio5_6_pad_a_esd_1_h,
    inout  wire  gpio5_6_pad_a_noesd_h,
    output wire   gpio5_6_analog_en,
    output wire   gpio5_6_analog_pol,
    output wire   gpio5_6_inp_dis,
    output wire   gpio5_6_enable_inp_h,
    output wire   gpio5_6_enable_h,
    output wire   gpio5_6_hld_h_n,
    output wire   gpio5_6_analog_sel,
    output wire   [2:0]    gpio5_6_dm,
    output wire   gpio5_6_hld_ovr,
    output wire   gpio5_6_out,
    output wire   gpio5_6_enable_vswitch_h,
    output wire   gpio5_6_enable_vdda_h,
    output wire   gpio5_6_vtrip_sel,
    output wire   gpio5_6_ib_mode_sel,
    output wire   gpio5_6_oe_n,
    input  wire  gpio5_6_in_h,
    input  wire  gpio5_6_zero,
    input  wire  gpio5_6_one,
    input  wire  gpio5_7_tie_lo_esd,
    input  wire  gpio5_7_in,
    input  wire  gpio5_7_tie_hi_esd,
    output wire   gpio5_7_enable_vddio,
    output wire   gpio5_7_slow,
    inout  wire  gpio5_7_pad_a_esd_0_h,
    inout  wire  gpio5_7_pad_a_esd_1_h,
    inout  wire  gpio5_7_pad_a_noesd_h,
    output wire   gpio5_7_analog_en,
    output wire   gpio5_7_analog_pol,
    output wire   gpio5_7_inp_dis,
    output wire   gpio5_7_enable_inp_h,
    output wire   gpio5_7_enable_h,
    output wire   gpio5_7_hld_h_n,
    output wire   gpio5_7_analog_sel,
    output wire   [2:0]    gpio5_7_dm,
    output wire   gpio5_7_hld_ovr,
    output wire   gpio5_7_out,
    output wire   gpio5_7_enable_vswitch_h,
    output wire   gpio5_7_enable_vdda_h,
    output wire   gpio5_7_vtrip_sel,
    output wire   gpio5_7_ib_mode_sel,
    output wire   gpio5_7_oe_n,
    input  wire  gpio5_7_in_h,
    input  wire  gpio5_7_zero,
    input  wire  gpio5_7_one,
    input  wire  gpio6_0_tie_hi_esd,
    output wire   [2:0]    gpio6_0_dm,
    output wire   gpio6_0_slow,
    output wire   gpio6_0_oe_n,
    input  wire  gpio6_0_tie_lo_esd,
    output wire   gpio6_0_inp_dis,
    output wire   gpio6_0_enable_vddio,
    output wire   gpio6_0_vtrip_sel,
    output wire   [1:0]    gpio6_0_ib_mode_sel,
    output wire   gpio6_0_out,
    output wire   [1:0]    gpio6_0_slew_ctl,
    output wire   gpio6_0_analog_pol,
    output wire   gpio6_0_analog_sel,
    output wire   gpio6_0_hys_trim,
    output wire   gpio6_0_vinref,
    output wire   gpio6_0_hld_ovr,
    input  wire  gpio6_0_in_h,
    output wire   gpio6_0_enable_h,
    input  wire  gpio6_0_in,
    output wire   gpio6_0_hld_h_n,
    output wire   gpio6_0_enable_vdda_h,
    output wire   gpio6_0_analog_en,
    output wire   gpio6_0_enable_inp_h,
    output wire   gpio6_0_enable_vswitch_h,
    inout  wire  gpio6_0_pad_a_noesd_h,
    inout  wire  gpio6_0_pad_a_esd_0_h,
    inout  wire  gpio6_0_pad_a_esd_1_h,
    input  wire  gpio6_0_zero,
    input  wire  gpio6_0_one,
    input  wire  gpio6_1_tie_hi_esd,
    output wire   [2:0]    gpio6_1_dm,
    output wire   gpio6_1_slow,
    output wire   gpio6_1_oe_n,
    input  wire  gpio6_1_tie_lo_esd,
    output wire   gpio6_1_inp_dis,
    output wire   gpio6_1_enable_vddio,
    output wire   gpio6_1_vtrip_sel,
    output wire   [1:0]    gpio6_1_ib_mode_sel,
    output wire   gpio6_1_out,
    output wire   [1:0]    gpio6_1_slew_ctl,
    output wire   gpio6_1_analog_pol,
    output wire   gpio6_1_analog_sel,
    output wire   gpio6_1_hys_trim,
    output wire   gpio6_1_vinref,
    output wire   gpio6_1_hld_ovr,
    input  wire  gpio6_1_in_h,
    output wire   gpio6_1_enable_h,
    input  wire  gpio6_1_in,
    output wire   gpio6_1_hld_h_n,
    output wire   gpio6_1_enable_vdda_h,
    output wire   gpio6_1_analog_en,
    output wire   gpio6_1_enable_inp_h,
    output wire   gpio6_1_enable_vswitch_h,
    inout  wire  gpio6_1_pad_a_noesd_h,
    inout  wire  gpio6_1_pad_a_esd_0_h,
    inout  wire  gpio6_1_pad_a_esd_1_h,
    input  wire  gpio6_1_zero,
    input  wire  gpio6_1_one,
    input  wire  gpio6_2_tie_hi_esd,
    output wire   [2:0]    gpio6_2_dm,
    output wire   gpio6_2_slow,
    output wire   gpio6_2_oe_n,
    input  wire  gpio6_2_tie_lo_esd,
    output wire   gpio6_2_inp_dis,
    output wire   gpio6_2_enable_vddio,
    output wire   gpio6_2_vtrip_sel,
    output wire   [1:0]    gpio6_2_ib_mode_sel,
    output wire   gpio6_2_out,
    output wire   [1:0]    gpio6_2_slew_ctl,
    output wire   gpio6_2_analog_pol,
    output wire   gpio6_2_analog_sel,
    output wire   gpio6_2_hys_trim,
    output wire   gpio6_2_vinref,
    output wire   gpio6_2_hld_ovr,
    input  wire  gpio6_2_in_h,
    output wire   gpio6_2_enable_h,
    input  wire  gpio6_2_in,
    output wire   gpio6_2_hld_h_n,
    output wire   gpio6_2_enable_vdda_h,
    output wire   gpio6_2_analog_en,
    output wire   gpio6_2_enable_inp_h,
    output wire   gpio6_2_enable_vswitch_h,
    inout  wire  gpio6_2_pad_a_noesd_h,
    inout  wire  gpio6_2_pad_a_esd_0_h,
    inout  wire  gpio6_2_pad_a_esd_1_h,
    input  wire  gpio6_2_zero,
    input  wire  gpio6_2_one,
    input  wire  gpio6_3_tie_hi_esd,
    output wire   [2:0]    gpio6_3_dm,
    output wire   gpio6_3_slow,
    output wire   gpio6_3_oe_n,
    input  wire  gpio6_3_tie_lo_esd,
    output wire   gpio6_3_inp_dis,
    output wire   gpio6_3_enable_vddio,
    output wire   gpio6_3_vtrip_sel,
    output wire   [1:0]    gpio6_3_ib_mode_sel,
    output wire   gpio6_3_out,
    output wire   [1:0]    gpio6_3_slew_ctl,
    output wire   gpio6_3_analog_pol,
    output wire   gpio6_3_analog_sel,
    output wire   gpio6_3_hys_trim,
    output wire   gpio6_3_vinref,
    output wire   gpio6_3_hld_ovr,
    input  wire  gpio6_3_in_h,
    output wire   gpio6_3_enable_h,
    input  wire  gpio6_3_in,
    output wire   gpio6_3_hld_h_n,
    output wire   gpio6_3_enable_vdda_h,
    output wire   gpio6_3_analog_en,
    output wire   gpio6_3_enable_inp_h,
    output wire   gpio6_3_enable_vswitch_h,
    inout  wire  gpio6_3_pad_a_noesd_h,
    inout  wire  gpio6_3_pad_a_esd_0_h,
    inout  wire  gpio6_3_pad_a_esd_1_h,
    input  wire  gpio6_3_zero,
    input  wire  gpio6_3_one,
    output wire   [4:0]    vref_w_ref_sel,
    output wire   vref_w_enable_h,
    output wire   vref_w_hld_h_n,
    output wire   vref_w_vrefgen_en,
    input  wire  gpio6_4_tie_hi_esd,
    output wire   [2:0]    gpio6_4_dm,
    output wire   gpio6_4_slow,
    output wire   gpio6_4_oe_n,
    input  wire  gpio6_4_tie_lo_esd,
    output wire   gpio6_4_inp_dis,
    output wire   gpio6_4_enable_vddio,
    output wire   gpio6_4_vtrip_sel,
    output wire   [1:0]    gpio6_4_ib_mode_sel,
    output wire   gpio6_4_out,
    output wire   [1:0]    gpio6_4_slew_ctl,
    output wire   gpio6_4_analog_pol,
    output wire   gpio6_4_analog_sel,
    output wire   gpio6_4_hys_trim,
    output wire   gpio6_4_vinref,
    output wire   gpio6_4_hld_ovr,
    input  wire  gpio6_4_in_h,
    output wire   gpio6_4_enable_h,
    input  wire  gpio6_4_in,
    output wire   gpio6_4_hld_h_n,
    output wire   gpio6_4_enable_vdda_h,
    output wire   gpio6_4_analog_en,
    output wire   gpio6_4_enable_inp_h,
    output wire   gpio6_4_enable_vswitch_h,
    inout  wire  gpio6_4_pad_a_noesd_h,
    inout  wire  gpio6_4_pad_a_esd_0_h,
    inout  wire  gpio6_4_pad_a_esd_1_h,
    input  wire  gpio6_4_zero,
    input  wire  gpio6_4_one,
    input  wire  gpio6_5_tie_hi_esd,
    output wire   [2:0]    gpio6_5_dm,
    output wire   gpio6_5_slow,
    output wire   gpio6_5_oe_n,
    input  wire  gpio6_5_tie_lo_esd,
    output wire   gpio6_5_inp_dis,
    output wire   gpio6_5_enable_vddio,
    output wire   gpio6_5_vtrip_sel,
    output wire   [1:0]    gpio6_5_ib_mode_sel,
    output wire   gpio6_5_out,
    output wire   [1:0]    gpio6_5_slew_ctl,
    output wire   gpio6_5_analog_pol,
    output wire   gpio6_5_analog_sel,
    output wire   gpio6_5_hys_trim,
    output wire   gpio6_5_vinref,
    output wire   gpio6_5_hld_ovr,
    input  wire  gpio6_5_in_h,
    output wire   gpio6_5_enable_h,
    input  wire  gpio6_5_in,
    output wire   gpio6_5_hld_h_n,
    output wire   gpio6_5_enable_vdda_h,
    output wire   gpio6_5_analog_en,
    output wire   gpio6_5_enable_inp_h,
    output wire   gpio6_5_enable_vswitch_h,
    inout  wire  gpio6_5_pad_a_noesd_h,
    inout  wire  gpio6_5_pad_a_esd_0_h,
    inout  wire  gpio6_5_pad_a_esd_1_h,
    input  wire  gpio6_5_zero,
    input  wire  gpio6_5_one,
    input  wire  gpio6_6_tie_hi_esd,
    output wire   [2:0]    gpio6_6_dm,
    output wire   gpio6_6_slow,
    output wire   gpio6_6_oe_n,
    input  wire  gpio6_6_tie_lo_esd,
    output wire   gpio6_6_inp_dis,
    output wire   gpio6_6_enable_vddio,
    output wire   gpio6_6_vtrip_sel,
    output wire   [1:0]    gpio6_6_ib_mode_sel,
    output wire   gpio6_6_out,
    output wire   [1:0]    gpio6_6_slew_ctl,
    output wire   gpio6_6_analog_pol,
    output wire   gpio6_6_analog_sel,
    output wire   gpio6_6_hys_trim,
    output wire   gpio6_6_vinref,
    output wire   gpio6_6_hld_ovr,
    input  wire  gpio6_6_in_h,
    output wire   gpio6_6_enable_h,
    input  wire  gpio6_6_in,
    output wire   gpio6_6_hld_h_n,
    output wire   gpio6_6_enable_vdda_h,
    output wire   gpio6_6_analog_en,
    output wire   gpio6_6_enable_inp_h,
    output wire   gpio6_6_enable_vswitch_h,
    inout  wire  gpio6_6_pad_a_noesd_h,
    inout  wire  gpio6_6_pad_a_esd_0_h,
    inout  wire  gpio6_6_pad_a_esd_1_h,
    input  wire  gpio6_6_zero,
    input  wire  gpio6_6_one,
    input  wire  gpio6_7_tie_hi_esd,
    output wire   [2:0]    gpio6_7_dm,
    output wire   gpio6_7_slow,
    output wire   gpio6_7_oe_n,
    input  wire  gpio6_7_tie_lo_esd,
    output wire   gpio6_7_inp_dis,
    output wire   gpio6_7_enable_vddio,
    output wire   gpio6_7_vtrip_sel,
    output wire   [1:0]    gpio6_7_ib_mode_sel,
    output wire   gpio6_7_out,
    output wire   [1:0]    gpio6_7_slew_ctl,
    output wire   gpio6_7_analog_pol,
    output wire   gpio6_7_analog_sel,
    output wire   gpio6_7_hys_trim,
    output wire   gpio6_7_vinref,
    output wire   gpio6_7_hld_ovr,
    input  wire  gpio6_7_in_h,
    output wire   gpio6_7_enable_h,
    input  wire  gpio6_7_in,
    output wire   gpio6_7_hld_h_n,
    output wire   gpio6_7_enable_vdda_h,
    output wire   gpio6_7_analog_en,
    output wire   gpio6_7_enable_inp_h,
    output wire   gpio6_7_enable_vswitch_h,
    inout  wire  gpio6_7_pad_a_noesd_h,
    inout  wire  gpio6_7_pad_a_esd_0_h,
    inout  wire  gpio6_7_pad_a_esd_1_h,
    input  wire  gpio6_7_zero,
    input  wire  gpio6_7_one,
    input  wire  gpio7_0_tie_lo_esd,
    input  wire  gpio7_0_in,
    input  wire  gpio7_0_tie_hi_esd,
    output wire   gpio7_0_enable_vddio,
    output wire   gpio7_0_slow,
    inout  wire  gpio7_0_pad_a_esd_0_h,
    inout  wire  gpio7_0_pad_a_esd_1_h,
    inout  wire  gpio7_0_pad_a_noesd_h,
    output wire   gpio7_0_analog_en,
    output wire   gpio7_0_analog_pol,
    output wire   gpio7_0_inp_dis,
    output wire   gpio7_0_enable_inp_h,
    output wire   gpio7_0_enable_h,
    output wire   gpio7_0_hld_h_n,
    output wire   gpio7_0_analog_sel,
    output wire   [2:0]    gpio7_0_dm,
    output wire   gpio7_0_hld_ovr,
    output wire   gpio7_0_out,
    output wire   gpio7_0_enable_vswitch_h,
    output wire   gpio7_0_enable_vdda_h,
    output wire   gpio7_0_vtrip_sel,
    output wire   gpio7_0_ib_mode_sel,
    output wire   gpio7_0_oe_n,
    input  wire  gpio7_0_in_h,
    input  wire  gpio7_0_zero,
    input  wire  gpio7_0_one,
    input  wire  gpio7_1_tie_lo_esd,
    input  wire  gpio7_1_in,
    input  wire  gpio7_1_tie_hi_esd,
    output wire   gpio7_1_enable_vddio,
    output wire   gpio7_1_slow,
    inout  wire  gpio7_1_pad_a_esd_0_h,
    inout  wire  gpio7_1_pad_a_esd_1_h,
    inout  wire  gpio7_1_pad_a_noesd_h,
    output wire   gpio7_1_analog_en,
    output wire   gpio7_1_analog_pol,
    output wire   gpio7_1_inp_dis,
    output wire   gpio7_1_enable_inp_h,
    output wire   gpio7_1_enable_h,
    output wire   gpio7_1_hld_h_n,
    output wire   gpio7_1_analog_sel,
    output wire   [2:0]    gpio7_1_dm,
    output wire   gpio7_1_hld_ovr,
    output wire   gpio7_1_out,
    output wire   gpio7_1_enable_vswitch_h,
    output wire   gpio7_1_enable_vdda_h,
    output wire   gpio7_1_vtrip_sel,
    output wire   gpio7_1_ib_mode_sel,
    output wire   gpio7_1_oe_n,
    input  wire  gpio7_1_in_h,
    input  wire  gpio7_1_zero,
    input  wire  gpio7_1_one,
    input  wire  gpio7_2_tie_lo_esd,
    input  wire  gpio7_2_in,
    input  wire  gpio7_2_tie_hi_esd,
    output wire   gpio7_2_enable_vddio,
    output wire   gpio7_2_slow,
    inout  wire  gpio7_2_pad_a_esd_0_h,
    inout  wire  gpio7_2_pad_a_esd_1_h,
    inout  wire  gpio7_2_pad_a_noesd_h,
    output wire   gpio7_2_analog_en,
    output wire   gpio7_2_analog_pol,
    output wire   gpio7_2_inp_dis,
    output wire   gpio7_2_enable_inp_h,
    output wire   gpio7_2_enable_h,
    output wire   gpio7_2_hld_h_n,
    output wire   gpio7_2_analog_sel,
    output wire   [2:0]    gpio7_2_dm,
    output wire   gpio7_2_hld_ovr,
    output wire   gpio7_2_out,
    output wire   gpio7_2_enable_vswitch_h,
    output wire   gpio7_2_enable_vdda_h,
    output wire   gpio7_2_vtrip_sel,
    output wire   gpio7_2_ib_mode_sel,
    output wire   gpio7_2_oe_n,
    input  wire  gpio7_2_in_h,
    input  wire  gpio7_2_zero,
    input  wire  gpio7_2_one,
    input  wire  gpio7_3_tie_lo_esd,
    input  wire  gpio7_3_in,
    input  wire  gpio7_3_tie_hi_esd,
    output wire   gpio7_3_enable_vddio,
    output wire   gpio7_3_slow,
    inout  wire  gpio7_3_pad_a_esd_0_h,
    inout  wire  gpio7_3_pad_a_esd_1_h,
    inout  wire  gpio7_3_pad_a_noesd_h,
    output wire   gpio7_3_analog_en,
    output wire   gpio7_3_analog_pol,
    output wire   gpio7_3_inp_dis,
    output wire   gpio7_3_enable_inp_h,
    output wire   gpio7_3_enable_h,
    output wire   gpio7_3_hld_h_n,
    output wire   gpio7_3_analog_sel,
    output wire   [2:0]    gpio7_3_dm,
    output wire   gpio7_3_hld_ovr,
    output wire   gpio7_3_out,
    output wire   gpio7_3_enable_vswitch_h,
    output wire   gpio7_3_enable_vdda_h,
    output wire   gpio7_3_vtrip_sel,
    output wire   gpio7_3_ib_mode_sel,
    output wire   gpio7_3_oe_n,
    input  wire  gpio7_3_in_h,
    input  wire  gpio7_3_zero,
    input  wire  gpio7_3_one,
    input  wire  gpio7_4_tie_lo_esd,
    input  wire  gpio7_4_in,
    input  wire  gpio7_4_tie_hi_esd,
    output wire   gpio7_4_enable_vddio,
    output wire   gpio7_4_slow,
    inout  wire  gpio7_4_pad_a_esd_0_h,
    inout  wire  gpio7_4_pad_a_esd_1_h,
    inout  wire  gpio7_4_pad_a_noesd_h,
    output wire   gpio7_4_analog_en,
    output wire   gpio7_4_analog_pol,
    output wire   gpio7_4_inp_dis,
    output wire   gpio7_4_enable_inp_h,
    output wire   gpio7_4_enable_h,
    output wire   gpio7_4_hld_h_n,
    output wire   gpio7_4_analog_sel,
    output wire   [2:0]    gpio7_4_dm,
    output wire   gpio7_4_hld_ovr,
    output wire   gpio7_4_out,
    output wire   gpio7_4_enable_vswitch_h,
    output wire   gpio7_4_enable_vdda_h,
    output wire   gpio7_4_vtrip_sel,
    output wire   gpio7_4_ib_mode_sel,
    output wire   gpio7_4_oe_n,
    input  wire  gpio7_4_in_h,
    input  wire  gpio7_4_zero,
    input  wire  gpio7_4_one,
    input  wire  gpio7_5_tie_lo_esd,
    input  wire  gpio7_5_in,
    input  wire  gpio7_5_tie_hi_esd,
    output wire   gpio7_5_enable_vddio,
    output wire   gpio7_5_slow,
    inout  wire  gpio7_5_pad_a_esd_0_h,
    inout  wire  gpio7_5_pad_a_esd_1_h,
    inout  wire  gpio7_5_pad_a_noesd_h,
    output wire   gpio7_5_analog_en,
    output wire   gpio7_5_analog_pol,
    output wire   gpio7_5_inp_dis,
    output wire   gpio7_5_enable_inp_h,
    output wire   gpio7_5_enable_h,
    output wire   gpio7_5_hld_h_n,
    output wire   gpio7_5_analog_sel,
    output wire   [2:0]    gpio7_5_dm,
    output wire   gpio7_5_hld_ovr,
    output wire   gpio7_5_out,
    output wire   gpio7_5_enable_vswitch_h,
    output wire   gpio7_5_enable_vdda_h,
    output wire   gpio7_5_vtrip_sel,
    output wire   gpio7_5_ib_mode_sel,
    output wire   gpio7_5_oe_n,
    input  wire  gpio7_5_in_h,
    input  wire  gpio7_5_zero,
    input  wire  gpio7_5_one,
    input  wire  gpio7_6_tie_lo_esd,
    input  wire  gpio7_6_in,
    input  wire  gpio7_6_tie_hi_esd,
    output wire   gpio7_6_enable_vddio,
    output wire   gpio7_6_slow,
    inout  wire  gpio7_6_pad_a_esd_0_h,
    inout  wire  gpio7_6_pad_a_esd_1_h,
    inout  wire  gpio7_6_pad_a_noesd_h,
    output wire   gpio7_6_analog_en,
    output wire   gpio7_6_analog_pol,
    output wire   gpio7_6_inp_dis,
    output wire   gpio7_6_enable_inp_h,
    output wire   gpio7_6_enable_h,
    output wire   gpio7_6_hld_h_n,
    output wire   gpio7_6_analog_sel,
    output wire   [2:0]    gpio7_6_dm,
    output wire   gpio7_6_hld_ovr,
    output wire   gpio7_6_out,
    output wire   gpio7_6_enable_vswitch_h,
    output wire   gpio7_6_enable_vdda_h,
    output wire   gpio7_6_vtrip_sel,
    output wire   gpio7_6_ib_mode_sel,
    output wire   gpio7_6_oe_n,
    input  wire  gpio7_6_in_h,
    input  wire  gpio7_6_zero,
    input  wire  gpio7_6_one,
    input  wire  gpio7_7_tie_lo_esd,
    input  wire  gpio7_7_in,
    input  wire  gpio7_7_tie_hi_esd,
    output wire   gpio7_7_enable_vddio,
    output wire   gpio7_7_slow,
    inout  wire  gpio7_7_pad_a_esd_0_h,
    inout  wire  gpio7_7_pad_a_esd_1_h,
    inout  wire  gpio7_7_pad_a_noesd_h,
    output wire   gpio7_7_analog_en,
    output wire   gpio7_7_analog_pol,
    output wire   gpio7_7_inp_dis,
    output wire   gpio7_7_enable_inp_h,
    output wire   gpio7_7_enable_h,
    output wire   gpio7_7_hld_h_n,
    output wire   gpio7_7_analog_sel,
    output wire   [2:0]    gpio7_7_dm,
    output wire   gpio7_7_hld_ovr,
    output wire   gpio7_7_out,
    output wire   gpio7_7_enable_vswitch_h,
    output wire   gpio7_7_enable_vdda_h,
    output wire   gpio7_7_vtrip_sel,
    output wire   gpio7_7_ib_mode_sel,
    output wire   gpio7_7_oe_n,
    input  wire  gpio7_7_in_h,
    input  wire  gpio7_7_zero,
    input  wire  gpio7_7_one,
    output wire   muxsplit_sw_hld_vdda_h_n,
    output wire   muxsplit_sw_enable_vdda_h,
    output wire   muxsplit_sw_switch_aa_sl,
    output wire   muxsplit_sw_switch_aa_s0,
    output wire   muxsplit_sw_switch_bb_s0,
    output wire   muxsplit_sw_switch_bb_sl,
    output wire   muxsplit_sw_switch_bb_sr,
    output wire   muxsplit_sw_switch_aa_sr,
    inout  wire   amuxbus_a_n,
    inout  wire   amuxbus_b_n,
    inout  wire   vcap_w_cpos,
    inout  wire   vref_e_vinref,
    inout  wire   vcap_e_cpos,
    inout  wire   vref_w_vinref
);

  wire [`MPRJ_IO_PADS-1:0] mprj_io_in;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_out;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_oeb;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_inp_dis;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_ib_mode_sel;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_vtrip_sel;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_slow_sel;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_holdover;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_analog_en;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_analog_sel;
  wire [`MPRJ_IO_PADS-1:0] mprj_io_analog_pol;
  wire [`MPRJ_IO_PADS*3-1:0] mprj_io_dm;
  wire [`MPRJ_IO_PADS*2-1:0] mprj_slew_ctl;
  wire [`MPRJ_IO_PADS-1:0] mprj_hys_trim;

  wire [`MPRJ_IO_PADS_1-1:0] gpio_serial_link_1;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_serial_link_2;
  wire mprj_io_loader_resetn;
  wire mprj_io_loader_clock;
  wire mprj_io_loader_strobe;
  wire mprj_io_loader_data_1;       /* user1 side serial loader */
  wire mprj_io_loader_data_2;       /* user2 side serial loader */

  wire [`MPRJ_IO_PADS_1-1:0] gpio_serial_link_1_shifted;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_serial_link_2_shifted;

  assign gpio_serial_link_1_shifted = {
    gpio_serial_link_1[`MPRJ_IO_PADS_1-2:0], mprj_io_loader_data_1
  };
  // Note that serial_link_2 is backwards compared to serial_link_1, so it
  // shifts in the other direction.
  assign gpio_serial_link_2_shifted = {
    mprj_io_loader_data_2, gpio_serial_link_2[`MPRJ_IO_PADS_2-1:1]
  };

  // Propagating clock and reset to mitigate timing and fanout issues
  wire [`MPRJ_IO_PADS_1-1:0] gpio_clock_1;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_clock_2;
  wire [`MPRJ_IO_PADS_1-1:0] gpio_resetn_1;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_resetn_2;
  wire [`MPRJ_IO_PADS_1-1:0] gpio_load_1;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_load_2;
  wire [`MPRJ_IO_PADS_1-1:0] gpio_clock_1_shifted;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_clock_2_shifted;
  wire [`MPRJ_IO_PADS_1-1:0] gpio_resetn_1_shifted;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_resetn_2_shifted;
  wire [`MPRJ_IO_PADS_1-1:0] gpio_load_1_shifted;
  wire [`MPRJ_IO_PADS_2-1:0] gpio_load_2_shifted;

  assign gpio_clock_1_shifted  = {gpio_clock_1[`MPRJ_IO_PADS_1-2:0], mprj_io_loader_clock};
  assign gpio_clock_2_shifted  = {mprj_io_loader_clock, gpio_clock_2[`MPRJ_IO_PADS_2-1:1]};
  assign gpio_resetn_1_shifted = {gpio_resetn_1[`MPRJ_IO_PADS_1-2:0], mprj_io_loader_resetn};
  assign gpio_resetn_2_shifted = {mprj_io_loader_resetn, gpio_resetn_2[`MPRJ_IO_PADS_2-1:1]};
  assign gpio_load_1_shifted   = {gpio_load_1[`MPRJ_IO_PADS_1-2:0], mprj_io_loader_strobe};
  assign gpio_load_2_shifted   = {mprj_io_loader_strobe, gpio_load_2[`MPRJ_IO_PADS_2-1:1]};

  // User' area signals
    wire         user_HCLK;
    wire         user_HRESETn;
    wire         user_HSEL;
    wire [31:0]  user_HADDR;
    wire [31:0]  user_HWDATA;
    wire         user_HREADY;
    wire         user_HWRITE;
    wire [1:0]   user_HTRANS;
    wire [2:0]   user_HSIZE;
    wire [31:0]  user_HRDATA;
    wire         user_HREADYOUT;

    wire         user_HSEL_core;
    wire [31:0]  user_HADDR_core;
    wire [31:0]  user_HWDATA_core;
    wire         user_HREADY_core;
    wire         user_HWRITE_core;
    wire [1:0]   user_HTRANS_core;
    wire [2:0]   user_HSIZE_core;
    wire [31:0]  user_HRDATA_core;
    wire         user_HREADYOUT_core;
    wire         user_ahb_ena;

    // user project IOs
    wire [7:0] user_gpio0_in;
    wire [7:0] user_gpio1_in;
    wire [7:0] user_gpio2_in;
    wire [7:0] user_gpio3_in;
    wire [7:0] user_gpio4_in;
    wire [7:0] user_gpio5_in;
    wire [7:0] user_gpio6_in;
    wire [7:0] user_gpio7_in;

    wire [7:0] user_gpio0_out;
    wire [7:0] user_gpio1_out;
    wire [7:0] user_gpio2_out;
    wire [7:0] user_gpio3_out;
    wire [7:0] user_gpio4_out;
    wire [7:0] user_gpio5_out;
    wire [7:0] user_gpio6_out;
    wire [7:0] user_gpio7_out;

    wire [7:0] user_gpio0_oeb;
    wire [7:0] user_gpio1_oeb;
    wire [7:0] user_gpio2_oeb;
    wire [7:0] user_gpio3_oeb;
    wire [7:0] user_gpio4_oeb;
    wire [7:0] user_gpio5_oeb;
    wire [7:0] user_gpio6_oeb;
    wire [7:0] user_gpio7_oeb;

    wire [1 :0] user_sio_in;
    wire [1 :0] user_sio_out;
    wire [1 :0] user_sio_oeb;

    wire [66:0]  user_gpio_in;
    wire [66:0]  user_gpio_out;
    wire [66:0]  user_gpio_oeb;
    wire [15:0]  user_irqs;
    wire [15:0]  user_irqs_core;
    wire [15:0]  user_irqs_ena;

    assign {user_sio_in, user_gpio7_in, user_gpio6_in, user_gpio5_in, user_gpio4_in,
        user_gpio3_in, user_gpio2_in, user_gpio1_in, user_gpio0_in} = user_gpio_in;
    assign user_gpio_out = {user_sio_out, user_gpio7_out, user_gpio6_out, user_gpio5_out,
        user_gpio4_out, user_gpio3_out, user_gpio2_out, user_gpio1_out, user_gpio0_out};
    assign user_gpio_oeb = {user_sio_oeb, user_gpio7_oeb, user_gpio6_oeb, user_gpio5_oeb,
        user_gpio4_oeb, user_gpio3_oeb, user_gpio2_oeb, user_gpio1_oeb, user_gpio0_oeb};

    // RAM_0
    wire [31:0]      SRAMRDATA_0;         // SRAM Read Data
    wire             SRAMR_WB_0;           // SRAM write enable (active high)
    wire [31:0]      SRAMWDATA_0;         // SRAM write data
    wire             SRAMEN_0;            // SRAM Chip Select (active high)
    wire [10:0]      SRAMADDR_0;          // SRAM address
    wire             SRAMCLK_0;          // SRAM clock
    wire [31:0]      SRAMBEN_0;          // bit enable

    // RAM_1
    wire [31:0]      SRAMRDATA_1;         // SRAM Read Data
    wire             SRAMR_WB_1;           // SRAM write enable (active high)
    wire [31:0]      SRAMWDATA_1;         // SRAM write data
    wire             SRAMEN_1;            // SRAM Chip Select (active high)
    wire [10:0]      SRAMADDR_1;          // SRAM address
    wire             SRAMCLK_1;          // SRAM clock
    wire [31:0]      SRAMBEN_1;          // bit enable

  wire HCLK;
  wire HRESETn;

  // negative reset
  wire por_n;

  // SPI master interface to/from SoC
  wire hk_spi_sdo;
  wire hk_spi_sdi;
  wire hk_spi_csb;
  wire hk_spi_sck;

  // USB CDC
  wire            usb_dp_rx;
  wire            usb_dn_rx;
  wire            usb_dp_tx;
  wire            usb_dn_tx;
  wire            usb_tx_en;

  // Pin MUX Ports - GPIO
  wire [47:0] pin_mux_io_in, pin_mux_io_out, pin_mux_io_oeb;

    // GPIO port G
    wire [7:0]      gpioG_io_in;
    wire [7:0]      gpioG_io_out;
    wire [7:0]      gpioG_io_oe;

    // GPIO port I
    wire            gpioH_io_in;
    wire            gpioH_io_out;
    wire            gpioH_io_oe;

    // GPIO port J
    wire [1:0]      gpioI_io_in;
    wire [1:0]      gpioI_io_out;
    wire [1:0]      gpioI_io_oe;


  // CLK sub-system Signals
  wire xclk, xrst_n;

    wire [1:0]    porb_h;    // power-on reset, sense inverted, 3.3V domain
    wire     porb_l;    // power-on reset, sense inverted, 1.8V domain
    wire     por_l;       // power-on reset, noninverted, 1.8V domain
    assign por_n = porb_l;

    wire rcosc_500k;
    wire rcosc_16m;
    wire hsxo;
    wire lsxo;
    wire rcosc_500k_en;
    wire rcosc_16m_en;
    wire hsxo_en;
    wire lsxo_en;
    wire lsxo_standby;
    wire hsxo_standby;


  // Flash signals
  wire            flash_sck;
  wire            flash_cen;
  wire [3:0]      flash_din;
    wire [3:0]      flash_dout;
    wire [3:0]      flash_douten;


    //------------------------------------------------------------
    // This value is uniquely defined for each user project.
    //------------------------------------------------------------
    parameter USER_PROJECT_ID = 32'h00000000;

    //------------------------------------------------------------
    // This value is uniquely defined for each product.
    //------------------------------------------------------------
    parameter PRODUCT_ID = 8'h42;


  // Mask revision/User project ID/Product ID
  wire [31:0]           mask_rev_in;
  wire [7:0]           product_id;
  project_id_rom_32bit #(
    .USER_PROJECT_ID(USER_PROJECT_ID)
  ) project_id_value (
`ifdef USE_POWER_PINS
      .VPWR(vccd0),
      .VGND(vssd0),
`endif
      .gpio_defaults(mask_rev_in)
  );

  product_id_rom_8bit #(
    .PRODUCT_ID(PRODUCT_ID)
  ) product_id_value (
`ifdef USE_POWER_PINS
      .VPWR(vccd0),
      .VGND(vssd0),
`endif
      .gpio_defaults(product_id)
  );

   wire         adc0_cmp;
   wire         adc0_hold;
   wire [11:0]   adc0_data;
   wire         adc0_en;
   wire         adc0_dac_rst;

   wire         adc1_cmp;
   wire         adc1_hold;
   wire [11:0]   adc1_data;
   wire         adc1_en;
   wire         adc1_dac_rst;

   wire         ds_o;
   wire         ds_n_o;


   wire left_instramp_ena;
   wire [4:0] left_instramp_G1;
   wire [4:0] left_instramp_G2;
   wire left_hgbw_opamp_ena;
   wire left_lp_opamp_ena;
   wire [7:0] left_rheostat1_b;
   wire [7:0] left_rheostat2_b;
   wire right_instramp_ena;
   wire [4:0] right_instramp_G1;
   wire [4:0] right_instramp_G2;
   wire right_hgbw_opamp_ena;
   wire right_lp_opamp_ena;
   wire [7:0] right_rheostat1_b;
   wire [7:0] right_rheostat2_b;
   wire  comp_ena;
   wire [5:0] comp_trim;
   wire [1:0] comp_hyst;
   wire  comp_out;
   wire  ulpcomp_ena;
   wire ulpcomp_clk;
   wire  ulpcomp_out;
   wire  bandgap_ena;
   wire [15:0] bandgap_trim;
   wire  bandgap_sel;
   wire  ldo_ena;
   wire ibias_ena;
   wire [23:0] ibias_src_ena;
   wire [3:0] ibias_snk_ena;
   wire ibias_ref_select;
   wire ibias_lsxo;
   wire ibias_hsxo;
   wire overvoltage_ena;
   wire [3:0] overvoltage_trim;
   wire ldo_ref_sel;
   wire overvoltage_out;
   wire [11:0] idac_value;
   wire  idac_ena;
   wire tempsense_ena;
   wire tempsense_sel;
   wire vdda1_pwr_good;
   wire vccd1_pwr_good;
   wire vdda2_pwr_good;
   wire vccd2_pwr_good;
   wire rdac0_ena;
   wire [11:0] rdac0_value;
   wire rdac1_ena;
   wire [11:0] rdac1_value;

   // Brownout detector
   wire brownout_ena;
   wire [2:0] brownout_vtrip;
   wire [2:0] brownout_otrip;
   wire brownout_isrc_sel;
   wire brownout_oneshot;
   wire brownout_rc_ena;
   wire brownout_rc_dis;

   wire brownout_vunder;
   wire brownout_timeout;
   wire brownout_filt;
   wire brownout_unfilt;

   wire [1:0] ibias_test_to_gpio1_2;
   wire [1:0] vbg_test_to_gpio1_1;
   wire [1:0] idac_to_gpio1_3;
   wire [1:0] idac_to_gpio1_2;
   wire [1:0] adc_refh_to_gpio6_6;
   wire [1:0] dac_refh_to_gpio1_1;
   wire [1:0] adc_refl_to_gpio6_7;
   wire [1:0] dac_refl_to_gpio1_0;
   wire [1:0] right_lp_opamp_to_ulpcomp_p;
   wire [1:0] right_lp_opamp_to_comp_p;
   wire [1:0] right_lp_opamp_to_adc0;
   wire [1:0] right_lp_opamp_to_gpio4_7;
   wire [1:0] right_lp_opamp_to_gpio4_3;
   wire [1:0] right_lp_opamp_to_analog1;
   wire [1:0] right_lp_opamp_to_amuxbusB;
   wire [1:0] right_lp_opamp_to_gpio3_7;
   wire [1:0] right_lp_opamp_to_gpio3_3;
   wire [1:0] right_hgbw_opamp_to_ulpcomp_n;
   wire [1:0] right_hgbw_opamp_to_comp_n;
   wire [1:0] right_hgbw_opamp_to_adc1;
   wire [1:0] right_hgbw_opamp_to_gpio4_6;
   wire [1:0] right_hgbw_opamp_to_gpio4_2;
   wire [1:0] right_hgbw_opamp_to_analog0;
   wire [1:0] right_hgbw_opamp_to_amuxbusA;
   wire [1:0] right_hgbw_opamp_to_gpio3_6;
   wire [1:0] right_hgbw_opamp_to_gpio3_2;
   wire [1:0] left_hgbw_opamp_to_ulpcomp_p;
   wire [1:0] left_hgbw_opamp_to_comp_p;
   wire [1:0] left_hgbw_opamp_to_adc0;
   wire [1:0] left_hgbw_opamp_to_gpio4_5;
   wire [1:0] left_hgbw_opamp_to_gpio4_1;
   wire [1:0] left_hgbw_opamp_to_analog1;
   wire [1:0] left_hgbw_opamp_to_amuxbusB;
   wire [1:0] left_hgbw_opamp_to_gpio3_5;
   wire [1:0] left_hgbw_opamp_to_gpio3_1;
   wire [1:0] left_lp_opamp_to_ulpcomp_n;
   wire [1:0] left_lp_opamp_to_comp_n;
   wire [1:0] left_lp_opamp_to_adc1;
   wire [1:0] left_lp_opamp_to_gpio4_0;
   wire [1:0] left_lp_opamp_to_analog0;
   wire [1:0] left_lp_opamp_to_amuxbusA;
   wire [1:0] left_lp_opamp_to_gpio3_4;
   wire right_lp_opamp_p_to_dac0;
   wire right_lp_opamp_p_to_analog0;
   wire right_lp_opamp_p_to_amuxbusA;
   wire right_lp_opamp_p_to_rheostat_out;
   wire right_lp_opamp_p_to_sio0;
   wire right_lp_opamp_p_to_tempsense;
   wire right_lp_opamp_p_to_left_vref;
   wire right_lp_opamp_p_to_voutref;
   wire [1:0] right_lp_opamp_p_to_gpio2_5;
   wire right_lp_opamp_n_to_dac1;
   wire right_lp_opamp_n_to_analog1;
   wire right_lp_opamp_n_to_amuxbusB;
   wire right_lp_opamp_n_to_rheostat_out;
   wire right_lp_opamp_n_to_rheostat_tap;
   wire right_lp_opamp_n_to_sio1;
   wire right_lp_opamp_n_to_vbgtc;
   wire right_lp_opamp_n_to_right_vref;
   wire right_lp_opamp_n_to_vinref;
   wire [1:0] right_lp_opamp_n_to_gpio2_4;
   wire [1:0] right_hgbw_opamp_p_to_gpio5_0;
   wire right_hgbw_opamp_p_to_dac0;
   wire right_hgbw_opamp_p_to_analog0;
   wire right_hgbw_opamp_p_to_amuxbusA;
   wire right_hgbw_opamp_p_to_rheostat_out;
   wire right_hgbw_opamp_p_to_sio0;
   wire right_hgbw_opamp_p_to_left_vref;
   wire right_hgbw_opamp_p_to_voutref;
   wire [1:0] right_hgbw_opamp_p_to_gpio2_3;
   wire [1:0] right_hgbw_opamp_n_to_gpio5_1;
   wire right_hgbw_opamp_n_to_dac1;
   wire right_hgbw_opamp_n_to_analog1;
   wire right_hgbw_opamp_n_to_amuxbusB;
   wire right_hgbw_opamp_n_to_rheostat_out;
   wire right_hgbw_opamp_n_to_rheostat_tap;
   wire right_hgbw_opamp_n_to_sio1;
   wire right_hgbw_opamp_n_to_vbgsc;
   wire right_hgbw_opamp_n_to_right_vref;
   wire right_hgbw_opamp_n_to_vinref;
   wire [1:0] right_hgbw_opamp_n_to_gpio2_2;
   wire [1:0] left_hgbw_opamp_p_to_gpio5_2;
   wire left_hgbw_opamp_p_to_dac0;
   wire left_hgbw_opamp_p_to_analog0;
   wire left_hgbw_opamp_p_to_amuxbusA;
   wire left_hgbw_opamp_p_to_rheostat_out;
   wire left_hgbw_opamp_p_to_sio0;
   wire left_hgbw_opamp_p_to_tempsense;
   wire left_hgbw_opamp_p_to_left_vref;
   wire left_hgbw_opamp_p_to_voutref;
   wire [1:0] left_hgbw_opamp_p_to_gpio2_1;
   wire [1:0] left_hgbw_opamp_n_to_gpio5_3;
   wire left_hgbw_opamp_n_to_dac1;
   wire left_hgbw_opamp_n_to_analog1;
   wire left_hgbw_opamp_n_to_amuxbusB;
   wire left_hgbw_opamp_n_to_rheostat_out;
   wire left_hgbw_opamp_n_to_rheostat_tap;
   wire left_hgbw_opamp_n_to_sio1;
   wire left_hgbw_opamp_n_to_vbgtc;
   wire left_hgbw_opamp_n_to_right_vref;
   wire left_hgbw_opamp_n_to_vinref;
   wire [1:0] left_hgbw_opamp_n_to_gpio2_0;
   wire [1:0] left_lp_opamp_p_to_gpio5_4;
   wire left_lp_opamp_p_to_dac0;
   wire left_lp_opamp_p_to_analog0;
   wire left_lp_opamp_p_to_amuxbusA;
   wire left_lp_opamp_p_to_rheostat_out;
   wire left_lp_opamp_p_to_sio0;
   wire left_lp_opamp_p_to_left_vref;
   wire left_lp_opamp_p_to_voutref;
   wire [1:0] left_lp_opamp_n_to_gpio5_5;
   wire left_lp_opamp_n_to_dac1;
   wire left_lp_opamp_n_to_analog1;
   wire left_lp_opamp_n_to_amuxbusB;
   wire left_lp_opamp_n_to_rheostat_out;
   wire left_lp_opamp_n_to_rheostat_tap;
   wire left_lp_opamp_n_to_sio1;
   wire left_lp_opamp_n_to_vbgsc;
   wire left_lp_opamp_n_to_right_vref;
   wire left_lp_opamp_n_to_vinref;
   wire [1:0] left_instramp_to_ulpcomp_p;
   wire [1:0] left_instramp_to_comp_p;
   wire [1:0] left_instramp_to_adc0;
   wire [1:0] left_instramp_to_gpio4_4;
   wire [1:0] left_instramp_to_analog1;
   wire [1:0] left_instramp_to_amuxbusB;
   wire [1:0] right_instramp_to_ulpcomp_n;
   wire [1:0] right_instramp_to_comp_n;
   wire [1:0] right_instramp_to_adc1;
   wire [1:0] right_instramp_to_analog0;
   wire [1:0] right_instramp_to_amuxbusA;
   wire [1:0] right_instramp_to_gpio3_0;
   wire [1:0] left_instramp_n_to_gpio5_7;
   wire left_instramp_n_to_analog1;
   wire left_instramp_n_to_amuxbusB;
   wire left_instramp_n_to_sio1;
   wire left_instramp_n_to_right_vref;
   wire left_instramp_n_to_vinref;
   wire [1:0] left_instramp_p_to_gpio5_6;
   wire left_instramp_p_to_analog0;
   wire left_instramp_p_to_amuxbusA;
   wire left_instramp_p_to_sio0;
   wire left_instramp_p_to_tempsense;
   wire left_instramp_p_to_left_vref;
   wire left_instramp_p_to_voutref;
   wire right_instramp_n_to_analog1;
   wire right_instramp_n_to_amuxbusB;
   wire right_instramp_n_to_sio1;
   wire right_instramp_n_to_right_vref;
   wire right_instramp_n_to_vinref;
   wire [1:0] right_instramp_n_to_gpio2_6;
   wire right_instramp_p_to_analog0;
   wire right_instramp_p_to_amuxbusA;
   wire right_instramp_p_to_sio0;
   wire right_instramp_p_to_tempsense;
   wire right_instramp_p_to_left_vref;
   wire right_instramp_p_to_voutref;
   wire [1:0] right_instramp_p_to_gpio2_7;
   wire ulpcomp_p_to_dac0;
   wire ulpcomp_p_to_analog1;
   wire ulpcomp_p_to_sio0;
   wire ulpcomp_p_to_vbgtc;
   wire ulpcomp_p_to_tempsense;
   wire ulpcomp_p_to_left_vref;
   wire ulpcomp_p_to_voutref;
   wire [1:0] ulpcomp_p_to_gpio6_0;
   wire [1:0] ulpcomp_p_to_gpio1_7;
   wire ulpcomp_n_to_dac1;
   wire ulpcomp_n_to_analog0;
   wire ulpcomp_n_to_sio1;
   wire ulpcomp_n_to_vbgsc;
   wire ulpcomp_n_to_right_vref;
   wire ulpcomp_n_to_vinref;
   wire [1:0] ulpcomp_n_to_gpio6_1;
   wire [1:0] ulpcomp_n_to_gpio1_6;
   wire comp_p_to_dac0;
   wire comp_p_to_analog1;
   wire comp_p_to_sio0;
   wire comp_p_to_vbgtc;
   wire comp_p_to_tempsense;
   wire comp_p_to_left_vref;
   wire comp_p_to_voutref;
   wire [1:0] comp_p_to_gpio6_2;
   wire [1:0] comp_p_to_gpio1_5;
   wire comp_n_to_dac1;
   wire comp_n_to_analog0;
   wire comp_n_to_sio1;
   wire comp_n_to_vbgsc;
   wire comp_n_to_right_vref;
   wire comp_n_to_vinref;
   wire [1:0] comp_n_to_gpio6_3;
   wire [1:0] comp_n_to_gpio1_4;
   wire adc0_to_dac0;
   wire adc0_to_analog1;
   wire adc0_to_vbgtc;
   wire adc0_to_tempsense;
   wire adc0_to_left_vref;
   wire adc0_to_voutref;
   wire [1:0] adc0_to_gpio6_4;
   wire [1:0] adc0_to_gpio1_3;
   wire adc1_to_dac1;
   wire adc1_to_analog0;
   wire adc1_to_vbgsc;
   wire adc1_to_right_vref;
   wire adc1_to_vinref;
   wire [1:0] adc1_to_gpio6_5;
   wire [1:0] adc1_to_gpio1_2;
   wire [1:0] sio0_connect;
   wire [1:0] sio1_connect;
   wire [1:0] analog0_connect;
   wire [1:0] analog1_connect;
   wire vbgtc_to_user;
   wire vbgsc_to_user;
   wire [1:0] user_to_comp_n;
   wire [1:0] user_to_comp_p;
   wire [1:0] user_to_ulpcomp_n;
   wire [1:0] user_to_ulpcomp_p;
   wire [1:0] user_to_adc0;
   wire [1:0] user_to_adc1;
   wire dac0_to_user;
   wire dac1_to_user;
   wire tempsense_to_user;
   wire right_vref_to_user;
   wire left_vref_to_user;
   wire vinref_to_user;
   wire voutref_to_user;
   wire dac0_to_analog1; 
   wire dac1_to_analog0;
   wire [1:0] audiodac_out_to_analog1;
   wire [1:0] audiodac_outb_to_analog0;
   wire mgmt_select;
   wire [5:0] sio_cfg;
   wire user_clk;


  // JTAG
  wire debug;
  wire jtag_clk;
  wire jtag_reset_n;
  wire jtag_select;
  wire jtag_in;
  wire jtag_out;
  wire test;

// ----------------------------------------------------------------------------
// Processor debug

localparam DTM_TYPE   = "JTAG";  // Can be "JTAG" or "ECP5"

wire              dmi_psel;
wire              dmi_penable;
wire              dmi_pwrite;
wire [8:0]        dmi_paddr;
wire [31:0]       dmi_pwdata;
wire [31:0]       dmi_prdata;
wire              dmi_pready;
wire              dmi_pslverr;

// TCK-domain DTM logic can force a hard reset
wire dmihardreset_req;
wire assert_dmi_reset = !HRESETn || dmihardreset_req;
wire rst_n_dmi;
wire hazard3_jtag_trst_n;
wire hazard3_jtag_tdo;
reset_sync dmi_reset_sync_u (
	.clk       (HCLK),
	.rst_n_in  (!assert_dmi_reset),
	.rst_n_out (rst_n_dmi)
);

generate
if (DTM_TYPE == "JTAG") begin

	// Standard RISC-V JTAG-DTM connected to external IOs.
	// JTAG-DTM IDCODE should be a JEP106-compliant ID:
	localparam IDCODE = 32'hdeadbeef;

	hazard3_jtag_dtm #(
		.IDCODE (IDCODE)
	) dtm_u (
		.tck              (jtag_clk),
		.trst_n           (jtag_reset_n),
		.tms              (jtag_select),
		.tdi              (jtag_in),
		.tdo              (jtag_out),

		.dmihardreset_req (dmihardreset_req),

		.clk_dmi          (HCLK),
		.rst_n_dmi        (rst_n_dmi),

		.dmi_psel         (dmi_psel),
		.dmi_penable      (dmi_penable),
		.dmi_pwrite       (dmi_pwrite),
		.dmi_paddr        (dmi_paddr),
		.dmi_pwdata       (dmi_pwdata),
		.dmi_prdata       (dmi_prdata),
		.dmi_pready       (dmi_pready),
		.dmi_pslverr      (dmi_pslverr)
	);

end else if (DTM_TYPE == "ECP5") begin

	// Attach RISC-V DTM's DTMCS/DMI registers to ECP5 ER1/ER2 registers. This
	// allows the processor to be debugged through the ECP5 chip TAP, using
	// regular upstream OpenOCD.

	// Connects to ECP5 TAP internally by instantiating a JTAGG primitive.
	assign jtag_out = 1'b0;

	hazard3_ecp5_jtag_dtm dtm_u (
		.dmihardreset_req (dmihardreset_req),

		.clk_dmi          (HCLK),
		.rst_n_dmi        (rst_n_dmi),

		.dmi_psel         (dmi_psel),
		.dmi_penable      (dmi_penable),
		.dmi_pwrite       (dmi_pwrite),
		.dmi_paddr        (dmi_paddr),
		.dmi_pwdata       (dmi_pwdata),
		.dmi_prdata       (dmi_prdata),
		.dmi_pready       (dmi_pready),
		.dmi_pslverr      (dmi_pslverr)
	);

end
endgenerate

  frigate_soc soc (
`ifdef USE_POWER_PINS
      .vccd1(vccd0),
      .vssd1(vssd0),
      .vdda1(vdda0),
      .vssa1(vssa0),
`endif
      // RISC-V JTAG-DTM 
      .dmi_psel(dmi_psel),
      .dmi_penable(dmi_penable),
      .dmi_pwrite(dmi_pwrite),
      .dmi_paddr(dmi_paddr),
      .dmi_pwdata(dmi_pwdata),
      .dmi_prdata(dmi_prdata),
      .dmi_pready(dmi_pready),
      .dmi_pslverr(dmi_pslverr),

      // Flash
      .fsclk   (flash_sck),
      .fcen    (flash_cen),
      .fdin    (flash_din),
      .fdout   (flash_dout),
      .fdouten (flash_douten),

      // CLK sub-system Signals
      .xclk       (xclk),
      .xrst_n     (xrst_n),
      .por_n      (por_n),
      .user_clk   (user_clk),

	  .rcosc_500k         (rcosc_500k),
	  .rcosc_16m          (rcosc_16m),
	  .hsxo               (hsxo),
	  .lsxo               (lsxo),

      .rcosc_500k_en_tf   (rcosc_500k_en),
	  .rcosc_16m_en_tf    (rcosc_16m_en),
	  .hsxo_en_tf         (hsxo_en),
	  .lsxo_en_tf         (lsxo_en),
	  .lsxo_standby_tf    (lsxo_standby),
	  .hsxo_standby_tf    (hsxo_standby),

      // USB CDC
      .usb_dp_rx      (usb_dp_rx),
      .usb_dn_rx      (usb_dn_rx),
      //.usb_dp_pu      (usb_dp_pu),
      .usb_tx_en      (usb_tx_en),
      .usb_dp_tx      (usb_dp_tx),
      .usb_dn_tx      (usb_dn_tx),


      // GPIO port G
      .gpioG_io_in(gpioG_io_in),
      .gpioG_io_out(gpioG_io_out),
      .gpioG_io_oe(gpioG_io_oe),

      // GPIO port H
      .gpioH_io_in(gpioH_io_in),
      .gpioH_io_out(gpioH_io_out),
      .gpioH_io_oe(gpioH_io_oe),

      // GPIO port I
      .gpioI_io_in(gpioI_io_in),
      .gpioI_io_out(gpioI_io_out),
      .gpioI_io_oe(gpioI_io_oe),


      // MUX Ports - GPIO
      .pin_mux_io_in (pin_mux_io_in),
      .pin_mux_io_out(pin_mux_io_out),
      .pin_mux_io_oeb(pin_mux_io_oeb),

      // user irqs
      .user_irqs      (user_irqs_core),

       // RAM_0
      .SRAMRDATA_0(SRAMRDATA_0),       // SRAM Read Data
      .SRAMR_WB_0(SRAMR_WB_0),           // SRAM write enable (active high)
      .SRAMWDATA_0(SRAMWDATA_0),       // SRAM write data
      .SRAMEN_0(SRAMEN_0),             // SRAM Chip Select (active high)
      .SRAMADDR_0(SRAMADDR_0),         // SRAM address
      .SRAMCLK_0(SRAMCLK_0),         // SRAM clock
      .SRAMBEN_0(SRAMBEN_0),          // bit write enable

        // RAM_1
      .SRAMRDATA_1(SRAMRDATA_1),       // SRAM Read Data
      .SRAMR_WB_1(SRAMR_WB_1),           // SRAM write enable (active high)
      .SRAMWDATA_1(SRAMWDATA_1),       // SRAM write data
      .SRAMEN_1(SRAMEN_1),             // SRAM Chip Select (active high)
      .SRAMADDR_1(SRAMADDR_1),          // SRAM address
      .SRAMCLK_1(SRAMCLK_1),          // SRAM address
      .SRAMBEN_1(SRAMBEN_1),          // bit write enable

      .HCLK_out(HCLK),
      .HRESETn_out(HRESETn),

      .ahb_2_hready_resp(user_HREADYOUT_core),
      .ahb_2_hready(user_HREADY_core),
      .ahb_2_hresp(1'h0),
      .ahb_2_haddr(user_HADDR_core),
      .ahb_2_hwrite(user_HWRITE_core),
      .ahb_2_htrans(user_HTRANS_core),
      .ahb_2_hsize(user_HSIZE_core),
      .ahb_2_hburst(),
      .ahb_2_hprot(),
      .ahb_2_hmastlock(),
      .ahb_2_hwdata(user_HWDATA_core),
      .ahb_2_hrdata(user_HRDATA_core),
      .hk_spi_sdi(hk_spi_sdi),
      .hk_spi_csb(hk_spi_csb),
      .hk_spi_sck(hk_spi_sck),
      .hk_spi_sdo(hk_spi_sdo),

      .mask_rev_in(mask_rev_in),
      .prod_id(product_id),
      .serial_clock (mprj_io_loader_clock),
      .serial_load  (mprj_io_loader_strobe),
      .serial_resetn(mprj_io_loader_resetn),
      .serial_data_1(mprj_io_loader_data_1),
      .serial_data_2(mprj_io_loader_data_2),

      .adc0_cmp       (adc0_cmp),
      .adc0_hold      (adc0_hold),
      .adc0_data      (adc0_data),
      .adc0_en        (adc0_en),
      .adc0_dac_rst   (adc0_dac_rst),

      .adc1_cmp       (adc1_cmp),
      .adc1_hold      (adc1_hold),
      .adc1_data      (adc1_data),
      .adc1_en        (adc1_en),
      .adc1_dac_rst   (adc1_dac_rst),

      .ds_o		      (ds_o),               
	  .ds_n_o		  (ds_n_o),               

      .ibias_test_to_gpio1_2(ibias_test_to_gpio1_2),
      .vbg_test_to_gpio1_1(vbg_test_to_gpio1_1),
      .idac_to_gpio1_3(idac_to_gpio1_3),
      .idac_to_gpio1_2(idac_to_gpio1_2),
      .adc_refh_to_gpio6_6(adc_refh_to_gpio6_6),
      .dac_refh_to_gpio1_1(dac_refh_to_gpio1_1),
      .adc_refl_to_gpio6_7(adc_refl_to_gpio6_7),
      .dac_refl_to_gpio1_0(dac_refl_to_gpio1_0),
      .right_lp_opamp_to_ulpcomp_p(right_lp_opamp_to_ulpcomp_p),
      .right_lp_opamp_to_comp_p(right_lp_opamp_to_comp_p),
      .right_lp_opamp_to_adc0(right_lp_opamp_to_adc0),
      .right_lp_opamp_to_gpio4_7(right_lp_opamp_to_gpio4_7),
      .right_lp_opamp_to_gpio4_3(right_lp_opamp_to_gpio4_3),
      .right_lp_opamp_to_analog1(right_lp_opamp_to_analog1),
      .right_lp_opamp_to_amuxbusB(right_lp_opamp_to_amuxbusB),
      .right_lp_opamp_to_gpio3_7(right_lp_opamp_to_gpio3_7),
      .right_lp_opamp_to_gpio3_3(right_lp_opamp_to_gpio3_3),
      .right_hgbw_opamp_to_ulpcomp_n(right_hgbw_opamp_to_ulpcomp_n),
      .right_hgbw_opamp_to_comp_n(right_hgbw_opamp_to_comp_n),
      .right_hgbw_opamp_to_adc1(right_hgbw_opamp_to_adc1),
      .right_hgbw_opamp_to_gpio4_6(right_hgbw_opamp_to_gpio4_6),
      .right_hgbw_opamp_to_gpio4_2(right_hgbw_opamp_to_gpio4_2),
      .right_hgbw_opamp_to_analog0(right_hgbw_opamp_to_analog0),
      .right_hgbw_opamp_to_amuxbusA(right_hgbw_opamp_to_amuxbusA),
      .right_hgbw_opamp_to_gpio3_6(right_hgbw_opamp_to_gpio3_6),
      .right_hgbw_opamp_to_gpio3_2(right_hgbw_opamp_to_gpio3_2),
      .left_hgbw_opamp_to_ulpcomp_p(left_hgbw_opamp_to_ulpcomp_p),
      .left_hgbw_opamp_to_comp_p(left_hgbw_opamp_to_comp_p),
      .left_hgbw_opamp_to_adc0(left_hgbw_opamp_to_adc0),
      .left_hgbw_opamp_to_gpio4_5(left_hgbw_opamp_to_gpio4_5),
      .left_hgbw_opamp_to_gpio4_1(left_hgbw_opamp_to_gpio4_1),
      .left_hgbw_opamp_to_analog1(left_hgbw_opamp_to_analog1),
      .left_hgbw_opamp_to_amuxbusB(left_hgbw_opamp_to_amuxbusB),
      .left_hgbw_opamp_to_gpio3_5(left_hgbw_opamp_to_gpio3_5),
      .left_hgbw_opamp_to_gpio3_1(left_hgbw_opamp_to_gpio3_1),
      .left_lp_opamp_to_ulpcomp_n(left_lp_opamp_to_ulpcomp_n),
      .left_lp_opamp_to_comp_n(left_lp_opamp_to_comp_n),
      .left_lp_opamp_to_adc1(left_lp_opamp_to_adc1),
      .left_lp_opamp_to_gpio4_0(left_lp_opamp_to_gpio4_0),
      .left_lp_opamp_to_analog0(left_lp_opamp_to_analog0),
      .left_lp_opamp_to_amuxbusA(left_lp_opamp_to_amuxbusA),
      .left_lp_opamp_to_gpio3_4(left_lp_opamp_to_gpio3_4),
      .right_lp_opamp_p_to_dac0(right_lp_opamp_p_to_dac0),
      .right_lp_opamp_p_to_analog0(right_lp_opamp_p_to_analog0),
      .right_lp_opamp_p_to_amuxbusA(right_lp_opamp_p_to_amuxbusA),
      .right_lp_opamp_p_to_rheostat_out(right_lp_opamp_p_to_rheostat_out),
      .right_lp_opamp_p_to_sio0(right_lp_opamp_p_to_sio0),
      .right_lp_opamp_p_to_tempsense(right_lp_opamp_p_to_tempsense),
      .right_lp_opamp_p_to_left_vref(right_lp_opamp_p_to_left_vref),
      .right_lp_opamp_p_to_voutref(right_lp_opamp_p_to_voutref),
      .right_lp_opamp_p_to_gpio2_5(right_lp_opamp_p_to_gpio2_5),
      .right_lp_opamp_n_to_dac1(right_lp_opamp_n_to_dac1),
      .right_lp_opamp_n_to_analog1(right_lp_opamp_n_to_analog1),
      .right_lp_opamp_n_to_amuxbusB(right_lp_opamp_n_to_amuxbusB),
      .right_lp_opamp_n_to_rheostat_out(right_lp_opamp_n_to_rheostat_out),
      .right_lp_opamp_n_to_rheostat_tap(right_lp_opamp_n_to_rheostat_tap),
      .right_lp_opamp_n_to_sio1(right_lp_opamp_n_to_sio1),
      .right_lp_opamp_n_to_vbgtc(right_lp_opamp_n_to_vbgtc),
      .right_lp_opamp_n_to_right_vref(right_lp_opamp_n_to_right_vref),
      .right_lp_opamp_n_to_vinref(right_lp_opamp_n_to_vinref),
      .right_lp_opamp_n_to_gpio2_4(right_lp_opamp_n_to_gpio2_4),
      .right_hgbw_opamp_p_to_gpio5_0(right_hgbw_opamp_p_to_gpio5_0),
      .right_hgbw_opamp_p_to_dac0(right_hgbw_opamp_p_to_dac0),
      .right_hgbw_opamp_p_to_analog0(right_hgbw_opamp_p_to_analog0),
      .right_hgbw_opamp_p_to_amuxbusA(right_hgbw_opamp_p_to_amuxbusA),
      .right_hgbw_opamp_p_to_rheostat_out(right_hgbw_opamp_p_to_rheostat_out),
      .right_hgbw_opamp_p_to_sio0(right_hgbw_opamp_p_to_sio0),
      .right_hgbw_opamp_p_to_left_vref(right_hgbw_opamp_p_to_left_vref),
      .right_hgbw_opamp_p_to_voutref(right_hgbw_opamp_p_to_voutref),
      .right_hgbw_opamp_p_to_gpio2_3(right_hgbw_opamp_p_to_gpio2_3),
      .right_hgbw_opamp_n_to_gpio5_1(right_hgbw_opamp_n_to_gpio5_1),
      .right_hgbw_opamp_n_to_dac1(right_hgbw_opamp_n_to_dac1),
      .right_hgbw_opamp_n_to_analog1(right_hgbw_opamp_n_to_analog1),
      .right_hgbw_opamp_n_to_amuxbusB(right_hgbw_opamp_n_to_amuxbusB),
      .right_hgbw_opamp_n_to_rheostat_out(right_hgbw_opamp_n_to_rheostat_out),
      .right_hgbw_opamp_n_to_rheostat_tap(right_hgbw_opamp_n_to_rheostat_tap),
      .right_hgbw_opamp_n_to_sio1(right_hgbw_opamp_n_to_sio1),
      .right_hgbw_opamp_n_to_vbgsc(right_hgbw_opamp_n_to_vbgsc),
      .right_hgbw_opamp_n_to_right_vref(right_hgbw_opamp_n_to_right_vref),
      .right_hgbw_opamp_n_to_vinref(right_hgbw_opamp_n_to_vinref),
      .right_hgbw_opamp_n_to_gpio2_2(right_hgbw_opamp_n_to_gpio2_2),
      .left_hgbw_opamp_p_to_gpio5_2(left_hgbw_opamp_p_to_gpio5_2),
      .left_hgbw_opamp_p_to_dac0(left_hgbw_opamp_p_to_dac0),
      .left_hgbw_opamp_p_to_analog0(left_hgbw_opamp_p_to_analog0),
      .left_hgbw_opamp_p_to_amuxbusA(left_hgbw_opamp_p_to_amuxbusA),
      .left_hgbw_opamp_p_to_rheostat_out(left_hgbw_opamp_p_to_rheostat_out),
      .left_hgbw_opamp_p_to_sio0(left_hgbw_opamp_p_to_sio0),
      .left_hgbw_opamp_p_to_tempsense(left_hgbw_opamp_p_to_tempsense),
      .left_hgbw_opamp_p_to_left_vref(left_hgbw_opamp_p_to_left_vref),
      .left_hgbw_opamp_p_to_voutref(left_hgbw_opamp_p_to_voutref),
      .left_hgbw_opamp_p_to_gpio2_1(left_hgbw_opamp_p_to_gpio2_1),
      .left_hgbw_opamp_n_to_gpio5_3(left_hgbw_opamp_n_to_gpio5_3),
      .left_hgbw_opamp_n_to_dac1(left_hgbw_opamp_n_to_dac1),
      .left_hgbw_opamp_n_to_analog1(left_hgbw_opamp_n_to_analog1),
      .left_hgbw_opamp_n_to_amuxbusB(left_hgbw_opamp_n_to_amuxbusB),
      .left_hgbw_opamp_n_to_rheostat_out(left_hgbw_opamp_n_to_rheostat_out),
      .left_hgbw_opamp_n_to_rheostat_tap(left_hgbw_opamp_n_to_rheostat_tap),
      .left_hgbw_opamp_n_to_sio1(left_hgbw_opamp_n_to_sio1),
      .left_hgbw_opamp_n_to_vbgtc(left_hgbw_opamp_n_to_vbgtc),
      .left_hgbw_opamp_n_to_right_vref(left_hgbw_opamp_n_to_right_vref),
      .left_hgbw_opamp_n_to_vinref(left_hgbw_opamp_n_to_vinref),
      .left_hgbw_opamp_n_to_gpio2_0(left_hgbw_opamp_n_to_gpio2_0),
      .left_lp_opamp_p_to_gpio5_4(left_lp_opamp_p_to_gpio5_4),
      .left_lp_opamp_p_to_dac0(left_lp_opamp_p_to_dac0),
      .left_lp_opamp_p_to_analog0(left_lp_opamp_p_to_analog0),
      .left_lp_opamp_p_to_amuxbusA(left_lp_opamp_p_to_amuxbusA),
      .left_lp_opamp_p_to_rheostat_out(left_lp_opamp_p_to_rheostat_out),
      .left_lp_opamp_p_to_sio0(left_lp_opamp_p_to_sio0),
      .left_lp_opamp_p_to_left_vref(left_lp_opamp_p_to_left_vref),
      .left_lp_opamp_p_to_voutref(left_lp_opamp_p_to_voutref),
      .left_lp_opamp_n_to_gpio5_5(left_lp_opamp_n_to_gpio5_5),
      .left_lp_opamp_n_to_dac1(left_lp_opamp_n_to_dac1),
      .left_lp_opamp_n_to_analog1(left_lp_opamp_n_to_analog1),
      .left_lp_opamp_n_to_amuxbusB(left_lp_opamp_n_to_amuxbusB),
      .left_lp_opamp_n_to_rheostat_out(left_lp_opamp_n_to_rheostat_out),
      .left_lp_opamp_n_to_rheostat_tap(left_lp_opamp_n_to_rheostat_tap),
      .left_lp_opamp_n_to_sio1(left_lp_opamp_n_to_sio1),
      .left_lp_opamp_n_to_vbgsc(left_lp_opamp_n_to_vbgsc),
      .left_lp_opamp_n_to_right_vref(left_lp_opamp_n_to_right_vref),
      .left_lp_opamp_n_to_vinref(left_lp_opamp_n_to_vinref),
      .left_instramp_to_ulpcomp_p(left_instramp_to_ulpcomp_p),
      .left_instramp_to_comp_p(left_instramp_to_comp_p),
      .left_instramp_to_adc0(left_instramp_to_adc0),
      .left_instramp_to_gpio4_4(left_instramp_to_gpio4_4),
      .left_instramp_to_analog1(left_instramp_to_analog1),
      .left_instramp_to_amuxbusB(left_instramp_to_amuxbusB),
      .right_instramp_to_ulpcomp_n(right_instramp_to_ulpcomp_n),
      .right_instramp_to_comp_n(right_instramp_to_comp_n),
      .right_instramp_to_adc1(right_instramp_to_adc1),
      .right_instramp_to_analog0(right_instramp_to_analog0),
      .right_instramp_to_amuxbusA(right_instramp_to_amuxbusA),
      .right_instramp_to_gpio3_0(right_instramp_to_gpio3_0),
      .left_instramp_n_to_gpio5_7(left_instramp_n_to_gpio5_7),
      .left_instramp_n_to_analog1(left_instramp_n_to_analog1),
      .left_instramp_n_to_amuxbusB(left_instramp_n_to_amuxbusB),
      .left_instramp_n_to_sio1(left_instramp_n_to_sio1),
      .left_instramp_n_to_right_vref(left_instramp_n_to_right_vref),
      .left_instramp_n_to_vinref(left_instramp_n_to_vinref),
      .left_instramp_p_to_gpio5_6(left_instramp_p_to_gpio5_6),
      .left_instramp_p_to_analog0(left_instramp_p_to_analog0),
      .left_instramp_p_to_amuxbusA(left_instramp_p_to_amuxbusA),
      .left_instramp_p_to_sio0(left_instramp_p_to_sio0),
      .left_instramp_p_to_tempsense(left_instramp_p_to_tempsense),
      .left_instramp_p_to_left_vref(left_instramp_p_to_left_vref),
      .left_instramp_p_to_voutref(left_instramp_p_to_voutref),
      .right_instramp_n_to_analog1(right_instramp_n_to_analog1),
      .right_instramp_n_to_amuxbusB(right_instramp_n_to_amuxbusB),
      .right_instramp_n_to_sio1(right_instramp_n_to_sio1),
      .right_instramp_n_to_right_vref(right_instramp_n_to_right_vref),
      .right_instramp_n_to_vinref(right_instramp_n_to_vinref),
      .right_instramp_n_to_gpio2_6(right_instramp_n_to_gpio2_6),
      .right_instramp_p_to_analog0(right_instramp_p_to_analog0),
      .right_instramp_p_to_amuxbusA(right_instramp_p_to_amuxbusA),
	  .right_instramp_p_to_sio0(right_instramp_p_to_sio0),
      .right_instramp_p_to_tempsense(right_instramp_p_to_tempsense),
      .right_instramp_p_to_left_vref(right_instramp_p_to_left_vref),
      .right_instramp_p_to_voutref(right_instramp_p_to_voutref),
      .right_instramp_p_to_gpio2_7(right_instramp_p_to_gpio2_7),
      .ulpcomp_p_to_dac0(ulpcomp_p_to_dac0),
      .ulpcomp_p_to_analog1(ulpcomp_p_to_analog1),
      .ulpcomp_p_to_sio0(ulpcomp_p_to_sio0),
      .ulpcomp_p_to_vbgtc(ulpcomp_p_to_vbgtc),
      .ulpcomp_p_to_tempsense(ulpcomp_p_to_tempsense),
      .ulpcomp_p_to_left_vref(ulpcomp_p_to_left_vref),
      .ulpcomp_p_to_voutref(ulpcomp_p_to_voutref),
      .ulpcomp_p_to_gpio6_0(ulpcomp_p_to_gpio6_0),
      .ulpcomp_p_to_gpio1_7(ulpcomp_p_to_gpio1_7),
      .ulpcomp_n_to_dac1(ulpcomp_n_to_dac1),
      .ulpcomp_n_to_analog0(ulpcomp_n_to_analog0),
      .ulpcomp_n_to_sio1(ulpcomp_n_to_sio1),
      .ulpcomp_n_to_vbgsc(ulpcomp_n_to_vbgsc),
      .ulpcomp_n_to_right_vref(ulpcomp_n_to_right_vref),
      .ulpcomp_n_to_vinref(ulpcomp_n_to_vinref),
      .ulpcomp_n_to_gpio6_1(ulpcomp_n_to_gpio6_1),
      .ulpcomp_n_to_gpio1_6(ulpcomp_n_to_gpio1_6),
      .comp_p_to_dac0(comp_p_to_dac0),
      .comp_p_to_analog1(comp_p_to_analog1),
      .comp_p_to_sio0(comp_p_to_sio0),
      .comp_p_to_vbgtc(comp_p_to_vbgtc),
      .comp_p_to_tempsense(comp_p_to_tempsense),
      .comp_p_to_left_vref(comp_p_to_left_vref),
      .comp_p_to_voutref(comp_p_to_voutref),
      .comp_p_to_gpio6_2(comp_p_to_gpio6_2),
      .comp_p_to_gpio1_5(comp_p_to_gpio1_5),
      .comp_n_to_dac1(comp_n_to_dac1),
      .comp_n_to_analog0(comp_n_to_analog0),
      .comp_n_to_sio1(comp_n_to_sio1),
      .comp_n_to_vbgsc(comp_n_to_vbgsc),
      .comp_n_to_right_vref(comp_n_to_right_vref),
      .comp_n_to_vinref(comp_n_to_vinref),
      .comp_n_to_gpio6_3(comp_n_to_gpio6_3),
      .comp_n_to_gpio1_4(comp_n_to_gpio1_4),
      .adc0_to_dac0(adc0_to_dac0),
      .adc0_to_analog1(adc0_to_analog1),
      .adc0_to_vbgtc(adc0_to_vbgtc),
      .adc0_to_tempsense(adc0_to_tempsense),
      .adc0_to_left_vref(adc0_to_left_vref),
      .adc0_to_voutref(adc0_to_voutref),
      .adc0_to_gpio6_4(adc0_to_gpio6_4),
      .adc0_to_gpio1_3(adc0_to_gpio1_3),
      .adc1_to_dac1(adc1_to_dac1),
      .adc1_to_analog0(adc1_to_analog0),
      .adc1_to_vbgsc(adc1_to_vbgsc),
      .adc1_to_right_vref(adc1_to_right_vref),
      .adc1_to_vinref(adc1_to_vinref),
      .adc1_to_gpio6_5(adc1_to_gpio6_5),
      .adc1_to_gpio1_2(adc1_to_gpio1_2),
      .sio0_connect(sio0_connect),
      .sio1_connect(sio1_connect),
      .analog0_connect(analog0_connect),
      .analog1_connect(analog1_connect),
      .vbgtc_to_user(vbgtc_to_user),
      .vbgsc_to_user(vbgsc_to_user),
      .user_to_comp_n(user_to_comp_n),
      .user_to_comp_p(user_to_comp_p),
      .user_to_ulpcomp_n(user_to_ulpcomp_n),
      .user_to_ulpcomp_p(user_to_ulpcomp_p),
      .user_to_adc0(user_to_adc0),
      .user_to_adc1(user_to_adc1),
      .dac0_to_user(dac0_to_user),
      .dac1_to_user(dac1_to_user),
      .tempsense_to_user(tempsense_to_user),
      .right_vref_to_user(right_vref_to_user),
      .left_vref_to_user(left_vref_to_user),
      .vinref_to_user(vinref_to_user),
      .voutref_to_user(voutref_to_user),
      .dac0_to_analog1(dac0_to_analog1),
	  .dac1_to_analog0(dac1_to_analog0),
	  .audiodac_out_to_analog1(audiodac_out_to_analog1),
	  .audiodac_outb_to_analog0(audiodac_outb_to_analog0),


      .left_instramp_ena(left_instramp_ena),
      .left_instramp_G1(left_instramp_G1),
      .left_instramp_G2(left_instramp_G2),
      .left_hgbw_opamp_ena(left_hgbw_opamp_ena),
      .left_lp_opamp_ena(left_lp_opamp_ena),
      .left_rheostat1_b(left_rheostat1_b),
      .left_rheostat2_b(left_rheostat2_b),
      .right_instramp_ena(right_instramp_ena),
      .right_instramp_G1(right_instramp_G1),
      .right_instramp_G2(right_instramp_G2),
      .right_hgbw_opamp_ena(right_hgbw_opamp_ena),
      .right_lp_opamp_ena(right_lp_opamp_ena),
      .right_rheostat1_b(right_rheostat1_b),
      .right_rheostat2_b(right_rheostat2_b),
      .comp_ena(comp_ena),
      .comp_trim(comp_trim),
      .comp_hyst(comp_hyst),
      .ulpcomp_ena(ulpcomp_ena),
	  .ulpcomp_clk(ulpcomp_clk),
      .bandgap_ena(bandgap_ena),
      .bandgap_trim(bandgap_trim),
      .bandgap_sel(bandgap_sel),
      .ldo_ena(ldo_ena),
      .overvoltage_ena(overvoltage_ena),
      .overvoltage_trim(overvoltage_trim),
      .ldo_ref_sel(ldo_ref_sel),
      .ibias_ena(ibias_ena),
      .ibias_src_ena(ibias_src_ena),
      .ibias_snk_ena(ibias_snk_ena),
      .ibias_ref_select(ibias_ref_select),
      .idac_value(idac_value),
      .idac_ena(idac_ena),
      .tempsense_ena(tempsense_ena),
      .tempsense_sel(tempsense_sel),
      .rdac0_ena(rdac0_ena),
      .rdac0_value(rdac0_value),
      .rdac1_ena(rdac1_ena),
      .rdac1_value(rdac1_value),
      .brownout_ena(brownout_ena),
	  .brownout_vtrip(brownout_vtrip),
	  .brownout_otrip(brownout_otrip),
	  .brownout_isrc_sel(brownout_isrc_sel),
	  .brownout_oneshot(brownout_oneshot),
	  .brownout_rc_ena(brownout_rc_ena),
	  .brownout_rc_dis(brownout_rc_dis),
	  .brownout_vunder(brownout_vunder),
	  .brownout_timeout(brownout_timeout),
	  .brownout_filt(brownout_filt),
	  .brownout_unfilt(brownout_unfilt),
      .comp_out(comp_out),
      .ulpcomp_out(ulpcomp_out),
      .overvoltage_out(overvoltage_out),
      .vdda1_pwr_good(vdda1_pwr_good),
      .vccd1_pwr_good(vccd1_pwr_good),
      .vdda2_pwr_good(vdda2_pwr_good),
      .vccd2_pwr_good(vccd2_pwr_good),

    // System registers
      .vref_e_vrefgen_en(vref_e_vrefgen_en),
      .vref_w_vrefgen_en(vref_w_vrefgen_en),
      .vref_e_ref_sel(vref_e_ref_sel),
      .vref_w_ref_sel(vref_w_ref_sel),

      .muxsplit_se_switch_aa_sl(muxsplit_se_switch_aa_sl),
      .muxsplit_se_switch_aa_s0(muxsplit_se_switch_aa_s0),
      .muxsplit_se_switch_bb_s0(muxsplit_se_switch_bb_s0),
      .muxsplit_se_switch_bb_sl(muxsplit_se_switch_bb_sl),
      .muxsplit_se_switch_bb_sr(muxsplit_se_switch_bb_sr),
      .muxsplit_se_switch_aa_sr(muxsplit_se_switch_aa_sr),
      .muxsplit_sw_switch_aa_sl(muxsplit_sw_switch_aa_sl),
      .muxsplit_sw_switch_aa_s0(muxsplit_sw_switch_aa_s0),
      .muxsplit_sw_switch_bb_s0(muxsplit_sw_switch_bb_s0),
      .muxsplit_sw_switch_bb_sl(muxsplit_sw_switch_bb_sl),
      .muxsplit_sw_switch_bb_sr(muxsplit_sw_switch_bb_sr),
      .muxsplit_sw_switch_aa_sr(muxsplit_sw_switch_aa_sr),
      .muxsplit_ne_switch_aa_sl(muxsplit_ne_switch_aa_sl),
      .muxsplit_ne_switch_aa_s0(muxsplit_ne_switch_aa_s0),
      .muxsplit_ne_switch_bb_s0(muxsplit_ne_switch_bb_s0),
      .muxsplit_ne_switch_bb_sl(muxsplit_ne_switch_bb_sl),
      .muxsplit_ne_switch_bb_sr(muxsplit_ne_switch_bb_sr),
      .muxsplit_ne_switch_aa_sr(muxsplit_ne_switch_aa_sr),
      .muxsplit_nw_switch_aa_sl(muxsplit_nw_switch_aa_sl),
      .muxsplit_nw_switch_aa_s0(muxsplit_nw_switch_aa_s0),
      .muxsplit_nw_switch_bb_s0(muxsplit_nw_switch_bb_s0),
      .muxsplit_nw_switch_bb_sl(muxsplit_nw_switch_bb_sl),
      .muxsplit_nw_switch_bb_sr(muxsplit_nw_switch_bb_sr),
      .muxsplit_nw_switch_aa_sr(muxsplit_nw_switch_aa_sr),
      .user_ahb_enable(user_ahb_ena),
      .user_irqs_enable(user_irqs_ena),
      .sio_cfg(sio_cfg),                  
      .mgmt_select(mgmt_select)
  );

  assign user_HSEL_core = 1'b1;

  mgmt_protect mgmt_buffers (
`ifdef USE_POWER_PINS
 	.vccd0(vccd0),
	.vssd0(vssd0),
	.vccd1(vccd1),
	.vssd1(vssd1),
`endif
	.frigate_HCLK(user_clk),
	.frigate_HRESETn(HRESETn),
    .mprj_AHB_Ena(user_ahb_ena),
    .mprj_HSEL_core(user_HSEL_core),
    .mprj_HADDR_core(user_HADDR_core),
    .mprj_HWDATA_core(user_HWDATA_core),
    .mprj_HREADY_core(user_HREADY_core),
    .mprj_HWRITE_core(user_HWRITE_core),
    .mprj_HTRANS_core(user_HTRANS_core),
    .mprj_HSIZE_core(user_HSIZE_core),
    .mprj_HRDATA_core(user_HRDATA_core),
    .mprj_HREADYOUT_core(user_HREADYOUT_core),
    .user_irq_core(user_irqs_core),

	.user_HCLK(user_HCLK),
	.user_HRESETn(user_HRESETn),
    .user_irq_ena(user_irqs_ena),
    .mprj_HSEL_user(user_HSEL),
    .mprj_HADDR_user(user_HADDR),
    .mprj_HWDATA_user(user_HWDATA),
    .mprj_HREADY_user(user_HREADY),
    .mprj_HWRITE_user(user_HWRITE),
    .mprj_HTRANS_user(user_HTRANS),
    .mprj_HSIZE_user(user_HSIZE),
    .mprj_HRDATA_user(user_HRDATA),
    .mprj_HREADYOUT_user(user_HREADYOUT),
    .user_irq(user_irqs)
  );

  wire user_voutref;
  wire user_vinref;
  wire user_left_vref;
  wire user_right_vref;
  wire user_tempsense;
  wire user_dac0;
  wire user_dac1;
  wire user_vbgtc;
  wire user_vbgsc;
  wire user_adc0;
  wire user_adc1;
  wire user_comp_n;
  wire user_comp_p;
  wire user_ulpcomp_n;
  wire user_ulpcomp_p;
  wire user_gpio3_0_analog;
  wire user_gpio3_1_analog;
  wire user_gpio3_2_analog;
  wire user_gpio3_3_analog;
  wire user_gpio3_4_analog;
  wire user_gpio3_5_analog;
  wire user_gpio3_6_analog;
  wire user_gpio3_7_analog;
  wire user_gpio4_0_analog;
  wire user_gpio4_1_analog;
  wire user_gpio4_2_analog;
  wire user_gpio4_3_analog;
  wire user_gpio4_4_analog;
  wire user_gpio4_5_analog;
  wire user_gpio4_6_analog;
  wire user_gpio4_7_analog;
  wire user_ibias50;
  wire user_ibias100;

  user_project_wrapper user_project (
`ifdef USE_POWER_PINS
    .vdda1(vdda1),    // User area 1 3.3V supply
    .vdda2(vdda2),    // User area 2 3.3V supply
    .vssa1(vssa1),    // User area 1 analog ground
    .vssa2(vssa2),    // User area 2 analog ground
    .vccd1(vccd1),    // User area 1 1.8V supply
    .vccd2(vccd2),    // User area 2 1.8v supply
    .vssd1(vssd1),    // User area 1 digital ground
    .vssd2(vssd2),    // User area 2 digital ground
`endif
    .HCLK(user_HCLK),
    .HRESETn(user_HRESETn),
    .HSEL(user_HSEL),
    .HADDR(user_HADDR),
    .HWDATA(user_HWDATA),
    .HREADY(user_HREADY),
    .HWRITE(user_HWRITE),
    .HTRANS(user_HTRANS),
    .HSIZE(user_HSIZE),
    .HRDATA(user_HRDATA),
    .HREADYOUT(user_HREADYOUT),

    .gpio0_in(user_gpio0_in),
    .gpio1_in(user_gpio1_in),
    .gpio2_in(user_gpio2_in),
    .gpio3_in(user_gpio3_in),
    .gpio4_in(user_gpio4_in),
    .gpio5_in(user_gpio5_in),
    .gpio6_in(user_gpio6_in),
    .gpio7_in(user_gpio7_in),
    .gpio0_out(user_gpio0_out),
    .gpio1_out(user_gpio1_out),
    .gpio2_out(user_gpio2_out),
    .gpio3_out(user_gpio3_out),
    .gpio4_out(user_gpio4_out),
    .gpio5_out(user_gpio5_out),
    .gpio6_out(user_gpio6_out),
    .gpio7_out(user_gpio7_out),
    .gpio0_oeb(user_gpio0_oeb),
    .gpio1_oeb(user_gpio1_oeb),
    .gpio2_oeb(user_gpio2_oeb),
    .gpio3_oeb(user_gpio3_oeb),
    .gpio4_oeb(user_gpio4_oeb),
    .gpio5_oeb(user_gpio5_oeb),
    .gpio6_oeb(user_gpio6_oeb),
    .gpio7_oeb(user_gpio7_oeb),

    .sio_in(user_sio_in),
    .sio_out(user_sio_out),
    .sio_oeb(user_sio_oeb),

    `ifndef PnR // Analog connections
        .voutref(user_voutref),
        .vinref(user_vinref),
        .left_vref(user_left_vref),
        .right_vref(user_right_vref),
        .tempsense(user_tempsense),
        .dac0(user_dac0),
        .dac1(user_dac1),
        .vbgtc(user_vbgtc),
        .vbgsc(user_vbgsc),
        .adc0(user_adc0),
        .adc1(user_adc1),
        .comp_n(user_comp_n),
        .comp_p(user_comp_p),
        .ulpcomp_n(user_ulpcomp_n),
        .ulpcomp_p(user_ulpcomp_p),
        .gpio3_0_analog(user_gpio3_0_analog),
        .gpio3_1_analog(user_gpio3_1_analog),
        .gpio3_2_analog(user_gpio3_2_analog),
        .gpio3_3_analog(user_gpio3_3_analog),
        .gpio3_4_analog(user_gpio3_4_analog),
        .gpio3_5_analog(user_gpio3_5_analog),
        .gpio3_6_analog(user_gpio3_6_analog),
        .gpio3_7_analog(user_gpio3_7_analog),
        .gpio4_0_analog(user_gpio4_0_analog),
        .gpio4_1_analog(user_gpio4_1_analog),
        .gpio4_2_analog(user_gpio4_2_analog),
        .gpio4_3_analog(user_gpio4_3_analog),
        .gpio4_4_analog(user_gpio4_4_analog),
        .gpio4_5_analog(user_gpio4_5_analog),
        .gpio4_6_analog(user_gpio4_6_analog),
        .gpio4_7_analog(user_gpio4_7_analog),
        .ibias50(user_ibias50),
        .ibias100(user_ibias100),
    `endif //!PnR
    .user_irq(user_irqs)
  );

sram_2048x32 RAM_0 (
`ifdef USE_POWER_PINS
    .vgnd(vssd0),
    .vnb(vssd0),
    .vpb(vccd0),
    .vpwra(vccd0),
    .vpwrm(vccd0),
    .vpwrp(vccd0),
`endif
    .vpwrac(1'b1),
    .vpwrpc(1'b1),
    // access ports
    .DO(SRAMRDATA_0),
    .DI(SRAMWDATA_0),
    .BEN(SRAMBEN_0),
    .AD(SRAMADDR_0),
    .EN(SRAMEN_0),
    .R_WB(SRAMR_WB_0),
    .CLKin(SRAMCLK_0),
    // scan ports
    .TM(1'b0),
    .SM(1'b0),
    .ScanInCC(1'b0),
    .ScanInDL(1'b0),
    .ScanInDR(1'b0),
    .ScanOutCC(),
    .WLBI(1'b0),
    .WLOFF(1'b0)
  );

sram_2048x32 RAM_1 (
`ifdef USE_POWER_PINS
    .vgnd(vssd0),
    .vnb(vssd0),
    .vpb(vccd0),
    .vpwra(vccd0),
    .vpwrm(vccd0),
    .vpwrp(vccd0),
`endif
    .vpwrac(1'b1),
    .vpwrpc(1'b1),
    // access ports
    .DO(SRAMRDATA_1),
    .DI(SRAMWDATA_1),
    .BEN(SRAMBEN_1),
    .AD(SRAMADDR_1),
    .EN(SRAMEN_1),
    .R_WB(SRAMR_WB_1),
    .CLKin(SRAMCLK_1),
    // scan ports
    .TM(1'b0),
    .SM(1'b0),
    .ScanInCC(1'b0),
    .ScanInDL(1'b0),
    .ScanInDR(1'b0),
    .ScanOutCC(),
    .WLBI(1'b0),
    .WLOFF(1'b0)
  );

    `ifndef PnR // Analog connections
        wire pad_right_vref;
        wire pad_left_vref; 
        assign vcap_e_cpos      = pad_right_vref;
        assign vref_e_vinref    = pad_right_vref;
        assign vcap_w_cpos      = pad_left_vref;
        assign vref_w_vinref    = pad_left_vref;
    `endif // !PnR
    frigate_analog analog_sys(
    `ifdef USE_POWER_PINS
            .vddio(vddio),  // primary 3.3V supply
            .vssio(vssio),
            .vdda0(vdda0),  // top side 3.3V
            .vssa0(vssa0),
            .vdda1(vdda1),  // right side 3.3V
            .vssa1(vssa1),
            .vdda2(vdda2),  // left side 3.3V
            .vssa2(vssa2),
            .vccd0(vccd0),  // primary 1.8V supply
            .vssd0(vssd0),
            .vccd1(vccd1),  // right side 1.8V
            .vssd1(vssd1),
            .vccd2(vccd2),  // left side 1.8V
            .vssd2(vssd2),
    `endif

        // Amplifiers left
        // Instrumentation amplifier (TBD)
        .left_instramp_ena(left_instramp_ena),
        .left_instramp_G1(left_instramp_G1),    // programmable gain
        .left_instramp_G2(left_instramp_G2),    // programmable gain

        // High gain-bandwidth operational amplifier
        .left_hgbw_opamp_ena(left_hgbw_opamp_ena),

        // Low power operational amplifier (TBD)
        .left_lp_opamp_ena(left_lp_opamp_ena),

        // Rheostat 1
        .left_rheostat1_b(left_rheostat1_b),    // programmable tap

        // Rheostat 2
        .left_rheostat2_b(left_rheostat2_b),    // programmable tap

        // Amplifiers right
        // Instrumentation amplifier (TBD)
        .right_instramp_ena(right_instramp_ena),
        .right_instramp_G1(right_instramp_G1),   // programmable gain
        .right_instramp_G2(right_instramp_G2),   // programmable gain

        // High gain-bandwidth operational amplifier
        .right_hgbw_opamp_ena(right_hgbw_opamp_ena),

        // Low power operational amplifier (TBD)
        .right_lp_opamp_ena(right_lp_opamp_ena),

        // Rheostat 1
        .right_rheostat1_b(right_rheostat1_b),   // programmable tap

        // Rheostat 2
        .right_rheostat2_b(right_rheostat2_b),   // programmable tap

        // Comparator
        .comp_ena(comp_ena),
        .comp_trim(comp_trim),   // offset trim
        .comp_hyst(comp_hyst),   // hysteresis trim
        .comp_out(comp_out),    // comparator output

        // Ultra-low-power comparator
        .ulpcomp_ena(ulpcomp_ena),
        .ulpcomp_clk(ulpcomp_clk), 
        .ulpcomp_out(ulpcomp_out),    // comparator output

        // Bandgap
        .bandgap_ena(bandgap_ena),
        .bandgap_trim(bandgap_trim),    // bandgap trim
        .bandgap_sel(bandgap_sel),

        // LDO
        .ldo_ena(ldo_ena),
        .ldo_ref_sel(ldo_ref_sel),

        // Bias current generator
        .ibias_ena(ibias_ena),           // bias generator master enable
        .ibias_src_ena(ibias_src_ena),       // bias generator individual source enables
        .ibias_snk_ena(ibias_snk_ena),       // bias generator individual sink enables
        .ibias_ref_select(ibias_ref_select),    // bias reference voltage selection

        // Overvoltage detector
        .overvoltage_ena(overvoltage_ena),
        .overvoltage_trim(overvoltage_trim),    // overvoltage trip point set
        .overvoltage_out(overvoltage_out),     // overvoltage alarm

        // Brownout detector
        .brownout_ena(brownout_ena),		// brownout detector enable
        .brownout_vtrip(brownout_vtrip),	// brownout detector trip point
        .brownout_otrip(brownout_otrip),	// brownout detector trip point
        .brownout_isrc_sel(brownout_isrc_sel),	// brownout detector select current bias
        .brownout_oneshot(brownout_oneshot),	// brownout detector force short one-shot
        .brownout_rc_ena(brownout_rc_ena),	// brownout detector force oscillator enabled
        .brownout_rc_dis(brownout_rc_dis),	// brownout detector force oscillator disabled
        .brownout_vunder(brownout_vunder),	// brownout detector undervoltage alarm
        .brownout_timeout(brownout_timeout),	// brownout detector timeout
        .brownout_filt(brownout_filt),	// brownout detector undervoltage (filtered)
        .brownout_unfilt(brownout_unfilt),	// brownout detector undervoltage (unfiltered)

        // POR
        .por(por_l),
        .porb(porb_l),
        .porb_h(porb_h),               // 3.3V domain only

        // 12-bit Current DAC (TBD)
        .idac_value(idac_value),
        .idac_ena(idac_ena),

        // Temperature sensor
        .tempsense_ena(tempsense_ena),
        .tempsense_sel(tempsense_sel),

        // Voltage detector 0
        .vdda1_pwr_good(vdda1_pwr_good),      // power good signal
        .vccd1_pwr_good(vccd1_pwr_good),      // power good signal

        // Voltage detector 1
        .vdda2_pwr_good(vdda2_pwr_good),      // power good signal
        .vccd2_pwr_good(vccd2_pwr_good),      // power good signal

        // 16-bit Sigma-delta audio DAC (external digital definition)
        // Only the output driver exists in the analog section.
        // (Assumed to be filtered off-chip?)
        .audiodac_in(ds_o),         // dynamic DAC noninverted input
        .audiodac_inb(ds_n_o),      // dynamic DAC inverted input

        // 12-bit RDAC 0
        .rdac0_ena(rdac0_ena),
        .rdac0_value(rdac0_value),

        // 12-bit RDAC 1
        .rdac1_ena(rdac1_ena),
        .rdac1_value(rdac1_value),

        // 16-bit ADC 0 (external digital control)
        .adc0_ena(adc0_en),
        .adc0_reset(adc0_dac_rst),
        .adc0_hold(adc0_hold),
        .adc0_dac_val(adc0_data),   // DAC input
        .adc0_comp_out(adc0_cmp),   // Comparator output

        // 16-bit ADC 1 (external digital control)
        .adc1_ena(adc1_en),
        .adc1_reset(adc1_dac_rst),
        .adc1_hold(adc1_hold),
        .adc1_dac_val(adc1_data),   // DAC input
        .adc1_comp_out(adc1_cmp),   // Comparator output

        // Switch matrix.  All 2-vector enables are (~ground, enable)
        // (0, 0) is the switch "off" state.
        // (1, 0) is the switch high impedence state (break)
        // (1, 1) is the switch "on" state (make)
        // (0, 1) shorts the signal to ground and is an invalid state
        //
        // All single signal enables are simple switches (1=on, 0=off)

        .ibias_test_to_gpio1_2(ibias_test_to_gpio1_2),
        .vbg_test_to_gpio1_1(vbg_test_to_gpio1_1),
        .idac_to_gpio1_3(idac_to_gpio1_3),
        .idac_to_gpio1_2(idac_to_gpio1_2),
        .adc_refh_to_gpio6_6(adc_refh_to_gpio6_6),
        .dac_refh_to_gpio1_1(dac_refh_to_gpio1_1),
        .adc_refl_to_gpio6_7(adc_refl_to_gpio6_7),
        .dac_refl_to_gpio1_0(dac_refl_to_gpio1_0),
        .right_lp_opamp_to_ulpcomp_p(right_lp_opamp_to_ulpcomp_p),
        .right_lp_opamp_to_comp_p(right_lp_opamp_to_comp_p),
        .right_lp_opamp_to_adc0(right_lp_opamp_to_adc0),
        .right_lp_opamp_to_gpio4_7(right_lp_opamp_to_gpio4_7),
        .right_lp_opamp_to_gpio4_3(right_lp_opamp_to_gpio4_3),
        .right_lp_opamp_to_analog1(right_lp_opamp_to_analog1),
        .right_lp_opamp_to_amuxbusB(right_lp_opamp_to_amuxbusB),
        .right_lp_opamp_to_gpio3_7(right_lp_opamp_to_gpio3_7),
        .right_lp_opamp_to_gpio3_3(right_lp_opamp_to_gpio3_3),
        .right_hgbw_opamp_to_ulpcomp_n(right_hgbw_opamp_to_ulpcomp_n),
        .right_hgbw_opamp_to_comp_n(right_hgbw_opamp_to_comp_n),
        .right_hgbw_opamp_to_adc1(right_hgbw_opamp_to_adc1),
        .right_hgbw_opamp_to_gpio4_6(right_hgbw_opamp_to_gpio4_6),
        .right_hgbw_opamp_to_gpio4_2(right_hgbw_opamp_to_gpio4_2),
        .right_hgbw_opamp_to_analog0(right_hgbw_opamp_to_analog0),
        .right_hgbw_opamp_to_amuxbusA(right_hgbw_opamp_to_amuxbusA),
        .right_hgbw_opamp_to_gpio3_6(right_hgbw_opamp_to_gpio3_6),
        .right_hgbw_opamp_to_gpio3_2(right_hgbw_opamp_to_gpio3_2),
        .left_hgbw_opamp_to_ulpcomp_p(left_hgbw_opamp_to_ulpcomp_p),
        .left_hgbw_opamp_to_comp_p(left_hgbw_opamp_to_comp_p),
        .left_hgbw_opamp_to_adc0(left_hgbw_opamp_to_adc0),
        .left_hgbw_opamp_to_gpio4_5(left_hgbw_opamp_to_gpio4_5),
        .left_hgbw_opamp_to_gpio4_1(left_hgbw_opamp_to_gpio4_1),
        .left_hgbw_opamp_to_analog1(left_hgbw_opamp_to_analog1),
        .left_hgbw_opamp_to_amuxbusB(left_hgbw_opamp_to_amuxbusB),
        .left_hgbw_opamp_to_gpio3_5(left_hgbw_opamp_to_gpio3_5),
        .left_hgbw_opamp_to_gpio3_1(left_hgbw_opamp_to_gpio3_1),
        .left_lp_opamp_to_ulpcomp_n(left_lp_opamp_to_ulpcomp_n),
        .left_lp_opamp_to_comp_n(left_lp_opamp_to_comp_n),
        .left_lp_opamp_to_adc1(left_lp_opamp_to_adc1),
        .left_lp_opamp_to_gpio4_0(left_lp_opamp_to_gpio4_0),
        .left_lp_opamp_to_analog0(left_lp_opamp_to_analog0),
        .left_lp_opamp_to_amuxbusA(left_lp_opamp_to_amuxbusA),
        .left_lp_opamp_to_gpio3_4(left_lp_opamp_to_gpio3_4),
        .right_lp_opamp_p_to_dac0(right_lp_opamp_p_to_dac0),
        .right_lp_opamp_p_to_analog0(right_lp_opamp_p_to_analog0),
        .right_lp_opamp_p_to_amuxbusA(right_lp_opamp_p_to_amuxbusA),
        .right_lp_opamp_p_to_rheostat_out(right_lp_opamp_p_to_rheostat_out),
        .right_lp_opamp_p_to_sio0(right_lp_opamp_p_to_sio0),
        .right_lp_opamp_p_to_tempsense(right_lp_opamp_p_to_tempsense),
        .right_lp_opamp_p_to_left_vref(right_lp_opamp_p_to_left_vref),
        .right_lp_opamp_p_to_voutref(right_lp_opamp_p_to_voutref),
        .right_lp_opamp_p_to_gpio2_5(right_lp_opamp_p_to_gpio2_5),
        .right_lp_opamp_n_to_dac1(right_lp_opamp_n_to_dac1),
        .right_lp_opamp_n_to_analog1(right_lp_opamp_n_to_analog1),
        .right_lp_opamp_n_to_amuxbusB(right_lp_opamp_n_to_amuxbusB),
        .right_lp_opamp_n_to_rheostat_out(right_lp_opamp_n_to_rheostat_out),
        .right_lp_opamp_n_to_rheostat_tap(right_lp_opamp_n_to_rheostat_tap),
        .right_lp_opamp_n_to_sio1(right_lp_opamp_n_to_sio1),
        .right_lp_opamp_n_to_vbgtc(right_lp_opamp_n_to_vbgtc),
        .right_lp_opamp_n_to_right_vref(right_lp_opamp_n_to_right_vref),
        .right_lp_opamp_n_to_vinref(right_lp_opamp_n_to_vinref),
        .right_lp_opamp_n_to_gpio2_4(right_lp_opamp_n_to_gpio2_4),
        .right_hgbw_opamp_p_to_gpio5_0(right_hgbw_opamp_p_to_gpio5_0),
        .right_hgbw_opamp_p_to_dac0(right_hgbw_opamp_p_to_dac0),
        .right_hgbw_opamp_p_to_analog0(right_hgbw_opamp_p_to_analog0),
        .right_hgbw_opamp_p_to_amuxbusA(right_hgbw_opamp_p_to_amuxbusA),
        .right_hgbw_opamp_p_to_rheostat_out(right_hgbw_opamp_p_to_rheostat_out),
        .right_hgbw_opamp_p_to_sio0(right_hgbw_opamp_p_to_sio0),
        .right_hgbw_opamp_p_to_left_vref(right_hgbw_opamp_p_to_left_vref),
        .right_hgbw_opamp_p_to_voutref(right_hgbw_opamp_p_to_voutref),
        .right_hgbw_opamp_p_to_gpio2_3(right_hgbw_opamp_p_to_gpio2_3),
        .right_hgbw_opamp_n_to_gpio5_1(right_hgbw_opamp_n_to_gpio5_1),
        .right_hgbw_opamp_n_to_dac1(right_hgbw_opamp_n_to_dac1),
        .right_hgbw_opamp_n_to_analog1(right_hgbw_opamp_n_to_analog1),
        .right_hgbw_opamp_n_to_amuxbusB(right_hgbw_opamp_n_to_amuxbusB),
        .right_hgbw_opamp_n_to_rheostat_out(right_hgbw_opamp_n_to_rheostat_out),
        .right_hgbw_opamp_n_to_rheostat_tap(right_hgbw_opamp_n_to_rheostat_tap),
        .right_hgbw_opamp_n_to_sio1(right_hgbw_opamp_n_to_sio1),
        .right_hgbw_opamp_n_to_vbgsc(right_hgbw_opamp_n_to_vbgsc),
        .right_hgbw_opamp_n_to_right_vref(right_hgbw_opamp_n_to_right_vref),
        .right_hgbw_opamp_n_to_vinref(right_hgbw_opamp_n_to_vinref),
        .right_hgbw_opamp_n_to_gpio2_2(right_hgbw_opamp_n_to_gpio2_2),
        .left_hgbw_opamp_p_to_gpio5_2(left_hgbw_opamp_p_to_gpio5_2),
        .left_hgbw_opamp_p_to_dac0(left_hgbw_opamp_p_to_dac0),
        .left_hgbw_opamp_p_to_analog0(left_hgbw_opamp_p_to_analog0),
        .left_hgbw_opamp_p_to_amuxbusA(left_hgbw_opamp_p_to_amuxbusA),
        .left_hgbw_opamp_p_to_rheostat_out(left_hgbw_opamp_p_to_rheostat_out),
        .left_hgbw_opamp_p_to_sio0(left_hgbw_opamp_p_to_sio0),
        .left_hgbw_opamp_p_to_tempsense(left_hgbw_opamp_p_to_tempsense),
        .left_hgbw_opamp_p_to_left_vref(left_hgbw_opamp_p_to_left_vref),
        .left_hgbw_opamp_p_to_voutref(left_hgbw_opamp_p_to_voutref),
        .left_hgbw_opamp_p_to_gpio2_1(left_hgbw_opamp_p_to_gpio2_1),
        .left_hgbw_opamp_n_to_gpio5_3(left_hgbw_opamp_n_to_gpio5_3),
        .left_hgbw_opamp_n_to_dac1(left_hgbw_opamp_n_to_dac1),
        .left_hgbw_opamp_n_to_analog1(left_hgbw_opamp_n_to_analog1),
        .left_hgbw_opamp_n_to_amuxbusB(left_hgbw_opamp_n_to_amuxbusB),
        .left_hgbw_opamp_n_to_rheostat_out(left_hgbw_opamp_n_to_rheostat_out),
        .left_hgbw_opamp_n_to_rheostat_tap(left_hgbw_opamp_n_to_rheostat_tap),
        .left_hgbw_opamp_n_to_sio1(left_hgbw_opamp_n_to_sio1),
        .left_hgbw_opamp_n_to_vbgtc(left_hgbw_opamp_n_to_vbgtc),
        .left_hgbw_opamp_n_to_right_vref(left_hgbw_opamp_n_to_right_vref),
        .left_hgbw_opamp_n_to_vinref(left_hgbw_opamp_n_to_vinref),
        .left_hgbw_opamp_n_to_gpio2_0(left_hgbw_opamp_n_to_gpio2_0),
        .left_lp_opamp_p_to_gpio5_4(left_lp_opamp_p_to_gpio5_4),
        .left_lp_opamp_p_to_dac0(left_lp_opamp_p_to_dac0),
        .left_lp_opamp_p_to_analog0(left_lp_opamp_p_to_analog0),
        .left_lp_opamp_p_to_amuxbusA(left_lp_opamp_p_to_amuxbusA),
        .left_lp_opamp_p_to_rheostat_out(left_lp_opamp_p_to_rheostat_out),
        .left_lp_opamp_p_to_sio0(left_lp_opamp_p_to_sio0),
        .left_lp_opamp_p_to_left_vref(left_lp_opamp_p_to_left_vref),
        .left_lp_opamp_p_to_voutref(left_lp_opamp_p_to_voutref),
        .left_lp_opamp_n_to_gpio5_5(left_lp_opamp_n_to_gpio5_5),
        .left_lp_opamp_n_to_dac1(left_lp_opamp_n_to_dac1),
        .left_lp_opamp_n_to_analog1(left_lp_opamp_n_to_analog1),
        .left_lp_opamp_n_to_amuxbusB(left_lp_opamp_n_to_amuxbusB),
        .left_lp_opamp_n_to_rheostat_out(left_lp_opamp_n_to_rheostat_out),
        .left_lp_opamp_n_to_rheostat_tap(left_lp_opamp_n_to_rheostat_tap),
        .left_lp_opamp_n_to_sio1(left_lp_opamp_n_to_sio1),
        .left_lp_opamp_n_to_vbgsc(left_lp_opamp_n_to_vbgsc),
        .left_lp_opamp_n_to_right_vref(left_lp_opamp_n_to_right_vref),
        .left_lp_opamp_n_to_vinref(left_lp_opamp_n_to_vinref),
        .left_instramp_to_ulpcomp_p(left_instramp_to_ulpcomp_p),
        .left_instramp_to_comp_p(left_instramp_to_comp_p),
        .left_instramp_to_adc0(left_instramp_to_adc0),
        .left_instramp_to_gpio4_4(left_instramp_to_gpio4_4),
        .left_instramp_to_analog1(left_instramp_to_analog1),
        .left_instramp_to_amuxbusB(left_instramp_to_amuxbusB),
        .right_instramp_to_ulpcomp_n(right_instramp_to_ulpcomp_n),
        .right_instramp_to_comp_n(right_instramp_to_comp_n),
        .right_instramp_to_adc1(right_instramp_to_adc1),
        .right_instramp_to_analog0(right_instramp_to_analog0),
        .right_instramp_to_amuxbusA(right_instramp_to_amuxbusA),
        .right_instramp_to_gpio3_0(right_instramp_to_gpio3_0),
        .left_instramp_n_to_gpio5_7(left_instramp_n_to_gpio5_7),
        .left_instramp_n_to_analog1(left_instramp_n_to_analog1),
        .left_instramp_n_to_amuxbusB(left_instramp_n_to_amuxbusB),
        .left_instramp_n_to_sio1(left_instramp_n_to_sio1),
        .left_instramp_n_to_right_vref(left_instramp_n_to_right_vref),
        .left_instramp_n_to_vinref(left_instramp_n_to_vinref),
        .left_instramp_p_to_gpio5_6(left_instramp_p_to_gpio5_6),
        .left_instramp_p_to_analog0(left_instramp_p_to_analog0),
        .left_instramp_p_to_amuxbusA(left_instramp_p_to_amuxbusA),
        .left_instramp_p_to_sio0(left_instramp_p_to_sio0),
        .left_instramp_p_to_tempsense(left_instramp_p_to_tempsense),
        .left_instramp_p_to_left_vref(left_instramp_p_to_left_vref),
        .left_instramp_p_to_voutref(left_instramp_p_to_voutref),
        .right_instramp_n_to_analog1(right_instramp_n_to_analog1),
        .right_instramp_n_to_amuxbusB(right_instramp_n_to_amuxbusB),
        .right_instramp_n_to_sio1(right_instramp_n_to_sio1),
        .right_instramp_n_to_right_vref(right_instramp_n_to_right_vref),
        .right_instramp_n_to_vinref(right_instramp_n_to_vinref),
        .right_instramp_n_to_gpio2_6(right_instramp_n_to_gpio2_6),
        .right_instramp_p_to_analog0(right_instramp_p_to_analog0),
        .right_instramp_p_to_amuxbusA(right_instramp_p_to_amuxbusA),
		.right_instramp_p_to_sio0(right_instramp_p_to_sio0),
        .right_instramp_p_to_tempsense(right_instramp_p_to_tempsense),
        .right_instramp_p_to_left_vref(right_instramp_p_to_left_vref),
        .right_instramp_p_to_voutref(right_instramp_p_to_voutref),
        .right_instramp_p_to_gpio2_7(right_instramp_p_to_gpio2_7),
        .ulpcomp_p_to_dac0(ulpcomp_p_to_dac0),
        .ulpcomp_p_to_analog1(ulpcomp_p_to_analog1),
        .ulpcomp_p_to_sio0(ulpcomp_p_to_sio0),
        .ulpcomp_p_to_vbgtc(ulpcomp_p_to_vbgtc),
        .ulpcomp_p_to_tempsense(ulpcomp_p_to_tempsense),
        .ulpcomp_p_to_left_vref(ulpcomp_p_to_left_vref),
        .ulpcomp_p_to_voutref(ulpcomp_p_to_voutref),
        .ulpcomp_p_to_gpio6_0(ulpcomp_p_to_gpio6_0),
        .ulpcomp_p_to_gpio1_7(ulpcomp_p_to_gpio1_7),
        .ulpcomp_n_to_dac1(ulpcomp_n_to_dac1),
        .ulpcomp_n_to_analog0(ulpcomp_n_to_analog0),
        .ulpcomp_n_to_sio1(ulpcomp_n_to_sio1),
        .ulpcomp_n_to_vbgsc(ulpcomp_n_to_vbgsc),
        .ulpcomp_n_to_right_vref(ulpcomp_n_to_right_vref),
        .ulpcomp_n_to_vinref(ulpcomp_n_to_vinref),
        .ulpcomp_n_to_gpio6_1(ulpcomp_n_to_gpio6_1),
        .ulpcomp_n_to_gpio1_6(ulpcomp_n_to_gpio1_6),
        .comp_p_to_dac0(comp_p_to_dac0),
        .comp_p_to_analog1(comp_p_to_analog1),
        .comp_p_to_sio0(comp_p_to_sio0),
        .comp_p_to_vbgtc(comp_p_to_vbgtc),
        .comp_p_to_tempsense(comp_p_to_tempsense),
        .comp_p_to_left_vref(comp_p_to_left_vref),
        .comp_p_to_voutref(comp_p_to_voutref),
        .comp_p_to_gpio6_2(comp_p_to_gpio6_2),
        .comp_p_to_gpio1_5(comp_p_to_gpio1_5),
        .comp_n_to_dac1(comp_n_to_dac1),
        .comp_n_to_analog0(comp_n_to_analog0),
        .comp_n_to_sio1(comp_n_to_sio1),
        .comp_n_to_vbgsc(comp_n_to_vbgsc),
        .comp_n_to_right_vref(comp_n_to_right_vref),
        .comp_n_to_vinref(comp_n_to_vinref),
        .comp_n_to_gpio6_3(comp_n_to_gpio6_3),
        .comp_n_to_gpio1_4(comp_n_to_gpio1_4),
        .adc0_to_dac0(adc0_to_dac0),
        .adc0_to_analog1(adc0_to_analog1),
        .adc0_to_vbgtc(adc0_to_vbgtc),
        .adc0_to_tempsense(adc0_to_tempsense),
        .adc0_to_left_vref(adc0_to_left_vref),
        .adc0_to_voutref(adc0_to_voutref),
        .adc0_to_gpio6_4(adc0_to_gpio6_4),
        .adc0_to_gpio1_3(adc0_to_gpio1_3),
        .adc1_to_dac1(adc1_to_dac1),
        .adc1_to_analog0(adc1_to_analog0),
        .adc1_to_vbgsc(adc1_to_vbgsc),
        .adc1_to_right_vref(adc1_to_right_vref),
        .adc1_to_vinref(adc1_to_vinref),
        .adc1_to_gpio6_5(adc1_to_gpio6_5),
        .adc1_to_gpio1_2(adc1_to_gpio1_2),
        .sio0_connect(sio0_connect),
        .sio1_connect(sio1_connect),
        .analog0_connect(analog0_connect),
        .analog1_connect(analog1_connect),
        .vbgtc_to_user(vbgtc_to_user),
        .vbgsc_to_user(vbgsc_to_user),
        .user_to_comp_n(user_to_comp_n),
        .user_to_comp_p(user_to_comp_p),
        .user_to_ulpcomp_n(user_to_ulpcomp_n),
        .user_to_ulpcomp_p(user_to_ulpcomp_p),
        .user_to_adc0(user_to_adc0),
        .user_to_adc1(user_to_adc1),
        .dac0_to_user(dac0_to_user),
        .dac1_to_user(dac1_to_user),
        .tempsense_to_user(tempsense_to_user),
        .right_vref_to_user(right_vref_to_user),
        .left_vref_to_user(left_vref_to_user),
        .vinref_to_user(vinref_to_user),
        .voutref_to_user(voutref_to_user),
        .dac0_to_analog1(dac0_to_analog1),
		.dac1_to_analog0(dac1_to_analog0),

        `ifndef PnR
            // Analog connections to user project
            .user_voutref(user_voutref),        // SIO voltage reference 1
            .user_vinref(user_vinref),          // SIO voltage reference 2
            .user_left_vref(user_left_vref),    // GPIO OVT voltage reference 1
            .user_right_vref(user_right_vref),  // GPIO OVT voltage reference 2
            .user_tempsense(user_tempsense),    // temperature sensor output
            .user_dac0(user_dac0),              // DAC0 output
            .user_dac1(user_dac1),              // DAC1 output
            .user_vbgtc(user_vbgtc),            // Bandgap scaled output 1
            .user_vbgsc(user_vbgsc),            // Bandgap scaled output 2
            .user_adc0(user_adc0),              // ADC0 input
            .user_adc1(user_adc1),              // ADC1 input
            .user_comp_n(user_comp_n),          // Comparator negative input
            .user_comp_p(user_comp_p),          // Comparator positive input
            .user_ulpcomp_n(user_ulpcomp_n),    // ULP comparator negative input
            .user_ulpcomp_p(user_ulpcomp_p),    // ULP comparator positive input
            .user_ibias100(user_ibias100),
            .user_ibias50(user_ibias50),

            // GPIO connections to user project
            .user_gpio3_0_analog(user_gpio3_0_analog),  // Direct connection to gpio3_0 pad
            .user_gpio3_1_analog(user_gpio3_1_analog),  // Direct connection to gpio3_1 pad
            .user_gpio3_2_analog(user_gpio3_2_analog),  // Direct connection to gpio3_2 pad
            .user_gpio3_3_analog(user_gpio3_3_analog),  // Direct connection to gpio3_3 pad
            .user_gpio3_4_analog(user_gpio3_4_analog),  // Direct connection to gpio3_4 pad
            .user_gpio3_5_analog(user_gpio3_5_analog),  // Direct connection to gpio3_5 pad
            .user_gpio3_6_analog(user_gpio3_6_analog),  // Direct connection to gpio3_6 pad
            .user_gpio3_7_analog(user_gpio3_7_analog),  // Direct connection to gpio3_7 pad
            .user_gpio4_0_analog(user_gpio4_0_analog),  // Direct connection to gpio4_0 pad
            .user_gpio4_1_analog(user_gpio4_1_analog),  // Direct connection to gpio4_1 pad
            .user_gpio4_2_analog(user_gpio4_2_analog),  // Direct connection to gpio4_2 pad
            .user_gpio4_3_analog(user_gpio4_3_analog),  // Direct connection to gpio4_3 pad
            .user_gpio4_4_analog(user_gpio4_4_analog),  // Direct connection to gpio4_4 pad
            .user_gpio4_5_analog(user_gpio4_5_analog),  // Direct connection to gpio4_5 pad
            .user_gpio4_6_analog(user_gpio4_6_analog),  // Direct connection to gpio4_6 pad
            .user_gpio4_7_analog(user_gpio4_7_analog),  // Direct connection to gpio4_7 pad

            // Analog connections to padframe pins
            .gpio1_0(gpio1_0_pad_a_noesd_h),    // DAC refL
            .gpio1_1(gpio1_1_pad_a_noesd_h),    // vbg and DAC refH
            .gpio1_2(gpio1_2_pad_a_esd_0_h),    // iDAC, ibias test, adc1
            .gpio1_3(gpio1_3_pad_a_esd_0_h),    // iDAC, adc0
            .gpio1_4(gpio1_4_pad_a_esd_0_h),    // comp_n
            .gpio1_5(gpio1_5_pad_a_esd_0_h),    // comp_p
            .gpio1_6(gpio1_6_pad_a_esd_0_h),    // ulpcomp_n
            .gpio1_7(gpio1_7_pad_a_esd_0_h),    // ulpcomp_p

            .gpio2_0(gpio2_0_pad_a_esd_0_h),    // left_lp_opamp_n
            .gpio2_1(gpio2_1_pad_a_esd_0_h),    // left_lp_opamp_p
            .gpio2_2(gpio2_2_pad_a_esd_0_h),    // right_lp_opamp_n
            .gpio2_3(gpio2_3_pad_a_esd_0_h),    // right_lp_opamp_p
            .gpio2_4(gpio2_4_pad_a_esd_0_h),    // right_hgbw_opamp_n
            .gpio2_5(gpio2_5_pad_a_esd_0_h),    // right_hgbw_opamp_p
            .gpio2_6(gpio2_6_pad_a_esd_0_h),    // right_instramp_n
            .gpio2_7(gpio2_7_pad_a_esd_0_h),    // right_instramp_p

            .gpio3_0(gpio3_0_pad_a_noesd_h),    // right_instramp
            .gpio3_1(gpio3_1_pad_a_noesd_h),    // left_lp_opamp
            .gpio3_2(gpio3_2_pad_a_noesd_h),    // right_lp_opamp
            .gpio3_3(gpio3_3_pad_a_noesd_h),    // right_hgbw_opamp
            .gpio3_4(gpio3_4_pad_a_noesd_h),    // left_hgbw_opamp
            .gpio3_5(gpio3_5_pad_a_noesd_h),    // left_lp_opamp
            .gpio3_6(gpio3_6_pad_a_noesd_h),    // right_lp_opamp
            .gpio3_7(gpio3_7_pad_a_noesd_h),    // right_hgbw_opamp

            .analog0(analog_0_core),            // (many connections)
            .analog1(analog_1_core),            // (many connections)

            .gpio4_0(gpio4_0_pad_a_noesd_h),    // left_hgbw_opamp
            .gpio4_1(gpio4_1_pad_a_noesd_h),    // left_lp_opamp
            .gpio4_2(gpio4_2_pad_a_noesd_h),    // right_lp_opamp
            .gpio4_3(gpio4_3_pad_a_noesd_h),    // right_hgbw_opamp
            .gpio4_4(gpio4_4_pad_a_noesd_h),    // left_instramp
            .gpio4_5(gpio4_5_pad_a_noesd_h),    // left_lp_opamp
            .gpio4_6(gpio4_6_pad_a_noesd_h),    // right_lp_opamp
            .gpio4_7(gpio4_7_pad_a_noesd_h),    // right_hgbw_opamp

            .gpio5_0(gpio5_0_pad_a_esd_0_h),    // right_lp_opamp_p
            .gpio5_1(gpio5_1_pad_a_esd_0_h),    // right_lp_opamp_n
            .gpio5_2(gpio5_2_pad_a_esd_0_h),    // left_lp_opamp_p
            .gpio5_3(gpio5_3_pad_a_esd_0_h),    // left_lp_opamp_n
            .gpio5_4(gpio5_4_pad_a_esd_0_h),    // left_hgbw_opamp_p
            .gpio5_5(gpio5_5_pad_a_esd_0_h),    // left_hgbw_opamp_n
            .gpio5_6(gpio5_6_pad_a_esd_0_h),    // left_instramp_p
            .gpio5_7(gpio5_7_pad_a_esd_0_h),    // left_instramp_n

            .gpio6_0(gpio6_0_pad_a_esd_0_h),    // ulpcomp_p
            .gpio6_1(gpio6_1_pad_a_esd_0_h),    // ulpcomp_n
            .gpio6_2(gpio6_2_pad_a_esd_0_h),    // comp_p
            .gpio6_3(gpio6_3_pad_a_esd_0_h),    // comp_n
            .gpio6_4(gpio6_4_pad_a_esd_0_h),    // adc0
            .gpio6_5(gpio6_5_pad_a_esd_0_h),    // adc1
            .gpio6_6(gpio6_6_pad_a_noesd_h),    // ADC refH
            .gpio6_7(gpio6_7_pad_a_noesd_h),    // ADC refL

            .sio0(sio_pad_a_noesd_h[1]),        // (many connections)
            .sio1(sio_pad_a_esd_0_h[0]),        // (many connections)

            .amuxbus_a_n(amuxbus_a_n),             // (many connections)
            .amuxbus_b_n(amuxbus_b_n),             // (many connections)

            // Other analog connections to padframe
            .voutref(sio_voutref_dft),      // through analog channel to sio
            .vinref(sio_vinref_dft),        // through analog channel to sio
            .vbg(sio_vohref),               // through analog channel to sio (vohref)
            .right_vref(pad_right_vref),    // center right gpio_ovt reference
            .left_vref(pad_left_vref),      // center left gpio_ovt reference
            
            // Analog connections to timing subsystem
            .ibias_lsxo(ibias_lsxo),      // through analog channel to bottom of chip
            .ibias_hsxo(ibias_hsxo),      // through analog channel to bottom of chip
        `endif // !PnR

		.audiodac_out_to_analog1(audiodac_out_to_analog1),
		.audiodac_outb_to_analog0(audiodac_outb_to_analog0)
    );

frigate_timing_frontend timing_frontend (
`ifdef USE_POWER_PINS
    .vdda3      (vdda3),
    .vssa3      (vssa3),
    .vccd0      (vccd0),
    .vssd0      (vssd0),
`endif

   // Reset pin level shifter (xres_buf)
   .resetb_in_h(resetb_xres_h_n),		// NOTE: 3.3V domain signal
   .resetb_out_l(xrst_n),		// NOTE: 1.8V domain signal

   // 16MHz R-C oscillator
   .rc_osc_16M_ena(rcosc_16m_en),	// NOTE: default 1
   .rc_osc_16M_dout(rcosc_16m),

   // 500kHz R-C oscillator
   .rc_osc_500k_ena(rcosc_500k_en),
   .rc_osc_500k_dout(rcosc_500k),

   // LSXO
   .lsxo_ena(lsxo_en),
   .lsxo_standby(lsxo_standby),
   .lsxo_dout(lsxo),
   `ifndef PnR
        .lsxo_ibias(ibias_lsxo), // analog bias current
        .lsxo_xin(xi0_core),     // analog pad connection
        .lsxo_xout(xo0_core),    // analog pad connection
    `endif // !PnR

   // HSXO
   .hsxo_standby(hsxo_standby),
   .hsxo_dout(hsxo),
   `ifndef PnR
        .hsxo_ibias(ibias_hsxo), // analog bias current
        .hsxo_xin(xi1_core),     // analog pad connection
        .hsxo_xout(xo1_core),    // analog pad connection
    `endif // !PnR
   .hsxo_ena(hsxo_en)
);

  /* GPIO defaults (via programmed) */

  wire [15:0] gpio_defaults [`MPRJ_IO_PADS-1:0];

  /* Fixed defaults for the first 7 GPIO pins */

    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_PULLDOWN))
`endif
    gpio_defaults_block_0 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[0])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_OUTPUT))
`endif
    gpio_defaults_block_1 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[1])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_PULLDOWN))
`endif
    gpio_defaults_block_2 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[2])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_PULLUP))
`endif
    gpio_defaults_block_3 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[3])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_PULLDOWN))
`endif
    gpio_defaults_block_4 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[4])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_BIDIRECTIONAL))
`endif
    gpio_defaults_block_5 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[5])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_BIDIRECTIONAL))
`endif
    gpio_defaults_block_6 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[6])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_PULLDOWN))
`endif
    gpio_defaults_block_7 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[7])
    );
    
gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_8_INIT))
`endif
    gpio_defaults_block_8 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[8])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_9_INIT))
`endif
    gpio_defaults_block_9 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[9])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_10_INIT))
`endif
    gpio_defaults_block_10 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[10])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_11_INIT))
`endif
    gpio_defaults_block_11 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[11])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_12_INIT))
`endif
    gpio_defaults_block_12 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[12])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_13_INIT))
`endif
    gpio_defaults_block_13 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[13])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_14_INIT))
`endif
    gpio_defaults_block_14 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[14])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_15_INIT))
`endif
    gpio_defaults_block_15 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[15])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_16_INIT))
`endif
    gpio_defaults_block_16 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[16])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_17_INIT))
`endif
    gpio_defaults_block_17 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[17])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_18_INIT))
`endif
    gpio_defaults_block_18 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[18])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_19_INIT))
`endif
    gpio_defaults_block_19 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[19])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_20_INIT))
`endif
    gpio_defaults_block_20 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[20])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_21_INIT))
`endif
    gpio_defaults_block_21 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[21])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_22_INIT))
`endif
    gpio_defaults_block_22 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[22])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_23_INIT))
`endif
    gpio_defaults_block_23 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[23])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_24_INIT))
`endif
    gpio_defaults_block_24 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[24])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_25_INIT))
`endif
    gpio_defaults_block_25 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[25])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_26_INIT))
`endif
    gpio_defaults_block_26 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[26])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_27_INIT))
`endif
    gpio_defaults_block_27 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[27])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_28_INIT))
`endif
    gpio_defaults_block_28 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[28])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_29_INIT))
`endif
    gpio_defaults_block_29 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[29])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_30_INIT))
`endif
    gpio_defaults_block_30 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[30])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_31_INIT))
`endif
    gpio_defaults_block_31 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[31])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_32_INIT))
`endif
    gpio_defaults_block_32 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[32])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_33_INIT))
`endif
    gpio_defaults_block_33 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[33])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_34_INIT))
`endif
    gpio_defaults_block_34 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[34])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_35_INIT))
`endif
    gpio_defaults_block_35 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[35])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_36_INIT))
`endif
    gpio_defaults_block_36 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[36])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_37_INIT))
`endif
    gpio_defaults_block_37 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[37])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_38_INIT))
`endif
    gpio_defaults_block_38 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[38])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_39_INIT))
`endif
    gpio_defaults_block_39 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[39])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_40_INIT))
`endif
    gpio_defaults_block_40 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[40])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_41_INIT))
`endif
    gpio_defaults_block_41 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[41])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_42_INIT))
`endif
    gpio_defaults_block_42 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[42])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_43_INIT))
`endif
    gpio_defaults_block_43 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[43])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_44_INIT))
`endif
    gpio_defaults_block_44 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[44])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_45_INIT))
`endif
    gpio_defaults_block_45 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[45])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_46_INIT))
`endif
    gpio_defaults_block_46 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[46])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_47_INIT))
`endif
    gpio_defaults_block_47 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[47])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_48_INIT))
`endif
    gpio_defaults_block_48 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[48])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_49_INIT))
`endif
    gpio_defaults_block_49 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[49])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_50_INIT))
`endif
    gpio_defaults_block_50 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[50])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_51_INIT))
`endif
    gpio_defaults_block_51 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[51])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_52_INIT))
`endif
    gpio_defaults_block_52 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[52])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_53_INIT))
`endif
    gpio_defaults_block_53 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[53])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_54_INIT))
`endif
    gpio_defaults_block_54 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[54])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_55_INIT))
`endif
    gpio_defaults_block_55 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[55])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_56_INIT))
`endif
    gpio_defaults_block_56 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[56])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_57_INIT))
`endif
    gpio_defaults_block_57 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[57])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_58_INIT))
`endif
    gpio_defaults_block_58 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[58])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_59_INIT))
`endif
    gpio_defaults_block_59 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[59])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_60_INIT))
`endif
    gpio_defaults_block_60 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[60])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_61_INIT))
`endif
    gpio_defaults_block_61 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[61])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_62_INIT))
`endif
    gpio_defaults_block_62 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[62])
    );

gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`USER_CONFIG_GPIO_63_INIT))
`endif
    gpio_defaults_block_63 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[63])
    );


    /* Defaults for the last 2 GPIO pins (SIO) */
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_BIDIRECTIONAL))
`endif
    gpio_defaults_block_64 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[`MPRJ_IO_PADS-2])
    );
    gpio_defaults_block_16bit
`ifndef __pnr__
    #(.GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_BIDIRECTIONAL))
`endif
    gpio_defaults_block_65 (
        `ifdef USE_POWER_PINS
        .VPWR(vccd0),
        .VGND(vssd0),
        `endif
    .gpio_defaults(gpio_defaults[`MPRJ_IO_PADS-1])
    );

  /* Section 1 GPIOs (GPIO 0 to 7) */
wire NC_0; // no connect
  gpio_control_block gpio_control_7_0 [7:0] (
`ifdef USE_POWER_PINS
    .vccd(vccd0),
    .vssd(vssd0),
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
    .gpio_defaults({gpio_defaults[7], gpio_defaults[6], gpio_defaults[5], gpio_defaults[4], gpio_defaults[3], gpio_defaults[2], gpio_defaults[1], gpio_defaults[0]}),

    // Management Soc-facing signals
    .resetn(gpio_resetn_1_shifted[7:0]),
    .serial_clock(gpio_clock_1_shifted[7:0]),
    .serial_load(gpio_load_1_shifted[7:0]),

    .resetn_out(gpio_resetn_1[7:0]),
    .serial_clock_out(gpio_clock_1[7:0]),
    .serial_load_out(gpio_load_1[7:0]),

    .mgmt_gpio_in   ({test, usb_dn_rx,  usb_dp_rx,  hk_spi_sck, hk_spi_csb, hk_spi_sdi, NC_0,       debug}),
    .mgmt_gpio_out  ({1'b0, usb_dn_tx,  usb_dp_tx,  1'b0,       1'b1,       1'b0,       hk_spi_sdo, 1'b0}),
    .mgmt_gpio_oeb  ({1'b0, ~usb_tx_en, ~usb_tx_en, 1'b0,       1'b0,       1'b0,       1'b0,       1'b0}),

    // Serial data chain for pad configuration
    .serial_data_in(gpio_serial_link_1_shifted[7:0]),
    .serial_data_out(gpio_serial_link_1[7:0]),

    // User-facing signals
    .user_gpio_out(user_gpio_out[7:0]),
    .user_gpio_oeb(user_gpio_oeb[7:0]),
    .user_gpio_in(user_gpio_in[7:0]),

    // Pad-facing signals (Pad GPIOv2)
    .pad_gpio_inenb(mprj_io_inp_dis[7:0]),
    .pad_gpio_ib_mode_sel(mprj_io_ib_mode_sel[7:0]),
    .pad_gpio_vtrip_sel(mprj_io_vtrip_sel[7:0]),
    .pad_gpio_slow_sel(mprj_io_slow_sel[7:0]),
    .pad_gpio_holdover(mprj_io_holdover[7:0]),
    .pad_gpio_ana_en(mprj_io_analog_en[7:0]),
    .pad_gpio_ana_sel(mprj_io_analog_sel[7:0]),
    .pad_gpio_ana_pol(mprj_io_analog_pol[7:0]),
    .pad_gpio_dm(mprj_io_dm[23:0]),
    .pad_gpio_outenb(mprj_io_oeb[7:0]),
    .pad_gpio_out(mprj_io_out[7:0]),
    .pad_gpio_slew_ctl(mprj_slew_ctl[15:0]),
    .pad_gpio_hys_trim(mprj_hys_trim[7:0]),
    .pad_gpio_in(mprj_io_in[7:0])
);

  /* Section 1 GPIOs (GPIO 8 to 32) */
  gpio_control_block_mgmt_monitor gpio_control_32_8 [`MPRJ_IO_PADS_1-1:8] (
`ifdef USE_POWER_PINS
    .vccd(vccd0),
    .vssd(vssd0),
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif

    .gpio_defaults({
        gpio_defaults[32],
        gpio_defaults[31],
        gpio_defaults[30],
        gpio_defaults[29],
        gpio_defaults[28],
        gpio_defaults[27],
        gpio_defaults[26],
        gpio_defaults[25],
        gpio_defaults[24],
        gpio_defaults[23],
        gpio_defaults[22],
        gpio_defaults[21],
        gpio_defaults[20],
        gpio_defaults[19],
        gpio_defaults[18],
        gpio_defaults[17],
        gpio_defaults[16],
        gpio_defaults[15],
        gpio_defaults[14],
        gpio_defaults[13],
        gpio_defaults[12],
        gpio_defaults[11],
        gpio_defaults[10],
        gpio_defaults[9],
        gpio_defaults[8]
    }),

    // Management Soc-facing signals

    .resetn(gpio_resetn_1_shifted[(`MPRJ_IO_PADS_1-1):8]),
    .serial_clock(gpio_clock_1_shifted[(`MPRJ_IO_PADS_1-1):8]),
    .serial_load(gpio_load_1_shifted[(`MPRJ_IO_PADS_1-1):8]),

    .resetn_out(gpio_resetn_1[(`MPRJ_IO_PADS_1-1):8]),
    .serial_clock_out(gpio_clock_1[(`MPRJ_IO_PADS_1-1):8]),
    .serial_load_out(gpio_load_1[(`MPRJ_IO_PADS_1-1):8]),

    .mgmt_gpio_in(pin_mux_io_in[(`MPRJ_IO_PADS_1-1)-8:0]),
    .mgmt_gpio_out(pin_mux_io_out[(`MPRJ_IO_PADS_1-1)-8:0]),
    .mgmt_gpio_oeb(pin_mux_io_oeb[(`MPRJ_IO_PADS_1-1)-8:0]),

    // Serial data chain for pad configuration
    .serial_data_in(gpio_serial_link_1_shifted[(`MPRJ_IO_PADS_1-1):8]),
    .serial_data_out(gpio_serial_link_1[(`MPRJ_IO_PADS_1-1):8]),

    // User-facing signals
    .user_gpio_out(user_gpio_out[(`MPRJ_IO_PADS_1-1):8]),
    .user_gpio_oeb(user_gpio_oeb[(`MPRJ_IO_PADS_1-1):8]),
    .user_gpio_in(user_gpio_in[(`MPRJ_IO_PADS_1-1):8]),

    // Pad-facing signals (Pad GPIOv2)
    .pad_gpio_inenb(mprj_io_inp_dis[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_ib_mode_sel(mprj_io_ib_mode_sel[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_vtrip_sel(mprj_io_vtrip_sel[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_slow_sel(mprj_io_slow_sel[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_holdover(mprj_io_holdover[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_ana_en(mprj_io_analog_en[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_ana_sel(mprj_io_analog_sel[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_ana_pol(mprj_io_analog_pol[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_dm(mprj_io_dm[(`MPRJ_IO_PADS_1*3-1):24]),
    .pad_gpio_outenb(mprj_io_oeb[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_out(mprj_io_out[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_slew_ctl(mprj_slew_ctl[(`MPRJ_IO_PADS_1*2-1):16]),
    .pad_gpio_hys_trim(mprj_hys_trim[(`MPRJ_IO_PADS_1-1):8]),
    .pad_gpio_in(mprj_io_in[(`MPRJ_IO_PADS_1-1):8])
);

    /* JTAG/GPIO PORTS */
    wire [7:0] port7_mgmt_in;
    wire [7:0] port7_mgmt_out;
    wire [7:0] port7_mgmt_oeb;
    assign jtag_clk = debug ? port7_mgmt_in[0] : 1'b0;
    assign gpioG_io_in[0] = ~debug ? port7_mgmt_in[0] : 1'b0;
    assign port7_mgmt_out[0] = gpioG_io_out[0];
    assign port7_mgmt_oeb[0] = debug ? 1'b1: ~gpioG_io_oe[0];

    assign jtag_reset_n = debug ? port7_mgmt_in[1] : 1'b0;
    assign gpioG_io_in[1] = ~debug ? port7_mgmt_in[1] : 1'b0;
    assign port7_mgmt_out[1] = gpioG_io_out[1];
    assign port7_mgmt_oeb[1] = debug ? 1'b1: ~gpioG_io_oe[1];

    assign jtag_select = debug ? port7_mgmt_in[2] : 1'b0;
    assign gpioG_io_in[2] = ~debug ? port7_mgmt_in[2] : 1'b0;
    assign port7_mgmt_out[2] = gpioG_io_out[2];
    assign port7_mgmt_oeb[2] = debug ? 1'b1: ~gpioG_io_oe[2];

    assign jtag_in = debug ? port7_mgmt_in[3] : 1'b0;
    assign gpioG_io_in[3] = ~debug ? port7_mgmt_in[3] : 1'b0;
    assign port7_mgmt_out[3] = gpioG_io_out[3];
    assign port7_mgmt_oeb[3] = debug ? 1'b1: ~gpioG_io_oe[3];

    assign gpioG_io_in[4] = ~debug ? port7_mgmt_in[4] : 1'b0;
    assign port7_mgmt_out[4] = debug ? jtag_out : gpioG_io_out[4];
    assign port7_mgmt_oeb[4] = debug ? 1'b0: ~gpioG_io_oe[4];

    assign gpioG_io_in[7:5] = port7_mgmt_in[7:5];
    assign port7_mgmt_out[7:5] = gpioG_io_out[7:5];
    assign port7_mgmt_oeb[7:5] = ~gpioG_io_oe[7:5];

  /* Section 2 GPIOs (GPIO 33 to 65) */
  gpio_control_block_mgmt_monitor gpio_control_65_33 [`MPRJ_IO_PADS-1:`MPRJ_IO_PADS_1] (
`ifdef USE_POWER_PINS
    .vccd(vccd0),
    .vssd(vssd0),
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif

    .gpio_defaults({
        gpio_defaults[65],
        gpio_defaults[64],
        gpio_defaults[63],
        gpio_defaults[62],
        gpio_defaults[61],
        gpio_defaults[60],
        gpio_defaults[59],
        gpio_defaults[58],
        gpio_defaults[57],
        gpio_defaults[56],
        gpio_defaults[55],
        gpio_defaults[54],
        gpio_defaults[53],
        gpio_defaults[52],
        gpio_defaults[51],
        gpio_defaults[50],
        gpio_defaults[49],
        gpio_defaults[48],
        gpio_defaults[47],
        gpio_defaults[46],
        gpio_defaults[45],
        gpio_defaults[44],
        gpio_defaults[43],
        gpio_defaults[42],
        gpio_defaults[41],
        gpio_defaults[40],
        gpio_defaults[39],
        gpio_defaults[38],
        gpio_defaults[37],
        gpio_defaults[36],
        gpio_defaults[35],
        gpio_defaults[34],
        gpio_defaults[33]
    }),

        // Management Soc-facing signals

    .resetn(gpio_resetn_2_shifted[`MPRJ_IO_PADS_2-1:0]),
    .serial_clock(gpio_clock_2_shifted[`MPRJ_IO_PADS_2-1:0]),
    .serial_load(gpio_load_2_shifted[`MPRJ_IO_PADS_2-1:0]),

    .resetn_out(gpio_resetn_2[`MPRJ_IO_PADS_2-1:0]),
    .serial_clock_out(gpio_clock_2[`MPRJ_IO_PADS_2-1:0]),
    .serial_load_out(gpio_load_2[`MPRJ_IO_PADS_2-1:0]),

    .mgmt_gpio_in   ({gpioI_io_in,  port7_mgmt_in,  pin_mux_io_in[47:(`MPRJ_IO_PADS_1-8)]}),
    .mgmt_gpio_out  ({gpioI_io_out, port7_mgmt_out, pin_mux_io_out[47:(`MPRJ_IO_PADS_1-8)]}),
    .mgmt_gpio_oeb  ({~gpioI_io_oe, port7_mgmt_oeb, pin_mux_io_oeb[47:(`MPRJ_IO_PADS_1-8)]}),

    // Serial data chain for pad configuration
    .serial_data_in(gpio_serial_link_2_shifted[(`MPRJ_IO_PADS_2-1):0]),
    .serial_data_out(gpio_serial_link_2[(`MPRJ_IO_PADS_2-1):0]),

    // User-facing signals
    .user_gpio_out(user_gpio_out[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .user_gpio_oeb(user_gpio_oeb[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .user_gpio_in(user_gpio_in[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),

    // Pad-facing signals (Pad GPIOv2)
    .pad_gpio_inenb(mprj_io_inp_dis[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_ib_mode_sel(mprj_io_ib_mode_sel[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_vtrip_sel(mprj_io_vtrip_sel[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_slow_sel(mprj_io_slow_sel[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_holdover(mprj_io_holdover[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_ana_en(mprj_io_analog_en[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_ana_sel(mprj_io_analog_sel[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_ana_pol(mprj_io_analog_pol[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_dm(mprj_io_dm[(`MPRJ_IO_PADS*3-1):(`MPRJ_IO_PADS_1*3)]),
    .pad_gpio_outenb(mprj_io_oeb[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_out(mprj_io_out[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_slew_ctl(mprj_slew_ctl[(`MPRJ_IO_PADS*2-1):(`MPRJ_IO_PADS_1*2)]),
    .pad_gpio_hys_trim(mprj_hys_trim[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)]),
    .pad_gpio_in(mprj_io_in[(`MPRJ_IO_PADS-1):(`MPRJ_IO_PADS_1)])
);

    // resetb PAD
    wire xres_vss_loop;
    assign resetb_pad_a_esd_h = resetb_tie_weak_hi_h;
    assign resetb_disable_pullup_h = xres_vss_loop;
    // assign resetb_tie_hi_esd =
    assign xres_vss_loop = resetb_tie_lo_esd;
    assign resetb_inp_sel_h = xres_vss_loop;
    assign resetb_en_vddio_sig_h = xres_vss_loop;
    assign resetb_filt_in_h = xres_vss_loop;
    //assign resetb_pullup_h = 

    assign resetb_enable_h = porb_h[0] ;
    assign resetb_enable_vddio = select_one;

    // muxsplit
    assign muxsplit_ne_enable_vdda_h = porb_h[1] ;
    assign muxsplit_ne_hld_vdda_h_n = gpio2_7_tie_hi_esd; // nearest tie hi esd
    assign muxsplit_nw_enable_vdda_h = porb_h[0] ;
    assign muxsplit_nw_hld_vdda_h_n = gpio5_0_tie_hi_esd; // nearest tie hi esd
    assign muxsplit_se_enable_vdda_h = porb_h[1] ;
    assign muxsplit_se_hld_vdda_h_n = gpio0_0_tie_hi_esd; // nearest tie hi esd
    assign muxsplit_sw_enable_vdda_h = porb_h[0] ;
    assign muxsplit_sw_hld_vdda_h_n = gpio7_7_tie_hi_esd; // nearest tie hi esd

    // vref
    assign vref_e_enable_h = porb_h[1];
    assign vref_e_hld_h_n = gpio1_4_tie_hi_esd; // nearest tie hi esd
    assign vref_w_enable_h = porb_h[0];
    assign vref_w_hld_h_n = gpio6_4_tie_hi_esd; // nearest tie hi esd

    // Select
    assign mgmt_select = select_in;
    assign select_enable_vddio = select_one;
    assign select_slow = select_zero;
    assign select_analog_en = select_zero;
    assign select_analog_pol = select_zero;
    assign select_inp_dis = select_zero;
    assign select_enable_inp_h = select_tie_lo_esd;
    assign select_enable_h = porb_h[0];
    assign select_hld_h_n = select_tie_hi_esd;
    assign select_analog_sel = select_zero;
    assign select_dm = 3'b011;
    assign select_hld_ovr = select_zero;
    assign select_out = select_zero;
    assign select_enable_vswitch_h = select_tie_hi_esd;
    assign select_enable_vdda_h = porb_h[0];
    assign select_vtrip_sel = select_zero;
    assign select_ib_mode_sel = select_zero;
    assign select_oe_n = select_zero;

    // CONFIGURABLE GPIOs PAD FRAME MAPPING

    // GPIO 0
    assign mprj_io_in[0] = gpio0_0_in;
    assign gpio0_0_out = mprj_io_out[0];
    assign gpio0_0_oe_n = mprj_io_oeb[0];
    assign gpio0_0_inp_dis = mprj_io_inp_dis[0];
    assign gpio0_0_ib_mode_sel = mprj_io_ib_mode_sel[0];
    assign gpio0_0_vtrip_sel = mprj_io_vtrip_sel[0];
    assign gpio0_0_slow = mprj_io_slow_sel[0];
    assign gpio0_0_hld_ovr = mprj_io_holdover[0];
    assign gpio0_0_analog_en = mprj_io_analog_en[0];
    assign gpio0_0_analog_sel = mprj_io_analog_sel[0];
    assign gpio0_0_analog_pol = mprj_io_analog_pol[0];
    assign gpio0_0_dm = mprj_io_dm[2:0];
    assign gpio0_0_enable_vddio = gpio0_0_one;
    assign gpio0_0_enable_inp_h = gpio0_0_tie_lo_esd;
    assign gpio0_0_enable_h = porb_h[1];
    assign gpio0_0_hld_h_n = gpio0_0_tie_hi_esd;
    assign gpio0_0_enable_vswitch_h = gpio0_0_tie_hi_esd;
    assign gpio0_0_enable_vdda_h = porb_h[1];

    // GPIO 1
    assign mprj_io_in[1] = gpio0_1_in;
    assign gpio0_1_out = mprj_io_out[1];
    assign gpio0_1_oe_n = mprj_io_oeb[1];
    assign gpio0_1_inp_dis = mprj_io_inp_dis[1];
    assign gpio0_1_ib_mode_sel = mprj_io_ib_mode_sel[1];
    assign gpio0_1_vtrip_sel = mprj_io_vtrip_sel[1];
    assign gpio0_1_slow = mprj_io_slow_sel[1];
    assign gpio0_1_hld_ovr = mprj_io_holdover[1];
    assign gpio0_1_analog_en = mprj_io_analog_en[1];
    assign gpio0_1_analog_sel = mprj_io_analog_sel[1];
    assign gpio0_1_analog_pol = mprj_io_analog_pol[1];
    assign gpio0_1_dm = mprj_io_dm[5:3];
    assign gpio0_1_enable_vddio = gpio0_1_one;
    assign gpio0_1_enable_inp_h = gpio0_1_tie_lo_esd;
    assign gpio0_1_enable_h = porb_h[1];
    assign gpio0_1_hld_h_n = gpio0_1_tie_hi_esd;
    assign gpio0_1_enable_vswitch_h = gpio0_1_tie_hi_esd;
    assign gpio0_1_enable_vdda_h = porb_h[1];

    // GPIO 2
    assign mprj_io_in[2] = gpio0_2_in;
    assign gpio0_2_out = mprj_io_out[2];
    assign gpio0_2_oe_n = mprj_io_oeb[2];
    assign gpio0_2_inp_dis = mprj_io_inp_dis[2];
    assign gpio0_2_ib_mode_sel = mprj_io_ib_mode_sel[2];
    assign gpio0_2_vtrip_sel = mprj_io_vtrip_sel[2];
    assign gpio0_2_slow = mprj_io_slow_sel[2];
    assign gpio0_2_hld_ovr = mprj_io_holdover[2];
    assign gpio0_2_analog_en = mprj_io_analog_en[2];
    assign gpio0_2_analog_sel = mprj_io_analog_sel[2];
    assign gpio0_2_analog_pol = mprj_io_analog_pol[2];
    assign gpio0_2_dm = mprj_io_dm[8:6];
    assign gpio0_2_enable_vddio = gpio0_2_one;
    assign gpio0_2_enable_inp_h = gpio0_2_tie_lo_esd;
    assign gpio0_2_enable_h = porb_h[1];
    assign gpio0_2_hld_h_n = gpio0_2_tie_hi_esd;
    assign gpio0_2_enable_vswitch_h = gpio0_2_tie_hi_esd;
    assign gpio0_2_enable_vdda_h = porb_h[1];

    // GPIO 3
    assign mprj_io_in[3] = gpio0_3_in;
    assign gpio0_3_out = mprj_io_out[3];
    assign gpio0_3_oe_n = mprj_io_oeb[3];
    assign gpio0_3_inp_dis = mprj_io_inp_dis[3];
    assign gpio0_3_ib_mode_sel = mprj_io_ib_mode_sel[3];
    assign gpio0_3_vtrip_sel = mprj_io_vtrip_sel[3];
    assign gpio0_3_slow = mprj_io_slow_sel[3];
    assign gpio0_3_hld_ovr = mprj_io_holdover[3];
    assign gpio0_3_analog_en = mprj_io_analog_en[3];
    assign gpio0_3_analog_sel = mprj_io_analog_sel[3];
    assign gpio0_3_analog_pol = mprj_io_analog_pol[3];
    assign gpio0_3_dm = mprj_io_dm[11:9];
    assign gpio0_3_enable_vddio = gpio0_3_one;
    assign gpio0_3_enable_inp_h = gpio0_3_tie_lo_esd;
    assign gpio0_3_enable_h = porb_h[1];
    assign gpio0_3_hld_h_n = gpio0_3_tie_hi_esd;
    assign gpio0_3_enable_vswitch_h = gpio0_3_tie_hi_esd;
    assign gpio0_3_enable_vdda_h = porb_h[1];

    // GPIO 4
    assign mprj_io_in[4] = gpio0_4_in;
    assign gpio0_4_out = mprj_io_out[4];
    assign gpio0_4_oe_n = mprj_io_oeb[4];
    assign gpio0_4_inp_dis = mprj_io_inp_dis[4];
    assign gpio0_4_ib_mode_sel = mprj_io_ib_mode_sel[4];
    assign gpio0_4_vtrip_sel = mprj_io_vtrip_sel[4];
    assign gpio0_4_slow = mprj_io_slow_sel[4];
    assign gpio0_4_hld_ovr = mprj_io_holdover[4];
    assign gpio0_4_analog_en = mprj_io_analog_en[4];
    assign gpio0_4_analog_sel = mprj_io_analog_sel[4];
    assign gpio0_4_analog_pol = mprj_io_analog_pol[4];
    assign gpio0_4_dm = mprj_io_dm[14:12];
    assign gpio0_4_enable_vddio = gpio0_4_one;
    assign gpio0_4_enable_inp_h = gpio0_4_tie_lo_esd;
    assign gpio0_4_enable_h = porb_h[1];
    assign gpio0_4_hld_h_n = gpio0_4_tie_hi_esd;
    assign gpio0_4_enable_vswitch_h = gpio0_4_tie_hi_esd;
    assign gpio0_4_enable_vdda_h = porb_h[1];

    // GPIO 5
    assign mprj_io_in[5] = gpio0_5_in;
    assign gpio0_5_out = mprj_io_out[5];
    assign gpio0_5_oe_n = mprj_io_oeb[5];
    assign gpio0_5_inp_dis = mprj_io_inp_dis[5];
    assign gpio0_5_ib_mode_sel = mprj_io_ib_mode_sel[5];
    assign gpio0_5_vtrip_sel = mprj_io_vtrip_sel[5];
    assign gpio0_5_slow = mprj_io_slow_sel[5];
    assign gpio0_5_hld_ovr = mprj_io_holdover[5];
    assign gpio0_5_analog_en = mprj_io_analog_en[5];
    assign gpio0_5_analog_sel = mprj_io_analog_sel[5];
    assign gpio0_5_analog_pol = mprj_io_analog_pol[5];
    assign gpio0_5_dm = mprj_io_dm[17:15];
    assign gpio0_5_enable_vddio = gpio0_5_one;
    assign gpio0_5_enable_inp_h = gpio0_5_tie_lo_esd;
    assign gpio0_5_enable_h = porb_h[1];
    assign gpio0_5_hld_h_n = gpio0_5_tie_hi_esd;
    assign gpio0_5_enable_vswitch_h = gpio0_5_tie_hi_esd;
    assign gpio0_5_enable_vdda_h = porb_h[1];

    // GPIO 6
    assign mprj_io_in[6] = gpio0_6_in;
    assign gpio0_6_out = mprj_io_out[6];
    assign gpio0_6_oe_n = mprj_io_oeb[6];
    assign gpio0_6_inp_dis = mprj_io_inp_dis[6];
    assign gpio0_6_ib_mode_sel = mprj_io_ib_mode_sel[6];
    assign gpio0_6_vtrip_sel = mprj_io_vtrip_sel[6];
    assign gpio0_6_slow = mprj_io_slow_sel[6];
    assign gpio0_6_hld_ovr = mprj_io_holdover[6];
    assign gpio0_6_analog_en = mprj_io_analog_en[6];
    assign gpio0_6_analog_sel = mprj_io_analog_sel[6];
    assign gpio0_6_analog_pol = mprj_io_analog_pol[6];
    assign gpio0_6_dm = mprj_io_dm[20:18];
    assign gpio0_6_enable_vddio = gpio0_6_one;
    assign gpio0_6_enable_inp_h = gpio0_6_tie_lo_esd;
    assign gpio0_6_enable_h = porb_h[1];
    assign gpio0_6_hld_h_n = gpio0_6_tie_hi_esd;
    assign gpio0_6_enable_vswitch_h = gpio0_6_tie_hi_esd;
    assign gpio0_6_enable_vdda_h = porb_h[1];

    // GPIO 7
    assign mprj_io_in[7] = gpio0_7_in;
    assign gpio0_7_out = mprj_io_out[7];
    assign gpio0_7_oe_n = mprj_io_oeb[7];
    assign gpio0_7_inp_dis = mprj_io_inp_dis[7];
    assign gpio0_7_ib_mode_sel = mprj_io_ib_mode_sel[7];
    assign gpio0_7_vtrip_sel = mprj_io_vtrip_sel[7];
    assign gpio0_7_slow = mprj_io_slow_sel[7];
    assign gpio0_7_hld_ovr = mprj_io_holdover[7];
    assign gpio0_7_analog_en = mprj_io_analog_en[7];
    assign gpio0_7_analog_sel = mprj_io_analog_sel[7];
    assign gpio0_7_analog_pol = mprj_io_analog_pol[7];
    assign gpio0_7_dm = mprj_io_dm[23:21];
    assign gpio0_7_enable_vddio = gpio0_7_one;
    assign gpio0_7_enable_inp_h = gpio0_7_tie_lo_esd;
    assign gpio0_7_enable_h = porb_h[1];
    assign gpio0_7_hld_h_n = gpio0_7_tie_hi_esd;
    assign gpio0_7_enable_vswitch_h = gpio0_7_tie_hi_esd;
    assign gpio0_7_enable_vdda_h = porb_h[1];

    // GPIO 8
    assign mprj_io_in[8] = gpio1_0_in;
    assign gpio1_0_out = mprj_io_out[8];
    assign gpio1_0_oe_n = mprj_io_oeb[8];
    assign gpio1_0_inp_dis = mprj_io_inp_dis[8];
    assign gpio1_0_ib_mode_sel = mprj_io_ib_mode_sel[8];
    assign gpio1_0_vtrip_sel = mprj_io_vtrip_sel[8];
    assign gpio1_0_slow = mprj_io_slow_sel[8];
    assign gpio1_0_hld_ovr = mprj_io_holdover[8];
    assign gpio1_0_analog_en = mprj_io_analog_en[8];
    assign gpio1_0_analog_sel = mprj_io_analog_sel[8];
    assign gpio1_0_analog_pol = mprj_io_analog_pol[8];
    assign gpio1_0_dm = mprj_io_dm[26:24];
    assign gpio1_0_enable_vddio = gpio1_0_one;
    assign gpio1_0_enable_inp_h = gpio1_0_tie_lo_esd;
    assign gpio1_0_enable_h = porb_h[1];
    assign gpio1_0_hld_h_n = gpio1_0_tie_hi_esd;
    assign gpio1_0_enable_vswitch_h = gpio1_0_tie_hi_esd;
    assign gpio1_0_enable_vdda_h = porb_h[1];
    assign gpio1_0_slew_ctl = mprj_slew_ctl[17:16];
    assign gpio1_0_hys_trim = mprj_hys_trim[8];

    // GPIO 9
    assign mprj_io_in[9] = gpio1_1_in;
    assign gpio1_1_out = mprj_io_out[9];
    assign gpio1_1_oe_n = mprj_io_oeb[9];
    assign gpio1_1_inp_dis = mprj_io_inp_dis[9];
    assign gpio1_1_ib_mode_sel = mprj_io_ib_mode_sel[9];
    assign gpio1_1_vtrip_sel = mprj_io_vtrip_sel[9];
    assign gpio1_1_slow = mprj_io_slow_sel[9];
    assign gpio1_1_hld_ovr = mprj_io_holdover[9];
    assign gpio1_1_analog_en = mprj_io_analog_en[9];
    assign gpio1_1_analog_sel = mprj_io_analog_sel[9];
    assign gpio1_1_analog_pol = mprj_io_analog_pol[9];
    assign gpio1_1_dm = mprj_io_dm[29:27];
    assign gpio1_1_enable_vddio = gpio1_1_one;
    assign gpio1_1_enable_inp_h = gpio1_1_tie_lo_esd;
    assign gpio1_1_enable_h = porb_h[1];
    assign gpio1_1_hld_h_n = gpio1_1_tie_hi_esd;
    assign gpio1_1_enable_vswitch_h = gpio1_1_tie_hi_esd;
    assign gpio1_1_enable_vdda_h = porb_h[1];
    assign gpio1_1_slew_ctl = mprj_slew_ctl[19:18];
    assign gpio1_1_hys_trim = mprj_hys_trim[9];

    // GPIO 10
    assign mprj_io_in[10] = gpio1_2_in;
    assign gpio1_2_out = mprj_io_out[10];
    assign gpio1_2_oe_n = mprj_io_oeb[10];
    assign gpio1_2_inp_dis = mprj_io_inp_dis[10];
    assign gpio1_2_ib_mode_sel = mprj_io_ib_mode_sel[10];
    assign gpio1_2_vtrip_sel = mprj_io_vtrip_sel[10];
    assign gpio1_2_slow = mprj_io_slow_sel[10];
    assign gpio1_2_hld_ovr = mprj_io_holdover[10];
    assign gpio1_2_analog_en = mprj_io_analog_en[10];
    assign gpio1_2_analog_sel = mprj_io_analog_sel[10];
    assign gpio1_2_analog_pol = mprj_io_analog_pol[10];
    assign gpio1_2_dm = mprj_io_dm[32:30];
    assign gpio1_2_enable_vddio = gpio1_2_one;
    assign gpio1_2_enable_inp_h = gpio1_2_tie_lo_esd;
    assign gpio1_2_enable_h = porb_h[1];
    assign gpio1_2_hld_h_n = gpio1_2_tie_hi_esd;
    assign gpio1_2_enable_vswitch_h = gpio1_2_tie_hi_esd;
    assign gpio1_2_enable_vdda_h = porb_h[1];
    assign gpio1_2_slew_ctl = mprj_slew_ctl[21:20];
    assign gpio1_2_hys_trim = mprj_hys_trim[10];

    // GPIO 11
    assign mprj_io_in[11] = gpio1_3_in;
    assign gpio1_3_out = mprj_io_out[11];
    assign gpio1_3_oe_n = mprj_io_oeb[11];
    assign gpio1_3_inp_dis = mprj_io_inp_dis[11];
    assign gpio1_3_ib_mode_sel = mprj_io_ib_mode_sel[11];
    assign gpio1_3_vtrip_sel = mprj_io_vtrip_sel[11];
    assign gpio1_3_slow = mprj_io_slow_sel[11];
    assign gpio1_3_hld_ovr = mprj_io_holdover[11];
    assign gpio1_3_analog_en = mprj_io_analog_en[11];
    assign gpio1_3_analog_sel = mprj_io_analog_sel[11];
    assign gpio1_3_analog_pol = mprj_io_analog_pol[11];
    assign gpio1_3_dm = mprj_io_dm[35:33];
    assign gpio1_3_enable_vddio = gpio1_3_one;
    assign gpio1_3_enable_inp_h = gpio1_3_tie_lo_esd;
    assign gpio1_3_enable_h = porb_h[1];
    assign gpio1_3_hld_h_n = gpio1_3_tie_hi_esd;
    assign gpio1_3_enable_vswitch_h = gpio1_3_tie_hi_esd;
    assign gpio1_3_enable_vdda_h = porb_h[1];
    assign gpio1_3_slew_ctl = mprj_slew_ctl[23:22];
    assign gpio1_3_hys_trim = mprj_hys_trim[11];

    // GPIO 12
    assign mprj_io_in[12] = gpio1_4_in;
    assign gpio1_4_out = mprj_io_out[12];
    assign gpio1_4_oe_n = mprj_io_oeb[12];
    assign gpio1_4_inp_dis = mprj_io_inp_dis[12];
    assign gpio1_4_ib_mode_sel = mprj_io_ib_mode_sel[12];
    assign gpio1_4_vtrip_sel = mprj_io_vtrip_sel[12];
    assign gpio1_4_slow = mprj_io_slow_sel[12];
    assign gpio1_4_hld_ovr = mprj_io_holdover[12];
    assign gpio1_4_analog_en = mprj_io_analog_en[12];
    assign gpio1_4_analog_sel = mprj_io_analog_sel[12];
    assign gpio1_4_analog_pol = mprj_io_analog_pol[12];
    assign gpio1_4_dm = mprj_io_dm[38:36];
    assign gpio1_4_enable_vddio = gpio1_4_one;
    assign gpio1_4_enable_inp_h = gpio1_4_tie_lo_esd;
    assign gpio1_4_enable_h = porb_h[1];
    assign gpio1_4_hld_h_n = gpio1_4_tie_hi_esd;
    assign gpio1_4_enable_vswitch_h = gpio1_4_tie_hi_esd;
    assign gpio1_4_enable_vdda_h = porb_h[1];
    assign gpio1_4_slew_ctl = mprj_slew_ctl[25:24];
    assign gpio1_4_hys_trim = mprj_hys_trim[12];

    // GPIO 13
    assign mprj_io_in[13] = gpio1_5_in;
    assign gpio1_5_out = mprj_io_out[13];
    assign gpio1_5_oe_n = mprj_io_oeb[13];
    assign gpio1_5_inp_dis = mprj_io_inp_dis[13];
    assign gpio1_5_ib_mode_sel = mprj_io_ib_mode_sel[13];
    assign gpio1_5_vtrip_sel = mprj_io_vtrip_sel[13];
    assign gpio1_5_slow = mprj_io_slow_sel[13];
    assign gpio1_5_hld_ovr = mprj_io_holdover[13];
    assign gpio1_5_analog_en = mprj_io_analog_en[13];
    assign gpio1_5_analog_sel = mprj_io_analog_sel[13];
    assign gpio1_5_analog_pol = mprj_io_analog_pol[13];
    assign gpio1_5_dm = mprj_io_dm[41:39];
    assign gpio1_5_enable_vddio = gpio1_5_one;
    assign gpio1_5_enable_inp_h = gpio1_5_tie_lo_esd;
    assign gpio1_5_enable_h = porb_h[1];
    assign gpio1_5_hld_h_n = gpio1_5_tie_hi_esd;
    assign gpio1_5_enable_vswitch_h = gpio1_5_tie_hi_esd;
    assign gpio1_5_enable_vdda_h = porb_h[1];
    assign gpio1_5_slew_ctl = mprj_slew_ctl[27:26];
    assign gpio1_5_hys_trim = mprj_hys_trim[13];

    // GPIO 14
    assign mprj_io_in[14] = gpio1_6_in;
    assign gpio1_6_out = mprj_io_out[14];
    assign gpio1_6_oe_n = mprj_io_oeb[14];
    assign gpio1_6_inp_dis = mprj_io_inp_dis[14];
    assign gpio1_6_ib_mode_sel = mprj_io_ib_mode_sel[14];
    assign gpio1_6_vtrip_sel = mprj_io_vtrip_sel[14];
    assign gpio1_6_slow = mprj_io_slow_sel[14];
    assign gpio1_6_hld_ovr = mprj_io_holdover[14];
    assign gpio1_6_analog_en = mprj_io_analog_en[14];
    assign gpio1_6_analog_sel = mprj_io_analog_sel[14];
    assign gpio1_6_analog_pol = mprj_io_analog_pol[14];
    assign gpio1_6_dm = mprj_io_dm[44:42];
    assign gpio1_6_enable_vddio = gpio1_6_one;
    assign gpio1_6_enable_inp_h = gpio1_6_tie_lo_esd;
    assign gpio1_6_enable_h = porb_h[1];
    assign gpio1_6_hld_h_n = gpio1_6_tie_hi_esd;
    assign gpio1_6_enable_vswitch_h = gpio1_6_tie_hi_esd;
    assign gpio1_6_enable_vdda_h = porb_h[1];
    assign gpio1_6_slew_ctl = mprj_slew_ctl[29:28];
    assign gpio1_6_hys_trim = mprj_hys_trim[14];

    // GPIO 15
    assign mprj_io_in[15] = gpio1_7_in;
    assign gpio1_7_out = mprj_io_out[15];
    assign gpio1_7_oe_n = mprj_io_oeb[15];
    assign gpio1_7_inp_dis = mprj_io_inp_dis[15];
    assign gpio1_7_ib_mode_sel = mprj_io_ib_mode_sel[15];
    assign gpio1_7_vtrip_sel = mprj_io_vtrip_sel[15];
    assign gpio1_7_slow = mprj_io_slow_sel[15];
    assign gpio1_7_hld_ovr = mprj_io_holdover[15];
    assign gpio1_7_analog_en = mprj_io_analog_en[15];
    assign gpio1_7_analog_sel = mprj_io_analog_sel[15];
    assign gpio1_7_analog_pol = mprj_io_analog_pol[15];
    assign gpio1_7_dm = mprj_io_dm[47:45];
    assign gpio1_7_enable_vddio = gpio1_7_one;
    assign gpio1_7_enable_inp_h = gpio1_7_tie_lo_esd;
    assign gpio1_7_enable_h = porb_h[1];
    assign gpio1_7_hld_h_n = gpio1_7_tie_hi_esd;
    assign gpio1_7_enable_vswitch_h = gpio1_7_tie_hi_esd;
    assign gpio1_7_enable_vdda_h = porb_h[1];
    assign gpio1_7_slew_ctl = mprj_slew_ctl[31:30];
    assign gpio1_7_hys_trim = mprj_hys_trim[15];

    // GPIO 16
    assign mprj_io_in[16] = gpio2_0_in;
    assign gpio2_0_out = mprj_io_out[16];
    assign gpio2_0_oe_n = mprj_io_oeb[16];
    assign gpio2_0_inp_dis = mprj_io_inp_dis[16];
    assign gpio2_0_ib_mode_sel = mprj_io_ib_mode_sel[16];
    assign gpio2_0_vtrip_sel = mprj_io_vtrip_sel[16];
    assign gpio2_0_slow = mprj_io_slow_sel[16];
    assign gpio2_0_hld_ovr = mprj_io_holdover[16];
    assign gpio2_0_analog_en = mprj_io_analog_en[16];
    assign gpio2_0_analog_sel = mprj_io_analog_sel[16];
    assign gpio2_0_analog_pol = mprj_io_analog_pol[16];
    assign gpio2_0_dm = mprj_io_dm[50:48];
    assign gpio2_0_enable_vddio = gpio2_0_one;
    assign gpio2_0_enable_inp_h = gpio2_0_tie_lo_esd;
    assign gpio2_0_enable_h = porb_h[1];
    assign gpio2_0_hld_h_n = gpio2_0_tie_hi_esd;
    assign gpio2_0_enable_vswitch_h = gpio2_0_tie_hi_esd;
    assign gpio2_0_enable_vdda_h = porb_h[1];

    // GPIO 17
    assign mprj_io_in[17] = gpio2_1_in;
    assign gpio2_1_out = mprj_io_out[17];
    assign gpio2_1_oe_n = mprj_io_oeb[17];
    assign gpio2_1_inp_dis = mprj_io_inp_dis[17];
    assign gpio2_1_ib_mode_sel = mprj_io_ib_mode_sel[17];
    assign gpio2_1_vtrip_sel = mprj_io_vtrip_sel[17];
    assign gpio2_1_slow = mprj_io_slow_sel[17];
    assign gpio2_1_hld_ovr = mprj_io_holdover[17];
    assign gpio2_1_analog_en = mprj_io_analog_en[17];
    assign gpio2_1_analog_sel = mprj_io_analog_sel[17];
    assign gpio2_1_analog_pol = mprj_io_analog_pol[17];
    assign gpio2_1_dm = mprj_io_dm[53:51];
    assign gpio2_1_enable_vddio = gpio2_1_one;
    assign gpio2_1_enable_inp_h = gpio2_1_tie_lo_esd;
    assign gpio2_1_enable_h = porb_h[1];
    assign gpio2_1_hld_h_n = gpio2_1_tie_hi_esd;
    assign gpio2_1_enable_vswitch_h = gpio2_1_tie_hi_esd;
    assign gpio2_1_enable_vdda_h = porb_h[1];

    // GPIO 18
    assign mprj_io_in[18] = gpio2_2_in;
    assign gpio2_2_out = mprj_io_out[18];
    assign gpio2_2_oe_n = mprj_io_oeb[18];
    assign gpio2_2_inp_dis = mprj_io_inp_dis[18];
    assign gpio2_2_ib_mode_sel = mprj_io_ib_mode_sel[18];
    assign gpio2_2_vtrip_sel = mprj_io_vtrip_sel[18];
    assign gpio2_2_slow = mprj_io_slow_sel[18];
    assign gpio2_2_hld_ovr = mprj_io_holdover[18];
    assign gpio2_2_analog_en = mprj_io_analog_en[18];
    assign gpio2_2_analog_sel = mprj_io_analog_sel[18];
    assign gpio2_2_analog_pol = mprj_io_analog_pol[18];
    assign gpio2_2_dm = mprj_io_dm[56:54];
    assign gpio2_2_enable_vddio = gpio2_2_one;
    assign gpio2_2_enable_inp_h = gpio2_2_tie_lo_esd;
    assign gpio2_2_enable_h = porb_h[1];
    assign gpio2_2_hld_h_n = gpio2_2_tie_hi_esd;
    assign gpio2_2_enable_vswitch_h = gpio2_2_tie_hi_esd;
    assign gpio2_2_enable_vdda_h = porb_h[1];

    // GPIO 19
    assign mprj_io_in[19] = gpio2_3_in;
    assign gpio2_3_out = mprj_io_out[19];
    assign gpio2_3_oe_n = mprj_io_oeb[19];
    assign gpio2_3_inp_dis = mprj_io_inp_dis[19];
    assign gpio2_3_ib_mode_sel = mprj_io_ib_mode_sel[19];
    assign gpio2_3_vtrip_sel = mprj_io_vtrip_sel[19];
    assign gpio2_3_slow = mprj_io_slow_sel[19];
    assign gpio2_3_hld_ovr = mprj_io_holdover[19];
    assign gpio2_3_analog_en = mprj_io_analog_en[19];
    assign gpio2_3_analog_sel = mprj_io_analog_sel[19];
    assign gpio2_3_analog_pol = mprj_io_analog_pol[19];
    assign gpio2_3_dm = mprj_io_dm[59:57];
    assign gpio2_3_enable_vddio = gpio2_3_one;
    assign gpio2_3_enable_inp_h = gpio2_3_tie_lo_esd;
    assign gpio2_3_enable_h = porb_h[1];
    assign gpio2_3_hld_h_n = gpio2_3_tie_hi_esd;
    assign gpio2_3_enable_vswitch_h = gpio2_3_tie_hi_esd;
    assign gpio2_3_enable_vdda_h = porb_h[1];

    // GPIO 20
    assign mprj_io_in[20] = gpio2_4_in;
    assign gpio2_4_out = mprj_io_out[20];
    assign gpio2_4_oe_n = mprj_io_oeb[20];
    assign gpio2_4_inp_dis = mprj_io_inp_dis[20];
    assign gpio2_4_ib_mode_sel = mprj_io_ib_mode_sel[20];
    assign gpio2_4_vtrip_sel = mprj_io_vtrip_sel[20];
    assign gpio2_4_slow = mprj_io_slow_sel[20];
    assign gpio2_4_hld_ovr = mprj_io_holdover[20];
    assign gpio2_4_analog_en = mprj_io_analog_en[20];
    assign gpio2_4_analog_sel = mprj_io_analog_sel[20];
    assign gpio2_4_analog_pol = mprj_io_analog_pol[20];
    assign gpio2_4_dm = mprj_io_dm[62:60];
    assign gpio2_4_enable_vddio = gpio2_4_one;
    assign gpio2_4_enable_inp_h = gpio2_4_tie_lo_esd;
    assign gpio2_4_enable_h = porb_h[1];
    assign gpio2_4_hld_h_n = gpio2_4_tie_hi_esd;
    assign gpio2_4_enable_vswitch_h = gpio2_4_tie_hi_esd;
    assign gpio2_4_enable_vdda_h = porb_h[1];

    // GPIO 21
    assign mprj_io_in[21] = gpio2_5_in;
    assign gpio2_5_out = mprj_io_out[21];
    assign gpio2_5_oe_n = mprj_io_oeb[21];
    assign gpio2_5_inp_dis = mprj_io_inp_dis[21];
    assign gpio2_5_ib_mode_sel = mprj_io_ib_mode_sel[21];
    assign gpio2_5_vtrip_sel = mprj_io_vtrip_sel[21];
    assign gpio2_5_slow = mprj_io_slow_sel[21];
    assign gpio2_5_hld_ovr = mprj_io_holdover[21];
    assign gpio2_5_analog_en = mprj_io_analog_en[21];
    assign gpio2_5_analog_sel = mprj_io_analog_sel[21];
    assign gpio2_5_analog_pol = mprj_io_analog_pol[21];
    assign gpio2_5_dm = mprj_io_dm[65:63];
    assign gpio2_5_enable_vddio = gpio2_5_one;
    assign gpio2_5_enable_inp_h = gpio2_5_tie_lo_esd;
    assign gpio2_5_enable_h = porb_h[1];
    assign gpio2_5_hld_h_n = gpio2_5_tie_hi_esd;
    assign gpio2_5_enable_vswitch_h = gpio2_5_tie_hi_esd;
    assign gpio2_5_enable_vdda_h = porb_h[1];

    // GPIO 22
    assign mprj_io_in[22] = gpio2_6_in;
    assign gpio2_6_out = mprj_io_out[22];
    assign gpio2_6_oe_n = mprj_io_oeb[22];
    assign gpio2_6_inp_dis = mprj_io_inp_dis[22];
    assign gpio2_6_ib_mode_sel = mprj_io_ib_mode_sel[22];
    assign gpio2_6_vtrip_sel = mprj_io_vtrip_sel[22];
    assign gpio2_6_slow = mprj_io_slow_sel[22];
    assign gpio2_6_hld_ovr = mprj_io_holdover[22];
    assign gpio2_6_analog_en = mprj_io_analog_en[22];
    assign gpio2_6_analog_sel = mprj_io_analog_sel[22];
    assign gpio2_6_analog_pol = mprj_io_analog_pol[22];
    assign gpio2_6_dm = mprj_io_dm[68:66];
    assign gpio2_6_enable_vddio = gpio2_6_one;
    assign gpio2_6_enable_inp_h = gpio2_6_tie_lo_esd;
    assign gpio2_6_enable_h = porb_h[1];
    assign gpio2_6_hld_h_n = gpio2_6_tie_hi_esd;
    assign gpio2_6_enable_vswitch_h = gpio2_6_tie_hi_esd;
    assign gpio2_6_enable_vdda_h = porb_h[1];

    // GPIO 23
    assign mprj_io_in[23] = gpio2_7_in;
    assign gpio2_7_out = mprj_io_out[23];
    assign gpio2_7_oe_n = mprj_io_oeb[23];
    assign gpio2_7_inp_dis = mprj_io_inp_dis[23];
    assign gpio2_7_ib_mode_sel = mprj_io_ib_mode_sel[23];
    assign gpio2_7_vtrip_sel = mprj_io_vtrip_sel[23];
    assign gpio2_7_slow = mprj_io_slow_sel[23];
    assign gpio2_7_hld_ovr = mprj_io_holdover[23];
    assign gpio2_7_analog_en = mprj_io_analog_en[23];
    assign gpio2_7_analog_sel = mprj_io_analog_sel[23];
    assign gpio2_7_analog_pol = mprj_io_analog_pol[23];
    assign gpio2_7_dm = mprj_io_dm[71:69];
    assign gpio2_7_enable_vddio = gpio2_7_one;
    assign gpio2_7_enable_inp_h = gpio2_7_tie_lo_esd;
    assign gpio2_7_enable_h = porb_h[1];
    assign gpio2_7_hld_h_n = gpio2_7_tie_hi_esd;
    assign gpio2_7_enable_vswitch_h = gpio2_7_tie_hi_esd;
    assign gpio2_7_enable_vdda_h = porb_h[1];

    // GPIO 24
    assign mprj_io_in[24] = gpio3_0_in;
    assign gpio3_0_out = mprj_io_out[24];
    assign gpio3_0_oe_n = mprj_io_oeb[24];
    assign gpio3_0_inp_dis = mprj_io_inp_dis[24];
    assign gpio3_0_ib_mode_sel = mprj_io_ib_mode_sel[24];
    assign gpio3_0_vtrip_sel = mprj_io_vtrip_sel[24];
    assign gpio3_0_slow = mprj_io_slow_sel[24];
    assign gpio3_0_hld_ovr = mprj_io_holdover[24];
    assign gpio3_0_analog_en = mprj_io_analog_en[24];
    assign gpio3_0_analog_sel = mprj_io_analog_sel[24];
    assign gpio3_0_analog_pol = mprj_io_analog_pol[24];
    assign gpio3_0_dm = mprj_io_dm[74:72];
    assign gpio3_0_enable_vddio = gpio3_0_one;
    assign gpio3_0_enable_inp_h = gpio3_0_tie_lo_esd;
    assign gpio3_0_enable_h = porb_h[1];
    assign gpio3_0_hld_h_n = gpio3_0_tie_hi_esd;
    assign gpio3_0_enable_vswitch_h = gpio3_0_tie_hi_esd;
    assign gpio3_0_enable_vdda_h = porb_h[1];

    // GPIO 25
    assign mprj_io_in[25] = gpio3_1_in;
    assign gpio3_1_out = mprj_io_out[25];
    assign gpio3_1_oe_n = mprj_io_oeb[25];
    assign gpio3_1_inp_dis = mprj_io_inp_dis[25];
    assign gpio3_1_ib_mode_sel = mprj_io_ib_mode_sel[25];
    assign gpio3_1_vtrip_sel = mprj_io_vtrip_sel[25];
    assign gpio3_1_slow = mprj_io_slow_sel[25];
    assign gpio3_1_hld_ovr = mprj_io_holdover[25];
    assign gpio3_1_analog_en = mprj_io_analog_en[25];
    assign gpio3_1_analog_sel = mprj_io_analog_sel[25];
    assign gpio3_1_analog_pol = mprj_io_analog_pol[25];
    assign gpio3_1_dm = mprj_io_dm[77:75];
    assign gpio3_1_enable_vddio = gpio3_1_one;
    assign gpio3_1_enable_inp_h = gpio3_1_tie_lo_esd;
    assign gpio3_1_enable_h = porb_h[1];
    assign gpio3_1_hld_h_n = gpio3_1_tie_hi_esd;
    assign gpio3_1_enable_vswitch_h = gpio3_1_tie_hi_esd;
    assign gpio3_1_enable_vdda_h = porb_h[1];

    // GPIO 26
    assign mprj_io_in[26] = gpio3_2_in;
    assign gpio3_2_out = mprj_io_out[26];
    assign gpio3_2_oe_n = mprj_io_oeb[26];
    assign gpio3_2_inp_dis = mprj_io_inp_dis[26];
    assign gpio3_2_ib_mode_sel = mprj_io_ib_mode_sel[26];
    assign gpio3_2_vtrip_sel = mprj_io_vtrip_sel[26];
    assign gpio3_2_slow = mprj_io_slow_sel[26];
    assign gpio3_2_hld_ovr = mprj_io_holdover[26];
    assign gpio3_2_analog_en = mprj_io_analog_en[26];
    assign gpio3_2_analog_sel = mprj_io_analog_sel[26];
    assign gpio3_2_analog_pol = mprj_io_analog_pol[26];
    assign gpio3_2_dm = mprj_io_dm[80:78];
    assign gpio3_2_enable_vddio = gpio3_2_one;
    assign gpio3_2_enable_inp_h = gpio3_2_tie_lo_esd;
    assign gpio3_2_enable_h = porb_h[1];
    assign gpio3_2_hld_h_n = gpio3_2_tie_hi_esd;
    assign gpio3_2_enable_vswitch_h = gpio3_2_tie_hi_esd;
    assign gpio3_2_enable_vdda_h = porb_h[1];

    // GPIO 27
    assign mprj_io_in[27] = gpio3_3_in;
    assign gpio3_3_out = mprj_io_out[27];
    assign gpio3_3_oe_n = mprj_io_oeb[27];
    assign gpio3_3_inp_dis = mprj_io_inp_dis[27];
    assign gpio3_3_ib_mode_sel = mprj_io_ib_mode_sel[27];
    assign gpio3_3_vtrip_sel = mprj_io_vtrip_sel[27];
    assign gpio3_3_slow = mprj_io_slow_sel[27];
    assign gpio3_3_hld_ovr = mprj_io_holdover[27];
    assign gpio3_3_analog_en = mprj_io_analog_en[27];
    assign gpio3_3_analog_sel = mprj_io_analog_sel[27];
    assign gpio3_3_analog_pol = mprj_io_analog_pol[27];
    assign gpio3_3_dm = mprj_io_dm[83:81];
    assign gpio3_3_enable_vddio = gpio3_3_one;
    assign gpio3_3_enable_inp_h = gpio3_3_tie_lo_esd;
    assign gpio3_3_enable_h = porb_h[1];
    assign gpio3_3_hld_h_n = gpio3_3_tie_hi_esd;
    assign gpio3_3_enable_vswitch_h = gpio3_3_tie_hi_esd;
    assign gpio3_3_enable_vdda_h = porb_h[1];

    // GPIO 28
    assign mprj_io_in[28] = gpio3_4_in;
    assign gpio3_4_out = mprj_io_out[28];
    assign gpio3_4_oe_n = mprj_io_oeb[28];
    assign gpio3_4_inp_dis = mprj_io_inp_dis[28];
    assign gpio3_4_ib_mode_sel = mprj_io_ib_mode_sel[28];
    assign gpio3_4_vtrip_sel = mprj_io_vtrip_sel[28];
    assign gpio3_4_slow = mprj_io_slow_sel[28];
    assign gpio3_4_hld_ovr = mprj_io_holdover[28];
    assign gpio3_4_analog_en = mprj_io_analog_en[28];
    assign gpio3_4_analog_sel = mprj_io_analog_sel[28];
    assign gpio3_4_analog_pol = mprj_io_analog_pol[28];
    assign gpio3_4_dm = mprj_io_dm[86:84];
    assign gpio3_4_enable_vddio = gpio3_4_one;
    assign gpio3_4_enable_inp_h = gpio3_4_tie_lo_esd;
    assign gpio3_4_enable_h = porb_h[1];
    assign gpio3_4_hld_h_n = gpio3_4_tie_hi_esd;
    assign gpio3_4_enable_vswitch_h = gpio3_4_tie_hi_esd;
    assign gpio3_4_enable_vdda_h = porb_h[1];

    // GPIO 29
    assign mprj_io_in[29] = gpio3_5_in;
    assign gpio3_5_out = mprj_io_out[29];
    assign gpio3_5_oe_n = mprj_io_oeb[29];
    assign gpio3_5_inp_dis = mprj_io_inp_dis[29];
    assign gpio3_5_ib_mode_sel = mprj_io_ib_mode_sel[29];
    assign gpio3_5_vtrip_sel = mprj_io_vtrip_sel[29];
    assign gpio3_5_slow = mprj_io_slow_sel[29];
    assign gpio3_5_hld_ovr = mprj_io_holdover[29];
    assign gpio3_5_analog_en = mprj_io_analog_en[29];
    assign gpio3_5_analog_sel = mprj_io_analog_sel[29];
    assign gpio3_5_analog_pol = mprj_io_analog_pol[29];
    assign gpio3_5_dm = mprj_io_dm[89:87];
    assign gpio3_5_enable_vddio = gpio3_5_one;
    assign gpio3_5_enable_inp_h = gpio3_5_tie_lo_esd;
    assign gpio3_5_enable_h = porb_h[1];
    assign gpio3_5_hld_h_n = gpio3_5_tie_hi_esd;
    assign gpio3_5_enable_vswitch_h = gpio3_5_tie_hi_esd;
    assign gpio3_5_enable_vdda_h = porb_h[1];

    // GPIO 30
    assign mprj_io_in[30] = gpio3_6_in;
    assign gpio3_6_out = mprj_io_out[30];
    assign gpio3_6_oe_n = mprj_io_oeb[30];
    assign gpio3_6_inp_dis = mprj_io_inp_dis[30];
    assign gpio3_6_ib_mode_sel = mprj_io_ib_mode_sel[30];
    assign gpio3_6_vtrip_sel = mprj_io_vtrip_sel[30];
    assign gpio3_6_slow = mprj_io_slow_sel[30];
    assign gpio3_6_hld_ovr = mprj_io_holdover[30];
    assign gpio3_6_analog_en = mprj_io_analog_en[30];
    assign gpio3_6_analog_sel = mprj_io_analog_sel[30];
    assign gpio3_6_analog_pol = mprj_io_analog_pol[30];
    assign gpio3_6_dm = mprj_io_dm[92:90];
    assign gpio3_6_enable_vddio = gpio3_6_one;
    assign gpio3_6_enable_inp_h = gpio3_6_tie_lo_esd;
    assign gpio3_6_enable_h = porb_h[1];
    assign gpio3_6_hld_h_n = gpio3_6_tie_hi_esd;
    assign gpio3_6_enable_vswitch_h = gpio3_6_tie_hi_esd;
    assign gpio3_6_enable_vdda_h = porb_h[1];

    // GPIO 31
    assign mprj_io_in[31] = gpio3_7_in;
    assign gpio3_7_out = mprj_io_out[31];
    assign gpio3_7_oe_n = mprj_io_oeb[31];
    assign gpio3_7_inp_dis = mprj_io_inp_dis[31];
    assign gpio3_7_ib_mode_sel = mprj_io_ib_mode_sel[31];
    assign gpio3_7_vtrip_sel = mprj_io_vtrip_sel[31];
    assign gpio3_7_slow = mprj_io_slow_sel[31];
    assign gpio3_7_hld_ovr = mprj_io_holdover[31];
    assign gpio3_7_analog_en = mprj_io_analog_en[31];
    assign gpio3_7_analog_sel = mprj_io_analog_sel[31];
    assign gpio3_7_analog_pol = mprj_io_analog_pol[31];
    assign gpio3_7_dm = mprj_io_dm[95:93];
    assign gpio3_7_enable_vddio = gpio3_7_one;
    assign gpio3_7_enable_inp_h = gpio3_7_tie_lo_esd;
    assign gpio3_7_enable_h = porb_h[1];
    assign gpio3_7_hld_h_n = gpio3_7_tie_hi_esd;
    assign gpio3_7_enable_vswitch_h = gpio3_7_tie_hi_esd;
    assign gpio3_7_enable_vdda_h = porb_h[1];

    // GPIO 32
    assign mprj_io_in[32] = gpio4_0_in;
    assign gpio4_0_out = mprj_io_out[32];
    assign gpio4_0_oe_n = mprj_io_oeb[32];
    assign gpio4_0_inp_dis = mprj_io_inp_dis[32];
    assign gpio4_0_ib_mode_sel = mprj_io_ib_mode_sel[32];
    assign gpio4_0_vtrip_sel = mprj_io_vtrip_sel[32];
    assign gpio4_0_slow = mprj_io_slow_sel[32];
    assign gpio4_0_hld_ovr = mprj_io_holdover[32];
    assign gpio4_0_analog_en = mprj_io_analog_en[32];
    assign gpio4_0_analog_sel = mprj_io_analog_sel[32];
    assign gpio4_0_analog_pol = mprj_io_analog_pol[32];
    assign gpio4_0_dm = mprj_io_dm[98:96];
    assign gpio4_0_enable_vddio = gpio4_0_one;
    assign gpio4_0_enable_inp_h = gpio4_0_tie_lo_esd;
    assign gpio4_0_enable_h = porb_h[0];
    assign gpio4_0_hld_h_n = gpio4_0_tie_hi_esd;
    assign gpio4_0_enable_vswitch_h = gpio4_0_tie_hi_esd;
    assign gpio4_0_enable_vdda_h = porb_h[0];

    // GPIO 33
    assign mprj_io_in[33] = gpio4_1_in;
    assign gpio4_1_out = mprj_io_out[33];
    assign gpio4_1_oe_n = mprj_io_oeb[33];
    assign gpio4_1_inp_dis = mprj_io_inp_dis[33];
    assign gpio4_1_ib_mode_sel = mprj_io_ib_mode_sel[33];
    assign gpio4_1_vtrip_sel = mprj_io_vtrip_sel[33];
    assign gpio4_1_slow = mprj_io_slow_sel[33];
    assign gpio4_1_hld_ovr = mprj_io_holdover[33];
    assign gpio4_1_analog_en = mprj_io_analog_en[33];
    assign gpio4_1_analog_sel = mprj_io_analog_sel[33];
    assign gpio4_1_analog_pol = mprj_io_analog_pol[33];
    assign gpio4_1_dm = mprj_io_dm[101:99];
    assign gpio4_1_enable_vddio = gpio4_1_one;
    assign gpio4_1_enable_inp_h = gpio4_1_tie_lo_esd;
    assign gpio4_1_enable_h = porb_h[0];
    assign gpio4_1_hld_h_n = gpio4_1_tie_hi_esd;
    assign gpio4_1_enable_vswitch_h = gpio4_1_tie_hi_esd;
    assign gpio4_1_enable_vdda_h = porb_h[0];

    // GPIO 34
    assign mprj_io_in[34] = gpio4_2_in;
    assign gpio4_2_out = mprj_io_out[34];
    assign gpio4_2_oe_n = mprj_io_oeb[34];
    assign gpio4_2_inp_dis = mprj_io_inp_dis[34];
    assign gpio4_2_ib_mode_sel = mprj_io_ib_mode_sel[34];
    assign gpio4_2_vtrip_sel = mprj_io_vtrip_sel[34];
    assign gpio4_2_slow = mprj_io_slow_sel[34];
    assign gpio4_2_hld_ovr = mprj_io_holdover[34];
    assign gpio4_2_analog_en = mprj_io_analog_en[34];
    assign gpio4_2_analog_sel = mprj_io_analog_sel[34];
    assign gpio4_2_analog_pol = mprj_io_analog_pol[34];
    assign gpio4_2_dm = mprj_io_dm[104:102];
    assign gpio4_2_enable_vddio = gpio4_2_one;
    assign gpio4_2_enable_inp_h = gpio4_2_tie_lo_esd;
    assign gpio4_2_enable_h = porb_h[0];
    assign gpio4_2_hld_h_n = gpio4_2_tie_hi_esd;
    assign gpio4_2_enable_vswitch_h = gpio4_2_tie_hi_esd;
    assign gpio4_2_enable_vdda_h = porb_h[0];

    // GPIO 35
    assign mprj_io_in[35] = gpio4_3_in;
    assign gpio4_3_out = mprj_io_out[35];
    assign gpio4_3_oe_n = mprj_io_oeb[35];
    assign gpio4_3_inp_dis = mprj_io_inp_dis[35];
    assign gpio4_3_ib_mode_sel = mprj_io_ib_mode_sel[35];
    assign gpio4_3_vtrip_sel = mprj_io_vtrip_sel[35];
    assign gpio4_3_slow = mprj_io_slow_sel[35];
    assign gpio4_3_hld_ovr = mprj_io_holdover[35];
    assign gpio4_3_analog_en = mprj_io_analog_en[35];
    assign gpio4_3_analog_sel = mprj_io_analog_sel[35];
    assign gpio4_3_analog_pol = mprj_io_analog_pol[35];
    assign gpio4_3_dm = mprj_io_dm[107:105];
    assign gpio4_3_enable_vddio = gpio4_3_one;
    assign gpio4_3_enable_inp_h = gpio4_3_tie_lo_esd;
    assign gpio4_3_enable_h = porb_h[0];
    assign gpio4_3_hld_h_n = gpio4_3_tie_hi_esd;
    assign gpio4_3_enable_vswitch_h = gpio4_3_tie_hi_esd;
    assign gpio4_3_enable_vdda_h = porb_h[0];

    // GPIO 36
    assign mprj_io_in[36] = gpio4_4_in;
    assign gpio4_4_out = mprj_io_out[36];
    assign gpio4_4_oe_n = mprj_io_oeb[36];
    assign gpio4_4_inp_dis = mprj_io_inp_dis[36];
    assign gpio4_4_ib_mode_sel = mprj_io_ib_mode_sel[36];
    assign gpio4_4_vtrip_sel = mprj_io_vtrip_sel[36];
    assign gpio4_4_slow = mprj_io_slow_sel[36];
    assign gpio4_4_hld_ovr = mprj_io_holdover[36];
    assign gpio4_4_analog_en = mprj_io_analog_en[36];
    assign gpio4_4_analog_sel = mprj_io_analog_sel[36];
    assign gpio4_4_analog_pol = mprj_io_analog_pol[36];
    assign gpio4_4_dm = mprj_io_dm[110:108];
    assign gpio4_4_enable_vddio = gpio4_4_one;
    assign gpio4_4_enable_inp_h = gpio4_4_tie_lo_esd;
    assign gpio4_4_enable_h = porb_h[0];
    assign gpio4_4_hld_h_n = gpio4_4_tie_hi_esd;
    assign gpio4_4_enable_vswitch_h = gpio4_4_tie_hi_esd;
    assign gpio4_4_enable_vdda_h = porb_h[0];

    // GPIO 37
    assign mprj_io_in[37] = gpio4_5_in;
    assign gpio4_5_out = mprj_io_out[37];
    assign gpio4_5_oe_n = mprj_io_oeb[37];
    assign gpio4_5_inp_dis = mprj_io_inp_dis[37];
    assign gpio4_5_ib_mode_sel = mprj_io_ib_mode_sel[37];
    assign gpio4_5_vtrip_sel = mprj_io_vtrip_sel[37];
    assign gpio4_5_slow = mprj_io_slow_sel[37];
    assign gpio4_5_hld_ovr = mprj_io_holdover[37];
    assign gpio4_5_analog_en = mprj_io_analog_en[37];
    assign gpio4_5_analog_sel = mprj_io_analog_sel[37];
    assign gpio4_5_analog_pol = mprj_io_analog_pol[37];
    assign gpio4_5_dm = mprj_io_dm[113:111];
    assign gpio4_5_enable_vddio = gpio4_5_one;
    assign gpio4_5_enable_inp_h = gpio4_5_tie_lo_esd;
    assign gpio4_5_enable_h = porb_h[0];
    assign gpio4_5_hld_h_n = gpio4_5_tie_hi_esd;
    assign gpio4_5_enable_vswitch_h = gpio4_5_tie_hi_esd;
    assign gpio4_5_enable_vdda_h = porb_h[0];

    // GPIO 38
    assign mprj_io_in[38] = gpio4_6_in;
    assign gpio4_6_out = mprj_io_out[38];
    assign gpio4_6_oe_n = mprj_io_oeb[38];
    assign gpio4_6_inp_dis = mprj_io_inp_dis[38];
    assign gpio4_6_ib_mode_sel = mprj_io_ib_mode_sel[38];
    assign gpio4_6_vtrip_sel = mprj_io_vtrip_sel[38];
    assign gpio4_6_slow = mprj_io_slow_sel[38];
    assign gpio4_6_hld_ovr = mprj_io_holdover[38];
    assign gpio4_6_analog_en = mprj_io_analog_en[38];
    assign gpio4_6_analog_sel = mprj_io_analog_sel[38];
    assign gpio4_6_analog_pol = mprj_io_analog_pol[38];
    assign gpio4_6_dm = mprj_io_dm[116:114];
    assign gpio4_6_enable_vddio = gpio4_6_one;
    assign gpio4_6_enable_inp_h = gpio4_6_tie_lo_esd;
    assign gpio4_6_enable_h = porb_h[0];
    assign gpio4_6_hld_h_n = gpio4_6_tie_hi_esd;
    assign gpio4_6_enable_vswitch_h = gpio4_6_tie_hi_esd;
    assign gpio4_6_enable_vdda_h = porb_h[0];

    // GPIO 39
    assign mprj_io_in[39] = gpio4_7_in;
    assign gpio4_7_out = mprj_io_out[39];
    assign gpio4_7_oe_n = mprj_io_oeb[39];
    assign gpio4_7_inp_dis = mprj_io_inp_dis[39];
    assign gpio4_7_ib_mode_sel = mprj_io_ib_mode_sel[39];
    assign gpio4_7_vtrip_sel = mprj_io_vtrip_sel[39];
    assign gpio4_7_slow = mprj_io_slow_sel[39];
    assign gpio4_7_hld_ovr = mprj_io_holdover[39];
    assign gpio4_7_analog_en = mprj_io_analog_en[39];
    assign gpio4_7_analog_sel = mprj_io_analog_sel[39];
    assign gpio4_7_analog_pol = mprj_io_analog_pol[39];
    assign gpio4_7_dm = mprj_io_dm[119:117];
    assign gpio4_7_enable_vddio = gpio4_7_one;
    assign gpio4_7_enable_inp_h = gpio4_7_tie_lo_esd;
    assign gpio4_7_enable_h = porb_h[0];
    assign gpio4_7_hld_h_n = gpio4_7_tie_hi_esd;
    assign gpio4_7_enable_vswitch_h = gpio4_7_tie_hi_esd;
    assign gpio4_7_enable_vdda_h = porb_h[0];

    // GPIO 40
    assign mprj_io_in[40] = gpio5_0_in;
    assign gpio5_0_out = mprj_io_out[40];
    assign gpio5_0_oe_n = mprj_io_oeb[40];
    assign gpio5_0_inp_dis = mprj_io_inp_dis[40];
    assign gpio5_0_ib_mode_sel = mprj_io_ib_mode_sel[40];
    assign gpio5_0_vtrip_sel = mprj_io_vtrip_sel[40];
    assign gpio5_0_slow = mprj_io_slow_sel[40];
    assign gpio5_0_hld_ovr = mprj_io_holdover[40];
    assign gpio5_0_analog_en = mprj_io_analog_en[40];
    assign gpio5_0_analog_sel = mprj_io_analog_sel[40];
    assign gpio5_0_analog_pol = mprj_io_analog_pol[40];
    assign gpio5_0_dm = mprj_io_dm[122:120];
    assign gpio5_0_enable_vddio = gpio5_0_one;
    assign gpio5_0_enable_inp_h = gpio5_0_tie_lo_esd;
    assign gpio5_0_enable_h = porb_h[0];
    assign gpio5_0_hld_h_n = gpio5_0_tie_hi_esd;
    assign gpio5_0_enable_vswitch_h = gpio5_0_tie_hi_esd;
    assign gpio5_0_enable_vdda_h = porb_h[0];

    // GPIO 41
    assign mprj_io_in[41] = gpio5_1_in;
    assign gpio5_1_out = mprj_io_out[41];
    assign gpio5_1_oe_n = mprj_io_oeb[41];
    assign gpio5_1_inp_dis = mprj_io_inp_dis[41];
    assign gpio5_1_ib_mode_sel = mprj_io_ib_mode_sel[41];
    assign gpio5_1_vtrip_sel = mprj_io_vtrip_sel[41];
    assign gpio5_1_slow = mprj_io_slow_sel[41];
    assign gpio5_1_hld_ovr = mprj_io_holdover[41];
    assign gpio5_1_analog_en = mprj_io_analog_en[41];
    assign gpio5_1_analog_sel = mprj_io_analog_sel[41];
    assign gpio5_1_analog_pol = mprj_io_analog_pol[41];
    assign gpio5_1_dm = mprj_io_dm[125:123];
    assign gpio5_1_enable_vddio = gpio5_1_one;
    assign gpio5_1_enable_inp_h = gpio5_1_tie_lo_esd;
    assign gpio5_1_enable_h = porb_h[0];
    assign gpio5_1_hld_h_n = gpio5_1_tie_hi_esd;
    assign gpio5_1_enable_vswitch_h = gpio5_1_tie_hi_esd;
    assign gpio5_1_enable_vdda_h = porb_h[0];

    // GPIO 42
    assign mprj_io_in[42] = gpio5_2_in;
    assign gpio5_2_out = mprj_io_out[42];
    assign gpio5_2_oe_n = mprj_io_oeb[42];
    assign gpio5_2_inp_dis = mprj_io_inp_dis[42];
    assign gpio5_2_ib_mode_sel = mprj_io_ib_mode_sel[42];
    assign gpio5_2_vtrip_sel = mprj_io_vtrip_sel[42];
    assign gpio5_2_slow = mprj_io_slow_sel[42];
    assign gpio5_2_hld_ovr = mprj_io_holdover[42];
    assign gpio5_2_analog_en = mprj_io_analog_en[42];
    assign gpio5_2_analog_sel = mprj_io_analog_sel[42];
    assign gpio5_2_analog_pol = mprj_io_analog_pol[42];
    assign gpio5_2_dm = mprj_io_dm[128:126];
    assign gpio5_2_enable_vddio = gpio5_2_one;
    assign gpio5_2_enable_inp_h = gpio5_2_tie_lo_esd;
    assign gpio5_2_enable_h = porb_h[0];
    assign gpio5_2_hld_h_n = gpio5_2_tie_hi_esd;
    assign gpio5_2_enable_vswitch_h = gpio5_2_tie_hi_esd;
    assign gpio5_2_enable_vdda_h = porb_h[0];

    // GPIO 43
    assign mprj_io_in[43] = gpio5_3_in;
    assign gpio5_3_out = mprj_io_out[43];
    assign gpio5_3_oe_n = mprj_io_oeb[43];
    assign gpio5_3_inp_dis = mprj_io_inp_dis[43];
    assign gpio5_3_ib_mode_sel = mprj_io_ib_mode_sel[43];
    assign gpio5_3_vtrip_sel = mprj_io_vtrip_sel[43];
    assign gpio5_3_slow = mprj_io_slow_sel[43];
    assign gpio5_3_hld_ovr = mprj_io_holdover[43];
    assign gpio5_3_analog_en = mprj_io_analog_en[43];
    assign gpio5_3_analog_sel = mprj_io_analog_sel[43];
    assign gpio5_3_analog_pol = mprj_io_analog_pol[43];
    assign gpio5_3_dm = mprj_io_dm[131:129];
    assign gpio5_3_enable_vddio = gpio5_3_one;
    assign gpio5_3_enable_inp_h = gpio5_3_tie_lo_esd;
    assign gpio5_3_enable_h = porb_h[0];
    assign gpio5_3_hld_h_n = gpio5_3_tie_hi_esd;
    assign gpio5_3_enable_vswitch_h = gpio5_3_tie_hi_esd;
    assign gpio5_3_enable_vdda_h = porb_h[0];

    // GPIO 44
    assign mprj_io_in[44] = gpio5_4_in;
    assign gpio5_4_out = mprj_io_out[44];
    assign gpio5_4_oe_n = mprj_io_oeb[44];
    assign gpio5_4_inp_dis = mprj_io_inp_dis[44];
    assign gpio5_4_ib_mode_sel = mprj_io_ib_mode_sel[44];
    assign gpio5_4_vtrip_sel = mprj_io_vtrip_sel[44];
    assign gpio5_4_slow = mprj_io_slow_sel[44];
    assign gpio5_4_hld_ovr = mprj_io_holdover[44];
    assign gpio5_4_analog_en = mprj_io_analog_en[44];
    assign gpio5_4_analog_sel = mprj_io_analog_sel[44];
    assign gpio5_4_analog_pol = mprj_io_analog_pol[44];
    assign gpio5_4_dm = mprj_io_dm[134:132];
    assign gpio5_4_enable_vddio = gpio5_4_one;
    assign gpio5_4_enable_inp_h = gpio5_4_tie_lo_esd;
    assign gpio5_4_enable_h = porb_h[0];
    assign gpio5_4_hld_h_n = gpio5_4_tie_hi_esd;
    assign gpio5_4_enable_vswitch_h = gpio5_4_tie_hi_esd;
    assign gpio5_4_enable_vdda_h = porb_h[0];

    // GPIO 45
    assign mprj_io_in[45] = gpio5_5_in;
    assign gpio5_5_out = mprj_io_out[45];
    assign gpio5_5_oe_n = mprj_io_oeb[45];
    assign gpio5_5_inp_dis = mprj_io_inp_dis[45];
    assign gpio5_5_ib_mode_sel = mprj_io_ib_mode_sel[45];
    assign gpio5_5_vtrip_sel = mprj_io_vtrip_sel[45];
    assign gpio5_5_slow = mprj_io_slow_sel[45];
    assign gpio5_5_hld_ovr = mprj_io_holdover[45];
    assign gpio5_5_analog_en = mprj_io_analog_en[45];
    assign gpio5_5_analog_sel = mprj_io_analog_sel[45];
    assign gpio5_5_analog_pol = mprj_io_analog_pol[45];
    assign gpio5_5_dm = mprj_io_dm[137:135];
    assign gpio5_5_enable_vddio = gpio5_5_one;
    assign gpio5_5_enable_inp_h = gpio5_5_tie_lo_esd;
    assign gpio5_5_enable_h = porb_h[0];
    assign gpio5_5_hld_h_n = gpio5_5_tie_hi_esd;
    assign gpio5_5_enable_vswitch_h = gpio5_5_tie_hi_esd;
    assign gpio5_5_enable_vdda_h = porb_h[0];

    // GPIO 46
    assign mprj_io_in[46] = gpio5_6_in;
    assign gpio5_6_out = mprj_io_out[46];
    assign gpio5_6_oe_n = mprj_io_oeb[46];
    assign gpio5_6_inp_dis = mprj_io_inp_dis[46];
    assign gpio5_6_ib_mode_sel = mprj_io_ib_mode_sel[46];
    assign gpio5_6_vtrip_sel = mprj_io_vtrip_sel[46];
    assign gpio5_6_slow = mprj_io_slow_sel[46];
    assign gpio5_6_hld_ovr = mprj_io_holdover[46];
    assign gpio5_6_analog_en = mprj_io_analog_en[46];
    assign gpio5_6_analog_sel = mprj_io_analog_sel[46];
    assign gpio5_6_analog_pol = mprj_io_analog_pol[46];
    assign gpio5_6_dm = mprj_io_dm[140:138];
    assign gpio5_6_enable_vddio = gpio5_6_one;
    assign gpio5_6_enable_inp_h = gpio5_6_tie_lo_esd;
    assign gpio5_6_enable_h = porb_h[0];
    assign gpio5_6_hld_h_n = gpio5_6_tie_hi_esd;
    assign gpio5_6_enable_vswitch_h = gpio5_6_tie_hi_esd;
    assign gpio5_6_enable_vdda_h = porb_h[0];

    // GPIO 47
    assign mprj_io_in[47] = gpio5_7_in;
    assign gpio5_7_out = mprj_io_out[47];
    assign gpio5_7_oe_n = mprj_io_oeb[47];
    assign gpio5_7_inp_dis = mprj_io_inp_dis[47];
    assign gpio5_7_ib_mode_sel = mprj_io_ib_mode_sel[47];
    assign gpio5_7_vtrip_sel = mprj_io_vtrip_sel[47];
    assign gpio5_7_slow = mprj_io_slow_sel[47];
    assign gpio5_7_hld_ovr = mprj_io_holdover[47];
    assign gpio5_7_analog_en = mprj_io_analog_en[47];
    assign gpio5_7_analog_sel = mprj_io_analog_sel[47];
    assign gpio5_7_analog_pol = mprj_io_analog_pol[47];
    assign gpio5_7_dm = mprj_io_dm[143:141];
    assign gpio5_7_enable_vddio = gpio5_7_one;
    assign gpio5_7_enable_inp_h = gpio5_7_tie_lo_esd;
    assign gpio5_7_enable_h = porb_h[0];
    assign gpio5_7_hld_h_n = gpio5_7_tie_hi_esd;
    assign gpio5_7_enable_vswitch_h = gpio5_7_tie_hi_esd;
    assign gpio5_7_enable_vdda_h = porb_h[0];

    // GPIO 48
    assign mprj_io_in[48] = gpio6_0_in;
    assign gpio6_0_out = mprj_io_out[48];
    assign gpio6_0_oe_n = mprj_io_oeb[48];
    assign gpio6_0_inp_dis = mprj_io_inp_dis[48];
    assign gpio6_0_ib_mode_sel = mprj_io_ib_mode_sel[48];
    assign gpio6_0_vtrip_sel = mprj_io_vtrip_sel[48];
    assign gpio6_0_slow = mprj_io_slow_sel[48];
    assign gpio6_0_hld_ovr = mprj_io_holdover[48];
    assign gpio6_0_analog_en = mprj_io_analog_en[48];
    assign gpio6_0_analog_sel = mprj_io_analog_sel[48];
    assign gpio6_0_analog_pol = mprj_io_analog_pol[48];
    assign gpio6_0_dm = mprj_io_dm[146:144];
    assign gpio6_0_enable_vddio = gpio6_0_one;
    assign gpio6_0_enable_inp_h = gpio6_0_tie_lo_esd;
    assign gpio6_0_enable_h = porb_h[0];
    assign gpio6_0_hld_h_n = gpio6_0_tie_hi_esd;
    assign gpio6_0_enable_vswitch_h = gpio6_0_tie_hi_esd;
    assign gpio6_0_enable_vdda_h = porb_h[0];
    assign gpio6_0_slew_ctl = mprj_slew_ctl[97:96];
    assign gpio6_0_hys_trim = mprj_hys_trim[48];

    // GPIO 49
    assign mprj_io_in[49] = gpio6_1_in;
    assign gpio6_1_out = mprj_io_out[49];
    assign gpio6_1_oe_n = mprj_io_oeb[49];
    assign gpio6_1_inp_dis = mprj_io_inp_dis[49];
    assign gpio6_1_ib_mode_sel = mprj_io_ib_mode_sel[49];
    assign gpio6_1_vtrip_sel = mprj_io_vtrip_sel[49];
    assign gpio6_1_slow = mprj_io_slow_sel[49];
    assign gpio6_1_hld_ovr = mprj_io_holdover[49];
    assign gpio6_1_analog_en = mprj_io_analog_en[49];
    assign gpio6_1_analog_sel = mprj_io_analog_sel[49];
    assign gpio6_1_analog_pol = mprj_io_analog_pol[49];
    assign gpio6_1_dm = mprj_io_dm[149:147];
    assign gpio6_1_enable_vddio = gpio6_1_one;
    assign gpio6_1_enable_inp_h = gpio6_1_tie_lo_esd;
    assign gpio6_1_enable_h = porb_h[0];
    assign gpio6_1_hld_h_n = gpio6_1_tie_hi_esd;
    assign gpio6_1_enable_vswitch_h = gpio6_1_tie_hi_esd;
    assign gpio6_1_enable_vdda_h = porb_h[0];
    assign gpio6_1_slew_ctl = mprj_slew_ctl[99:98];
    assign gpio6_1_hys_trim = mprj_hys_trim[49];

    // GPIO 50
    assign mprj_io_in[50] = gpio6_2_in;
    assign gpio6_2_out = mprj_io_out[50];
    assign gpio6_2_oe_n = mprj_io_oeb[50];
    assign gpio6_2_inp_dis = mprj_io_inp_dis[50];
    assign gpio6_2_ib_mode_sel = mprj_io_ib_mode_sel[50];
    assign gpio6_2_vtrip_sel = mprj_io_vtrip_sel[50];
    assign gpio6_2_slow = mprj_io_slow_sel[50];
    assign gpio6_2_hld_ovr = mprj_io_holdover[50];
    assign gpio6_2_analog_en = mprj_io_analog_en[50];
    assign gpio6_2_analog_sel = mprj_io_analog_sel[50];
    assign gpio6_2_analog_pol = mprj_io_analog_pol[50];
    assign gpio6_2_dm = mprj_io_dm[152:150];
    assign gpio6_2_enable_vddio = gpio6_2_one;
    assign gpio6_2_enable_inp_h = gpio6_2_tie_lo_esd;
    assign gpio6_2_enable_h = porb_h[0];
    assign gpio6_2_hld_h_n = gpio6_2_tie_hi_esd;
    assign gpio6_2_enable_vswitch_h = gpio6_2_tie_hi_esd;
    assign gpio6_2_enable_vdda_h = porb_h[0];
    assign gpio6_2_slew_ctl = mprj_slew_ctl[101:100];
    assign gpio6_2_hys_trim = mprj_hys_trim[50];

    // GPIO 51
    assign mprj_io_in[51] = gpio6_3_in;
    assign gpio6_3_out = mprj_io_out[51];
    assign gpio6_3_oe_n = mprj_io_oeb[51];
    assign gpio6_3_inp_dis = mprj_io_inp_dis[51];
    assign gpio6_3_ib_mode_sel = mprj_io_ib_mode_sel[51];
    assign gpio6_3_vtrip_sel = mprj_io_vtrip_sel[51];
    assign gpio6_3_slow = mprj_io_slow_sel[51];
    assign gpio6_3_hld_ovr = mprj_io_holdover[51];
    assign gpio6_3_analog_en = mprj_io_analog_en[51];
    assign gpio6_3_analog_sel = mprj_io_analog_sel[51];
    assign gpio6_3_analog_pol = mprj_io_analog_pol[51];
    assign gpio6_3_dm = mprj_io_dm[155:153];
    assign gpio6_3_enable_vddio = gpio6_3_one;
    assign gpio6_3_enable_inp_h = gpio6_3_tie_lo_esd;
    assign gpio6_3_enable_h = porb_h[0];
    assign gpio6_3_hld_h_n = gpio6_3_tie_hi_esd;
    assign gpio6_3_enable_vswitch_h = gpio6_3_tie_hi_esd;
    assign gpio6_3_enable_vdda_h = porb_h[0];
    assign gpio6_3_slew_ctl = mprj_slew_ctl[103:102];
    assign gpio6_3_hys_trim = mprj_hys_trim[51];

    // GPIO 52
    assign mprj_io_in[52] = gpio6_4_in;
    assign gpio6_4_out = mprj_io_out[52];
    assign gpio6_4_oe_n = mprj_io_oeb[52];
    assign gpio6_4_inp_dis = mprj_io_inp_dis[52];
    assign gpio6_4_ib_mode_sel = mprj_io_ib_mode_sel[52];
    assign gpio6_4_vtrip_sel = mprj_io_vtrip_sel[52];
    assign gpio6_4_slow = mprj_io_slow_sel[52];
    assign gpio6_4_hld_ovr = mprj_io_holdover[52];
    assign gpio6_4_analog_en = mprj_io_analog_en[52];
    assign gpio6_4_analog_sel = mprj_io_analog_sel[52];
    assign gpio6_4_analog_pol = mprj_io_analog_pol[52];
    assign gpio6_4_dm = mprj_io_dm[158:156];
    assign gpio6_4_enable_vddio = gpio6_4_one;
    assign gpio6_4_enable_inp_h = gpio6_4_tie_lo_esd;
    assign gpio6_4_enable_h = porb_h[0];
    assign gpio6_4_hld_h_n = gpio6_4_tie_hi_esd;
    assign gpio6_4_enable_vswitch_h = gpio6_4_tie_hi_esd;
    assign gpio6_4_enable_vdda_h = porb_h[0];
    assign gpio6_4_slew_ctl = mprj_slew_ctl[105:104];
    assign gpio6_4_hys_trim = mprj_hys_trim[52];

    // GPIO 53
    assign mprj_io_in[53] = gpio6_5_in;
    assign gpio6_5_out = mprj_io_out[53];
    assign gpio6_5_oe_n = mprj_io_oeb[53];
    assign gpio6_5_inp_dis = mprj_io_inp_dis[53];
    assign gpio6_5_ib_mode_sel = mprj_io_ib_mode_sel[53];
    assign gpio6_5_vtrip_sel = mprj_io_vtrip_sel[53];
    assign gpio6_5_slow = mprj_io_slow_sel[53];
    assign gpio6_5_hld_ovr = mprj_io_holdover[53];
    assign gpio6_5_analog_en = mprj_io_analog_en[53];
    assign gpio6_5_analog_sel = mprj_io_analog_sel[53];
    assign gpio6_5_analog_pol = mprj_io_analog_pol[53];
    assign gpio6_5_dm = mprj_io_dm[161:159];
    assign gpio6_5_enable_vddio = gpio6_5_one;
    assign gpio6_5_enable_inp_h = gpio6_5_tie_lo_esd;
    assign gpio6_5_enable_h = porb_h[0];
    assign gpio6_5_hld_h_n = gpio6_5_tie_hi_esd;
    assign gpio6_5_enable_vswitch_h = gpio6_5_tie_hi_esd;
    assign gpio6_5_enable_vdda_h = porb_h[0];
    assign gpio6_5_slew_ctl = mprj_slew_ctl[107:106];
    assign gpio6_5_hys_trim = mprj_hys_trim[53];

    // GPIO 54
    assign mprj_io_in[54] = gpio6_6_in;
    assign gpio6_6_out = mprj_io_out[54];
    assign gpio6_6_oe_n = mprj_io_oeb[54];
    assign gpio6_6_inp_dis = mprj_io_inp_dis[54];
    assign gpio6_6_ib_mode_sel = mprj_io_ib_mode_sel[54];
    assign gpio6_6_vtrip_sel = mprj_io_vtrip_sel[54];
    assign gpio6_6_slow = mprj_io_slow_sel[54];
    assign gpio6_6_hld_ovr = mprj_io_holdover[54];
    assign gpio6_6_analog_en = mprj_io_analog_en[54];
    assign gpio6_6_analog_sel = mprj_io_analog_sel[54];
    assign gpio6_6_analog_pol = mprj_io_analog_pol[54];
    assign gpio6_6_dm = mprj_io_dm[164:162];
    assign gpio6_6_enable_vddio = gpio6_6_one;
    assign gpio6_6_enable_inp_h = gpio6_6_tie_lo_esd;
    assign gpio6_6_enable_h = porb_h[0];
    assign gpio6_6_hld_h_n = gpio6_6_tie_hi_esd;
    assign gpio6_6_enable_vswitch_h = gpio6_6_tie_hi_esd;
    assign gpio6_6_enable_vdda_h = porb_h[0];
    assign gpio6_6_slew_ctl = mprj_slew_ctl[109:108];
    assign gpio6_6_hys_trim = mprj_hys_trim[54];

    // GPIO 55
    assign mprj_io_in[55] = gpio6_7_in;
    assign gpio6_7_out = mprj_io_out[55];
    assign gpio6_7_oe_n = mprj_io_oeb[55];
    assign gpio6_7_inp_dis = mprj_io_inp_dis[55];
    assign gpio6_7_ib_mode_sel = mprj_io_ib_mode_sel[55];
    assign gpio6_7_vtrip_sel = mprj_io_vtrip_sel[55];
    assign gpio6_7_slow = mprj_io_slow_sel[55];
    assign gpio6_7_hld_ovr = mprj_io_holdover[55];
    assign gpio6_7_analog_en = mprj_io_analog_en[55];
    assign gpio6_7_analog_sel = mprj_io_analog_sel[55];
    assign gpio6_7_analog_pol = mprj_io_analog_pol[55];
    assign gpio6_7_dm = mprj_io_dm[167:165];
    assign gpio6_7_enable_vddio = gpio6_7_one;
    assign gpio6_7_enable_inp_h = gpio6_7_tie_lo_esd;
    assign gpio6_7_enable_h = porb_h[0];
    assign gpio6_7_hld_h_n = gpio6_7_tie_hi_esd;
    assign gpio6_7_enable_vswitch_h = gpio6_7_tie_hi_esd;
    assign gpio6_7_enable_vdda_h = porb_h[0];
    assign gpio6_7_slew_ctl = mprj_slew_ctl[111:110];
    assign gpio6_7_hys_trim = mprj_hys_trim[55];

    // GPIO 56
    assign mprj_io_in[56] = gpio7_0_in;
    assign gpio7_0_out = mprj_io_out[56];
    assign gpio7_0_oe_n = mprj_io_oeb[56];
    assign gpio7_0_inp_dis = mprj_io_inp_dis[56];
    assign gpio7_0_ib_mode_sel = mprj_io_ib_mode_sel[56];
    assign gpio7_0_vtrip_sel = mprj_io_vtrip_sel[56];
    assign gpio7_0_slow = mprj_io_slow_sel[56];
    assign gpio7_0_hld_ovr = mprj_io_holdover[56];
    assign gpio7_0_analog_en = mprj_io_analog_en[56];
    assign gpio7_0_analog_sel = mprj_io_analog_sel[56];
    assign gpio7_0_analog_pol = mprj_io_analog_pol[56];
    assign gpio7_0_dm = mprj_io_dm[170:168];
    assign gpio7_0_enable_vddio = gpio7_0_one;
    assign gpio7_0_enable_inp_h = gpio7_0_tie_lo_esd;
    assign gpio7_0_enable_h = porb_h[0];
    assign gpio7_0_hld_h_n = gpio7_0_tie_hi_esd;
    assign gpio7_0_enable_vswitch_h = gpio7_0_tie_hi_esd;
    assign gpio7_0_enable_vdda_h = porb_h[0];

    // GPIO 57
    assign mprj_io_in[57] = gpio7_1_in;
    assign gpio7_1_out = mprj_io_out[57];
    assign gpio7_1_oe_n = mprj_io_oeb[57];
    assign gpio7_1_inp_dis = mprj_io_inp_dis[57];
    assign gpio7_1_ib_mode_sel = mprj_io_ib_mode_sel[57];
    assign gpio7_1_vtrip_sel = mprj_io_vtrip_sel[57];
    assign gpio7_1_slow = mprj_io_slow_sel[57];
    assign gpio7_1_hld_ovr = mprj_io_holdover[57];
    assign gpio7_1_analog_en = mprj_io_analog_en[57];
    assign gpio7_1_analog_sel = mprj_io_analog_sel[57];
    assign gpio7_1_analog_pol = mprj_io_analog_pol[57];
    assign gpio7_1_dm = mprj_io_dm[173:171];
    assign gpio7_1_enable_vddio = gpio7_1_one;
    assign gpio7_1_enable_inp_h = gpio7_1_tie_lo_esd;
    assign gpio7_1_enable_h = porb_h[0];
    assign gpio7_1_hld_h_n = gpio7_1_tie_hi_esd;
    assign gpio7_1_enable_vswitch_h = gpio7_1_tie_hi_esd;
    assign gpio7_1_enable_vdda_h = porb_h[0];

    // GPIO 58
    assign mprj_io_in[58] = gpio7_2_in;
    assign gpio7_2_out = mprj_io_out[58];
    assign gpio7_2_oe_n = mprj_io_oeb[58];
    assign gpio7_2_inp_dis = mprj_io_inp_dis[58];
    assign gpio7_2_ib_mode_sel = mprj_io_ib_mode_sel[58];
    assign gpio7_2_vtrip_sel = mprj_io_vtrip_sel[58];
    assign gpio7_2_slow = mprj_io_slow_sel[58];
    assign gpio7_2_hld_ovr = mprj_io_holdover[58];
    assign gpio7_2_analog_en = mprj_io_analog_en[58];
    assign gpio7_2_analog_sel = mprj_io_analog_sel[58];
    assign gpio7_2_analog_pol = mprj_io_analog_pol[58];
    assign gpio7_2_dm = mprj_io_dm[176:174];
    assign gpio7_2_enable_vddio = gpio7_2_one;
    assign gpio7_2_enable_inp_h = gpio7_2_tie_lo_esd;
    assign gpio7_2_enable_h = porb_h[0];
    assign gpio7_2_hld_h_n = gpio7_2_tie_hi_esd;
    assign gpio7_2_enable_vswitch_h = gpio7_2_tie_hi_esd;
    assign gpio7_2_enable_vdda_h = porb_h[0];

    // GPIO 59
    assign mprj_io_in[59] = gpio7_3_in;
    assign gpio7_3_out = mprj_io_out[59];
    assign gpio7_3_oe_n = mprj_io_oeb[59];
    assign gpio7_3_inp_dis = mprj_io_inp_dis[59];
    assign gpio7_3_ib_mode_sel = mprj_io_ib_mode_sel[59];
    assign gpio7_3_vtrip_sel = mprj_io_vtrip_sel[59];
    assign gpio7_3_slow = mprj_io_slow_sel[59];
    assign gpio7_3_hld_ovr = mprj_io_holdover[59];
    assign gpio7_3_analog_en = mprj_io_analog_en[59];
    assign gpio7_3_analog_sel = mprj_io_analog_sel[59];
    assign gpio7_3_analog_pol = mprj_io_analog_pol[59];
    assign gpio7_3_dm = mprj_io_dm[179:177];
    assign gpio7_3_enable_vddio = gpio7_3_one;
    assign gpio7_3_enable_inp_h = gpio7_3_tie_lo_esd;
    assign gpio7_3_enable_h = porb_h[0];
    assign gpio7_3_hld_h_n = gpio7_3_tie_hi_esd;
    assign gpio7_3_enable_vswitch_h = gpio7_3_tie_hi_esd;
    assign gpio7_3_enable_vdda_h = porb_h[0];

    // GPIO 60
    assign mprj_io_in[60] = gpio7_4_in;
    assign gpio7_4_out = mprj_io_out[60];
    assign gpio7_4_oe_n = mprj_io_oeb[60];
    assign gpio7_4_inp_dis = mprj_io_inp_dis[60];
    assign gpio7_4_ib_mode_sel = mprj_io_ib_mode_sel[60];
    assign gpio7_4_vtrip_sel = mprj_io_vtrip_sel[60];
    assign gpio7_4_slow = mprj_io_slow_sel[60];
    assign gpio7_4_hld_ovr = mprj_io_holdover[60];
    assign gpio7_4_analog_en = mprj_io_analog_en[60];
    assign gpio7_4_analog_sel = mprj_io_analog_sel[60];
    assign gpio7_4_analog_pol = mprj_io_analog_pol[60];
    assign gpio7_4_dm = mprj_io_dm[182:180];
    assign gpio7_4_enable_vddio = gpio7_4_one;
    assign gpio7_4_enable_inp_h = gpio7_4_tie_lo_esd;
    assign gpio7_4_enable_h = porb_h[0];
    assign gpio7_4_hld_h_n = gpio7_4_tie_hi_esd;
    assign gpio7_4_enable_vswitch_h = gpio7_4_tie_hi_esd;
    assign gpio7_4_enable_vdda_h = porb_h[0];

    // GPIO 61
    assign mprj_io_in[61] = gpio7_5_in;
    assign gpio7_5_out = mprj_io_out[61];
    assign gpio7_5_oe_n = mprj_io_oeb[61];
    assign gpio7_5_inp_dis = mprj_io_inp_dis[61];
    assign gpio7_5_ib_mode_sel = mprj_io_ib_mode_sel[61];
    assign gpio7_5_vtrip_sel = mprj_io_vtrip_sel[61];
    assign gpio7_5_slow = mprj_io_slow_sel[61];
    assign gpio7_5_hld_ovr = mprj_io_holdover[61];
    assign gpio7_5_analog_en = mprj_io_analog_en[61];
    assign gpio7_5_analog_sel = mprj_io_analog_sel[61];
    assign gpio7_5_analog_pol = mprj_io_analog_pol[61];
    assign gpio7_5_dm = mprj_io_dm[185:183];
    assign gpio7_5_enable_vddio = gpio7_5_one;
    assign gpio7_5_enable_inp_h = gpio7_5_tie_lo_esd;
    assign gpio7_5_enable_h = porb_h[0];
    assign gpio7_5_hld_h_n = gpio7_5_tie_hi_esd;
    assign gpio7_5_enable_vswitch_h = gpio7_5_tie_hi_esd;
    assign gpio7_5_enable_vdda_h = porb_h[0];

    // GPIO 62
    assign mprj_io_in[62] = gpio7_6_in;
    assign gpio7_6_out = mprj_io_out[62];
    assign gpio7_6_oe_n = mprj_io_oeb[62];
    assign gpio7_6_inp_dis = mprj_io_inp_dis[62];
    assign gpio7_6_ib_mode_sel = mprj_io_ib_mode_sel[62];
    assign gpio7_6_vtrip_sel = mprj_io_vtrip_sel[62];
    assign gpio7_6_slow = mprj_io_slow_sel[62];
    assign gpio7_6_hld_ovr = mprj_io_holdover[62];
    assign gpio7_6_analog_en = mprj_io_analog_en[62];
    assign gpio7_6_analog_sel = mprj_io_analog_sel[62];
    assign gpio7_6_analog_pol = mprj_io_analog_pol[62];
    assign gpio7_6_dm = mprj_io_dm[188:186];
    assign gpio7_6_enable_vddio = gpio7_6_one;
    assign gpio7_6_enable_inp_h = gpio7_6_tie_lo_esd;
    assign gpio7_6_enable_h = porb_h[0];
    assign gpio7_6_hld_h_n = gpio7_6_tie_hi_esd;
    assign gpio7_6_enable_vswitch_h = gpio7_6_tie_hi_esd;
    assign gpio7_6_enable_vdda_h = porb_h[0];

    // GPIO 63
    assign mprj_io_in[63] = gpio7_7_in;
    assign gpio7_7_out = mprj_io_out[63];
    assign gpio7_7_oe_n = mprj_io_oeb[63];
    assign gpio7_7_inp_dis = mprj_io_inp_dis[63];
    assign gpio7_7_ib_mode_sel = mprj_io_ib_mode_sel[63];
    assign gpio7_7_vtrip_sel = mprj_io_vtrip_sel[63];
    assign gpio7_7_slow = mprj_io_slow_sel[63];
    assign gpio7_7_hld_ovr = mprj_io_holdover[63];
    assign gpio7_7_analog_en = mprj_io_analog_en[63];
    assign gpio7_7_analog_sel = mprj_io_analog_sel[63];
    assign gpio7_7_analog_pol = mprj_io_analog_pol[63];
    assign gpio7_7_dm = mprj_io_dm[191:189];
    assign gpio7_7_enable_vddio = gpio7_7_one;
    assign gpio7_7_enable_inp_h = gpio7_7_tie_lo_esd;
    assign gpio7_7_enable_h = porb_h[0];
    assign gpio7_7_hld_h_n = gpio7_7_tie_hi_esd;
    assign gpio7_7_enable_vswitch_h = gpio7_7_tie_hi_esd;
    assign gpio7_7_enable_vdda_h = porb_h[0];

    // SIO 0 (GPIO 72)
    assign mprj_io_in[64]       = sio_in[0];
    assign sio_out[0]           = mprj_io_out[64];
    assign sio_oe_n[0]          = mprj_io_oeb[64];
    assign sio_inp_dis[0]       = mprj_io_inp_dis[64];
    assign sio_vtrip_sel[0]     = mprj_io_vtrip_sel[64];
    assign sio_slow[0]          = mprj_io_slow_sel[64];
    assign sio_hld_ovr[0]       = mprj_io_holdover[64];
    assign sio_dm0              = mprj_io_dm[194:192];
    // assign sio_enable_vddio[0]  = 1'b1; // Not exported from panamax
    // assign sio_enable_inp_h[0]  = sio_tie_lo_esd[0]; // Not exported from panamax
    assign sio_enable_h         = porb_h[1];
    assign sio_hld_h_n[0]       = gpio0_0_tie_hi_esd;
    assign sio_enable_vdda_h    = porb_h[1];
    assign sio_ibuf_sel[0]      = mprj_io_ib_mode_sel[64];
    assign sio_vreg_en[0]       = mprj_hys_trim[64];
    assign sio_hld_h_n_refgen   = gpio0_0_tie_hi_esd; 
    assign sio_ibuf_sel_refgen  = mprj_io_analog_pol[64];
    assign sio_vtrip_sel_refgen = mprj_io_analog_sel[64];
    assign sio_dft_refgen       = mprj_slew_ctl[129];
    // assign sio_vohref           = 1'b1; // Analog connection

    // SIO 1 (GPIO 73)
    assign mprj_io_in[65]           = sio_in[1];
    assign sio_out[1]               = mprj_io_out[65];
    assign sio_oe_n[1]              = mprj_io_oeb[65];
    assign sio_inp_dis[1]           = mprj_io_inp_dis[65];
    assign sio_vtrip_sel[1]         = mprj_io_vtrip_sel[65];
    assign sio_slow[1]              = mprj_io_slow_sel[65];
    assign sio_hld_ovr[1]           = mprj_io_holdover[65];
    assign sio_dm1                  = mprj_io_dm[197:195];
    // assign sio_enable_vddio[1]      = 1'b1; // Not exported from panamax
    // assign sio_enable_inp_h[1]      = sio_tie_lo_esd[1]; // Not exported from panamax
    assign sio_hld_h_n[1]           = gpio0_0_tie_hi_esd;
    assign sio_ibuf_sel[1]       = mprj_io_ib_mode_sel[65]; 
    assign sio_vreg_en[1]        = mprj_hys_trim[65];
    assign sio_voh_sel = sio_cfg[2:0];
    assign sio_vref_sel = sio_cfg[4:3];
    assign sio_vreg_en_refgen = sio_cfg[5];

    // NON-CONFIGURABLE GPIOs PAD FRAME MAPPING
    // GPIO 64
    assign xclk = gpio8_0_in;
    assign gpio8_0_out = 1'b0;
    assign gpio8_0_oe_n = 1'b1;
    assign gpio8_0_inp_dis = 1'b0;
    assign gpio8_0_ib_mode_sel = gpio8_0_zero;
    assign gpio8_0_vtrip_sel = gpio8_0_zero;
    assign gpio8_0_slow = gpio8_0_zero;
    assign gpio8_0_hld_ovr = gpio8_0_zero;
    assign gpio8_0_analog_en = gpio8_0_zero;
    assign gpio8_0_analog_sel = gpio8_0_zero;
    assign gpio8_0_analog_pol = gpio8_0_zero;
    assign gpio8_0_dm = {gpio8_0_one,gpio8_0_one,gpio8_0_zero};
    assign gpio8_0_enable_vddio = gpio8_0_one;
    assign gpio8_0_enable_inp_h = gpio8_0_tie_lo_esd;
    assign gpio8_0_enable_h = porb_h[0];
    assign gpio8_0_hld_h_n = gpio8_0_tie_hi_esd;
    assign gpio8_0_enable_vswitch_h = gpio8_0_tie_hi_esd;
    assign gpio8_0_enable_vdda_h = porb_h[0];

    // GPIO 65
    // assign NO_CONNECT = gpio8_1_in;
    assign gpio8_1_out = flash_cen;
    assign gpio8_1_oe_n = 1'b0;
    assign gpio8_1_inp_dis = 1'b1;
    assign gpio8_1_ib_mode_sel = gpio8_1_zero;
    assign gpio8_1_vtrip_sel = gpio8_1_zero;
    assign gpio8_1_slow = gpio8_1_zero;
    assign gpio8_1_hld_ovr = gpio8_1_zero;
    assign gpio8_1_analog_en = gpio8_1_zero;
    assign gpio8_1_analog_sel = gpio8_1_zero;
    assign gpio8_1_analog_pol = gpio8_1_zero;
    assign gpio8_1_dm = {gpio8_1_one,gpio8_1_one,gpio8_1_zero};
    assign gpio8_1_enable_vddio = gpio8_1_one;
    assign gpio8_1_enable_inp_h = gpio8_1_tie_lo_esd;
    assign gpio8_1_enable_h = porb_h[0];
    assign gpio8_1_hld_h_n = gpio8_1_tie_hi_esd;
    assign gpio8_1_enable_vswitch_h = gpio8_1_tie_hi_esd;
    assign gpio8_1_enable_vdda_h = porb_h[0];

    // GPIO 66
    // assign NO_CONNECT = gpio8_2_in;
    assign gpio8_2_out = flash_sck;
    assign gpio8_2_oe_n = 1'b0;
    assign gpio8_2_inp_dis = 1'b1;
    assign gpio8_2_ib_mode_sel = gpio8_2_zero;
    assign gpio8_2_vtrip_sel = gpio8_2_zero;
    assign gpio8_2_slow = gpio8_2_zero;
    assign gpio8_2_hld_ovr = gpio8_2_zero;
    assign gpio8_2_analog_en = gpio8_2_zero;
    assign gpio8_2_analog_sel = gpio8_2_zero;
    assign gpio8_2_analog_pol = gpio8_2_zero;
    assign gpio8_2_dm = {gpio8_2_one,gpio8_2_one,gpio8_2_zero};
    assign gpio8_2_enable_vddio = gpio8_2_one;
    assign gpio8_2_enable_inp_h = gpio8_2_tie_lo_esd;
    assign gpio8_2_enable_h = porb_h[0];
    assign gpio8_2_hld_h_n = gpio8_2_tie_hi_esd;
    assign gpio8_2_enable_vswitch_h = gpio8_2_tie_hi_esd;
    assign gpio8_2_enable_vdda_h = porb_h[0];

    // GPIO 67
    assign flash_din[0] = gpio8_3_in;
    assign gpio8_3_out = flash_dout[0];
    assign gpio8_3_oe_n = ~flash_douten[0];
    assign gpio8_3_inp_dis = flash_douten[0];
    assign gpio8_3_ib_mode_sel = gpio8_3_zero;
    assign gpio8_3_vtrip_sel = gpio8_3_zero;
    assign gpio8_3_slow = gpio8_3_zero;
    assign gpio8_3_hld_ovr = gpio8_3_zero;
    assign gpio8_3_analog_en = gpio8_3_zero;
    assign gpio8_3_analog_sel = gpio8_3_zero;
    assign gpio8_3_analog_pol = gpio8_3_zero;
    assign gpio8_3_dm = {gpio8_3_one,gpio8_3_one,gpio8_3_zero};
    assign gpio8_3_enable_vddio = gpio8_3_one;
    assign gpio8_3_enable_inp_h = gpio8_3_tie_lo_esd;
    assign gpio8_3_enable_h = porb_h[0];
    assign gpio8_3_hld_h_n = gpio8_3_tie_hi_esd;
    assign gpio8_3_enable_vswitch_h = gpio8_3_tie_hi_esd;
    assign gpio8_3_enable_vdda_h = porb_h[0];

    // GPIO 68
    assign flash_din[1] = gpio8_4_in;
    assign gpio8_4_out = flash_dout[1];
    assign gpio8_4_oe_n = ~flash_douten[1];
    assign gpio8_4_inp_dis = flash_douten[1];
    assign gpio8_4_ib_mode_sel = gpio8_4_zero;
    assign gpio8_4_vtrip_sel = gpio8_4_zero;
    assign gpio8_4_slow = gpio8_4_zero;
    assign gpio8_4_hld_ovr = gpio8_4_zero;
    assign gpio8_4_analog_en = gpio8_4_zero;
    assign gpio8_4_analog_sel = gpio8_4_zero;
    assign gpio8_4_analog_pol = gpio8_4_zero;
    assign gpio8_4_dm = {gpio8_4_one,gpio8_4_one,gpio8_4_zero};
    assign gpio8_4_enable_vddio = gpio8_4_one;
    assign gpio8_4_enable_inp_h = gpio8_4_tie_lo_esd;
    assign gpio8_4_enable_h = porb_h[0];
    assign gpio8_4_hld_h_n = gpio8_4_tie_hi_esd;
    assign gpio8_4_enable_vswitch_h = gpio8_4_tie_hi_esd;
    assign gpio8_4_enable_vdda_h = porb_h[0];

    // GPIO 69
    assign flash_din[2] = gpio8_5_in;
    assign gpio8_5_out = flash_dout[2];
    assign gpio8_5_oe_n = ~flash_douten[2];
    assign gpio8_5_inp_dis = flash_douten[2];
    assign gpio8_5_ib_mode_sel = gpio8_5_zero;
    assign gpio8_5_vtrip_sel = gpio8_5_zero;
    assign gpio8_5_slow = gpio8_5_zero;
    assign gpio8_5_hld_ovr = gpio8_5_zero;
    assign gpio8_5_analog_en = gpio8_5_zero;
    assign gpio8_5_analog_sel = gpio8_5_zero;
    assign gpio8_5_analog_pol = gpio8_5_zero;
    assign gpio8_5_dm = {gpio8_5_one,gpio8_5_one,gpio8_5_zero};
    assign gpio8_5_enable_vddio = gpio8_5_one;
    assign gpio8_5_enable_inp_h = gpio8_5_tie_lo_esd;
    assign gpio8_5_enable_h = porb_h[0];
    assign gpio8_5_hld_h_n = gpio8_5_tie_hi_esd;
    assign gpio8_5_enable_vswitch_h = gpio8_5_tie_hi_esd;
    assign gpio8_5_enable_vdda_h = porb_h[0];

    // GPIO 70
    assign flash_din[3] = gpio8_6_in;
    assign gpio8_6_out = flash_dout[3];
    assign gpio8_6_oe_n = ~flash_douten[3];
    assign gpio8_6_inp_dis = flash_douten[3];
    assign gpio8_6_ib_mode_sel = gpio8_6_zero;
    assign gpio8_6_vtrip_sel = gpio8_6_zero;
    assign gpio8_6_slow = gpio8_6_zero;
    assign gpio8_6_hld_ovr = gpio8_6_zero;
    assign gpio8_6_analog_en = gpio8_6_zero;
    assign gpio8_6_analog_sel = gpio8_6_zero;
    assign gpio8_6_analog_pol = gpio8_6_zero;
    assign gpio8_6_dm = {gpio8_6_one,gpio8_6_one,gpio8_6_zero};
    assign gpio8_6_enable_vddio = gpio8_6_one;
    assign gpio8_6_enable_inp_h = gpio8_6_tie_lo_esd;
    assign gpio8_6_enable_h = porb_h[0];
    assign gpio8_6_hld_h_n = gpio8_6_tie_hi_esd;
    assign gpio8_6_enable_vswitch_h = gpio8_6_tie_hi_esd;
    assign gpio8_6_enable_vdda_h = porb_h[0];

    // GPIO 71
    assign gpioH_io_in = gpio8_7_in;
    assign gpio8_7_out = gpioH_io_out;
    assign gpio8_7_oe_n = ~gpioH_io_oe;
    assign gpio8_7_inp_dis = gpioH_io_oe;
    assign gpio8_7_ib_mode_sel = gpio8_7_zero;
    assign gpio8_7_vtrip_sel = gpio8_7_zero;
    assign gpio8_7_slow = gpio8_7_zero;
    assign gpio8_7_hld_ovr = gpio8_7_zero;
    assign gpio8_7_analog_en = gpio8_7_zero;
    assign gpio8_7_analog_sel = gpio8_7_zero;
    assign gpio8_7_analog_pol = gpio8_7_zero;
    assign gpio8_7_dm = {gpio8_7_one,gpio8_7_one,gpio8_7_zero};
    assign gpio8_7_enable_vddio = gpio8_7_one;
    assign gpio8_7_enable_inp_h = gpio8_7_tie_lo_esd;
    assign gpio8_7_enable_h = porb_h[0];
    assign gpio8_7_hld_h_n = gpio8_7_tie_hi_esd;
    assign gpio8_7_enable_vswitch_h = gpio8_7_tie_hi_esd;
    assign gpio8_7_enable_vdda_h = porb_h[0];

    //connect top_pwrdetv2 pad inputs 
    assign pwrdet_in1_vddd_hv   = pwrdet_tie_lo_esd;
    assign pwrdet_in1_vddio_hv  = pwrdet_tie_lo_esd;
    assign pwrdet_in2_vddd_hv   = pwrdet_tie_lo_esd;
    assign pwrdet_in2_vddio_hv  = pwrdet_tie_lo_esd;
    assign pwrdet_in3_vddd_hv   = pwrdet_tie_lo_esd;
    assign pwrdet_in3_vddio_hv  = pwrdet_tie_lo_esd;
    assign pwrdet_rst_por_hv_n  = porb_h[0];

`ifdef PnR
    (* keep *) analog_routes analog_routes();
    (* keep *) manual_power_connections manual_power_connections();
`endif

endmodule  // frigate_core

`default_nettype wire
