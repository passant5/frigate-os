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

module apb_0 #(
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

	// GPIO port A 
	input  wire [7:0]			gpioA_io_in,
	output wire [7:0]			gpioA_io_out,
	output wire [7:0]			gpioA_io_oe,
	output wire 				gpioA_irq,

	// GPIO port B 
	input  wire [7:0]			gpioB_io_in,
	output wire [7:0]			gpioB_io_out,
	output wire [7:0]			gpioB_io_oe,
	output wire   				gpioB_irq,

	// GPIO port C 
	input  wire [7:0]			gpioC_io_in,
	output wire [7:0]			gpioC_io_out,
	output wire [7:0]			gpioC_io_oe,
	output wire   				gpioC_irq,

	// GPIO port D 
	input  wire [7:0]			gpioD_io_in,
	output wire [7:0]			gpioD_io_out,
	output wire [7:0]			gpioD_io_oe,
	output wire   				gpioD_irq,

	// GPIO port E 
	input  wire [7:0]			gpioE_io_in,
	output wire [7:0]			gpioE_io_out,
	output wire [7:0]			gpioE_io_oe,
	output wire   				gpioE_irq,

	// GPIO port F 
	input  wire [7:0]			gpioF_io_in,
	output wire [7:0]			gpioF_io_out,
	output wire [7:0]			gpioF_io_oe,
	output wire   				gpioF_irq,

	// GPIO port G 
	input  wire [7:0]			gpioG_io_in,
	output wire [7:0]			gpioG_io_out,
	output wire [7:0]			gpioG_io_oe,
	output wire   				gpioG_irq,

	// GPIO port H 
	input  wire [7:0]			gpioH_io_in,
	output wire [7:0]			gpioH_io_out,
	output wire [7:0]			gpioH_io_oe,
	output wire   				gpioH_irq,

	// GPIO port I 
	input  wire [7:0]			gpioI_io_in,
	output wire [7:0]			gpioI_io_out,
	output wire [7:0]			gpioI_io_oe,
	output wire   				gpioI_irq,

	//I2S0
	output wire 				i2s0_ws,
	output wire 				i2s0_sck,
	input  wire 				i2s0_sdi,
	output wire     			i2s0_irq,


	//ADC0
	input  wire					adc0_cmp, 
	output wire 				adc0_hold, 
	output wire [2:0]			adc0_ch_sel_out, 
	output wire [11:0]			adc0_data, 
	output wire					adc0_en, 
	output wire 				adc0_dac_rst,
	output wire 				adc0_irq,

	//ADC1
	input  wire					adc1_cmp, 
	output wire 				adc1_hold, 
	output wire [2:0]			adc1_ch_sel_out, 
	output wire [11:0]			adc1_data, 
	output wire					adc1_en, 
	output wire 				adc1_dac_rst,
	output wire 				adc1_irq,
	
	//AUDIODAC0
	// ds-modulator outputs
	output wire			    		ds_o,		// single-bit SD-modulator output
	output wire			    		ds_n_o,		//  plus the complementary output
	output wire 					audiodac0_irq,

	// CAN0
	input  wire         		can0_rx,
	output wire         		can0_tx,
	output wire         		can0_irq,

    output wire                 timer_irq,
	input  wire                 hart_halted
);

	wire        gpioA_psel;
	wire        gpioA_penable;
	wire        gpioA_pwrite;
	wire [31:0] gpioA_paddr;
	wire [31:0] gpioA_pwdata;
	wire [31:0] gpioA_prdata;
	wire        gpioA_pready;
	wire        gpioA_pslverr;

	wire        gpioB_psel;
	wire        gpioB_penable;
	wire        gpioB_pwrite;
	wire [31:0] gpioB_paddr;
	wire [31:0] gpioB_pwdata;
	wire [31:0] gpioB_prdata;
	wire        gpioB_pready;
	wire        gpioB_pslverr;

	wire        gpioC_psel;
	wire        gpioC_penable;
	wire        gpioC_pwrite;
	wire [31:0] gpioC_paddr;
	wire [31:0] gpioC_pwdata;
	wire [31:0] gpioC_prdata;
	wire        gpioC_pready;
	wire        gpioC_pslverr;

	wire        gpioD_psel;
	wire        gpioD_penable;
	wire        gpioD_pwrite;
	wire [31:0] gpioD_paddr;
	wire [31:0] gpioD_pwdata;
	wire [31:0] gpioD_prdata;
	wire        gpioD_pready;
	wire        gpioD_pslverr;

	wire        gpioE_psel;
	wire        gpioE_penable;
	wire        gpioE_pwrite;
	wire [31:0] gpioE_paddr;
	wire [31:0] gpioE_pwdata;
	wire [31:0] gpioE_prdata;
	wire        gpioE_pready;
	wire        gpioE_pslverr;

	wire        gpioF_psel;
	wire        gpioF_penable;
	wire        gpioF_pwrite;
	wire [31:0] gpioF_paddr;
	wire [31:0] gpioF_pwdata;
	wire [31:0] gpioF_prdata;
	wire        gpioF_pready;
	wire        gpioF_pslverr;

	wire        gpioG_psel;
	wire        gpioG_penable;
	wire        gpioG_pwrite;
	wire [31:0] gpioG_paddr;
	wire [31:0] gpioG_pwdata;
	wire [31:0] gpioG_prdata;
	wire        gpioG_pready;
	wire        gpioG_pslverr;

	wire        gpioH_psel;
	wire        gpioH_penable;
	wire        gpioH_pwrite;
	wire [31:0] gpioH_paddr;
	wire [31:0] gpioH_pwdata;
	wire [31:0] gpioH_prdata;
	wire        gpioH_pready;
	wire        gpioH_pslverr;

	wire        gpioI_psel;
	wire        gpioI_penable;
	wire        gpioI_pwrite;
	wire [31:0] gpioI_paddr;
	wire [31:0] gpioI_pwdata;
	wire [31:0] gpioI_prdata;
	wire        gpioI_pready;
	wire        gpioI_pslverr;

	wire        i2s0_psel;
	wire        i2s0_penable;
	wire        i2s0_pwrite;
	wire [31:0] i2s0_paddr;
	wire [31:0] i2s0_pwdata;
	wire [31:0] i2s0_prdata;
	wire        i2s0_pready;
	wire        i2s0_pslverr;


	wire        adc0_psel;
	wire        adc0_penable;
	wire        adc0_pwrite;
	wire [31:0] adc0_paddr;
	wire [31:0] adc0_pwdata;
	wire [31:0] adc0_prdata;
	wire        adc0_pready;
	wire        adc0_pslverr;

	wire        adc1_psel;
	wire        adc1_penable;
	wire        adc1_pwrite;
	wire [31:0] adc1_paddr;
	wire [31:0] adc1_pwdata;
	wire [31:0] adc1_prdata;
	wire        adc1_pready;
	wire        adc1_pslverr;

	wire        audiodac0_psel;
	wire        audiodac0_penable;
	wire        audiodac0_pwrite;
	wire [31:0] audiodac0_paddr;
	wire [31:0] audiodac0_pwdata;
	wire [31:0] audiodac0_prdata;
	wire        audiodac0_pready;
	wire        audiodac0_pslverr;

	wire        acmp0_psel;
	wire        acmp0_penable;
	wire        acmp0_pwrite;
	wire [31:0] acmp0_paddr;
	wire [31:0] acmp0_pwdata;
	wire [31:0] acmp0_prdata;
	wire        acmp0_pready;
	wire        acmp0_pslverr;

	wire        timer_psel;
	wire        timer_penable;
	wire        timer_pwrite;
	wire [31:0] timer_paddr;
	wire [31:0] timer_pwdata;
	wire [31:0] timer_prdata;
	wire        timer_pready;
	wire        timer_pslverr;


	wire        can_psel;
	wire        can_penable;
	wire        can_pwrite;
	wire [31:0] can_paddr;
	wire [31:0] can_pwdata;
	wire [31:0] can_prdata;
	wire        can_pready;
	wire        can_pslverr;


