/*
	Copyright 2020 Mohamed Shalan (mshalan@aucegypt.edu)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale              1ns/1ps
`default_nettype        none

/* 
    A Clock and Reset Manager for Cheetah V3 MLSoC
    Clock sources:
        - Internal Low Speed RCOSC (500 KHz) -- Boot Oscillator
        - Internal High SPeed RCOSC (16 MHz)
        - High Speed Crystal Oscillator (HSXO)
        - Low Speed Crystal Oscillator (LSXO, 32.768 KHz)
        - External Clock (XCLK)
    Reset Sources:
        - PoR
        - XRST
        - HKRST
*/
module clk_rst(
`ifdef USE_POWER_PINS 
    inout   wire        VPWR, 
    inout   wire        VGND, 
`endif 
    // Clock Sources
    input   wire        xclk,           // External clock source
    input   wire        rcosc_500k,     // Internal Low Speed RCOSC (500 KHz) -- Boot Oscillator
    input   wire        rcosc_16m,      // Internal High SPeed RCOSC (16 MHz)
    input   wire        hsxo,           // High SPeed XO
    input   wire        lsxo,           // Low SPeed XO (32.768KHz)

    // Reset Sources
    input   wire        xrst_n,         // external reset
    input   wire        por_n,          // Power-on-Reset
    input   wire        hkrst_n,        // Housekeeping Reset

    // dll clock 
    input   wire        dll_clk,
    input   wire        dll_clk90,
    output  wire        clk_mux1_out,

    // clock source enables
    input   wire        rcosc_500k_en,  // ROSC 500K enable (should be 1 on reset)
    input   wire        rcosc_16m_en,   // ROSC 16M enable
    input   wire        hsxo_en,        // HSXO enable
    input   wire        lsxo_en,        // LSXO enable

    output   wire       rcosc_500k_en_tf, 
    output   wire       rcosc_16m_en_tf,
    output   wire       hsxo_en_tf,
    output   wire       lsxo_en_tf,

    // lsxo and hsxo standby 
    input   wire        lsxo_standby,   // Enable standby for LSXO
    input   wire        hsxo_standby,   // Enable standby for HSXO

    output   wire       lsxo_standby_tf,
    output   wire       hsxo_standby_tf,


    // Clock monitor select
    input   wire [2:0]  clk_mon_sel,
    
    // Clock MUXing Control
    input   wire        sel_mux0,       // CLKMUX0 selection - 0: XCLK          1: HSXO
    input   wire        sel_mux1,       // CLKMUX1 selection - 0: ROSC 16MHz    1: CLKMUX0 out
    input   wire        sel_mux2,       // CLKMUX2 selection - 0: dll clk       1: CLKMUX1 output
    input   wire        sel_mux3,       // CLKMUX3 selection - 0: RCOSC 500KHz  1: CLKMUX2 output
    input   wire        sel_mux4,       // CLKMUX4 selection - 0: CLKMUX_3      1: LSXO (32.768KHz)
    input   wire        sel_mux5,       // CLKMUX5 selection - 0: CLKMUX_4      1: RCOSC 16MHz
    
    // Clock Dividers Control
    input   wire [2:0]  sel_clkdiv0,    // CLKDIV0 control - 0xx: No division   1dd: 2^(dd+1) division (2, 4, 8 and 16)
    input   wire [2:0]  sel_clkdiv1,    // CLKDIV1 control - 0xx: No division   1dd: 2^(dd+1) division (2, 4, 8 and 16)
    input   wire [2:0]  sel_clkdiv2,    // CLKDIV2 control - 0xx: No division   1dd: 2^(dd+1) division (2, 4, 8 and 16)

    // User's Programmable Delay Line Control
    input   wire [1:0]  user_dly_sel,

    // The output clocks
    output  wire        clk,            // system clock - CPU and AHB1
    output  wire        pclk,           // clock for apb sys 
    output  wire        usb_clk,        // USB clock (48 MHz) should come from xclk
    output  wire        user_clk,       // The user's area clock
    output  wire        clk_mon,        // clock monitor 

    // System reset
    output  wire        rst_n           // system reset
);


assign rcosc_500k_en_tf  = rcosc_500k_en; 
assign rcosc_16m_en_tf  = rcosc_16m_en;
assign hsxo_en_tf  = hsxo_en;
assign lsxo_en_tf  = lsxo_en;

