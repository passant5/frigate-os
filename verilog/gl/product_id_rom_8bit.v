module product_id_rom_8bit (VPWR,
    VGND,
    gpio_defaults);
 input VPWR;
 input VGND;
 output [7:0] gpio_defaults;

 wire \gpio_defaults_high[0] ;
 wire \gpio_defaults_high[1] ;
 wire \gpio_defaults_high[2] ;
 wire \gpio_defaults_high[3] ;
 wire \gpio_defaults_high[4] ;
 wire \gpio_defaults_high[5] ;
 wire \gpio_defaults_high[6] ;
 wire \gpio_defaults_high[7] ;
 wire \gpio_defaults_low[0] ;
 wire \gpio_defaults_low[1] ;
 wire \gpio_defaults_low[2] ;
 wire \gpio_defaults_low[3] ;
 wire \gpio_defaults_low[4] ;
 wire \gpio_defaults_low[5] ;
 wire \gpio_defaults_low[6] ;
 wire \gpio_defaults_low[7] ;

 sky130_fd_sc_hd__conb_1 \gpio_default_value[0]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[0] ),
    .LO(\gpio_defaults_low[0] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[1]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[1] ),
    .LO(\gpio_defaults_low[1] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[2]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[2] ),
    .LO(\gpio_defaults_low[2] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[3]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[3] ),
    .LO(\gpio_defaults_low[3] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[4]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[4] ),
    .LO(\gpio_defaults_low[4] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[5]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[5] ),
    .LO(\gpio_defaults_low[5] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[6]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[6] ),
    .LO(\gpio_defaults_low[6] ));
 sky130_fd_sc_hd__conb_1 \gpio_default_value[7]  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(\gpio_defaults_high[7] ),
    .LO(\gpio_defaults_low[7] ));
 sky130_fd_sc_hd__decap_3 PHY_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_1 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_2 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_4 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_5 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 sky130_fd_sc_hd__decap_3_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_6_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_6_1 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_6_2 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_12 FILLER_1_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_12 FILLER_2_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_2_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_1_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_6 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_7 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_8 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_9 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_10 (.VGND(VGND),
    .VPWR(VPWR));
 
 assign gpio_defaults[0] = \gpio_defaults_low[0] ;
 assign gpio_defaults[1] = \gpio_defaults_high[1] ;
 assign gpio_defaults[2] = \gpio_defaults_low[2] ;
 assign gpio_defaults[3] = \gpio_defaults_low[3] ;
 assign gpio_defaults[4] = \gpio_defaults_low[4] ;
 assign gpio_defaults[5] = \gpio_defaults_low[5] ;
 assign gpio_defaults[6] = \gpio_defaults_high[6] ;
 assign gpio_defaults[7] = \gpio_defaults_low[7] ;
endmodule