// - APB Peripherals:  0x4000_0000   
//                     0x4000_0000  GPIO Port A
//                     0x4001_0000  GPIO Port B
//                     0x4002_0000  GPIO Port C
//                     0x4003_0000  GPIO Port D
//                     0x4004_0000  GPIO Port E
//                     0x4005_0000  GPIO Port F
//                     0x4006_0000  GPIO Port G
//                     0x4007_0000  GPIO Port H
//                     0x4008_0000  GPIO Port I
//                     0x4009_0000  I2S0
//                     0x400A_0000  ADC0
//                     0x400B_0000  AUDIODAC0
//                     0x400C_0000  hazard3_timer
//                     0x400A_0000  I2S1
//                     0x400B_0000  ADC0
//                     0x400C_0000  AUDIODAC0
//                     0x400D_0000  hazard3_timer



	apb_splitter #(
		.N_SLAVES   (15),
		.ADDR_MAP   (480'h40000000_40010000_40020000_40030000_40040000_40050000_40060000_40070000_40080000_40090000_400A0000_400B0000_400C0000_400D0000_400E0000),
		.ADDR_MASK  (480'hF0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000_F0FF0000),
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
		.apbm_paddr   ({gpioA_paddr   , gpioB_paddr   , gpioC_paddr   , gpioD_paddr   , gpioE_paddr   , gpioF_paddr   , gpioG_paddr   , gpioH_paddr   , gpioI_paddr    , i2s0_paddr		, adc0_paddr	, adc1_paddr	, audiodac0_paddr	,  can_paddr	 ,  timer_paddr		}),
		.apbm_psel    ({gpioA_psel    , gpioB_psel    , gpioC_psel    , gpioD_psel    , gpioE_psel    , gpioF_psel    , gpioG_psel    , gpioH_psel    , gpioI_psel     , i2s0_psel	 	, adc0_psel	 	, adc1_psel	 	, audiodac0_psel	 	,  can_psel	     ,  timer_psel		}),
		.apbm_penable ({gpioA_penable , gpioB_penable , gpioC_penable , gpioD_penable , gpioE_penable , gpioF_penable , gpioG_penable , gpioH_penable , gpioI_penable  , i2s0_penable  	, adc0_penable  , adc1_penable  , audiodac0_penable  ,  can_penable   ,  timer_penable	}),
		.apbm_pwrite  ({gpioA_pwrite  , gpioB_pwrite  , gpioC_pwrite  , gpioD_pwrite  , gpioE_pwrite  , gpioF_pwrite  , gpioG_pwrite  , gpioH_pwrite  , gpioI_pwrite   , i2s0_pwrite	, adc0_pwrite	, adc1_pwrite	, audiodac0_pwrite	,  can_pwrite	 ,  timer_pwrite	}),
		.apbm_pwdata  ({gpioA_pwdata  , gpioB_pwdata  , gpioC_pwdata  , gpioD_pwdata  , gpioE_pwdata  , gpioF_pwdata  , gpioG_pwdata  , gpioH_pwdata  , gpioI_pwdata   , i2s0_pwdata	, adc0_pwdata	, adc1_pwdata	, audiodac0_pwdata	,  can_pwdata	 ,  timer_pwdata	}),
		.apbm_pready  ({gpioA_pready  , gpioB_pready  , gpioC_pready  , gpioD_pready  , gpioE_pready  , gpioF_pready  , gpioG_pready  , gpioH_pready  , gpioI_pready   , i2s0_pready	, adc0_pready	, adc1_pready	, audiodac0_pready	,  can_pready	 ,  timer_pready	}),
		.apbm_prdata  ({gpioA_prdata  , gpioB_prdata  , gpioC_prdata  , gpioD_prdata  , gpioE_prdata  , gpioF_prdata  , gpioG_prdata  , gpioH_prdata  , gpioI_prdata   , i2s0_prdata	, adc0_prdata	, adc1_prdata	, audiodac0_prdata	,  can_prdata	 ,  timer_prdata	}),
		.apbm_pslverr ({gpioA_pslverr , gpioB_pslverr , gpioC_pslverr , gpioD_pslverr , gpioE_pslverr , gpioF_pslverr , gpioG_pslverr , gpioH_pslverr , gpioI_pslverr  , i2s0_pslverr  	, adc0_pslverr  , adc1_pslverr  , audiodac0_pslverr  ,  can_pslverr   ,  timer_pslverr	})
	);


	EF_GPIO8_APB gpioA(
		.io_in		(gpioA_io_in),
		.io_out		(gpioA_io_out),
		.io_oe		(gpioA_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioA_paddr),
		.PWRITE     (gpioA_pwrite),
		.PSEL       (gpioA_psel),
		.PENABLE    (gpioA_penable),
		.PWDATA     (gpioA_pwdata),
		.PRDATA     (gpioA_prdata),
		.PREADY     (gpioA_pready),
		.IRQ        (gpioA_irq)
	);
	assign gpioA_pslverr = 1'b0;

	EF_GPIO8_APB gpioB(
		.io_in		(gpioB_io_in),
		.io_out		(gpioB_io_out),
		.io_oe		(gpioB_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioB_paddr),
		.PWRITE     (gpioB_pwrite),
		.PSEL       (gpioB_psel),
		.PENABLE    (gpioB_penable),
		.PWDATA     (gpioB_pwdata),
		.PRDATA     (gpioB_prdata),
		.PREADY     (gpioB_pready),
		.IRQ        (gpioB_irq)
	);
	assign gpioB_pslverr = 1'b0;

	EF_GPIO8_APB gpioC(
		.io_in		(gpioC_io_in),
		.io_out		(gpioC_io_out),
		.io_oe		(gpioC_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioC_paddr),
		.PWRITE     (gpioC_pwrite),
		.PSEL       (gpioC_psel),
		.PENABLE    (gpioC_penable),
		.PWDATA     (gpioC_pwdata),
		.PRDATA     (gpioC_prdata),
		.PREADY     (gpioC_pready),
		.IRQ        (gpioC_irq)
	);
	assign gpioC_pslverr = 1'b0;

	EF_GPIO8_APB gpioD(
		.io_in		(gpioD_io_in),
		.io_out		(gpioD_io_out),
		.io_oe		(gpioD_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioD_paddr),
		.PWRITE     (gpioD_pwrite),
		.PSEL       (gpioD_psel),
		.PENABLE    (gpioD_penable),
		.PWDATA     (gpioD_pwdata),
		.PRDATA     (gpioD_prdata),
		.PREADY     (gpioD_pready),
		.IRQ        (gpioD_irq)
	);
	assign gpioD_pslverr = 1'b0;

	EF_GPIO8_APB gpioE(
		.io_in		(gpioE_io_in),
		.io_out		(gpioE_io_out),
		.io_oe		(gpioE_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioE_paddr),
		.PWRITE     (gpioE_pwrite),
		.PSEL       (gpioE_psel),
		.PENABLE    (gpioE_penable),
		.PWDATA     (gpioE_pwdata),
		.PRDATA     (gpioE_prdata),
		.PREADY     (gpioE_pready),
		.IRQ        (gpioE_irq)
	);
	assign gpioE_pslverr = 1'b0;

	EF_GPIO8_APB gpioF(
		.io_in		(gpioF_io_in),
		.io_out		(gpioF_io_out),
		.io_oe		(gpioF_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioF_paddr),
		.PWRITE     (gpioF_pwrite),
		.PSEL       (gpioF_psel),
		.PENABLE    (gpioF_penable),
		.PWDATA     (gpioF_pwdata),
		.PRDATA     (gpioF_prdata),
		.PREADY     (gpioF_pready),
		.IRQ        (gpioF_irq)
	);
	assign gpioF_pslverr = 1'b0;

	EF_GPIO8_APB gpioG(
		.io_in		(gpioG_io_in),
		.io_out		(gpioG_io_out),
		.io_oe		(gpioG_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioG_paddr),
		.PWRITE     (gpioG_pwrite),
		.PSEL       (gpioG_psel),
		.PENABLE    (gpioG_penable),
		.PWDATA     (gpioG_pwdata),
		.PRDATA     (gpioG_prdata),
		.PREADY     (gpioG_pready),
		.IRQ        (gpioG_irq)
	);
	assign gpioG_pslverr = 1'b0;

	EF_GPIO8_APB gpioH(
		.io_in		(gpioH_io_in),
		.io_out		(gpioH_io_out),
		.io_oe		(gpioH_io_oe),


		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioH_paddr),
		.PWRITE     (gpioH_pwrite),
		.PSEL       (gpioH_psel),
		.PENABLE    (gpioH_penable),
		.PWDATA     (gpioH_pwdata),
		.PRDATA     (gpioH_prdata),
		.PREADY     (gpioH_pready),
		.IRQ        (gpioH_irq)
	);
	assign gpioH_pslverr = 1'b0;

	EF_GPIO8_APB gpioI(
		.io_in		(gpioI_io_in),
		.io_out		(gpioI_io_out),
		.io_oe		(gpioI_io_oe),

		.PCLK       (clk),
		.PRESETn    (rst_n),
		.PADDR      (gpioI_paddr),
		.PWRITE     (gpioI_pwrite),
		.PSEL       (gpioI_psel),
		.PENABLE    (gpioI_penable),
		.PWDATA     (gpioI_pwdata),
		.PRDATA     (gpioI_prdata),
		.PREADY     (gpioI_pready),
		.IRQ        (gpioI_irq)
	);
	assign gpioI_pslverr = 1'b0;

    EF_I2S_APB #(
		.AW(5)
	)i2s0 (
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (i2s0_paddr),
		.PWRITE     (i2s0_pwrite),
		.PSEL       (i2s0_psel),
		.PENABLE    (i2s0_penable),
		.PWDATA     (i2s0_pwdata),
		.PRDATA     (i2s0_prdata),
		.PREADY     (i2s0_pready),

		.ws         (i2s0_ws),
		.sck		(i2s0_sck),
		.sdi		(i2s0_sdi),

		.IRQ      	(i2s0_irq)
	);
	assign i2s0_pslverr = 1'b0;


	EF_ADCS1008A_apb adc0 (   

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (adc0_paddr),
		.PWRITE     (adc0_pwrite),
		.PSEL       (adc0_psel),
		.PENABLE    (adc0_penable),
		.PWDATA     (adc0_pwdata),
		.PRDATA     (adc0_prdata),
		.PREADY     (adc0_pready),

		.cmp		(adc0_cmp),
		.sample_n	(adc0_hold),
    	.ch_sel_out	(adc0_ch_sel_out),
    	.adc_data	(adc0_data),
    	.EN			(adc0_en),
    	.dac_rst	(adc0_dac_rst),

		.irq		(adc0_irq)

	);
	assign adc0_pslverr = 1'b0;

	EF_ADCS1008A_apb adc1 (   

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (adc1_paddr),
		.PWRITE     (adc1_pwrite),
		.PSEL       (adc1_psel),
		.PENABLE    (adc1_penable),
		.PWDATA     (adc1_pwdata),
		.PRDATA     (adc1_prdata),
		.PREADY     (adc1_pready),

		.cmp		(adc1_cmp),
		.sample_n	(adc1_hold),
    	.ch_sel_out	(adc1_ch_sel_out),
    	.adc_data	(adc1_data),
    	.EN			(adc1_en),
    	.dac_rst	(adc1_dac_rst),

		.irq		(adc1_irq)

	);
	assign adc1_pslverr = 1'b0;

