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

module APB_sys2 #(
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

    input  wire                 porb,
    // housekeeping spi (slave)
    input  wire                 hk_spi_csb,
    input  wire                 hk_spi_sck,
    input  wire                 hk_spi_sdi,
    output wire                 hk_spi_sdo,


    // External (originating from SPI and pad) IRQ and reset

    output wire                 hk_spi_irq,
    output wire                 hkrst,


    // GPIO serial loader programming interface
    output wire                 serial_clock,
    output wire                 serial_load,
    output wire                 serial_resetn,
    output wire                 serial_data_1,
    output wire                 serial_data_2,

    // Mask revision/User project ID
    input wire [31:0]                mask_rev_in,
    input wire [7:0]                 prod_id,


    // Flash controler signals coming from frigate
    input  wire                 spimemio_flash_csb,
    input  wire                 spimemio_flash_clk,
    input  wire                 spimemio_flash_io0_oeb,
    input  wire                 spimemio_flash_io1_oeb,
    input  wire                 spimemio_flash_io2_oeb,
    input  wire                 spimemio_flash_io3_oeb,
    input  wire                 spimemio_flash_io0_do,
    input  wire                 spimemio_flash_io1_do,
    input  wire                 spimemio_flash_io2_do,
    input  wire                 spimemio_flash_io3_do,
    output  wire                spimemio_flash_io0_di,
    output  wire                spimemio_flash_io1_di,
    output  wire                spimemio_flash_io2_di,
    output  wire                spimemio_flash_io3_di,

    // SPI flash management (padframe side)
    // (io2 and io3 are part of GPIO array, not dedicated pads)
    output  wire                pad_flash_csb,
    output  wire                pad_flash_csb_oeb,
    output  wire                pad_flash_clk,
    output  wire                pad_flash_clk_oeb,
    output  wire                pad_flash_io0_oeb,
    output  wire                pad_flash_io1_oeb,
    output  wire                pad_flash_io0_ieb,
    output  wire                pad_flash_io1_ieb,
    output  wire                pad_flash_io0_do,
    output  wire                pad_flash_io1_do,
    input  wire                 pad_flash_io0_di,
    input  wire                 pad_flash_io1_di,

    // IO 3 and 4 (from mangment IOs)
    output  wire                pad_flash_io2_oeb,
    output  wire                pad_flash_io3_oeb,
    output  wire                pad_flash_io2_do,
    output  wire                pad_flash_io3_do,
    input  wire                 pad_flash_io2_di,
    input  wire                 pad_flash_io3_di
);  


	wire        hk_psel;
	wire        hk_penable;
	wire        hk_pwrite;
	wire [31:0] hk_paddr;
	wire [31:0] hk_pwdata;
	wire [31:0] hk_prdata;
	wire        hk_pready;
	wire        hk_pslverr;

    wire         HK_PSEL;
    wire         HK_PREADY;
    wire [31:0]  HK_PRDATA;
    wire [31:0]  HK_PWDATA;
    wire         HK_PENABLE;
    wire [31:0]  HK_PADDR;
    wire         HK_PWRITE;

    wire 	     hk_cyc_o;
    wire 	     hk_stb_o;
    wire 	     hk_we_o;
    wire [3:0]   hk_sel_o;
    wire [31:0]  hk_adr_o;
    wire [31:0]  hk_dat_o;
    wire [31:0]  hk_dat_i;
    wire 	     hk_ack_i;


    

	// - APB Peripherals:  0x2600_0000   


    apb_splitter #(
		.N_SLAVES   (1),
		.ADDR_MAP   (32'h26000000),
		.ADDR_MASK  (32'hFF000000),

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


		.apbm_paddr   ({ hk_paddr   }),
		.apbm_psel    ({ hk_psel    }),
		.apbm_penable ({ hk_penable }),
		.apbm_pwrite  ({ hk_pwrite  }),
		.apbm_pwdata  ({ hk_pwdata  }),
		.apbm_pready  ({ hk_pready  }),
		.apbm_prdata  ({ hk_prdata  }),
		.apbm_pslverr ({ hk_pslverr })

	);

    // HK Access Port
    assign hk_pready = HK_PREADY;
    assign HK_PSEL = hk_psel;
    assign HK_PWDATA = hk_pwdata;
    assign HK_PENABLE = hk_penable;
    assign HK_PADDR = hk_paddr;
    assign HK_PWRITE = hk_pwrite;
    assign hk_prdata = HK_PRDATA;

    assign hk_adr_o     = HK_PADDR;
    assign hk_dat_o     = HK_PWDATA;
    assign hk_we_o      = HK_PWRITE;
    assign hk_sel_o     = 4'hF;
    assign hk_cyc_o     = HK_PSEL;
    assign hk_stb_o     = HK_PSEL & HK_PENABLE;
    assign HK_PRDATA    = hk_dat_i;
    assign HK_PREADY    = hk_ack_i;

    assign hk_pslverr = 1'b0;
    

// Housekeeping interface
 wire trap;
 assign trap = 0; // since trap isn't connected to the cpu 
 housekeeping housekeeping (
`ifdef USE_POWER_PINS
     .VPWR(VPWR),
     .VGND(VGND),
`endif

     // Change
     .wb_clk_i (clk),
     .wb_rstn_i(rst_n),

     // No change
     .wb_adr_i(hk_adr_o),
     .wb_dat_i(hk_dat_o),
     .wb_sel_i(hk_sel_o),
     .wb_we_i (hk_we_o),
     .wb_cyc_i(hk_cyc_o),
     .wb_stb_i(hk_stb_o),
     .wb_ack_o(hk_ack_i),
     .wb_dat_o(hk_dat_i),

     // No Changes
     .porb(porb), // expose to outside (connected to por from analog)
     .irq  (hk_spi_irq), // check spi irq condition 
     .reset(hkrst), // connection in swift

     .serial_clock (serial_clock),
     .serial_load  (serial_load),
     .serial_resetn(serial_resetn),
     .serial_data_1(serial_data_1),
     .serial_data_2(serial_data_2),

     .hk_spi_sdo(hk_spi_sdo),
     .hk_spi_sdi(hk_spi_sdi),
     .hk_spi_csb(hk_spi_csb),
     .hk_spi_sck(hk_spi_sck),


     // No Changes
     .mask_rev_in(mask_rev_in),
     .prod_id(prod_id),

     // No Changes
     .spimemio_flash_csb(spimemio_flash_csb),
     .spimemio_flash_clk(spimemio_flash_clk),
     .spimemio_flash_io0_oeb(spimemio_flash_io0_oeb),
     .spimemio_flash_io1_oeb(spimemio_flash_io1_oeb),
     .spimemio_flash_io2_oeb(spimemio_flash_io2_oeb),
     .spimemio_flash_io3_oeb(spimemio_flash_io3_oeb),
     .spimemio_flash_io0_do(spimemio_flash_io0_do),
     .spimemio_flash_io1_do(spimemio_flash_io1_do),
     .spimemio_flash_io2_do(spimemio_flash_io2_do),
     .spimemio_flash_io3_do(spimemio_flash_io3_do),
     .spimemio_flash_io0_di(spimemio_flash_io0_di),
     .spimemio_flash_io1_di(spimemio_flash_io1_di),
     .spimemio_flash_io2_di(spimemio_flash_io2_di),
     .spimemio_flash_io3_di(spimemio_flash_io3_di),

     // No Changes
    .pad_flash_csb(pad_flash_csb),
    .pad_flash_csb_oeb(pad_flash_csb_oeb),
    .pad_flash_clk(pad_flash_clk),
    .pad_flash_clk_oeb(pad_flash_clk_oeb),
    .pad_flash_io0_oeb(pad_flash_io0_oeb),
    .pad_flash_io1_oeb(pad_flash_io1_oeb),
    .pad_flash_io2_oeb(pad_flash_io2_oeb),
    .pad_flash_io3_oeb(pad_flash_io3_oeb),
    .pad_flash_io0_ieb(pad_flash_io0_ieb),
    .pad_flash_io1_ieb(pad_flash_io1_ieb),
    .pad_flash_io0_do(pad_flash_io0_do),
    .pad_flash_io1_do(pad_flash_io1_do),
    .pad_flash_io2_do(pad_flash_io2_do),
    .pad_flash_io3_do(pad_flash_io3_do),
    .pad_flash_io0_di(pad_flash_io0_di),
    .pad_flash_io1_di(pad_flash_io1_di),
    .pad_flash_io2_di(pad_flash_io2_di),
    .pad_flash_io3_di(pad_flash_io3_di)

 );
endmodule
