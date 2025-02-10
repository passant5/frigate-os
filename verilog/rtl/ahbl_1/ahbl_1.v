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

module ahbl_1 #(
    parameter W_ADDR = 32,
	parameter W_DATA = 32,
    parameter SRAM_DEPTH = 1 << 12
	
)(

    input wire                       clk,
    input wire                       rst_n,

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

    output  wire                     bridge0_hready,
	input wire                       bridge0_hready_resp,
	input wire                       bridge0_hresp,
	output  wire [W_ADDR-1:0]        bridge0_haddr,
	output  wire                     bridge0_hwrite,
	output  wire [1:0]               bridge0_htrans,
	output  wire [2:0]               bridge0_hsize,
	output  wire [2:0]               bridge0_hburst,
	output  wire [3:0]               bridge0_hprot,
	output  wire                     bridge0_hmastlock,
	output  wire [W_DATA-1:0]        bridge0_hwdata,
	input wire [W_DATA-1:0]          bridge0_hrdata,

    output  wire                     bridge1_hready,
	input wire                       bridge1_hready_resp,
	input wire                       bridge1_hresp,
	output  wire [W_ADDR-1:0]        bridge1_haddr,
	output  wire                     bridge1_hwrite,
	output  wire [1:0]               bridge1_htrans,
	output  wire [2:0]               bridge1_hsize,
	output  wire [2:0]               bridge1_hburst,
	output  wire [3:0]               bridge1_hprot,
	output  wire                     bridge1_hmastlock,
	output  wire [W_DATA-1:0]        bridge1_hwdata,
	input wire [W_DATA-1:0]          bridge1_hrdata,

	output  wire            	     usb_cdc_dp_pu,
    input   wire            	     usb_cdc_dp_rx,
    input   wire            	     usb_cdc_dn_rx,
    output  wire            	     usb_cdc_dp_tx,
    output  wire            	     usb_cdc_dn_tx,
    output  wire            	     usb_cdc_tx_en,
    output  wire                     usb_cdc_irq, 
    input   wire                     usb_clk, 

    input wire [31:0]                SRAMRDATA_1,          // SRAM Read Data
    output wire                      SRAMR_WB_1,           // SRAM write enable (active high)
    output wire [31:0]               SRAMWDATA_1,          // SRAM write data
    output wire                      SRAMEN_1,             // SRAM Chip Select (active high)
    output wire [10:0]               SRAMADDR_1,           // SRAM address
    output wire                      SRAMCLK_1,            // SRAM clock
    output wire [31:0]               SRAMBEN_1             // bit enable
);