`ifndef FPGA

	iic_audiodac_APB audiodac0 (   

		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (audiodac0_paddr),
		.PWRITE     (audiodac0_pwrite),
		.PSEL       (audiodac0_psel),
		.PENABLE    (audiodac0_penable),
		.PWDATA     (audiodac0_pwdata),
		.PRDATA     (audiodac0_prdata),
		.PREADY     (audiodac0_pready),

		.ds_o		(ds_o),
		.ds_n_o		(ds_n_o),

		.IRQ		(audiodac0_irq)

	);
	assign audiodac0_pslverr = 1'b0;
`endif


	// Microsecond timebase for timer

	reg [$clog2(CLK_MHZ)-1:0] timer_tick_ctr;
	reg                       timer_tick;

	always @ (posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			timer_tick_ctr <= {$clog2(CLK_MHZ){1'b0}};
			timer_tick <= 1'b0;
		end else begin
			if (|timer_tick_ctr) begin
				timer_tick_ctr <= timer_tick_ctr - 1'b1;
			end else begin
				timer_tick_ctr <= CLK_MHZ - 1'b1;
			end
			timer_tick <= ~|timer_tick_ctr;
		end
	end

	hazard3_riscv_timer timer_u (
		.clk       (clk),
		.rst_n     (rst_n),

		.psel      (timer_psel),
		.penable   (timer_penable),
		.pwrite    (timer_pwrite),
		.paddr     ({16'h0,timer_paddr[15:0]}),
		.pwdata    (timer_pwdata),
		.prdata    (timer_prdata),
		.pready    (timer_pready),
		.pslverr   (timer_pslverr),

		.dbg_halt  (&hart_halted),

		.tick      (timer_tick),

		.timer_irq (timer_irq)
	);

`ifndef FPGA
	ctu_can_APB ctu_can_wrapper (
		
		.PCLK       (clk),
		.PRESETn    (rst_n),

		.PADDR      (can_paddr),
		.PWRITE     (can_pwrite),
		.PSEL       (can_psel),
		.PENABLE    (can_penable),
		.PWDATA     (can_pwdata),
		.PRDATA     (can_prdata),
		.PREADY     (can_pready),

		.can_rx  	(can0_rx),
		.can_tx     (can0_tx),
		.irq 		(can0_irq)
	);
`endif

	
endmodule 