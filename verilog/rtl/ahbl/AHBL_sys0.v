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

module AHBL_sys0 #(
    parameter W_ADDR = 32,
	parameter W_DATA = 32,
    parameter SRAM_DEPTH = 1 << 12
	
)(
`ifdef USE_POWER_PINS
    inout wire vdda1,	// User area 1 3.3V supply
    inout wire vssa1,	// User area 1 analog ground
    inout wire vccd1,	// User area 1 1.8V supply
    inout wire vssd1,	// User area 1 digital ground
`endif // USE_POWER_PINS

`ifndef FPGA
    output wire                      clk,               // system clock - CPU and AHB1
    output wire                      rst_n,             // system reset
`else
    input wire                       clk,
    input wire                       rst_n,
`endif 
    
    input  wire                      hready,
	output wire                      hready_resp,
	output wire                      hresp,
	input  wire [W_ADDR-1:0]         haddr,
	input  wire                      hwrite,
	input  wire [1:0]                htrans,
	input  wire [2:0]                hsize,
	input  wire [2:0]                hburst,
	input  wire [3:0]                hprot,
	input  wire                      hmastlock,
	input  wire [W_DATA-1:0]         hwdata,
	output wire [W_DATA-1:0]         hrdata,

    // AHB-APB bridge for housekeeping 
    output  wire                     bridge2_hready,
	input wire                       bridge2_hready_resp,
	input wire                       bridge2_hresp,
	output  wire [W_ADDR-1:0]        bridge2_haddr,
	output  wire                     bridge2_hwrite,
	output  wire [1:0]               bridge2_htrans,
	output  wire [2:0]               bridge2_hsize,
	output  wire [2:0]               bridge2_hburst,
	output  wire [3:0]               bridge2_hprot,
	output  wire                     bridge2_hmastlock,
	output  wire [W_DATA-1:0]        bridge2_hwdata,
	input wire [W_DATA-1:0]          bridge2_hrdata,

   // FLASH Interface from the FR
    input  wire                      fr_sck,
    input  wire                      fr_ce_n,
    output wire [3:0]                fr_din,
    input  wire [3:0]                fr_dout,
    input  wire [3:0]                fr_douten,

    // FLASH Interface
    output  wire                     fm_sck,
    output  wire                     fm_ce_n,
    input   wire [3:0]               fm_din,
    output  wire [3:0]               fm_dout,
    output  wire [3:0]               fm_douten,


    input wire                       dmac_S_hready_resp,
    output wire                      dmac_S_hready,
    input wire                       dmac_S_hresp,
    output wire [W_ADDR-1:0]         dmac_S_haddr,
    output wire                      dmac_S_hwrite,
    output wire [1:0]                dmac_S_htrans,
    output wire [2:0]                dmac_S_hsize,
    output wire [2:0]                dmac_S_hburst,
    output wire [3:0]                dmac_S_hprot,
    output wire                      dmac_S_hmastlock,
    output wire [W_DATA-1:0]         dmac_S_hwdata,
    input wire [W_DATA-1:0]          dmac_S_hrdata,

    output  wire                     psram_sck,
    output  wire                     psram_ce_n,
    input   wire [3:0]               psram_din,
    output  wire [3:0]               psram_dout,
    output  wire [3:0]               psram_douten,

    input	wire [47:0]	             pin_mux_io_in,
	output	wire [47:0]	             pin_mux_io_out,
	output	wire [47:0]	             pin_mux_io_oeb,
	output	wire [191:0]	         p_in,
	input	wire [191:0]	         p_out,
	input	wire [191:0]	         p_oeb,

	// CLK Sub-System Signals 
    // Clock Sources
    input   wire                     xclk,           // External clock source
    input   wire                     rcosc_500k,     // Internal Low Speed RCOSC (500 KHz) -- Boot Oscillator
    input   wire                     rcosc_16m,      // Internal High SPeed RCOSC (16 MHz)
    input   wire                     hsxo,           // High SPeed XO
    input   wire                     lsxo,           // Low SPeed XO (32.768KHz)
     
    // Reset Sources
    input   wire                     xrst_n,         // external reset
    input   wire                     por_n,          // Power-on-Reset
    input   wire                     hkrst_n,        // Housekeeping Reset

	// The output clocks
    output  wire                     pclk,           // clock for apb sys 
    output  wire                     usb_clk,        // USB clock (48 MHz)
    output  wire                     clk_mon,        // clock monitor 
    output  wire                     user_clk,       // User clock 

    // clock source enables connected to timing frontend 
    output   wire                    rcosc_500k_en_tf, 
    output   wire                    rcosc_16m_en_tf,
    output   wire                    hsxo_en_tf,
    output   wire                    lsxo_en_tf,

    // lsxo and hsxo standby connected to timing frontend 
    output   wire                    lsxo_standby_tf,
    output   wire                    hsxo_standby_tf,


    input wire [31:0]       SRAMRDATA_0,          // SRAM Read Data
    output wire             SRAMR_WB_0,            // SRAM write enable (active high)
    output wire [31:0]      SRAMWDATA_0,          // SRAM write data
    output wire             SRAMEN_0,             // SRAM Chip Select (active high)
    output wire [10:0]      SRAMADDR_0,            // SRAM address
    output wire             SRAMCLK_0,            // SRAM clck
    output wire [31:0]      SRAMBEN_0,            // bit enable

    // System registers SIGNALS
    output wire  vref_e_vrefgen_en,
    output wire  vref_w_vrefgen_en,
    output wire  [4:0] vref_e_ref_sel,
    output wire  [4:0] vref_w_ref_sel,
    output wire  muxsplit_se_switch_aa_sl,
    output wire  muxsplit_se_switch_aa_s0,
    output wire  muxsplit_se_switch_bb_s0,
    output wire  muxsplit_se_switch_bb_sl,
    output wire  muxsplit_se_switch_bb_sr,
    output wire  muxsplit_se_switch_aa_sr,
    output wire  muxsplit_sw_switch_aa_sl,
    output wire  muxsplit_sw_switch_aa_s0,
    output wire  muxsplit_sw_switch_bb_s0,
    output wire  muxsplit_sw_switch_bb_sl,
    output wire  muxsplit_sw_switch_bb_sr,
    output wire  muxsplit_sw_switch_aa_sr,
    output wire  muxsplit_ne_switch_aa_sl,
    output wire  muxsplit_ne_switch_aa_s0,
    output wire  muxsplit_ne_switch_bb_s0,
    output wire  muxsplit_ne_switch_bb_sl,
    output wire  muxsplit_ne_switch_bb_sr,
    output wire  muxsplit_ne_switch_aa_sr,
    output wire  muxsplit_nw_switch_aa_sl,
    output wire  muxsplit_nw_switch_aa_s0,
    output wire  muxsplit_nw_switch_bb_s0,
    output wire  muxsplit_nw_switch_bb_sl,
    output wire  muxsplit_nw_switch_bb_sr,
    output wire  muxsplit_nw_switch_aa_sr,
    output wire  user_ahb_enable,
    output wire [15:0] user_irqs_enable,
    output wire	[5:0]	sio_cfg,
	input  wire mgmt_select
);


    wire               sram0_hready_resp;
    wire               sram0_hready;
    wire               sram0_hresp;
    wire [W_ADDR-1:0]  sram0_haddr;
    wire               sram0_hwrite;
    wire [1:0]         sram0_htrans;
    wire [2:0]         sram0_hsize;
    wire [2:0]         sram0_hburst;
    wire [3:0]         sram0_hprot;
    wire               sram0_hmastlock;
    wire [W_DATA-1:0]  sram0_hwdata;
    wire [W_DATA-1:0]  sram0_hrdata;

    wire               psram_hready_resp;
    wire               psram_hready;
    wire               psram_hresp;
    wire [W_ADDR-1:0]  psram_haddr;
    wire               psram_hwrite;
    wire [1:0]         psram_htrans;
    wire [2:0]         psram_hsize;
    wire [2:0]         psram_hburst;
    wire [3:0]         psram_hprot;
    wire               psram_hmastlock;
    wire [W_DATA-1:0]  psram_hwdata;
    wire [W_DATA-1:0]  psram_hrdata;

    wire               fw_hready_resp;
    wire               fw_hready;
    wire               fw_hresp;
    wire [W_ADDR-1:0]  fw_haddr;
    wire               fw_hwrite;
    wire [1:0]         fw_htrans;
    wire [2:0]         fw_hsize;
    wire [2:0]         fw_hburst;
    wire [3:0]         fw_hprot;
    wire               fw_hmastlock;
    wire [W_DATA-1:0]  fw_hwdata;
    wire [W_DATA-1:0]  fw_hrdata;

    wire               clk_sys_hready_resp;
    wire               clk_sys_hready;
    wire               clk_sys_hresp;
    wire [W_ADDR-1:0]  clk_sys_haddr;
    wire               clk_sys_hwrite;
    wire [1:0]         clk_sys_htrans;
    wire [2:0]         clk_sys_hsize;
    wire [2:0]         clk_sys_hburst;
    wire [3:0]         clk_sys_hprot;
    wire               clk_sys_hmastlock;
    wire [W_DATA-1:0]  clk_sys_hwdata;
    wire [W_DATA-1:0]  clk_sys_hrdata;

    wire               pin_mux_hready_resp;
    wire               pin_mux_hready;
    wire               pin_mux_hresp;
    wire [W_ADDR-1:0]  pin_mux_haddr;
    wire               pin_mux_hwrite;
    wire [1:0]         pin_mux_htrans;
    wire [2:0]         pin_mux_hsize;
    wire [2:0]         pin_mux_hburst;
    wire [3:0]         pin_mux_hprot;
    wire               pin_mux_hmastlock;
    wire [W_DATA-1:0]  pin_mux_hwdata;
    wire [W_DATA-1:0]  pin_mux_hrdata;

    wire               sys_regs_hready_resp;
    wire               sys_regs_hready;
    wire               sys_regs_hresp;
    wire [W_ADDR-1:0]  sys_regs_haddr;
    wire               sys_regs_hwrite;
    wire [1:0]         sys_regs_htrans;
    wire [2:0]         sys_regs_hsize;
    wire [2:0]         sys_regs_hburst;
    wire [3:0]         sys_regs_hprot;
    wire               sys_regs_hmastlock;
    wire [W_DATA-1:0]  sys_regs_hwdata;
    wire [W_DATA-1:0]  sys_regs_hrdata;


    // AHB 0 Bus fabric 

    // - 4 kB SRAM at...                0x2000_0000
    // - PSRAM at ......                0x2100_0000
    // - Flash writer at .......        0x2200_0000
    // - clocking system at .......     0x2300_0000
    // - DMAC at .....                  0x2400_0000
    // - PIN MUX at .....               0x2500_0000



    ahbl_splitter #(
        .N_PORTS     (8),
        .ADDR_MAP    (256'h27000000_26000000_25000000_24000000_23000000_22000000_21000000_20000000),
        .ADDR_MASK   (256'hFF000000_FF000000_FF000000_FF000000_FF000000_FF000000_FF000000_FF000000)
    ) ahb0_splitter_u (
        .clk             (clk),
        .rst_n           (rst_n),

        .src_hready_resp (hready_resp ),
        .src_hready      (hready   ),
        .src_hresp       (hresp    ),
        .src_haddr       (haddr    ),
        .src_hwrite      (hwrite   ),
        .src_htrans      (htrans   ),
        .src_hsize       (hsize    ),
        .src_hburst      (hburst   ),
        .src_hprot       (hprot    ),
        .src_hmastlock   (hmastlock),
        .src_hwdata      (hwdata   ),
        .src_hrdata      (hrdata   ),

        .dst_hready_resp ({ sys_regs_hready_resp , bridge2_hready_resp , pin_mux_hready_resp , dmac_S_hready_resp , clk_sys_hready_resp , fw_hready_resp , psram_hready_resp , sram0_hready_resp  }),
        .dst_hready      ({ sys_regs_hready      , bridge2_hready      , pin_mux_hready      , dmac_S_hready      , clk_sys_hready      , fw_hready      , psram_hready      , sram0_hready       }),
        .dst_hresp       ({ sys_regs_hresp       , bridge2_hresp       , pin_mux_hresp       , dmac_S_hresp       , clk_sys_hresp       , fw_hresp       , psram_hresp       , sram0_hresp        }),
        .dst_haddr       ({ sys_regs_haddr       , bridge2_haddr       , pin_mux_haddr       , dmac_S_haddr       , clk_sys_haddr       , fw_haddr       , psram_haddr       , sram0_haddr        }),
        .dst_hwrite      ({ sys_regs_hwrite      , bridge2_hwrite      , pin_mux_hwrite      , dmac_S_hwrite      , clk_sys_hwrite      , fw_hwrite      , psram_hwrite      , sram0_hwrite       }),
        .dst_htrans      ({ sys_regs_htrans      , bridge2_htrans      , pin_mux_htrans      , dmac_S_htrans      , clk_sys_htrans      , fw_htrans      , psram_htrans      , sram0_htrans       }),
        .dst_hsize       ({ sys_regs_hsize       , bridge2_hsize       , pin_mux_hsize       , dmac_S_hsize       , clk_sys_hsize       , fw_hsize       , psram_hsize       , sram0_hsize        }),
        .dst_hburst      ({ sys_regs_hburst      , bridge2_hburst      , pin_mux_hburst      , dmac_S_hburst      , clk_sys_hburst      , fw_hburst      , psram_hburst      , sram0_hburst       }),
        .dst_hprot       ({ sys_regs_hprot       , bridge2_hprot       , pin_mux_hprot       , dmac_S_hprot       , clk_sys_hprot       , fw_hprot       , psram_hprot       , sram0_hprot        }),
        .dst_hmastlock   ({ sys_regs_hmastlock   , bridge2_hmastlock   , pin_mux_hmastlock   , dmac_S_hmastlock   , clk_sys_hmastlock   , fw_hmastlock   , psram_hmastlock   , sram0_hmastlock    }),
        .dst_hwdata      ({ sys_regs_hwdata      , bridge2_hwdata      , pin_mux_hwdata      , dmac_S_hwdata      , clk_sys_hwdata      , fw_hwdata      , psram_hwdata      , sram0_hwdata       }),
        .dst_hrdata      ({ sys_regs_hrdata      , bridge2_hrdata      , pin_mux_hrdata      , dmac_S_hrdata      , clk_sys_hrdata      , fw_hrdata      , psram_hrdata      , sram0_hrdata       })
    );

    // ----------------------------------------------------------------------------
    // Memory and peripherals

    // No preloaded bootloader -- just use the debugger! (the processor will
    // actually enter an infinite crash loop after reset if memory is
    // zero-initialised so don't leave the little guy hanging too long)

    // HSEL is not set by the bus and only HTRANS is set
    // It is set to 1 since the checks if it's set along with HTRANS by anding them
    wire sram0_HSEL = 1'b1;

    // CPU expects hresp to indicate an error in the transaction and the RAM doesn't implement this functionality
    assign sram0_hresp = 1'b0;
    ram_ahb_controller sram0(
        .HCLK       (clk),
        .HRESETn	(rst_n),
        .HSEL		(sram0_HSEL),
        .HADDR		(sram0_haddr),
        .HTRANS		(sram0_htrans),
        .HWRITE		(sram0_hwrite),
        .HREADY		(sram0_hready),
        .HWDATA		(sram0_hwdata),
        .HSIZE		(sram0_hsize),
        .HREADYOUT	(sram0_hready_resp),
        .HRDATA		(sram0_hrdata),
        .DO(SRAMRDATA_0),
        .R_WB(SRAMR_WB_0),
        .DI(SRAMWDATA_0),
        .EN(SRAMEN_0),
        .AD(SRAMADDR_0),
        .BEN(SRAMBEN_0)
    );
    assign SRAMCLK_0 = clk;

    EF_PSRAM_CTRL_V2_ahbl psram_u (
        // AHB-Lite Slave Interface
        .HCLK       (clk),
        .HRESETn            (rst_n),

        .HSEL               (1'b1),
        .HADDR              (psram_haddr),
        .HWDATA             (psram_hwdata),
        .HTRANS             (psram_htrans),
        .HSIZE              (psram_hsize),
        .HWRITE             (psram_hwrite),
        .HREADY             (psram_hready),
        .HREADYOUT          (psram_hready_resp),
        .HRDATA             (psram_hrdata),

        // External Interface to Quad I/O
        .sck                (psram_sck),
        .ce_n               (psram_ce_n),
        .din                (psram_din),
        .dout               (psram_dout),
        .douten             (psram_douten)     
    );

    assign psram_hresp = 1'b0;

`ifndef FPGA
    clk_rst_sys_AHBL clk_sys(
    `ifdef USE_POWER_PINS
        .VPWR(vccd1),
        .VGND(vssd1),
    `endif // USE_POWER_PINS
		.xclk               (xclk),
		.rcosc_500k         (rcosc_500k),
		.rcosc_16m          (rcosc_16m),
		.hsxo               (hsxo),
		.lsxo               (lsxo),
		.xrst_n             (xrst_n),
		.por_n              (por_n),
		.hkrst_n            (hkrst_n),
		.clk                (clk),
		.pclk               (pclk),
		.usb_clk            (usb_clk),
		.user_clk           (user_clk),
		.clk_mon            (clk_mon),
		.rst_n              (rst_n),

        .rcosc_500k_en_tf(rcosc_500k_en_tf),
		.rcosc_16m_en_tf(rcosc_16m_en_tf),
		.hsxo_en_tf(hsxo_en_tf),
		.lsxo_en_tf(lsxo_en_tf),
		.lsxo_standby_tf(lsxo_standby_tf),
		.hsxo_standby_tf(hsxo_standby_tf),

	    .HCLK               (clk),
        .HRESETn            (rst_n),

        .HSEL               (1'b1),
        .HADDR              (clk_sys_haddr),
        .HWDATA             (clk_sys_hwdata),
        .HTRANS             (clk_sys_htrans),
        // .HSIZE              (clk_sys_hsize),
        .HWRITE             (clk_sys_hwrite),
        .HREADY             (clk_sys_hready),
        .HREADYOUT          (clk_sys_hready_resp),
        .HRDATA             (clk_sys_hrdata)
    );

    assign clk_sys_hresp = 1'b0;

`else 
    clocking_sys_fpga clk_sys_fpga(
	`ifdef USE_POWER_PINS 
		.DVDD               (vccd1),
		.DVSS               (vssd1),
		.AVDD               (vdda1),
		.AVSS               (vssa1), 
	`endif 
		
		.clk_div_2          (clk_div_2),
	    .HCLK               (clk),
        .HRESETn            (rst_n),

        .HSEL               (1'b1),
        .HADDR              (clk_sys_haddr),
        .HWDATA             (clk_sys_hwdata),
        .HTRANS             (clk_sys_htrans),
        .HSIZE              (clk_sys_hsize),
        .HWRITE             (clk_sys_hwrite),
        .HREADY             (clk_sys_hready),
        .HREADYOUT          (clk_sys_hready_resp),
        .HRDATA             (clk_sys_hrdata)
    );

    assign clk_sys_hresp = 1'b0;

`endif

    EF_PIN_MUX_AHBL pin_mux(
        .io_in              (pin_mux_io_in),
	    .io_out             (pin_mux_io_out),
	    .io_oeb             (pin_mux_io_oeb),

	    .p_in               (p_in),
	    .p_out              (p_out),
	    .p_oeb              (p_oeb),
 
        .HCLK               (clk),
        .HRESETn            (rst_n),

        .HSEL               (1'b1),
        .HADDR              (pin_mux_haddr),
        .HWDATA             (pin_mux_hwdata),
        .HTRANS             (pin_mux_htrans),
        // .HSIZE              (pin_mux_hsize),
        .HWRITE             (pin_mux_hwrite),
        .HREADY             (pin_mux_hready),
        .HREADYOUT          (pin_mux_hready_resp),
        .HRDATA             (pin_mux_hrdata)
    );

    assign pin_mux_hresp = 1'b0;


    EF_QSPI_FLASH_WRITER flash_writer(

        .HCLK               (clk),
        .HRESETn            (rst_n),
    
    // AHB-Lite Slave Interface
        .HSEL               (1'b1),
        .HADDR              (fw_haddr),
        .HWDATA             (fw_hwdata),
        .HTRANS             (fw_htrans),
        .HSIZE              (fw_hsize),
        .HWRITE             (fw_hwrite),
        .HREADY             (fw_hready),
        .HREADYOUT          (fw_hready_resp),
        .HRDATA             (fw_hrdata),
    
        // Flash controller interface 
	    .fr_sck 			(fr_sck),
        .fr_ce_n			(fr_ce_n),
        .fr_din			    (fr_din),
        .fr_dout			(fr_dout),
        .fr_douten			(fr_douten),


        // FLASH IO interface 
        .fm_sck				(fm_sck),
        .fm_ce_n			(fm_ce_n),
        .fm_din			    (fm_din),
        .fm_dout			(fm_dout),
        .fm_douten			(fm_douten)
    );

    assign fw_hresp = 1'b0;

    regs_system_AHBL sys_regs(

        .HCLK               (clk),
        .HRESETn            (rst_n),
    
    // AHB-Lite Slave Interface
        .HSEL               (1'b1),
        .HADDR              (sys_regs_haddr),
        .HWDATA             (sys_regs_hwdata),
        .HTRANS             (sys_regs_htrans),
        // .HSIZE              (sys_regs_hsize),
        .HWRITE             (sys_regs_hwrite),
        .HREADY             (sys_regs_hready),
        .HREADYOUT          (sys_regs_hready_resp),
        .HRDATA             (sys_regs_hrdata),
    
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
		.user_ahb_enable(user_ahb_enable),
		.user_irqs_enable(user_irqs_enable),
        .sio_cfg(sio_cfg),
		.mgmt_select(mgmt_select)
    );

    assign sys_regs_hresp = 1'b0;


endmodule