// AHBL layer

    wire               sram1_hready_resp;
    wire               sram1_hready;
    wire               sram1_hresp;
    wire [W_ADDR-1:0]  sram1_haddr;
    wire               sram1_hwrite;
    wire [1:0]         sram1_htrans;
    wire [2:0]         sram1_hsize;
    wire [2:0]         sram1_hburst;
    wire [3:0]         sram1_hprot;
    wire               sram1_hmastlock;
    wire [W_DATA-1:0]  sram1_hwdata;
    wire [W_DATA-1:0]  sram1_hrdata;

    wire               usb_cdc_hready_resp;
    wire               usb_cdc_hready;
    wire               usb_cdc_hresp;
    wire [W_ADDR-1:0]  usb_cdc_haddr;
    wire               usb_cdc_hwrite;
    wire [1:0]         usb_cdc_htrans;
    wire [2:0]         usb_cdc_hsize;
    wire [2:0]         usb_cdc_hburst;
    wire [3:0]         usb_cdc_hprot;
    wire               usb_cdc_hmastlock;
    wire [W_DATA-1:0]  usb_cdc_hwdata;
    wire [W_DATA-1:0]  usb_cdc_hrdata;




    ahbl_splitter #(
        .N_PORTS     (4),
        .ADDR_MAP    (128'h40000000_42000000_48000000_49000000),
        .ADDR_MASK   (128'hFF000000_FF000000_FF000000_FF000000)
    ) ahb1_splitter_u (
        .clk             (clk),
        .rst_n           (rst_n),

        .src_hready_resp (hready_resp),
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

        .dst_hready_resp ({bridge0_hready_resp ,  bridge1_hready_resp ,  sram1_hready_resp , usb_cdc_hready_resp   }),
        .dst_hready      ({bridge0_hready      ,  bridge1_hready      ,  sram1_hready      , usb_cdc_hready        }),
        .dst_hresp       ({bridge0_hresp       ,  bridge1_hresp       ,  sram1_hresp       , usb_cdc_hresp         }),
        .dst_haddr       ({bridge0_haddr       ,  bridge1_haddr       ,  sram1_haddr       , usb_cdc_haddr         }),
        .dst_hwrite      ({bridge0_hwrite      ,  bridge1_hwrite      ,  sram1_hwrite      , usb_cdc_hwrite        }),
        .dst_htrans      ({bridge0_htrans      ,  bridge1_htrans      ,  sram1_htrans      , usb_cdc_htrans        }),
        .dst_hsize       ({bridge0_hsize       ,  bridge1_hsize       ,  sram1_hsize       , usb_cdc_hsize         }),
        .dst_hburst      ({bridge0_hburst      ,  bridge1_hburst      ,  sram1_hburst      , usb_cdc_hburst        }),
        .dst_hprot       ({bridge0_hprot       ,  bridge1_hprot       ,  sram1_hprot       , usb_cdc_hprot         }),
        .dst_hmastlock   ({bridge0_hmastlock   ,  bridge1_hmastlock   ,  sram1_hmastlock   , usb_cdc_hmastlock     }),
        .dst_hwdata      ({bridge0_hwdata      ,  bridge1_hwdata      ,  sram1_hwdata      , usb_cdc_hwdata        }),
        .dst_hrdata      ({bridge0_hrdata      ,  bridge1_hrdata      ,  sram1_hrdata      , usb_cdc_hrdata        })
    );

    // HSEL is not set by the bus and only HTRANS is set
    // It is set to 1 since the checks if it's set along with HTRANS by anding them
    wire sram1_HSEL = 1'b1;

    // CPU expects hresp to indicate an error in the transaction and the RAM doesn't implement this functionality
    ram_ahb_controller sram1(
        .HCLK		(clk),
        .HRESETn	(rst_n),
        .HSEL		(sram1_HSEL),
        .HADDR		(sram1_haddr),
        .HTRANS		(sram1_htrans),
        .HWRITE		(sram1_hwrite),
        .HREADY		(sram1_hready),
        .HWDATA		(sram1_hwdata),
        .HSIZE		(sram1_hsize),
        .HREADYOUT	(sram1_hready_resp),
        .HRDATA		(sram1_hrdata),
        .DO(SRAMRDATA_1),
        .R_WB(SRAMR_WB_1),
        .DI(SRAMWDATA_1),
        .EN(SRAMEN_1),
        .AD(SRAMADDR_1),
        .BEN(SRAMBEN_1)
    );
    assign SRAMCLK_1 = clk;
 

    assign sram1_hresp = 1'b0;

`ifndef FPGA
    usb_cdc_wrapper_ahbl u_usb_cdc_ahbl (
        .HCLK               (clk),
	    .usb_cdc_clk_48MHz  (usb_clk),
        .HRESETn            (rst_n),

        .HADDR              (usb_cdc_haddr),
        .HWRITE             (usb_cdc_hwrite),
        .HTRANS             (usb_cdc_htrans),
        .HREADY             (usb_cdc_hready),
        .HSEL               (1'b1),
        .HSIZE              (usb_cdc_hsize),
        .HWDATA             (usb_cdc_hwdata),
        .HRDATA             (usb_cdc_hrdata),
        .HREADYOUT          (usb_cdc_hready_resp),
        
        .dp_rx_i            (usb_cdc_dp_rx),
        .dn_rx_i            (usb_cdc_dn_rx),
        .dp_pu_o            (usb_cdc_dp_pu),
        .tx_en_o            (usb_cdc_tx_en),
        .dp_tx_o            (usb_cdc_dp_tx),
        .dn_tx_o            (usb_cdc_dn_tx),

        .irq                (usb_cdc_irq)
    );
	
    assign usb_cdc_hresp = 1'b0;
`endif


endmodule 