assign lsxo_standby_tf = lsxo_standby;
assign hsxo_standby_tf = hsxo_standby;

    wire    irst_n;
    wire    clk_mon_1;
    wire    clk_mon_2;
    wire    clk_mux0;
    wire    clk_mux1;
    wire    clk_mux2;
    wire    clk_mux3;
    wire    clk_mux4;
    wire    clk_mux5;

    wire    clk_div0;
    wire    clk_div1;
    wire    clk_div2;

    wire    user_clk_dly;
    wire    user_clk_pre;

   


    assign clk_mux1_out = clk_mux1;
    
    // internal reset logic
    assign irst_n = xrst_n & por_n & hkrst_n;

    // Reset Synchonizer
    reset_sync #(
        .N_CYCLES(3)
    ) RST_SYNC (
	    .clk(rcosc_500k),
	    .rst_n_in(irst_n),
	    .rst_n_out(rst_n)
    );


    // Clock monitoring
    // Select the clock to monitor
    clkmux_4x1 CLK_MON_MUX_0 (
        .rst_n(rst_n),
        .clk0(rcosc_500k), 
        .clk1(rcosc_16m), 
        .clk2(hsxo),
        .clk3(lsxo),
        .sel(clk_mon_sel[1:0]),
        .clko(clk_mon_1)
    );
    clkmux_2x1 CLK_MON_MUX_1 (
        .rst_n(rst_n),
        .clk0(clk_mon_1), 
        .clk1(dll_clk), 
        .sel(clk_mon_sel[2]),
        .clko(clk_mon_2)
    );
    // divide the monitored clock by 4
    reg [1:0] clk_mon_div;
    always@(posedge clk_mon_2 or negedge rst_n)
	if(!rst_n)
        clk_mon_div <= 2'b0;
    else
        clk_mon_div <= clk_mon_div + 1'b1;

    assign clk_mon = clk_mon_div[1];

    // DLL Input CLock Selection
    // Clock MUX 0 - 0: XCLK, 1: HSXO
    clkmux_2x1 CLKMUX_0 (
        .rst_n(rst_n),
        .clk0(xclk), 
        .clk1(hsxo), 
        .sel(sel_mux0),
        .clko(clk_mux0)
    );
    // Clock MUX 1 - 0: 16MHz RCOSC, 1: CLKMUX_0 Clock
    clkmux_2x1 CLKMUX_1 (
        .rst_n(rst_n),
        .clk0(rcosc_16m), 
        .clk1(clk_mux0), 
        .sel(sel_mux1),
        .clko(clk_mux1)
    );

    
    // Clock MUX 2 - 0: DLL Clock, 1: CLKMUX_1 Clock
    clkmux_2x1 CLKMUX_2 (
        .rst_n(rst_n),
        .clk0(dll_clk), 
        .clk1(clk_mux1), 
        .sel(sel_mux2),
        .clko(clk_mux2)
    );

    // Clock Divider 0 for the output of CLKMUX_2
    clk_div CLKDIV_0(
        .rst_n(rst_n),
        .clki(clk_mux2),
        .div_sel(sel_clkdiv0[1:0]),
        .div_en(sel_clkdiv0[2]),
        .clko(clk_div0)
    );

    // Clock MUX 3 - 0: RCOSC_500K, 1: CLKMUX_2 Clock
    clkmux_2x1 CLKMUX_3 (
        .rst_n(rst_n),
        .clk0(rcosc_500k), 
        .clk1(clk_div0), 
        .sel(sel_mux3),
        .clko(clk_mux3)
    );

    // Clock MUX 4 - 0: CLKMUX_3 Clock, 1: LSXO
    clkmux_2x1 CLKMUX_4 (
        .rst_n(rst_n),
        .clk0(clk_mux3), 
        .clk1(lsxo), 
        .sel(sel_mux4),
        .clko(clk_mux4)
    );

    // Clock MUX 5 - 0: CLKMUX_4, 1: RCOSC_16M
    clkmux_2x1 CLKMUX_5 (
        .rst_n(rst_n),
        .clk0(clk_mux4), 
        .clk1(rcosc_16m), 
        .sel(sel_mux5),
        .clko(clk_mux5)
    );

    // Clock Divider 1 for the output of CLKMUX_5
    clk_div CLKDIV_1 (
        .rst_n(rst_n),
        .clki(clk_mux5),
        .div_sel(sel_clkdiv1[1:0]),
        .div_en(sel_clkdiv1[2]),
        .clko(clk_div1)
    );


    // User Prog. Delay Line
    // prog_delay_line PROGDLY (
    // `ifdef USE_POWER_PINS 
    //     .VPWR(VPWR), 
    //     .VGND(VGND), 
    // `endif 
    //     .rst_n(rst_n),
    //     .in(clk_mux5),
    //     .sel(user_dly_sel),
    //     .out(user_clk_dly)
    // );

    // User Clock Divider
    // clk_div CLKDIV_2 (
    //     .rst_n(rst_n),
    //     .clki(user_clk_dly),
    //     .div_sel(sel_clkdiv2[1:0]),
    //     .div_en(sel_clkdiv2[2]),
    //     .clko(user_clk_pre)
    // );
    clk_div CLKDIV_2 (
        .rst_n(rst_n),
        .clki(clk_mux5),
        .div_sel(sel_clkdiv2[1:0]),
        .div_en(sel_clkdiv2[2]),
        .clko(user_clk_pre)
    );

    // Peripherals Clock Divider
    reg pclk_div;
    always@(posedge clk_div1 or negedge rst_n)
	if(!rst_n)
        pclk_div <= 1'b0;
    else
        pclk_div <= ~pclk_div;

    // Output clocks
