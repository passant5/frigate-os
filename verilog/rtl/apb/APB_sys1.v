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

module APB_sys1 #(
    parameter CLK_MHZ    = 12      // For timer timebase
)(
	`ifdef USE_POWER_PINS
		inout VPWR,
		inout VGND,
	`endif

    input wire                  clk,
    input wire                  rst_n,

    input  wire [31:0]          paddr,
	input  wire                 psel,
	input  wire                 penable,
	input  wire                 pwrite,
	input  wire [31:0]          pwdata,
	output wire                 pready,
	output wire [31:0]          prdata,
	output wire                 pslverr,

	// UART0
    input  wire                 uart0_rx,
    output wire                 uart0_tx,
    output wire                 uart0_irq,

	// UART1
    input  wire                 uart1_rx,
    output wire                 uart1_tx,
    output wire                 uart1_irq,

	// UART2
    input  wire                 uart2_rx,
    output wire                 uart2_tx,
    output wire                 uart2_irq,

	// UART3
    input  wire                 uart3_rx,
    output wire                 uart3_tx,
    output wire                 uart3_irq,

	// TMR0
	output wire 				tmr0_pwm0,
	output wire 				tmr0_pwm1,
	input  wire 				tmr0_pwm_fault,
	output  wire 				tmr0_irq,

	// TMR1
	output wire 				tmr1_pwm0,
	output wire 				tmr1_pwm1,
	input  wire 				tmr1_pwm_fault,
	output  wire 				tmr1_irq,

	// TMR2
	output wire 				tmr2_pwm0,
	output wire 				tmr2_pwm1,
	input  wire 				tmr2_pwm_fault,
	output  wire 				tmr2_irq,

	// TMR3
	output wire 				tmr3_pwm0,
	output wire 				tmr3_pwm1,
	input  wire 				tmr3_pwm_fault,
	output  wire 				tmr3_irq,

	// TMR4
	output wire 				tmr4_pwm0,
	output wire 				tmr4_pwm1,
	input  wire 				tmr4_pwm_fault,
	output  wire 				tmr4_irq,

	// TMR5
	output wire 				tmr5_pwm0,
	output wire 				tmr5_pwm1,
	input  wire 				tmr5_pwm_fault,
	output  wire 				tmr5_irq,


	//WDT0
	output wire      			wdt0_irq,

	//SPI0
	input  wire         		spi0_MSI,
    output wire         		spi0_MSO,
    output wire         		spi0_SSn,
    output wire         		spi0_SCK,
	output wire 				spi0_irq,

	//SPI1
	input  wire         		spi1_MSI,
    output wire         		spi1_MSO,
    output wire         		spi1_SSn,
    output wire         		spi1_SCK,
	output wire 				spi1_irq,

	//I2C0
	input  wire					i2c0_scl_i,
	output wire					i2c0_scl_o,
	output wire					i2c0_scl_oen_o,
	input  wire					i2c0_sda_i,
	output wire					i2c0_sda_o,
	output wire					i2c0_sda_oen_o,
	output wire					i2c0_irq,

	//I2C1
	input  wire					i2c1_scl_i,
	output wire					i2c1_scl_o,
	output wire					i2c1_scl_oen_o,
	input  wire					i2c1_sda_i,
	output wire					i2c1_sda_o,
	output wire					i2c1_sda_oen_o,
	output wire					i2c1_irq,

	 // Test points enable/disable connections
	output wire [1:0] ibias_test_to_gpio1_2,
	output wire [1:0] vbg_test_to_gpio1_1,
 
	// iDAC enable/disable connections
	output wire [1:0] idac_to_gpio1_3,
	output wire [1:0] idac_to_gpio1_2,
 
	// ADC and DAC reference voltage selection enable/disable connections
	output wire [1:0] adc_refh_to_gpio6_6,
	output wire [1:0] dac_refh_to_gpio1_1,
	output wire [1:0] adc_refl_to_gpio6_7,
	output wire [1:0] dac_refl_to_gpio1_0,
 
	// Right lp op-amp output wire enable/disable connections
	output wire [1:0] right_lp_opamp_to_ulpcomp_p,
	output wire [1:0] right_lp_opamp_to_comp_p,
	output wire [1:0] right_lp_opamp_to_adc0,
	output wire [1:0] right_lp_opamp_to_gpio4_7,
	output wire [1:0] right_lp_opamp_to_gpio4_3,
	output wire [1:0] right_lp_opamp_to_analog1,
	output wire [1:0] right_lp_opamp_to_amuxbusB,
	output wire [1:0] right_lp_opamp_to_gpio3_7,
	output wire [1:0] right_lp_opamp_to_gpio3_3,
 
	// Right hgbw op-amp output wire enable/disable connections
	output wire [1:0] right_hgbw_opamp_to_ulpcomp_n,
	output wire [1:0] right_hgbw_opamp_to_comp_n,
	output wire [1:0] right_hgbw_opamp_to_adc1,
	output wire [1:0] right_hgbw_opamp_to_gpio4_6,
	output wire [1:0] right_hgbw_opamp_to_gpio4_2,
	output wire [1:0] right_hgbw_opamp_to_analog0,
	output wire [1:0] right_hgbw_opamp_to_amuxbusA,
	output wire [1:0] right_hgbw_opamp_to_gpio3_6,
	output wire [1:0] right_hgbw_opamp_to_gpio3_2,
 
	// Left hgbw op-amp output wire enable/disable connections
	output wire [1:0] left_hgbw_opamp_to_ulpcomp_p,
	output wire [1:0] left_hgbw_opamp_to_comp_p,
	output wire [1:0] left_hgbw_opamp_to_adc0,
	output wire [1:0] left_hgbw_opamp_to_gpio4_5,
	output wire [1:0] left_hgbw_opamp_to_gpio4_1,
	output wire [1:0] left_hgbw_opamp_to_analog1,
	output wire [1:0] left_hgbw_opamp_to_amuxbusB,
	output wire [1:0] left_hgbw_opamp_to_gpio3_5,
	output wire [1:0] left_hgbw_opamp_to_gpio3_1,
 
	// Left lp op-amp output wire enable/disable connections
	output wire [1:0] left_lp_opamp_to_ulpcomp_n,
	output wire [1:0] left_lp_opamp_to_comp_n,
	output wire [1:0] left_lp_opamp_to_adc1,
	output wire [1:0] left_lp_opamp_to_gpio4_0,
	output wire [1:0] left_lp_opamp_to_analog0,
	output wire [1:0] left_lp_opamp_to_amuxbusA,
	output wire [1:0] left_lp_opamp_to_gpio3_4,
 
	// Right lp op-amp positive output wire enable/disable connections
	output wire right_lp_opamp_p_to_dac0,
	output wire right_lp_opamp_p_to_analog0,
	output wire right_lp_opamp_p_to_amuxbusA,
	output wire right_lp_opamp_p_to_rheostat_out,
	output wire right_lp_opamp_p_to_sio0,
	output wire right_lp_opamp_p_to_tempsense,
	output wire right_lp_opamp_p_to_left_vref,
	output wire right_lp_opamp_p_to_voutref,
	output wire [1:0] right_lp_opamp_p_to_gpio2_5,
 
	// Right lp op-amp negative output wire enable/disable connections
	output wire right_lp_opamp_n_to_dac1,
	output wire right_lp_opamp_n_to_analog1,
	output wire right_lp_opamp_n_to_amuxbusB,
	output wire right_lp_opamp_n_to_rheostat_out,
	output wire right_lp_opamp_n_to_rheostat_tap,
	output wire right_lp_opamp_n_to_sio1,
	output wire right_lp_opamp_n_to_vbgtc,
	output wire right_lp_opamp_n_to_right_vref,
	output wire right_lp_opamp_n_to_vinref,
	output wire [1:0] right_lp_opamp_n_to_gpio2_4,
 
	// Right hgbw op-amp positive output wire enable/disable connections
	output wire [1:0] right_hgbw_opamp_p_to_gpio5_0,
	output wire right_hgbw_opamp_p_to_dac0,
	output wire right_hgbw_opamp_p_to_analog0,
	output wire right_hgbw_opamp_p_to_amuxbusA,
	output wire right_hgbw_opamp_p_to_rheostat_out,
	output wire right_hgbw_opamp_p_to_sio0,
	output wire right_hgbw_opamp_p_to_left_vref,
	output wire right_hgbw_opamp_p_to_voutref,
	output wire [1:0] right_hgbw_opamp_p_to_gpio2_3,
 
	// Right hgbw op-amp negative output wire enable/disable connections
	output wire [1:0] right_hgbw_opamp_n_to_gpio5_1,
	output wire right_hgbw_opamp_n_to_dac1,
	output wire right_hgbw_opamp_n_to_analog1,
	output wire right_hgbw_opamp_n_to_amuxbusB,
	output wire right_hgbw_opamp_n_to_rheostat_out,
	output wire right_hgbw_opamp_n_to_rheostat_tap,
	output wire right_hgbw_opamp_n_to_sio1,
	output wire right_hgbw_opamp_n_to_vbgsc,
	output wire right_hgbw_opamp_n_to_right_vref,
	output wire right_hgbw_opamp_n_to_vinref,
	output wire [1:0] right_hgbw_opamp_n_to_gpio2_2,
 
	// Left hgbw op-amp positive output wire enable/disable connections
	output wire [1:0] left_hgbw_opamp_p_to_gpio5_2,
	output wire left_hgbw_opamp_p_to_dac0,
	output wire left_hgbw_opamp_p_to_analog0,
	output wire left_hgbw_opamp_p_to_amuxbusA,
	output wire left_hgbw_opamp_p_to_rheostat_out,
	output wire left_hgbw_opamp_p_to_sio0,
	output wire left_hgbw_opamp_p_to_tempsense,
	output wire left_hgbw_opamp_p_to_left_vref,
	output wire left_hgbw_opamp_p_to_voutref,
	output wire [1:0] left_hgbw_opamp_p_to_gpio2_1,
 
	// Left hgbw op-amp negative output wire enable/disable connections
	output wire [1:0] left_hgbw_opamp_n_to_gpio5_3,
	output wire left_hgbw_opamp_n_to_dac1,
	output wire left_hgbw_opamp_n_to_analog1,
	output wire left_hgbw_opamp_n_to_amuxbusB,
	output wire left_hgbw_opamp_n_to_rheostat_out,
	output wire left_hgbw_opamp_n_to_rheostat_tap,
	output wire left_hgbw_opamp_n_to_sio1,
	output wire left_hgbw_opamp_n_to_vbgtc,
	output wire left_hgbw_opamp_n_to_right_vref,
	output wire left_hgbw_opamp_n_to_vinref,
	output wire [1:0] left_hgbw_opamp_n_to_gpio2_0,
 
	// Left lp op-amp positive output wire enable/disable connections
	output wire [1:0] left_lp_opamp_p_to_gpio5_4,
	output wire left_lp_opamp_p_to_dac0,
	output wire left_lp_opamp_p_to_analog0,
	output wire left_lp_opamp_p_to_amuxbusA,
	output wire left_lp_opamp_p_to_rheostat_out,
	output wire left_lp_opamp_p_to_sio0,
	output wire left_lp_opamp_p_to_left_vref,
	output wire left_lp_opamp_p_to_voutref,
 
	// Left lp op-amp negative output wire enable/disable connections
	output wire [1:0] left_lp_opamp_n_to_gpio5_5,
	output wire left_lp_opamp_n_to_dac1,
	output wire left_lp_opamp_n_to_analog1,
	output wire left_lp_opamp_n_to_amuxbusB,
	output wire left_lp_opamp_n_to_rheostat_out,
	output wire left_lp_opamp_n_to_rheostat_tap,
	output wire left_lp_opamp_n_to_sio1,
	output wire left_lp_opamp_n_to_vbgsc,
	output wire left_lp_opamp_n_to_right_vref,
	output wire left_lp_opamp_n_to_vinref,
 
	// Left instrumentation amplifier output wire enable/disable connections
	output wire [1:0] left_instramp_to_ulpcomp_p,
	output wire [1:0] left_instramp_to_comp_p,
	output wire [1:0] left_instramp_to_adc0,
	output wire [1:0] left_instramp_to_gpio4_4,
	output wire [1:0] left_instramp_to_analog1,
	output wire [1:0] left_instramp_to_amuxbusB,
 
	// Right instrumentation amplifier output wire enable/disable connections
	output wire [1:0] right_instramp_to_ulpcomp_n,
	output wire [1:0] right_instramp_to_comp_n,
	output wire [1:0] right_instramp_to_adc1,
	output wire [1:0] right_instramp_to_analog0,
	output wire [1:0] right_instramp_to_amuxbusA,
	output wire [1:0] right_instramp_to_gpio3_0,
 
	// Left instrumentation amplifier negative output wire enable/disable connections
	output wire [1:0] left_instramp_n_to_gpio5_7,
	output wire left_instramp_n_to_analog1,
	output wire left_instramp_n_to_amuxbusB,
	output wire left_instramp_n_to_sio1,
	output wire left_instramp_n_to_right_vref,
	output wire left_instramp_n_to_vinref,
 
	// Left instrumentation amplifier positive output wire enable/disable connections
	output wire [1:0] left_instramp_p_to_gpio5_6,
	output wire left_instramp_p_to_analog0,
	output wire left_instramp_p_to_amuxbusA,
	output wire left_instramp_p_to_sio0,
	output wire left_instramp_p_to_tempsense,
	output wire left_instramp_p_to_left_vref,
	output wire left_instramp_p_to_voutref,
 
	// Right instrumentation amplifier negative output wire enable/disable connections
	output wire right_instramp_n_to_analog1,
	output wire right_instramp_n_to_amuxbusB,
	output wire right_instramp_n_to_sio1,
	output wire right_instramp_n_to_right_vref,
	output wire right_instramp_n_to_vinref,
	output wire [1:0] right_instramp_n_to_gpio2_6,
 
	// Right instrumentation amplifier positive output wire enable/disable connections
	output wire right_instramp_p_to_analog0,
	output wire right_instramp_p_to_amuxbusA,
	output wire right_instramp_p_to_sio0,
	output wire right_instramp_p_to_tempsense,
	output wire right_instramp_p_to_left_vref,
	output wire right_instramp_p_to_voutref,
	output wire [1:0] right_instramp_p_to_gpio2_7,
 
	// ULP comparator positive output wire enable/disable connections
	output wire ulpcomp_p_to_dac0,
	output wire ulpcomp_p_to_analog1,
	output wire ulpcomp_p_to_sio0,
	output wire ulpcomp_p_to_vbgtc,
	output wire ulpcomp_p_to_tempsense,
	output wire ulpcomp_p_to_left_vref,
	output wire ulpcomp_p_to_voutref,
	output wire [1:0] ulpcomp_p_to_gpio6_0,
	output wire [1:0] ulpcomp_p_to_gpio1_7,
 
	// ULP comparator negative output wire enable/disable connections
	output wire ulpcomp_n_to_dac1,
	output wire ulpcomp_n_to_analog0,
	output wire ulpcomp_n_to_sio1,
	output wire ulpcomp_n_to_vbgsc,
	output wire ulpcomp_n_to_right_vref,
	output wire ulpcomp_n_to_vinref,
	output wire [1:0] ulpcomp_n_to_gpio6_1,
	output wire [1:0] ulpcomp_n_to_gpio1_6,
 
	// Comparator positive output wire enable/disable connections
	output wire comp_p_to_dac0,
	output wire comp_p_to_analog1,
	output wire comp_p_to_sio0,
	output wire comp_p_to_vbgtc,
	output wire comp_p_to_tempsense,
	output wire comp_p_to_left_vref,
	output wire comp_p_to_voutref,
	output wire [1:0] comp_p_to_gpio6_2,
	output wire [1:0] comp_p_to_gpio1_5,
 
	// Comparator negative output wire enable/disable connections
	output wire comp_n_to_dac1,
	output wire comp_n_to_analog0,
	output wire comp_n_to_sio1,
	output wire comp_n_to_vbgsc,
	output wire comp_n_to_right_vref,
	output wire comp_n_to_vinref,
	output wire [1:0] comp_n_to_gpio6_3,
	output wire [1:0] comp_n_to_gpio1_4,
 
	// ADC0 output wire enable/disable connections
	output wire adc0_to_dac0,
	output wire adc0_to_analog1,
	output wire adc0_to_vbgtc,
	output wire adc0_to_tempsense,
	output wire adc0_to_left_vref,
	output wire adc0_to_voutref,
	output wire [1:0] adc0_to_gpio6_4,
	output wire [1:0] adc0_to_gpio1_3,
 
	// ADC1 output wire enable/disable connections
	output wire adc1_to_dac1,
	output wire adc1_to_analog0,
	output wire adc1_to_vbgsc,
	output wire adc1_to_right_vref,
	output wire adc1_to_vinref,
	output wire [1:0] adc1_to_gpio6_5,
	output wire [1:0] adc1_to_gpio1_2,
 
	// SIO pin enable/disable connections
	output wire [1:0] sio0_connect,
	output wire [1:0] sio1_connect,
 
	// Analog pin enable/disable connections
	output wire [1:0] analog0_connect,
	output wire [1:0] analog1_connect,
 
	// User project enable/disable connections
	output wire vbgtc_to_user,
	output wire vbgsc_to_user,
	output wire [1:0] user_to_comp_n,
	output wire [1:0] user_to_comp_p,
	output wire [1:0] user_to_ulpcomp_n,
	output wire [1:0] user_to_ulpcomp_p,
	output wire [1:0] user_to_adc0,
	output wire [1:0] user_to_adc1,
	output wire dac0_to_user,
	output wire dac1_to_user,
	output wire tempsense_to_user,
	output wire right_vref_to_user,
	output wire left_vref_to_user,
	output wire vinref_to_user,
	output wire voutref_to_user,
	
	// Audiodac output connections
	output	wire dac0_to_analog1,
	output	wire dac1_to_analog0,
	output	wire [1:0] audiodac_out_to_analog1,
	output	wire [1:0] audiodac_outb_to_analog0,


	// Instrumentation amplifier (TBD)
	output wire left_instramp_ena,
	output wire [4:0] left_instramp_G1,	// programmable gain
	output wire [4:0] left_instramp_G2,	// programmable gain
 
	// High gain-bandwidth operational amplifier
	output wire left_hgbw_opamp_ena,
 
	// Low power operational amplifier (TBD)
	output wire left_lp_opamp_ena,
 
	// Rheostat 1
	output wire [7:0] left_rheostat1_b,	// programmable tap
 
	// Rheostat 2
	output wire [7:0] left_rheostat2_b,	// programmable tap
 
	// Amplifiers right
	// Instrumentation amplifier (TBD)
	output wire right_instramp_ena,
	output wire [4:0] right_instramp_G1,	// programmable gain
	output wire [4:0] right_instramp_G2,	// programmable gain
 
	// High gain-bandwidth operational amplifier
	output wire right_hgbw_opamp_ena,
 
	// Low power operational amplifier (TBD)
	output wire right_lp_opamp_ena,
 
	// Rheostat 1
	output wire [7:0] right_rheostat1_b,	// programmable tap
 
	// Rheostat 2
	output wire [7:0] right_rheostat2_b,	// programmable tap
 
	// Comparator
	output wire  comp_ena,
	output wire [5:0] comp_trim,	// offset trim
	output wire [1:0] comp_hyst,	// hysteresis trim
	input wire      comp_out,	// comparator output wire
	
	// Ultra-low-power comparator
	output wire  ulpcomp_ena,
	output wire ulpcomp_clk,
	input wire  ulpcomp_out,		// comparator output wire
 
	// Bandgap
	output wire  bandgap_ena,
	output wire [15:0] bandgap_trim,		// bandgap trim
	output wire bandgap_sel,
 
	// LDO
	output wire  ldo_ena,
 
	// Bias current generator
	output wire	ibias_ena,		// bias generator master enable
	output wire [23:0] ibias_src_ena,		// bias generator individual source enables
	output wire [3:0]	ibias_snk_ena,		// bias generator individual sink enables
	output wire	ibias_ref_select,	// bias reference voltage selection
 
	// Overvoltage detector
	output wire overvoltage_ena,
	output wire [3:0] overvoltage_trim,	// overvoltage trip point set
	output wire	ldo_ref_sel,
	input wire overvoltage_out,		// overvoltage alarm
 
	 // 12-bit Current DAC (TBD)
	output wire [11:0] idac_value,
	output wire  idac_ena,
 
	// Temperature sensor
	output wire tempsense_ena,
	output wire tempsense_sel,
 
	// Voltage detector 0
	input wire vdda1_pwr_good,		// power good signal
	input wire vccd1_pwr_good,		// power good signal
 
	// Voltage detector 1
	input wire vdda2_pwr_good,		// power good signal
	input wire vccd2_pwr_good,		// power good signal
 
	// 12-bit RDAC 0
	output wire rdac0_ena,
	output wire [11:0] rdac0_value,
 
	// 12-bit RDAC 1
	output wire rdac1_ena,
	output wire [11:0] rdac1_value,

	// Brownout detector
	output wire brownout_ena,			// brownout detector enable
	output wire [2:0] brownout_vtrip,	// brownout detector trip point
	output wire [2:0] brownout_otrip,	// brownout detector trip point
	output wire brownout_isrc_sel,		// brownout detector select current bias
	output wire brownout_oneshot,		// brownout detector force short one-shot
	output wire brownout_rc_ena,		// brownout detector force oscillator enabled
	output wire brownout_rc_dis,		// brownout detector force oscillator disabled
 
	input wire brownout_vunder,		// brownout detector undervoltage alarm
	input wire brownout_timeout,	// brownout detector timeout
	input wire brownout_filt,		// brownout detector undervoltage (filtered)
	input wire brownout_unfilt		// brownout detector undervoltage (unfiltered)

);

	wire        uart0_psel;
	wire        uart0_penable;
	wire        uart0_pwrite;
	wire [31:0] uart0_paddr;
	wire [31:0] uart0_pwdata;
	wire [31:0] uart0_prdata;
	wire        uart0_pready;
	wire        uart0_pslverr;

	wire        uart1_psel;
	wire        uart1_penable;
	wire        uart1_pwrite;
	wire [31:0] uart1_paddr;
	wire [31:0] uart1_pwdata;
	wire [31:0] uart1_prdata;
	wire        uart1_pready;
	wire        uart1_pslverr;

	wire        uart2_psel;
	wire        uart2_penable;
	wire        uart2_pwrite;
	wire [31:0] uart2_paddr;
	wire [31:0] uart2_pwdata;
	wire [31:0] uart2_prdata;
	wire        uart2_pready;
	wire        uart2_pslverr;

	wire        uart3_psel;
	wire        uart3_penable;
	wire        uart3_pwrite;
	wire [31:0] uart3_paddr;
	wire [31:0] uart3_pwdata;
	wire [31:0] uart3_prdata;
	wire        uart3_pready;
	wire        uart3_pslverr;


	wire        tmr0_psel;
	wire        tmr0_penable;
	wire        tmr0_pwrite;
	wire [31:0] tmr0_paddr;
	wire [31:0] tmr0_pwdata;
	wire [31:0] tmr0_prdata;
	wire        tmr0_pready;
	wire        tmr0_pslverr;

	wire        tmr1_psel;
	wire        tmr1_penable;
	wire        tmr1_pwrite;
	wire [31:0] tmr1_paddr;
	wire [31:0] tmr1_pwdata;
	wire [31:0] tmr1_prdata;
	wire        tmr1_pready;
	wire        tmr1_pslverr;

	wire        tmr2_psel;
	wire        tmr2_penable;
	wire        tmr2_pwrite;
	wire [31:0] tmr2_paddr;
	wire [31:0] tmr2_pwdata;
	wire [31:0] tmr2_prdata;
	wire        tmr2_pready;
	wire        tmr2_pslverr;

	wire        tmr3_psel;
	wire        tmr3_penable;
	wire        tmr3_pwrite;
	wire [31:0] tmr3_paddr;
	wire [31:0] tmr3_pwdata;
	wire [31:0] tmr3_prdata;
	wire        tmr3_pready;
	wire        tmr3_pslverr;

	wire        tmr4_psel;
	wire        tmr4_penable;
	wire        tmr4_pwrite;
	wire [31:0] tmr4_paddr;
	wire [31:0] tmr4_pwdata;
	wire [31:0] tmr4_prdata;
	wire        tmr4_pready;
	wire        tmr4_pslverr;

	wire        tmr5_psel;
	wire        tmr5_penable;
	wire        tmr5_pwrite;
	wire [31:0] tmr5_paddr;
	wire [31:0] tmr5_pwdata;
	wire [31:0] tmr5_prdata;
	wire        tmr5_pready;
	wire        tmr5_pslverr;


	wire        wdt0_psel;
	wire        wdt0_penable;
	wire        wdt0_pwrite;
	wire [31:0] wdt0_paddr;
	wire [31:0] wdt0_pwdata;
	wire [31:0] wdt0_prdata;
	wire        wdt0_pready;
	wire        wdt0_pslverr;

	wire        spi0_psel;
	wire        spi0_penable;
	wire        spi0_pwrite;
	wire [31:0] spi0_paddr;
	wire [31:0] spi0_pwdata;
	wire [31:0] spi0_prdata;
	wire        spi0_pready;
	wire        spi0_pslverr;

	wire        spi1_psel;
	wire        spi1_penable;
	wire        spi1_pwrite;
	wire [31:0] spi1_paddr;
	wire [31:0] spi1_pwdata;
	wire [31:0] spi1_prdata;
	wire        spi1_pready;
	wire        spi1_pslverr;

	wire        i2c0_psel;
	wire        i2c0_penable;
	wire        i2c0_pwrite;
	wire [31:0] i2c0_paddr;
	wire [31:0] i2c0_pwdata;
	wire [31:0] i2c0_prdata;
	wire        i2c0_pready;
	wire        i2c0_pslverr;

	wire        i2c1_psel;
	wire        i2c1_penable;
	wire        i2c1_pwrite;
	wire [31:0] i2c1_paddr;
	wire [31:0] i2c1_pwdata;
	wire [31:0] i2c1_prdata;
	wire        i2c1_pready;
	wire        i2c1_pslverr;

	wire        ana_regs_psel;
	wire        ana_regs_penable;
	wire        ana_regs_pwrite;
	wire [31:0] ana_regs_paddr;
	wire [31:0] ana_regs_pwdata;
	wire [31:0] ana_regs_prdata;
	wire        ana_regs_pready;
	wire        ana_regs_pslverr;

	// - APB Peripherals:  0x4200_0000   
	//                     0x4200_0000  UART0
	//                     0x4201_0000  UART1
	//                     0x4202_0000  UART2
	//                     0x4203_0000  UART3
	//                     0x4204_0000  TMR0
	//                     0x4205_0000  TMR1
	//                     0x4206_0000  TMR2
	//                     0x4207_0000  TMR3
	//                     0x4208_0000  TMR4
	//                     0x4209_0000  TMR5
	//                     0x420A_0000  WDT
	//                     0x420B_0000  SPI0
	//                     0x420C_0000  SPI1
	//                     0x420D_0000  I2C0
	//                     0x420E_0000  I2C1
	//                     0x420F_0000  ANALOG CTRL REGS

    apb_splitter #(
		.N_SLAVES   (16),
		.ADDR_MAP   (512'h42000000_42010000_42020000_42030000_42040000_42050000_42060000_42070000_42080000_42090000_420A0000_420B0000_420C0000_420D0000_420E0000_420F0000),
		.ADDR_MASK  (512'hFFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000_FFFF0000),

		.W_ADDR     (32)
	) inst_apb_splitter (
		.apbs_paddr   (paddr),
		.apbs_psel    (psel),
		.apbs_penable (penable),
		.apbs_pwrite  (pwrite),
		.apbs_pwdata  (pwdata),
		.apbs_pready  (pready),
		.apbs_prdata  (prdata),
		.apbs_pslverr (pslverr),


		.apbm_paddr   ({ uart0_paddr   , uart1_paddr   , uart2_paddr    , uart3_paddr   , tmr0_paddr    , tmr1_paddr    ,tmr2_paddr    ,tmr3_paddr    ,tmr4_paddr    ,tmr5_paddr    , wdt0_paddr	, spi0_paddr	,spi1_paddr		, i2c0_paddr	, i2c1_paddr	, ana_regs_paddr	}),
		.apbm_psel    ({ uart0_psel    , uart1_psel    , uart2_psel     , uart3_psel	, tmr0_psel	    , tmr1_psel	    ,tmr2_psel	   ,tmr3_psel	  ,tmr4_psel	 ,tmr5_psel	    , wdt0_psel	 	, spi0_psel	 	,spi1_psel	 	, i2c0_psel	 	, i2c1_psel	 	, ana_regs_psel	 	}),
		.apbm_penable ({ uart0_penable , uart1_penable , uart2_penable  , uart3_penable , tmr0_penable  , tmr1_penable  ,tmr2_penable  ,tmr3_penable  ,tmr4_penable  ,tmr5_penable  , wdt0_penable  , spi0_penable  ,spi1_penable  	, i2c0_penable  , i2c1_penable  , ana_regs_penable  }),
		.apbm_pwrite  ({ uart0_pwrite  , uart1_pwrite  , uart2_pwrite   , uart3_pwrite  , tmr0_pwrite   , tmr1_pwrite   ,tmr2_pwrite   ,tmr3_pwrite   ,tmr4_pwrite   ,tmr5_pwrite   , wdt0_pwrite	, spi0_pwrite	,spi1_pwrite	, i2c0_pwrite	, i2c1_pwrite	, ana_regs_pwrite	}),
		.apbm_pwdata  ({ uart0_pwdata  , uart1_pwdata  , uart2_pwdata   , uart3_pwdata  , tmr0_pwdata   , tmr1_pwdata   ,tmr2_pwdata   ,tmr3_pwdata   ,tmr4_pwdata   ,tmr5_pwdata   , wdt0_pwdata	, spi0_pwdata	,spi1_pwdata	, i2c0_pwdata	, i2c1_pwdata	, ana_regs_pwdata	}),
		.apbm_pready  ({ uart0_pready  , uart1_pready  , uart2_pready   , uart3_pready  , tmr0_pready   , tmr1_pready   ,tmr2_pready   ,tmr3_pready   ,tmr4_pready   ,tmr5_pready   , wdt0_pready	, spi0_pready	,spi1_pready	, i2c0_pready	, i2c1_pready	, ana_regs_pready	}),
		.apbm_prdata  ({ uart0_prdata  , uart1_prdata  , uart2_prdata   , uart3_prdata  , tmr0_prdata   , tmr1_prdata   ,tmr2_prdata   ,tmr3_prdata   ,tmr4_prdata   ,tmr5_prdata   , wdt0_prdata	, spi0_prdata	,spi1_prdata	, i2c0_prdata	, i2c1_prdata	, ana_regs_prdata	}),
		.apbm_pslverr ({ uart0_pslverr , uart1_pslverr , uart2_pslverr  , uart3_pslverr , tmr0_pslverr  , tmr1_pslverr  ,tmr2_pslverr  ,tmr3_pslverr  ,tmr4_pslverr  ,tmr5_pslverr  , wdt0_pslverr  , spi0_pslverr  ,spi1_pslverr  	, i2c0_pslverr  , i2c1_pslverr  , ana_regs_pslverr  })

	);


	EF_UART_APB uart0 (
		.rx         (uart0_rx),
		.tx         (uart0_tx),

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (uart0_paddr),
		.PWRITE     (uart0_pwrite),
		.PSEL       (uart0_psel),
		.PENABLE    (uart0_penable),
		.PWDATA     (uart0_pwdata),
		.PRDATA     (uart0_prdata),
		.PREADY     (uart0_pready),
		.IRQ        (uart0_irq)
	);
	assign uart0_pslverr = 1'b0;

	EF_UART_APB uart1 (
		.rx         (uart1_rx),
		.tx         (uart1_tx),

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (uart1_paddr),
		.PWRITE     (uart1_pwrite),
		.PSEL       (uart1_psel),
		.PENABLE    (uart1_penable),
		.PWDATA     (uart1_pwdata),
		.PRDATA     (uart1_prdata),
		.PREADY     (uart1_pready),
		.IRQ        (uart1_irq)
	);
	assign uart1_pslverr = 1'b0;

	EF_UART_APB uart2 (
		.rx         (uart2_rx),
		.tx         (uart2_tx),

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (uart2_paddr),
		.PWRITE     (uart2_pwrite),
		.PSEL       (uart2_psel),
		.PENABLE    (uart2_penable),
		.PWDATA     (uart2_pwdata),
		.PRDATA     (uart2_prdata),
		.PREADY     (uart2_pready),
		.IRQ        (uart2_irq)
	);
	assign uart2_pslverr = 1'b0;

	EF_UART_APB uart3 (
		.rx         (uart3_rx),
		.tx         (uart3_tx),

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (uart3_paddr),
		.PWRITE     (uart3_pwrite),
		.PSEL       (uart3_psel),
		.PENABLE    (uart3_penable),
		.PWDATA     (uart3_pwdata),
		.PRDATA     (uart3_prdata),
		.PREADY     (uart3_pready),
		.IRQ        (uart3_irq)
	);
	assign uart3_pslverr = 1'b0;


	EF_TMR32_APB tmr0 (
		.pwm0       (tmr0_pwm0),
		.pwm1       (tmr0_pwm1),
		.pwm_fault 	(tmr0_pwm_fault),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (tmr0_paddr),
		.PWRITE     (tmr0_pwrite),
		.PSEL       (tmr0_psel),
		.PENABLE    (tmr0_penable),
		.PWDATA     (tmr0_pwdata),
		.PRDATA     (tmr0_prdata),
		.PREADY     (tmr0_pready),
		.IRQ 		(tmr0_irq)
	);
	assign tmr0_pslverr = 1'b0;

	EF_TMR32_APB tmr1 (
		.pwm0       (tmr1_pwm0),
		.pwm1       (tmr1_pwm1),
		.pwm_fault 	(tmr1_pwm_fault),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (tmr1_paddr),
		.PWRITE     (tmr1_pwrite),
		.PSEL       (tmr1_psel),
		.PENABLE    (tmr1_penable),
		.PWDATA     (tmr1_pwdata),
		.PRDATA     (tmr1_prdata),
		.PREADY     (tmr1_pready),
		.IRQ 		(tmr1_irq)
	);
	assign tmr1_pslverr = 1'b0;

	EF_TMR32_APB tmr2 (
		.pwm0       (tmr2_pwm0),
		.pwm1       (tmr2_pwm1),
		.pwm_fault 	(tmr2_pwm_fault),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (tmr2_paddr),
		.PWRITE     (tmr2_pwrite),
		.PSEL       (tmr2_psel),
		.PENABLE    (tmr2_penable),
		.PWDATA     (tmr2_pwdata),
		.PRDATA     (tmr2_prdata),
		.PREADY     (tmr2_pready),
		.IRQ 		(tmr2_irq)

	);
	assign tmr2_pslverr = 1'b0;

	EF_TMR32_APB tmr3 (
		.pwm0       (tmr3_pwm0),
		.pwm1       (tmr3_pwm1),
		.pwm_fault 	(tmr3_pwm_fault),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (tmr3_paddr),
		.PWRITE     (tmr3_pwrite),
		.PSEL       (tmr3_psel),
		.PENABLE    (tmr3_penable),
		.PWDATA     (tmr3_pwdata),
		.PRDATA     (tmr3_prdata),
		.PREADY     (tmr3_pready),
		.IRQ 		(tmr3_irq)
	);
	assign tmr3_pslverr = 1'b0;

	EF_TMR32_APB tmr4 (
		.pwm0       (tmr4_pwm0),
		.pwm1       (tmr4_pwm1),
		.pwm_fault 	(tmr4_pwm_fault),   

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (tmr4_paddr),
		.PWRITE     (tmr4_pwrite),
		.PSEL       (tmr4_psel),
		.PENABLE    (tmr4_penable),
		.PWDATA     (tmr4_pwdata),
		.PRDATA     (tmr4_prdata),
		.PREADY     (tmr4_pready),
		.IRQ		(tmr4_irq)
	);
	assign tmr4_pslverr = 1'b0;

	EF_TMR32_APB tmr5 (
		.pwm0       (tmr5_pwm0),
		.pwm1       (tmr5_pwm1),
		.pwm_fault 	(tmr5_pwm_fault),   

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (tmr5_paddr),
		.PWRITE     (tmr5_pwrite),
		.PSEL       (tmr5_psel),
		.PENABLE    (tmr5_penable),
		.PWDATA     (tmr5_pwdata),
		.PRDATA     (tmr5_prdata),
		.PREADY     (tmr5_pready),
		.IRQ		(tmr5_irq)
	);
	assign tmr5_pslverr = 1'b0;


	EF_WDT32_APB wdt0 (
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (wdt0_paddr),
		.PWRITE     (wdt0_pwrite),
		.PSEL       (wdt0_psel),
		.PENABLE    (wdt0_penable),
		.PWDATA     (wdt0_pwdata),
		.PRDATA     (wdt0_prdata),
		.PREADY     (wdt0_pready),
		.IRQ		(wdt0_irq)

	);
	assign wdt0_pslverr = 1'b0;

	EF_SPI_APB spi0 (
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (spi0_paddr),
		.PWRITE     (spi0_pwrite),
		.PSEL       (spi0_psel),
		.PENABLE    (spi0_penable),
		.PWDATA     (spi0_pwdata),
		.PRDATA     (spi0_prdata),
		.PREADY     (spi0_pready),

		.mosi		(spi0_MSO),
		.miso		(spi0_MSI),
    	.csb		(spi0_SSn),
    	.sclk		(spi0_SCK),

		.IRQ		(spi0_irq)

	);
	assign spi0_pslverr = 1'b0;

	EF_SPI_APB spi1 (   
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (spi1_paddr),
		.PWRITE     (spi1_pwrite),
		.PSEL       (spi1_psel),
		.PENABLE    (spi1_penable),
		.PWDATA     (spi1_pwdata),
		.PRDATA     (spi1_prdata),
		.PREADY     (spi1_pready),

		.mosi		(spi1_MSO),
		.miso		(spi1_MSI),
    	.csb		(spi1_SSn),
    	.sclk		(spi1_SCK),

		.IRQ		(spi1_irq)

	);
	assign spi1_pslverr = 1'b0;


	EF_I2C_APB i2c0 (   
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (i2c0_paddr),
		.PWRITE     (i2c0_pwrite),
		.PSEL       (i2c0_psel),
		.PENABLE    (i2c0_penable),
		.PWDATA     (i2c0_pwdata),
		.PRDATA     (i2c0_prdata),
		.PREADY     (i2c0_pready),

		.scl_i		(i2c0_scl_i),
		.scl_o		(i2c0_scl_o),
    	.scl_oen_o	(i2c0_scl_oen_o),
    	.sda_o		(i2c0_sda_o),
    	.sda_oen_o	(i2c0_sda_oen_o),
		.sda_i	(i2c0_sda_i),
		.i2c_irq	(i2c0_irq)

	);
	assign i2c0_pslverr = 1'b0;

	EF_I2C_APB i2c1 (   
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (i2c1_paddr),
		.PWRITE     (i2c1_pwrite),
		.PSEL       (i2c1_psel),
		.PENABLE    (i2c1_penable),
		.PWDATA     (i2c1_pwdata),
		.PRDATA     (i2c1_prdata),
		.PREADY     (i2c1_pready),

		.scl_i		(i2c1_scl_i),
		.scl_o		(i2c1_scl_o),
    	.scl_oen_o	(i2c1_scl_oen_o),
    	.sda_o		(i2c1_sda_o),
    	.sda_oen_o	(i2c1_sda_oen_o),
		.sda_i		(i2c1_sda_i),
		.i2c_irq	(i2c1_irq)

	);
	assign i2c1_pslverr = 1'b0;
	

	regs_analog_ctrl_APB analog_regs (   

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (ana_regs_paddr),
		.PWRITE     (ana_regs_pwrite),
		.PSEL       (ana_regs_psel),
		.PENABLE    (ana_regs_penable),
		.PWDATA     (ana_regs_pwdata),
		.PRDATA     (ana_regs_prdata),
		.PREADY     (ana_regs_pready),

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
		.vccd2_pwr_good(vccd2_pwr_good)

	);
	assign ana_regs_pslverr = 1'b0;


endmodule