`ifndef PnR
    assign clk = clk_div1;
    assign pclk = pclk_div;
    assign usb_clk = clk_mux5;
    assign user_clk = user_clk_pre;
`else
    //clk_div1 delay
    (* keep *) clkdly #(
        .N(8)
    ) clk_div1_delay (
    `ifdef USE_POWER_PINS 
        .VPWR(VPWR), 
        .VGND(VGND), 
    `endif 
        .clk_in(clk_div1),
        .clk_out(clk)
    );

    // clk delay
    // (* keep *) clkdly #(
    //     .N(3)
    // ) clk_delay (
    //     `ifdef USE_POWER_PINS
    //     .VPWR(VPWR),
    //     .VGND(VGND),
    //     `endif
    //     .clk_in(clk_div1_delayed),
    //     .clk_out(clk)
    // );

    // gclk delay
    // (* keep *) clkdly #(
    //     .N(3)
    // ) gclk_delay (
    // `ifdef USE_POWER_PINS 
    //     .VPWR(VPWR), 
    //     .VGND(VGND), 
    // `endif 
    //     .clk_in(gclk_predelay),
    //     .clk_out(gclk)
    // );

    // ghclk delay
    // (* keep *) clkdly #(
    //     .N(4)
    // ) ghclk_delay (
    // `ifdef USE_POWER_PINS 
    //     .VPWR(VPWR), 
    //     .VGND(VGND), 
    // `endif 
    //     .clk_in(ghclk_predelay),
    //     .clk_out(ghclk0)
    // );




// Menna : Nov23 add delay to pclk
    (* keep *) clkdly #(
        .N(5)
    ) pclk_div_skewed_delay (
    `ifdef USE_POWER_PINS 
        .VPWR(VPWR), 
        .VGND(VGND), 
    `endif 
        .clk_in(pclk_div),
        .clk_out(pclk)
    );



// Menna : Nov23 add delay to usb_clk

    (* keep *) clkdly #(
        .N(9)
    ) usb_clk_delayed (
    `ifdef USE_POWER_PINS 
        .VPWR(VPWR), 
        .VGND(VGND), 
    `endif 
        .clk_in(clk_mux5),
        .clk_out(usb_clk)
    );

    (* keep *) clkdly #(
        .N(1)
    ) user_clk_delay (
    `ifdef USE_POWER_PINS 
        .VPWR(VPWR), 
        .VGND(VGND), 
    `endif 
        .clk_in(user_clk_pre),
        .clk_out(user_clk)
    );

`endif

/*    
`ifdef PnR
    (* keep *) sky130_fd_sc_hd__clkbuf_8 clkbuf (
`ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
`endif
        .A(clk_mux6),
        .X(clk)
    );
    (* keep *) sky130_fd_sc_hd__clkbuf_8 clk2_buf (
`ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
`endif
        .A(clk_mux6_div),
        .X(clk_div_2)        
    );
`else // ! PnR
    assign clk = clk_mux6;
    assign clk_div_2 = clk_mux6_div;
`endif // PnR

// Gate system clock
wire clk_g;
(* keep *) sky130_fd_sc_hd__dlclkp_4 clk_gate(
`ifdef USE_POWER_PINS 
    .VPWR(VPWR), 
    .VGND(VGND), 
`endif 
    .GCLK(clk_g), 
    .GATE(clk_gated_en), 
    .CLK(clk_mux6)
);

`ifdef PnR
    (* keep *) sky130_fd_sc_hd__clkbuf_8 clk_g_buf (
`ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
`endif
        .A(clk_g),
        .X(clk_gated)
    );
`else // ! PnR
    assign clk_gated = clk_g;
`endif
*/
endmodule