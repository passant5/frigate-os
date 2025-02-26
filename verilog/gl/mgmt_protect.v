module mgmt_protect (frigate_HCLK,
    frigate_HRESETn,
    mprj_AHB_Ena,
    mprj_HREADYOUT_core,
    mprj_HREADYOUT_user,
    mprj_HREADY_core,
    mprj_HREADY_user,
    mprj_HSEL_core,
    mprj_HSEL_user,
    mprj_HWRITE_core,
    mprj_HWRITE_user,
    user_HCLK,
    user_HRESETn,
    vccd0,
    vssd0,
    vccd1,
    vssd1,
    mprj_HADDR_core,
    mprj_HADDR_user,
    mprj_HRDATA_core,
    mprj_HRDATA_user,
    mprj_HSIZE_core,
    mprj_HSIZE_user,
    mprj_HTRANS_core,
    mprj_HTRANS_user,
    mprj_HWDATA_core,
    mprj_HWDATA_user,
    user_irq,
    user_irq_core,
    user_irq_ena);
 input frigate_HCLK;
 input frigate_HRESETn;
 input mprj_AHB_Ena;
 output mprj_HREADYOUT_core;
 input mprj_HREADYOUT_user;
 input mprj_HREADY_core;
 output mprj_HREADY_user;
 input mprj_HSEL_core;
 output mprj_HSEL_user;
 input mprj_HWRITE_core;
 output mprj_HWRITE_user;
 output user_HCLK;
 output user_HRESETn;
 inout vccd0;
 inout vssd0;
 inout vccd1;
 inout vssd1;
 input [31:0] mprj_HADDR_core;
 output [31:0] mprj_HADDR_user;
 output [31:0] mprj_HRDATA_core;
 input [31:0] mprj_HRDATA_user;
 input [2:0] mprj_HSIZE_core;
 output [2:0] mprj_HSIZE_user;
 input [1:0] mprj_HTRANS_core;
 output [1:0] mprj_HTRANS_user;
 input [31:0] mprj_HWDATA_core;
 output [31:0] mprj_HWDATA_user;
 input [15:0] user_irq;
 output [15:0] user_irq_core;
 input [15:0] user_irq_ena;

 wire ahb_in_enable;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire mprj_ack_i_core_bar;
 wire \mprj_dat_i_core_bar[0] ;
 wire \mprj_dat_i_core_bar[10] ;
 wire \mprj_dat_i_core_bar[11] ;
 wire \mprj_dat_i_core_bar[12] ;
 wire \mprj_dat_i_core_bar[13] ;
 wire \mprj_dat_i_core_bar[14] ;
 wire \mprj_dat_i_core_bar[15] ;
 wire \mprj_dat_i_core_bar[16] ;
 wire \mprj_dat_i_core_bar[17] ;
 wire \mprj_dat_i_core_bar[18] ;
 wire \mprj_dat_i_core_bar[19] ;
 wire \mprj_dat_i_core_bar[1] ;
 wire \mprj_dat_i_core_bar[20] ;
 wire \mprj_dat_i_core_bar[21] ;
 wire \mprj_dat_i_core_bar[22] ;
 wire \mprj_dat_i_core_bar[23] ;
 wire \mprj_dat_i_core_bar[24] ;
 wire \mprj_dat_i_core_bar[25] ;
 wire \mprj_dat_i_core_bar[26] ;
 wire \mprj_dat_i_core_bar[27] ;
 wire \mprj_dat_i_core_bar[28] ;
 wire \mprj_dat_i_core_bar[29] ;
 wire \mprj_dat_i_core_bar[2] ;
 wire \mprj_dat_i_core_bar[30] ;
 wire \mprj_dat_i_core_bar[31] ;
 wire \mprj_dat_i_core_bar[3] ;
 wire \mprj_dat_i_core_bar[4] ;
 wire \mprj_dat_i_core_bar[5] ;
 wire \mprj_dat_i_core_bar[6] ;
 wire \mprj_dat_i_core_bar[7] ;
 wire \mprj_dat_i_core_bar[8] ;
 wire \mprj_dat_i_core_bar[9] ;
 wire \mprj_logic1[0] ;
 wire \mprj_logic1[10] ;
 wire \mprj_logic1[11] ;
 wire \mprj_logic1[12] ;
 wire \mprj_logic1[13] ;
 wire \mprj_logic1[14] ;
 wire \mprj_logic1[15] ;
 wire \mprj_logic1[16] ;
 wire \mprj_logic1[17] ;
 wire \mprj_logic1[18] ;
 wire \mprj_logic1[19] ;
 wire \mprj_logic1[1] ;
 wire \mprj_logic1[20] ;
 wire \mprj_logic1[21] ;
 wire \mprj_logic1[22] ;
 wire \mprj_logic1[23] ;
 wire \mprj_logic1[24] ;
 wire \mprj_logic1[25] ;
 wire \mprj_logic1[26] ;
 wire \mprj_logic1[27] ;
 wire \mprj_logic1[28] ;
 wire \mprj_logic1[29] ;
 wire \mprj_logic1[2] ;
 wire \mprj_logic1[30] ;
 wire \mprj_logic1[31] ;
 wire \mprj_logic1[32] ;
 wire \mprj_logic1[33] ;
 wire \mprj_logic1[34] ;
 wire \mprj_logic1[35] ;
 wire \mprj_logic1[36] ;
 wire \mprj_logic1[37] ;
 wire \mprj_logic1[38] ;
 wire \mprj_logic1[39] ;
 wire \mprj_logic1[3] ;
 wire \mprj_logic1[40] ;
 wire \mprj_logic1[41] ;
 wire \mprj_logic1[42] ;
 wire \mprj_logic1[43] ;
 wire \mprj_logic1[44] ;
 wire \mprj_logic1[45] ;
 wire \mprj_logic1[46] ;
 wire \mprj_logic1[47] ;
 wire \mprj_logic1[48] ;
 wire \mprj_logic1[49] ;
 wire \mprj_logic1[4] ;
 wire \mprj_logic1[50] ;
 wire \mprj_logic1[51] ;
 wire \mprj_logic1[52] ;
 wire \mprj_logic1[53] ;
 wire \mprj_logic1[54] ;
 wire \mprj_logic1[55] ;
 wire \mprj_logic1[56] ;
 wire \mprj_logic1[57] ;
 wire \mprj_logic1[58] ;
 wire \mprj_logic1[59] ;
 wire \mprj_logic1[5] ;
 wire \mprj_logic1[60] ;
 wire \mprj_logic1[61] ;
 wire \mprj_logic1[62] ;
 wire \mprj_logic1[63] ;
 wire \mprj_logic1[64] ;
 wire \mprj_logic1[65] ;
 wire \mprj_logic1[66] ;
 wire \mprj_logic1[67] ;
 wire \mprj_logic1[68] ;
 wire \mprj_logic1[69] ;
 wire \mprj_logic1[6] ;
 wire \mprj_logic1[70] ;
 wire \mprj_logic1[71] ;
 wire \mprj_logic1[72] ;
 wire \mprj_logic1[73] ;
 wire \mprj_logic1[74] ;
 wire \mprj_logic1[75] ;
 wire \mprj_logic1[76] ;
 wire \mprj_logic1[77] ;
 wire \mprj_logic1[78] ;
 wire \mprj_logic1[79] ;
 wire \mprj_logic1[7] ;
 wire \mprj_logic1[80] ;
 wire \mprj_logic1[81] ;
 wire \mprj_logic1[82] ;
 wire \mprj_logic1[83] ;
 wire \mprj_logic1[84] ;
 wire \mprj_logic1[85] ;
 wire \mprj_logic1[86] ;
 wire \mprj_logic1[87] ;
 wire \mprj_logic1[88] ;
 wire \mprj_logic1[89] ;
 wire \mprj_logic1[8] ;
 wire \mprj_logic1[90] ;
 wire \mprj_logic1[9] ;
 wire \user_irq_bar[0] ;
 wire \user_irq_bar[10] ;
 wire \user_irq_bar[11] ;
 wire \user_irq_bar[12] ;
 wire \user_irq_bar[13] ;
 wire \user_irq_bar[14] ;
 wire \user_irq_bar[15] ;
 wire \user_irq_bar[1] ;
 wire \user_irq_bar[2] ;
 wire \user_irq_bar[3] ;
 wire \user_irq_bar[4] ;
 wire \user_irq_bar[5] ;
 wire \user_irq_bar[6] ;
 wire \user_irq_bar[7] ;
 wire \user_irq_bar[8] ;
 wire \user_irq_bar[9] ;
 wire \user_irq_enable[0] ;
 wire \user_irq_enable[10] ;
 wire \user_irq_enable[11] ;
 wire \user_irq_enable[12] ;
 wire \user_irq_enable[13] ;
 wire \user_irq_enable[14] ;
 wire \user_irq_enable[15] ;
 wire \user_irq_enable[1] ;
 wire \user_irq_enable[2] ;
 wire \user_irq_enable[3] ;
 wire \user_irq_enable[4] ;
 wire \user_irq_enable[5] ;
 wire \user_irq_enable[6] ;
 wire \user_irq_enable[7] ;
 wire \user_irq_enable[8] ;
 wire \user_irq_enable[9] ;

 sky130_fd_sc_hd__inv_2 _000_ (.A(\user_irq_bar[0] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[0]));
 sky130_fd_sc_hd__inv_2 _001_ (.A(\user_irq_bar[1] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[1]));
 sky130_fd_sc_hd__inv_2 _002_ (.A(\user_irq_bar[2] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[2]));
 sky130_fd_sc_hd__inv_2 _003_ (.A(\user_irq_bar[3] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[3]));
 sky130_fd_sc_hd__inv_2 _004_ (.A(\user_irq_bar[4] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[4]));
 sky130_fd_sc_hd__inv_2 _005_ (.A(\user_irq_bar[5] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[5]));
 sky130_fd_sc_hd__inv_2 _006_ (.A(\user_irq_bar[6] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[6]));
 sky130_fd_sc_hd__inv_2 _007_ (.A(\user_irq_bar[7] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[7]));
 sky130_fd_sc_hd__inv_2 _008_ (.A(\user_irq_bar[8] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[8]));
 sky130_fd_sc_hd__inv_2 _009_ (.A(\user_irq_bar[9] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[9]));
 sky130_fd_sc_hd__inv_2 _010_ (.A(\user_irq_bar[10] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[10]));
 sky130_fd_sc_hd__inv_2 _011_ (.A(\user_irq_bar[11] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[11]));
 sky130_fd_sc_hd__inv_2 _012_ (.A(\user_irq_bar[12] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[12]));
 sky130_fd_sc_hd__inv_2 _013_ (.A(\user_irq_bar[13] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[13]));
 sky130_fd_sc_hd__inv_2 _014_ (.A(\user_irq_bar[14] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[14]));
 sky130_fd_sc_hd__inv_2 _015_ (.A(\user_irq_bar[15] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(user_irq_core[15]));
 sky130_fd_sc_hd__inv_2 _016_ (.A(\mprj_dat_i_core_bar[0] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net1));
 sky130_fd_sc_hd__inv_2 _017_ (.A(\mprj_dat_i_core_bar[1] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net12));
 sky130_fd_sc_hd__inv_2 _018_ (.A(\mprj_dat_i_core_bar[2] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net23));
 sky130_fd_sc_hd__inv_2 _019_ (.A(\mprj_dat_i_core_bar[3] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net26));
 sky130_fd_sc_hd__inv_2 _020_ (.A(\mprj_dat_i_core_bar[4] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net27));
 sky130_fd_sc_hd__inv_2 _021_ (.A(\mprj_dat_i_core_bar[5] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net28));
 sky130_fd_sc_hd__inv_2 _022_ (.A(\mprj_dat_i_core_bar[6] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net29));
 sky130_fd_sc_hd__inv_2 _023_ (.A(\mprj_dat_i_core_bar[7] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net30));
 sky130_fd_sc_hd__inv_2 _024_ (.A(\mprj_dat_i_core_bar[8] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net31));
 sky130_fd_sc_hd__inv_2 _025_ (.A(\mprj_dat_i_core_bar[9] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net32));
 sky130_fd_sc_hd__inv_2 _026_ (.A(\mprj_dat_i_core_bar[10] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net2));
 sky130_fd_sc_hd__inv_2 _027_ (.A(\mprj_dat_i_core_bar[11] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net3));
 sky130_fd_sc_hd__inv_2 _028_ (.A(\mprj_dat_i_core_bar[12] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net4));
 sky130_fd_sc_hd__inv_2 _029_ (.A(\mprj_dat_i_core_bar[13] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net5));
 sky130_fd_sc_hd__inv_2 _030_ (.A(\mprj_dat_i_core_bar[14] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net6));
 sky130_fd_sc_hd__inv_2 _031_ (.A(\mprj_dat_i_core_bar[15] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net7));
 sky130_fd_sc_hd__inv_2 _032_ (.A(\mprj_dat_i_core_bar[16] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net8));
 sky130_fd_sc_hd__inv_2 _033_ (.A(\mprj_dat_i_core_bar[17] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net9));
 sky130_fd_sc_hd__inv_2 _034_ (.A(\mprj_dat_i_core_bar[18] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net10));
 sky130_fd_sc_hd__inv_2 _035_ (.A(\mprj_dat_i_core_bar[19] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net11));
 sky130_fd_sc_hd__inv_2 _036_ (.A(\mprj_dat_i_core_bar[20] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net13));
 sky130_fd_sc_hd__inv_2 _037_ (.A(\mprj_dat_i_core_bar[21] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net14));
 sky130_fd_sc_hd__inv_2 _038_ (.A(\mprj_dat_i_core_bar[22] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net15));
 sky130_fd_sc_hd__inv_2 _039_ (.A(\mprj_dat_i_core_bar[23] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net16));
 sky130_fd_sc_hd__inv_2 _040_ (.A(\mprj_dat_i_core_bar[24] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net17));
 sky130_fd_sc_hd__inv_2 _041_ (.A(\mprj_dat_i_core_bar[25] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net18));
 sky130_fd_sc_hd__inv_2 _042_ (.A(\mprj_dat_i_core_bar[26] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net19));
 sky130_fd_sc_hd__inv_2 _043_ (.A(\mprj_dat_i_core_bar[27] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net20));
 sky130_fd_sc_hd__inv_2 _044_ (.A(\mprj_dat_i_core_bar[28] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net21));
 sky130_fd_sc_hd__inv_2 _045_ (.A(\mprj_dat_i_core_bar[29] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net22));
 sky130_fd_sc_hd__inv_2 _046_ (.A(\mprj_dat_i_core_bar[30] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net24));
 sky130_fd_sc_hd__inv_2 _047_ (.A(\mprj_dat_i_core_bar[31] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net25));
 sky130_fd_sc_hd__inv_2 _048_ (.A(mprj_ack_i_core_bar),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(net33));
 sky130_fd_sc_hd__and2_4 _049_ (.A(\mprj_logic1[83] ),
    .B(user_irq_ena[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[8] ));
 sky130_fd_sc_hd__and2_4 _050_ (.A(\mprj_logic1[84] ),
    .B(user_irq_ena[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[9] ));
 sky130_fd_sc_hd__and2_4 _051_ (.A(\mprj_logic1[85] ),
    .B(user_irq_ena[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[10] ));
 sky130_fd_sc_hd__and2_4 _052_ (.A(\mprj_logic1[86] ),
    .B(user_irq_ena[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[11] ));
 sky130_fd_sc_hd__and2_4 _053_ (.A(\mprj_logic1[87] ),
    .B(user_irq_ena[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[12] ));
 sky130_fd_sc_hd__and2_4 _054_ (.A(\mprj_logic1[88] ),
    .B(user_irq_ena[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[13] ));
 sky130_fd_sc_hd__and2_4 _055_ (.A(\mprj_logic1[89] ),
    .B(user_irq_ena[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[14] ));
 sky130_fd_sc_hd__and2_4 _056_ (.A(\mprj_logic1[90] ),
    .B(user_irq_ena[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[15] ));
 sky130_fd_sc_hd__and2_4 _057_ (.A(\mprj_logic1[74] ),
    .B(mprj_AHB_Ena),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(ahb_in_enable));
 sky130_fd_sc_hd__and2_4 _058_ (.A(\mprj_logic1[0] ),
    .B(frigate_HCLK),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(user_HCLK));
 sky130_fd_sc_hd__and2_4 _059_ (.A(\mprj_logic1[1] ),
    .B(frigate_HRESETn),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(user_HRESETn));
 sky130_fd_sc_hd__and2_4 _060_ (.A(\mprj_logic1[2] ),
    .B(mprj_HSEL_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HSEL_user));
 sky130_fd_sc_hd__and2_4 _061_ (.A(\mprj_logic1[3] ),
    .B(mprj_HREADY_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HREADY_user));
 sky130_fd_sc_hd__and2_4 _062_ (.A(\mprj_logic1[4] ),
    .B(mprj_HWRITE_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWRITE_user));
 sky130_fd_sc_hd__and2_4 _063_ (.A(\mprj_logic1[5] ),
    .B(mprj_HSIZE_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HSIZE_user[0]));
 sky130_fd_sc_hd__and2_4 _064_ (.A(\mprj_logic1[6] ),
    .B(mprj_HSIZE_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HSIZE_user[1]));
 sky130_fd_sc_hd__and2_4 _065_ (.A(\mprj_logic1[7] ),
    .B(mprj_HSIZE_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HSIZE_user[2]));
 sky130_fd_sc_hd__and2_4 _066_ (.A(\mprj_logic1[8] ),
    .B(mprj_HADDR_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[0]));
 sky130_fd_sc_hd__and2_4 _067_ (.A(\mprj_logic1[9] ),
    .B(mprj_HADDR_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[1]));
 sky130_fd_sc_hd__and2_4 _068_ (.A(\mprj_logic1[10] ),
    .B(mprj_HADDR_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[2]));
 sky130_fd_sc_hd__and2_4 _069_ (.A(\mprj_logic1[11] ),
    .B(mprj_HADDR_core[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[3]));
 sky130_fd_sc_hd__and2_4 _070_ (.A(\mprj_logic1[12] ),
    .B(mprj_HADDR_core[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[4]));
 sky130_fd_sc_hd__and2_4 _071_ (.A(\mprj_logic1[13] ),
    .B(mprj_HADDR_core[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[5]));
 sky130_fd_sc_hd__and2_4 _072_ (.A(\mprj_logic1[14] ),
    .B(mprj_HADDR_core[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[6]));
 sky130_fd_sc_hd__and2_4 _073_ (.A(\mprj_logic1[15] ),
    .B(mprj_HADDR_core[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[7]));
 sky130_fd_sc_hd__and2_4 _074_ (.A(\mprj_logic1[16] ),
    .B(mprj_HADDR_core[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[8]));
 sky130_fd_sc_hd__and2_4 _075_ (.A(\mprj_logic1[17] ),
    .B(mprj_HADDR_core[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[9]));
 sky130_fd_sc_hd__and2_4 _076_ (.A(\mprj_logic1[18] ),
    .B(mprj_HADDR_core[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[10]));
 sky130_fd_sc_hd__and2_4 _077_ (.A(\mprj_logic1[19] ),
    .B(mprj_HADDR_core[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[11]));
 sky130_fd_sc_hd__and2_4 _078_ (.A(\mprj_logic1[20] ),
    .B(mprj_HADDR_core[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[12]));
 sky130_fd_sc_hd__and2_4 _079_ (.A(\mprj_logic1[21] ),
    .B(mprj_HADDR_core[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[13]));
 sky130_fd_sc_hd__and2_4 _080_ (.A(\mprj_logic1[22] ),
    .B(mprj_HADDR_core[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[14]));
 sky130_fd_sc_hd__and2_4 _081_ (.A(\mprj_logic1[23] ),
    .B(mprj_HADDR_core[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[15]));
 sky130_fd_sc_hd__and2_4 _082_ (.A(\mprj_logic1[24] ),
    .B(mprj_HADDR_core[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[16]));
 sky130_fd_sc_hd__and2_4 _083_ (.A(\mprj_logic1[25] ),
    .B(mprj_HADDR_core[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[17]));
 sky130_fd_sc_hd__and2_4 _084_ (.A(\mprj_logic1[26] ),
    .B(mprj_HADDR_core[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[18]));
 sky130_fd_sc_hd__and2_4 _085_ (.A(\mprj_logic1[27] ),
    .B(mprj_HADDR_core[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[19]));
 sky130_fd_sc_hd__and2_4 _086_ (.A(\mprj_logic1[28] ),
    .B(mprj_HADDR_core[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[20]));
 sky130_fd_sc_hd__and2_4 _087_ (.A(\mprj_logic1[29] ),
    .B(mprj_HADDR_core[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[21]));
 sky130_fd_sc_hd__and2_4 _088_ (.A(\mprj_logic1[30] ),
    .B(mprj_HADDR_core[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[22]));
 sky130_fd_sc_hd__and2_4 _089_ (.A(\mprj_logic1[31] ),
    .B(mprj_HADDR_core[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[23]));
 sky130_fd_sc_hd__and2_4 _090_ (.A(\mprj_logic1[32] ),
    .B(mprj_HADDR_core[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[24]));
 sky130_fd_sc_hd__and2_4 _091_ (.A(\mprj_logic1[33] ),
    .B(mprj_HADDR_core[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[25]));
 sky130_fd_sc_hd__and2_4 _092_ (.A(\mprj_logic1[34] ),
    .B(mprj_HADDR_core[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[26]));
 sky130_fd_sc_hd__and2_4 _093_ (.A(\mprj_logic1[35] ),
    .B(mprj_HADDR_core[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[27]));
 sky130_fd_sc_hd__and2_4 _094_ (.A(\mprj_logic1[36] ),
    .B(mprj_HADDR_core[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[28]));
 sky130_fd_sc_hd__and2_4 _095_ (.A(\mprj_logic1[37] ),
    .B(mprj_HADDR_core[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[29]));
 sky130_fd_sc_hd__and2_4 _096_ (.A(\mprj_logic1[38] ),
    .B(mprj_HADDR_core[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[30]));
 sky130_fd_sc_hd__and2_4 _097_ (.A(\mprj_logic1[39] ),
    .B(mprj_HADDR_core[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HADDR_user[31]));
 sky130_fd_sc_hd__and2_4 _098_ (.A(\mprj_logic1[40] ),
    .B(mprj_HWDATA_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[0]));
 sky130_fd_sc_hd__and2_4 _099_ (.A(\mprj_logic1[41] ),
    .B(mprj_HWDATA_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[1]));
 sky130_fd_sc_hd__and2_4 _100_ (.A(\mprj_logic1[42] ),
    .B(mprj_HWDATA_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[2]));
 sky130_fd_sc_hd__and2_4 _101_ (.A(\mprj_logic1[43] ),
    .B(mprj_HWDATA_core[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[3]));
 sky130_fd_sc_hd__and2_4 _102_ (.A(\mprj_logic1[44] ),
    .B(mprj_HWDATA_core[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[4]));
 sky130_fd_sc_hd__and2_4 _103_ (.A(\mprj_logic1[45] ),
    .B(mprj_HWDATA_core[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[5]));
 sky130_fd_sc_hd__and2_4 _104_ (.A(\mprj_logic1[46] ),
    .B(mprj_HWDATA_core[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[6]));
 sky130_fd_sc_hd__and2_4 _105_ (.A(\mprj_logic1[47] ),
    .B(mprj_HWDATA_core[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[7]));
 sky130_fd_sc_hd__and2_4 _106_ (.A(\mprj_logic1[48] ),
    .B(mprj_HWDATA_core[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[8]));
 sky130_fd_sc_hd__and2_4 _107_ (.A(\mprj_logic1[49] ),
    .B(mprj_HWDATA_core[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[9]));
 sky130_fd_sc_hd__and2_4 _108_ (.A(\mprj_logic1[50] ),
    .B(mprj_HWDATA_core[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[10]));
 sky130_fd_sc_hd__and2_4 _109_ (.A(\mprj_logic1[51] ),
    .B(mprj_HWDATA_core[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[11]));
 sky130_fd_sc_hd__and2_4 _110_ (.A(\mprj_logic1[52] ),
    .B(mprj_HWDATA_core[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[12]));
 sky130_fd_sc_hd__and2_4 _111_ (.A(\mprj_logic1[53] ),
    .B(mprj_HWDATA_core[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[13]));
 sky130_fd_sc_hd__and2_4 _112_ (.A(\mprj_logic1[54] ),
    .B(mprj_HWDATA_core[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[14]));
 sky130_fd_sc_hd__and2_4 _113_ (.A(\mprj_logic1[55] ),
    .B(mprj_HWDATA_core[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[15]));
 sky130_fd_sc_hd__and2_4 _114_ (.A(\mprj_logic1[56] ),
    .B(mprj_HWDATA_core[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[16]));
 sky130_fd_sc_hd__and2_4 _115_ (.A(\mprj_logic1[57] ),
    .B(mprj_HWDATA_core[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[17]));
 sky130_fd_sc_hd__and2_4 _116_ (.A(\mprj_logic1[58] ),
    .B(mprj_HWDATA_core[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[18]));
 sky130_fd_sc_hd__and2_4 _117_ (.A(\mprj_logic1[59] ),
    .B(mprj_HWDATA_core[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[19]));
 sky130_fd_sc_hd__and2_4 _118_ (.A(\mprj_logic1[60] ),
    .B(mprj_HWDATA_core[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[20]));
 sky130_fd_sc_hd__and2_4 _119_ (.A(\mprj_logic1[61] ),
    .B(mprj_HWDATA_core[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[21]));
 sky130_fd_sc_hd__and2_4 _120_ (.A(\mprj_logic1[62] ),
    .B(mprj_HWDATA_core[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[22]));
 sky130_fd_sc_hd__and2_4 _121_ (.A(\mprj_logic1[63] ),
    .B(mprj_HWDATA_core[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[23]));
 sky130_fd_sc_hd__and2_4 _122_ (.A(\mprj_logic1[64] ),
    .B(mprj_HWDATA_core[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[24]));
 sky130_fd_sc_hd__and2_4 _123_ (.A(\mprj_logic1[65] ),
    .B(mprj_HWDATA_core[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[25]));
 sky130_fd_sc_hd__and2_4 _124_ (.A(\mprj_logic1[66] ),
    .B(mprj_HWDATA_core[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[26]));
 sky130_fd_sc_hd__and2_4 _125_ (.A(\mprj_logic1[67] ),
    .B(mprj_HWDATA_core[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[27]));
 sky130_fd_sc_hd__and2_4 _126_ (.A(\mprj_logic1[68] ),
    .B(mprj_HWDATA_core[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[28]));
 sky130_fd_sc_hd__and2_4 _127_ (.A(\mprj_logic1[69] ),
    .B(mprj_HWDATA_core[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[29]));
 sky130_fd_sc_hd__and2_4 _128_ (.A(\mprj_logic1[70] ),
    .B(mprj_HWDATA_core[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[30]));
 sky130_fd_sc_hd__and2_4 _129_ (.A(\mprj_logic1[71] ),
    .B(mprj_HWDATA_core[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HWDATA_user[31]));
 sky130_fd_sc_hd__and2_4 _130_ (.A(\mprj_logic1[72] ),
    .B(mprj_HTRANS_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HTRANS_user[0]));
 sky130_fd_sc_hd__and2_4 _131_ (.A(\mprj_logic1[73] ),
    .B(mprj_HTRANS_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HTRANS_user[1]));
 sky130_fd_sc_hd__and2_4 _132_ (.A(\mprj_logic1[75] ),
    .B(user_irq_ena[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[0] ));
 sky130_fd_sc_hd__and2_4 _133_ (.A(\mprj_logic1[76] ),
    .B(user_irq_ena[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[1] ));
 sky130_fd_sc_hd__and2_4 _134_ (.A(\mprj_logic1[77] ),
    .B(user_irq_ena[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[2] ));
 sky130_fd_sc_hd__and2_4 _135_ (.A(\mprj_logic1[78] ),
    .B(user_irq_ena[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[3] ));
 sky130_fd_sc_hd__and2_4 _136_ (.A(\mprj_logic1[79] ),
    .B(user_irq_ena[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[4] ));
 sky130_fd_sc_hd__and2_4 _137_ (.A(\mprj_logic1[80] ),
    .B(user_irq_ena[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[5] ));
 sky130_fd_sc_hd__and2_4 _138_ (.A(\mprj_logic1[81] ),
    .B(user_irq_ena[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[6] ));
 sky130_fd_sc_hd__and2_4 _139_ (.A(\mprj_logic1[82] ),
    .B(user_irq_ena[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(\user_irq_enable[7] ));
 sky130_fd_sc_hd__nand2_1 hreadyout_ack_gate (.A(mprj_HREADYOUT_user),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(mprj_ack_i_core_bar));
 sky130_fd_sc_hd__nand2_4 \irq_gates[0]  (.A(user_irq[0]),
    .B(\user_irq_enable[0] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[0] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[10]  (.A(user_irq[10]),
    .B(\user_irq_enable[10] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[10] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[11]  (.A(user_irq[11]),
    .B(\user_irq_enable[11] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[11] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[12]  (.A(user_irq[12]),
    .B(\user_irq_enable[12] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[12] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[13]  (.A(user_irq[13]),
    .B(\user_irq_enable[13] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[13] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[14]  (.A(user_irq[14]),
    .B(\user_irq_enable[14] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[14] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[15]  (.A(user_irq[15]),
    .B(\user_irq_enable[15] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[15] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[1]  (.A(user_irq[1]),
    .B(\user_irq_enable[1] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[1] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[2]  (.A(user_irq[2]),
    .B(\user_irq_enable[2] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[2] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[3]  (.A(user_irq[3]),
    .B(\user_irq_enable[3] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[3] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[4]  (.A(user_irq[4]),
    .B(\user_irq_enable[4] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[4] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[5]  (.A(user_irq[5]),
    .B(\user_irq_enable[5] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[5] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[6]  (.A(user_irq[6]),
    .B(\user_irq_enable[6] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[6] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[7]  (.A(user_irq[7]),
    .B(\user_irq_enable[7] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[7] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[8]  (.A(user_irq[8]),
    .B(\user_irq_enable[8] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[8] ));
 sky130_fd_sc_hd__nand2_4 \irq_gates[9]  (.A(user_irq[9]),
    .B(\user_irq_enable[9] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\user_irq_bar[9] ));
 vccd1_tie_high mprj_logic_high_inst (.vccd1(vccd1),
    .vssd1(vssd1),
    .HI({\mprj_logic1[90] ,
    \mprj_logic1[89] ,
    \mprj_logic1[88] ,
    \mprj_logic1[87] ,
    \mprj_logic1[86] ,
    \mprj_logic1[85] ,
    \mprj_logic1[84] ,
    \mprj_logic1[83] ,
    \mprj_logic1[82] ,
    \mprj_logic1[81] ,
    \mprj_logic1[80] ,
    \mprj_logic1[79] ,
    \mprj_logic1[78] ,
    \mprj_logic1[77] ,
    \mprj_logic1[76] ,
    \mprj_logic1[75] ,
    \mprj_logic1[74] ,
    \mprj_logic1[73] ,
    \mprj_logic1[72] ,
    \mprj_logic1[71] ,
    \mprj_logic1[70] ,
    \mprj_logic1[69] ,
    \mprj_logic1[68] ,
    \mprj_logic1[67] ,
    \mprj_logic1[66] ,
    \mprj_logic1[65] ,
    \mprj_logic1[64] ,
    \mprj_logic1[63] ,
    \mprj_logic1[62] ,
    \mprj_logic1[61] ,
    \mprj_logic1[60] ,
    \mprj_logic1[59] ,
    \mprj_logic1[58] ,
    \mprj_logic1[57] ,
    \mprj_logic1[56] ,
    \mprj_logic1[55] ,
    \mprj_logic1[54] ,
    \mprj_logic1[53] ,
    \mprj_logic1[52] ,
    \mprj_logic1[51] ,
    \mprj_logic1[50] ,
    \mprj_logic1[49] ,
    \mprj_logic1[48] ,
    \mprj_logic1[47] ,
    \mprj_logic1[46] ,
    \mprj_logic1[45] ,
    \mprj_logic1[44] ,
    \mprj_logic1[43] ,
    \mprj_logic1[42] ,
    \mprj_logic1[41] ,
    \mprj_logic1[40] ,
    \mprj_logic1[39] ,
    \mprj_logic1[38] ,
    \mprj_logic1[37] ,
    \mprj_logic1[36] ,
    \mprj_logic1[35] ,
    \mprj_logic1[34] ,
    \mprj_logic1[33] ,
    \mprj_logic1[32] ,
    \mprj_logic1[31] ,
    \mprj_logic1[30] ,
    \mprj_logic1[29] ,
    \mprj_logic1[28] ,
    \mprj_logic1[27] ,
    \mprj_logic1[26] ,
    \mprj_logic1[25] ,
    \mprj_logic1[24] ,
    \mprj_logic1[23] ,
    \mprj_logic1[22] ,
    \mprj_logic1[21] ,
    \mprj_logic1[20] ,
    \mprj_logic1[19] ,
    \mprj_logic1[18] ,
    \mprj_logic1[17] ,
    \mprj_logic1[16] ,
    \mprj_logic1[15] ,
    \mprj_logic1[14] ,
    \mprj_logic1[13] ,
    \mprj_logic1[12] ,
    \mprj_logic1[11] ,
    \mprj_logic1[10] ,
    \mprj_logic1[9] ,
    \mprj_logic1[8] ,
    \mprj_logic1[7] ,
    \mprj_logic1[6] ,
    \mprj_logic1[5] ,
    \mprj_logic1[4] ,
    \mprj_logic1[3] ,
    \mprj_logic1[2] ,
    \mprj_logic1[1] ,
    \mprj_logic1[0] }));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[0]  (.A(mprj_HRDATA_user[0]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[0] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[10]  (.A(mprj_HRDATA_user[10]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[10] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[11]  (.A(mprj_HRDATA_user[11]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[11] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[12]  (.A(mprj_HRDATA_user[12]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[12] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[13]  (.A(mprj_HRDATA_user[13]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[13] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[14]  (.A(mprj_HRDATA_user[14]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[14] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[15]  (.A(mprj_HRDATA_user[15]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[15] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[16]  (.A(mprj_HRDATA_user[16]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[16] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[17]  (.A(mprj_HRDATA_user[17]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[17] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[18]  (.A(mprj_HRDATA_user[18]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[18] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[19]  (.A(mprj_HRDATA_user[19]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[19] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[1]  (.A(mprj_HRDATA_user[1]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[1] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[20]  (.A(mprj_HRDATA_user[20]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[20] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[21]  (.A(mprj_HRDATA_user[21]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[21] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[22]  (.A(mprj_HRDATA_user[22]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[22] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[23]  (.A(mprj_HRDATA_user[23]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[23] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[24]  (.A(mprj_HRDATA_user[24]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[24] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[25]  (.A(mprj_HRDATA_user[25]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[25] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[26]  (.A(mprj_HRDATA_user[26]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[26] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[27]  (.A(mprj_HRDATA_user[27]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[27] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[28]  (.A(mprj_HRDATA_user[28]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[28] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[29]  (.A(mprj_HRDATA_user[29]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[29] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[2]  (.A(mprj_HRDATA_user[2]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[2] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[30]  (.A(mprj_HRDATA_user[30]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[30] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[31]  (.A(mprj_HRDATA_user[31]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[31] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[3]  (.A(mprj_HRDATA_user[3]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[3] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[4]  (.A(mprj_HRDATA_user[4]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[4] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[5]  (.A(mprj_HRDATA_user[5]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[5] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[6]  (.A(mprj_HRDATA_user[6]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[6] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[7]  (.A(mprj_HRDATA_user[7]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[7] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[8]  (.A(mprj_HRDATA_user[8]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[8] ));
 sky130_fd_sc_hd__nand2_1 \wb_hrdata_gates[9]  (.A(mprj_HRDATA_user[9]),
    .B(ahb_in_enable),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .Y(\mprj_dat_i_core_bar[9] ));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_5 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_6 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_7 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_8 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_9 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_10 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_2_Right_11 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_2_Right_12 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_2_Right_13 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_2_Right_14 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_2_Right_15 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_2_Right_16 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_2_Right_17 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_2_Right_18 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_2_Right_19 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_20 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_21 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_22 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_23 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_24 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_1_Left_25 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_1_Left_26 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_1_Left_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_1_Left_28 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_1_Left_29 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_1_Left_30 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_1_Left_31 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_1_Left_32 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_33 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_34 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_35 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_36 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_37 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_38 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_1_Left_39 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_2_Left_40 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_2_Left_41 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_2_Left_42 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_2_Left_43 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_2_Left_44 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_2_Left_45 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_2_Left_46 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_2_Left_47 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_2_Left_48 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_1_Right_49 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_1_Right_50 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_1_Right_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_1_Right_52 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_1_Right_53 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_1_Right_54 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_1_Right_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_1_Right_56 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_1_Right_57 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_58 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_59 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_60 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_61 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_62 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_63 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_64 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_65 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_66 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_67 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_68 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_69 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_70 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_71 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_72 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_73 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_74 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_75 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_76 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_77 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_78 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_79 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_80 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_81 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_82 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_83 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_84 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_85 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_86 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_87 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_88 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_89 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_90 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_91 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_92 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_93 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_94 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_95 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_96 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_97 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_98 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_99 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_100 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_101 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_102 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_103 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_104 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_105 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_106 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_107 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_108 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_109 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_110 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_111 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_112 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_113 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_1_114 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_1_115 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_1_116 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_1_117 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_1_118 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_1_119 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_1_120 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_1_121 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_1_122 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_1_123 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_1_124 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_1_125 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_1_126 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_1_127 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_1_128 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_1_129 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_130 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_131 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_132 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_133 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_134 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_135 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_136 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_137 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_138 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_139 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_140 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_141 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_142 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_143 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_144 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_145 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_146 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_147 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_148 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_149 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_150 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_151 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_152 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_153 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_154 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_155 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_156 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_157 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_158 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_159 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_160 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_161 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_162 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_163 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_164 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_165 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_166 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_167 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_168 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_169 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_170 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_171 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_172 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_173 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_174 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_175 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_176 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_177 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_178 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_179 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_180 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_181 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_182 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_183 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_184 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_185 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_186 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_187 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_188 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_189 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_190 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_191 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_192 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_193 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_1_194 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_1_195 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_2_196 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_2_197 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_2_198 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_2_199 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_2_200 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_2_201 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_2_202 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_2_203 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_2_204 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_2_205 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_2_206 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_2_207 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_2_208 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_2_209 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_2_210 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_2_211 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_2_212 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_2_213 (.VGND(vssd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__buf_12 output1 (.A(net1),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[0]));
 sky130_fd_sc_hd__buf_12 output2 (.A(net2),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[10]));
 sky130_fd_sc_hd__buf_12 output3 (.A(net3),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[11]));
 sky130_fd_sc_hd__buf_12 output4 (.A(net4),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[12]));
 sky130_fd_sc_hd__buf_12 output5 (.A(net5),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[13]));
 sky130_fd_sc_hd__buf_12 output6 (.A(net6),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[14]));
 sky130_fd_sc_hd__buf_12 output7 (.A(net7),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[15]));
 sky130_fd_sc_hd__buf_12 output8 (.A(net8),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[16]));
 sky130_fd_sc_hd__buf_12 output9 (.A(net9),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[17]));
 sky130_fd_sc_hd__buf_12 output10 (.A(net10),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[18]));
 sky130_fd_sc_hd__buf_12 output11 (.A(net11),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[19]));
 sky130_fd_sc_hd__buf_12 output12 (.A(net12),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[1]));
 sky130_fd_sc_hd__buf_12 output13 (.A(net13),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[20]));
 sky130_fd_sc_hd__buf_12 output14 (.A(net14),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[21]));
 sky130_fd_sc_hd__buf_12 output15 (.A(net15),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[22]));
 sky130_fd_sc_hd__buf_12 output16 (.A(net16),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[23]));
 sky130_fd_sc_hd__buf_12 output17 (.A(net17),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[24]));
 sky130_fd_sc_hd__buf_12 output18 (.A(net18),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[25]));
 sky130_fd_sc_hd__buf_12 output19 (.A(net19),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[26]));
 sky130_fd_sc_hd__buf_12 output20 (.A(net20),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[27]));
 sky130_fd_sc_hd__buf_12 output21 (.A(net21),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[28]));
 sky130_fd_sc_hd__buf_12 output22 (.A(net22),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[29]));
 sky130_fd_sc_hd__buf_12 output23 (.A(net23),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[2]));
 sky130_fd_sc_hd__buf_12 output24 (.A(net24),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[30]));
 sky130_fd_sc_hd__buf_12 output25 (.A(net25),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[31]));
 sky130_fd_sc_hd__buf_12 output26 (.A(net26),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[3]));
 sky130_fd_sc_hd__buf_12 output27 (.A(net27),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[4]));
 sky130_fd_sc_hd__buf_12 output28 (.A(net28),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[5]));
 sky130_fd_sc_hd__buf_12 output29 (.A(net29),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[6]));
 sky130_fd_sc_hd__buf_12 output30 (.A(net30),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[7]));
 sky130_fd_sc_hd__buf_12 output31 (.A(net31),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[8]));
 sky130_fd_sc_hd__buf_12 output32 (.A(net32),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HRDATA_core[9]));
 sky130_fd_sc_hd__buf_12 output33 (.A(net33),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0),
    .X(mprj_HREADYOUT_core));
 sky130_fd_sc_hd__diode_2 ANTENNA__058__B (.DIODE(frigate_HCLK),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__059__B (.DIODE(frigate_HRESETn),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__057__B (.DIODE(mprj_AHB_Ena),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__066__B (.DIODE(mprj_HADDR_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__076__B (.DIODE(mprj_HADDR_core[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__077__B (.DIODE(mprj_HADDR_core[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__078__B (.DIODE(mprj_HADDR_core[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__079__B (.DIODE(mprj_HADDR_core[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__080__B (.DIODE(mprj_HADDR_core[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__081__B (.DIODE(mprj_HADDR_core[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__082__B (.DIODE(mprj_HADDR_core[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__083__B (.DIODE(mprj_HADDR_core[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__084__B (.DIODE(mprj_HADDR_core[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__085__B (.DIODE(mprj_HADDR_core[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__067__B (.DIODE(mprj_HADDR_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__086__B (.DIODE(mprj_HADDR_core[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__087__B (.DIODE(mprj_HADDR_core[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__088__B (.DIODE(mprj_HADDR_core[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__089__B (.DIODE(mprj_HADDR_core[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__090__B (.DIODE(mprj_HADDR_core[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__091__B (.DIODE(mprj_HADDR_core[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__092__B (.DIODE(mprj_HADDR_core[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__093__B (.DIODE(mprj_HADDR_core[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__094__B (.DIODE(mprj_HADDR_core[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__095__B (.DIODE(mprj_HADDR_core[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__068__B (.DIODE(mprj_HADDR_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__096__B (.DIODE(mprj_HADDR_core[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__097__B (.DIODE(mprj_HADDR_core[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__069__B (.DIODE(mprj_HADDR_core[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__070__B (.DIODE(mprj_HADDR_core[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__071__B (.DIODE(mprj_HADDR_core[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__072__B (.DIODE(mprj_HADDR_core[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__073__B (.DIODE(mprj_HADDR_core[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__074__B (.DIODE(mprj_HADDR_core[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__075__B (.DIODE(mprj_HADDR_core[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__066__X (.DIODE(mprj_HADDR_user[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__076__X (.DIODE(mprj_HADDR_user[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__077__X (.DIODE(mprj_HADDR_user[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__078__X (.DIODE(mprj_HADDR_user[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__079__X (.DIODE(mprj_HADDR_user[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__080__X (.DIODE(mprj_HADDR_user[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__081__X (.DIODE(mprj_HADDR_user[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__082__X (.DIODE(mprj_HADDR_user[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__083__X (.DIODE(mprj_HADDR_user[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__084__X (.DIODE(mprj_HADDR_user[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__085__X (.DIODE(mprj_HADDR_user[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__067__X (.DIODE(mprj_HADDR_user[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__086__X (.DIODE(mprj_HADDR_user[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__087__X (.DIODE(mprj_HADDR_user[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__088__X (.DIODE(mprj_HADDR_user[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__089__X (.DIODE(mprj_HADDR_user[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__090__X (.DIODE(mprj_HADDR_user[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__091__X (.DIODE(mprj_HADDR_user[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__092__X (.DIODE(mprj_HADDR_user[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__093__X (.DIODE(mprj_HADDR_user[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__094__X (.DIODE(mprj_HADDR_user[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__095__X (.DIODE(mprj_HADDR_user[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__068__X (.DIODE(mprj_HADDR_user[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__096__X (.DIODE(mprj_HADDR_user[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__097__X (.DIODE(mprj_HADDR_user[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__069__X (.DIODE(mprj_HADDR_user[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__070__X (.DIODE(mprj_HADDR_user[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__071__X (.DIODE(mprj_HADDR_user[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__072__X (.DIODE(mprj_HADDR_user[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__073__X (.DIODE(mprj_HADDR_user[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__074__X (.DIODE(mprj_HADDR_user[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__075__X (.DIODE(mprj_HADDR_user[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[0]_A  (.DIODE(mprj_HRDATA_user[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[10]_A  (.DIODE(mprj_HRDATA_user[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[11]_A  (.DIODE(mprj_HRDATA_user[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[12]_A  (.DIODE(mprj_HRDATA_user[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[13]_A  (.DIODE(mprj_HRDATA_user[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[14]_A  (.DIODE(mprj_HRDATA_user[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[15]_A  (.DIODE(mprj_HRDATA_user[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[16]_A  (.DIODE(mprj_HRDATA_user[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[17]_A  (.DIODE(mprj_HRDATA_user[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[18]_A  (.DIODE(mprj_HRDATA_user[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[19]_A  (.DIODE(mprj_HRDATA_user[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[1]_A  (.DIODE(mprj_HRDATA_user[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[20]_A  (.DIODE(mprj_HRDATA_user[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[21]_A  (.DIODE(mprj_HRDATA_user[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[22]_A  (.DIODE(mprj_HRDATA_user[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[23]_A  (.DIODE(mprj_HRDATA_user[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[24]_A  (.DIODE(mprj_HRDATA_user[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[25]_A  (.DIODE(mprj_HRDATA_user[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[26]_A  (.DIODE(mprj_HRDATA_user[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[27]_A  (.DIODE(mprj_HRDATA_user[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[28]_A  (.DIODE(mprj_HRDATA_user[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[29]_A  (.DIODE(mprj_HRDATA_user[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[2]_A  (.DIODE(mprj_HRDATA_user[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[30]_A  (.DIODE(mprj_HRDATA_user[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[31]_A  (.DIODE(mprj_HRDATA_user[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[3]_A  (.DIODE(mprj_HRDATA_user[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[4]_A  (.DIODE(mprj_HRDATA_user[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[5]_A  (.DIODE(mprj_HRDATA_user[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[6]_A  (.DIODE(mprj_HRDATA_user[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[7]_A  (.DIODE(mprj_HRDATA_user[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[8]_A  (.DIODE(mprj_HRDATA_user[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_wb_hrdata_gates[9]_A  (.DIODE(mprj_HRDATA_user[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_hreadyout_ack_gate_A (.DIODE(mprj_HREADYOUT_user),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__061__B (.DIODE(mprj_HREADY_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__061__X (.DIODE(mprj_HREADY_user),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__060__B (.DIODE(mprj_HSEL_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__060__X (.DIODE(mprj_HSEL_user),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__063__B (.DIODE(mprj_HSIZE_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__064__B (.DIODE(mprj_HSIZE_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__065__B (.DIODE(mprj_HSIZE_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__063__X (.DIODE(mprj_HSIZE_user[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__064__X (.DIODE(mprj_HSIZE_user[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__065__X (.DIODE(mprj_HSIZE_user[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__130__B (.DIODE(mprj_HTRANS_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__131__B (.DIODE(mprj_HTRANS_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__130__X (.DIODE(mprj_HTRANS_user[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__131__X (.DIODE(mprj_HTRANS_user[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__098__B (.DIODE(mprj_HWDATA_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__108__B (.DIODE(mprj_HWDATA_core[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__109__B (.DIODE(mprj_HWDATA_core[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__110__B (.DIODE(mprj_HWDATA_core[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__111__B (.DIODE(mprj_HWDATA_core[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__112__B (.DIODE(mprj_HWDATA_core[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__113__B (.DIODE(mprj_HWDATA_core[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__114__B (.DIODE(mprj_HWDATA_core[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__115__B (.DIODE(mprj_HWDATA_core[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__116__B (.DIODE(mprj_HWDATA_core[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__117__B (.DIODE(mprj_HWDATA_core[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__099__B (.DIODE(mprj_HWDATA_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__118__B (.DIODE(mprj_HWDATA_core[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__119__B (.DIODE(mprj_HWDATA_core[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__120__B (.DIODE(mprj_HWDATA_core[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__121__B (.DIODE(mprj_HWDATA_core[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__122__B (.DIODE(mprj_HWDATA_core[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__123__B (.DIODE(mprj_HWDATA_core[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__124__B (.DIODE(mprj_HWDATA_core[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__125__B (.DIODE(mprj_HWDATA_core[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__126__B (.DIODE(mprj_HWDATA_core[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__127__B (.DIODE(mprj_HWDATA_core[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__100__B (.DIODE(mprj_HWDATA_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__128__B (.DIODE(mprj_HWDATA_core[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__129__B (.DIODE(mprj_HWDATA_core[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__101__B (.DIODE(mprj_HWDATA_core[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__102__B (.DIODE(mprj_HWDATA_core[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__103__B (.DIODE(mprj_HWDATA_core[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__104__B (.DIODE(mprj_HWDATA_core[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__105__B (.DIODE(mprj_HWDATA_core[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__106__B (.DIODE(mprj_HWDATA_core[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__107__B (.DIODE(mprj_HWDATA_core[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__098__X (.DIODE(mprj_HWDATA_user[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__108__X (.DIODE(mprj_HWDATA_user[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__109__X (.DIODE(mprj_HWDATA_user[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__110__X (.DIODE(mprj_HWDATA_user[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__111__X (.DIODE(mprj_HWDATA_user[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__112__X (.DIODE(mprj_HWDATA_user[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__113__X (.DIODE(mprj_HWDATA_user[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__114__X (.DIODE(mprj_HWDATA_user[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__115__X (.DIODE(mprj_HWDATA_user[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__116__X (.DIODE(mprj_HWDATA_user[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__117__X (.DIODE(mprj_HWDATA_user[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__099__X (.DIODE(mprj_HWDATA_user[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__118__X (.DIODE(mprj_HWDATA_user[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__119__X (.DIODE(mprj_HWDATA_user[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__120__X (.DIODE(mprj_HWDATA_user[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__121__X (.DIODE(mprj_HWDATA_user[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__122__X (.DIODE(mprj_HWDATA_user[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__123__X (.DIODE(mprj_HWDATA_user[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__124__X (.DIODE(mprj_HWDATA_user[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__125__X (.DIODE(mprj_HWDATA_user[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__126__X (.DIODE(mprj_HWDATA_user[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__127__X (.DIODE(mprj_HWDATA_user[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__100__X (.DIODE(mprj_HWDATA_user[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__128__X (.DIODE(mprj_HWDATA_user[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__129__X (.DIODE(mprj_HWDATA_user[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__101__X (.DIODE(mprj_HWDATA_user[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__102__X (.DIODE(mprj_HWDATA_user[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__103__X (.DIODE(mprj_HWDATA_user[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__104__X (.DIODE(mprj_HWDATA_user[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__105__X (.DIODE(mprj_HWDATA_user[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__106__X (.DIODE(mprj_HWDATA_user[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__107__X (.DIODE(mprj_HWDATA_user[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__062__B (.DIODE(mprj_HWRITE_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__062__X (.DIODE(mprj_HWRITE_user),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__058__X (.DIODE(user_HCLK),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__059__X (.DIODE(user_HRESETn),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[0]_A  (.DIODE(user_irq[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[10]_A  (.DIODE(user_irq[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[11]_A  (.DIODE(user_irq[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[12]_A  (.DIODE(user_irq[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[13]_A  (.DIODE(user_irq[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[14]_A  (.DIODE(user_irq[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[15]_A  (.DIODE(user_irq[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[1]_A  (.DIODE(user_irq[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[2]_A  (.DIODE(user_irq[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[3]_A  (.DIODE(user_irq[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[4]_A  (.DIODE(user_irq[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[5]_A  (.DIODE(user_irq[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[6]_A  (.DIODE(user_irq[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[7]_A  (.DIODE(user_irq[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[8]_A  (.DIODE(user_irq[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 \ANTENNA_irq_gates[9]_A  (.DIODE(user_irq[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__000__Y (.DIODE(user_irq_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__010__Y (.DIODE(user_irq_core[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__011__Y (.DIODE(user_irq_core[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__012__Y (.DIODE(user_irq_core[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__013__Y (.DIODE(user_irq_core[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__014__Y (.DIODE(user_irq_core[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__015__Y (.DIODE(user_irq_core[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__001__Y (.DIODE(user_irq_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__002__Y (.DIODE(user_irq_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__003__Y (.DIODE(user_irq_core[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__004__Y (.DIODE(user_irq_core[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__005__Y (.DIODE(user_irq_core[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__006__Y (.DIODE(user_irq_core[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__007__Y (.DIODE(user_irq_core[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__008__Y (.DIODE(user_irq_core[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__009__Y (.DIODE(user_irq_core[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__132__B (.DIODE(user_irq_ena[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__051__B (.DIODE(user_irq_ena[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__052__B (.DIODE(user_irq_ena[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__053__B (.DIODE(user_irq_ena[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__054__B (.DIODE(user_irq_ena[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__055__B (.DIODE(user_irq_ena[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__056__B (.DIODE(user_irq_ena[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__133__B (.DIODE(user_irq_ena[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__134__B (.DIODE(user_irq_ena[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__135__B (.DIODE(user_irq_ena[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__136__B (.DIODE(user_irq_ena[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__137__B (.DIODE(user_irq_ena[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__138__B (.DIODE(user_irq_ena[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__139__B (.DIODE(user_irq_ena[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__049__B (.DIODE(user_irq_ena[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA__050__B (.DIODE(user_irq_ena[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output1_X (.DIODE(mprj_HRDATA_core[0]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output2_X (.DIODE(mprj_HRDATA_core[10]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output3_X (.DIODE(mprj_HRDATA_core[11]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output4_X (.DIODE(mprj_HRDATA_core[12]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output5_X (.DIODE(mprj_HRDATA_core[13]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output6_X (.DIODE(mprj_HRDATA_core[14]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output7_X (.DIODE(mprj_HRDATA_core[15]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output8_X (.DIODE(mprj_HRDATA_core[16]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output9_X (.DIODE(mprj_HRDATA_core[17]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output10_X (.DIODE(mprj_HRDATA_core[18]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output11_X (.DIODE(mprj_HRDATA_core[19]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output12_X (.DIODE(mprj_HRDATA_core[1]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output13_X (.DIODE(mprj_HRDATA_core[20]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output14_X (.DIODE(mprj_HRDATA_core[21]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output15_X (.DIODE(mprj_HRDATA_core[22]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output16_X (.DIODE(mprj_HRDATA_core[23]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output17_X (.DIODE(mprj_HRDATA_core[24]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output18_X (.DIODE(mprj_HRDATA_core[25]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output19_X (.DIODE(mprj_HRDATA_core[26]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output20_X (.DIODE(mprj_HRDATA_core[27]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output21_X (.DIODE(mprj_HRDATA_core[28]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output22_X (.DIODE(mprj_HRDATA_core[29]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output23_X (.DIODE(mprj_HRDATA_core[2]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output24_X (.DIODE(mprj_HRDATA_core[30]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output25_X (.DIODE(mprj_HRDATA_core[31]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output26_X (.DIODE(mprj_HRDATA_core[3]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output27_X (.DIODE(mprj_HRDATA_core[4]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output28_X (.DIODE(mprj_HRDATA_core[5]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output29_X (.DIODE(mprj_HRDATA_core[6]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output30_X (.DIODE(mprj_HRDATA_core[7]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output31_X (.DIODE(mprj_HRDATA_core[8]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output32_X (.DIODE(mprj_HRDATA_core[9]),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_output33_X (.DIODE(mprj_HREADYOUT_core),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(\mprj_logic1[90] ),
    .VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_0_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_53 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_81 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_113 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_125 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_137 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_141 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_153 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_165 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_169 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_181 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_193 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_197 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_209 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_221 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_0_225 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_0_237 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_0_356 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_0_421 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_0_427 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_0_437 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_0_447 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_0_462 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_1_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_93 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_1_105 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_111 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_113 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_125 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_137 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_149 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_1_161 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_167 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_169 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_181 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_193 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_205 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_1_217 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_223 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_225 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_1_237 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_279 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_335 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_1_447 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_1_459 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_53 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_65 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_2_77 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_83 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_109 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_121 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_2_133 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_139 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_141 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_153 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_165 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_177 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_2_189 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_195 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_197 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_209 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_221 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_233 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_2_245 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_251 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_253 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_2_446 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_2_458 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_2_464 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_3_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_3_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_93 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_3_105 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_3_111 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_113 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_125 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_137 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_149 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_3_161 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_3_167 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_169 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_181 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_193 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_205 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_3_217 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_3_223 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_225 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_237 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_3_249 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_3_257 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_3_335 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_3_445 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_3_449 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_3_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_4_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_53 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_81 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_113 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_125 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_137 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_141 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_153 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_165 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_169 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_181 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_193 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_197 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_209 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_221 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_225 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_237 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_249 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_253 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_4_265 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_4_273 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_4_301 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_4_356 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_4_388 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_4_419 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_421 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_4_445 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_4_449 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_4_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_5_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_5_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_93 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_5_105 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_5_111 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_5_113 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_5_117 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_413 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_425 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_5_437 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_5_449 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_5_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_5_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_6_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_53 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_65 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_6_77 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_6_83 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_6_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_6_117 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_6_357 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_6_385 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_6_392 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_402 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_414 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_6_426 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_6_445 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_6_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_7_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_7_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_93 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_7_105 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_7_111 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_7_113 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_7_117 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_7_354 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_381 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_7_393 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_7_401 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_417 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_429 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_7_441 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_7_453 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_7_459 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_7_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_8_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_53 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_65 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_8_77 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_8_83 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_8_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_8_117 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_8_360 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_8 FILLER_8_366 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_8_374 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_377 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_394 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_406 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_418 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_2 FILLER_8_430 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_8_445 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_8_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_9_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_9_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_9_93 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_9_98 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_9_104 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_9_107 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_9_111 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_9_113 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_351 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_363 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_375 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_387 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_9_399 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_9_403 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_417 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_429 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_9_441 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_9_453 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_9_459 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_9_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_10_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_2 FILLER_10_53 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_10_59 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_10_63 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_10_66 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_10_72 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_10_75 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_10_79 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_10_87 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_10_93 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_10_351 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_10_361 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_10_377 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_385 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_397 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_409 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_10_421 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_10_429 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_10_445 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_10_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_11_39 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_11_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_11_115 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_11_351 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_11_361 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_375 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_387 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_11_399 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_11_403 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_417 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_429 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_11_441 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_11_453 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_11_459 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_11_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_12_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_12_29 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_12_108 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_360 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_12_372 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_377 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_389 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_401 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_413 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_12_425 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_12_431 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_12_445 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_12_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_13_39 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_13_79 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_13_113 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_351 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_363 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_375 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_387 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_13_399 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_13_403 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_417 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_429 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_13_441 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_13_453 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_13_459 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_13_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_14_41 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_14_49 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_14_54 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_14_57 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_14_63 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_69 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_14_74 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_78 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_83 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_91 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_98 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_176 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_195 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_197 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_225 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_14_251 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_292 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_14_304 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_309 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_321 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_14_333 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_337 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_349 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_14_361 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_365 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_377 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_14_389 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_393 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_14_417 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_421 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_14_445 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_14_449 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_14_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_15_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_93 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_15_105 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_126 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_134 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_167 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_225 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_15_283 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_290 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_302 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_15_314 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_323 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_335 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_337 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_349 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_361 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_373 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_15_385 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_391 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_393 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_417 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_429 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_15_441 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_15_447 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_15_449 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_15_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_53 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_65 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_16_77 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_83 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_16_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_16_117 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_8 FILLER_16_122 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_130 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_133 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_136 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_139 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_141 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_146 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_156 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_161 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_182 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_230 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_237 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_244 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_255 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_16_260 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_16_264 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_268 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_273 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_285 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_16_297 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_16_305 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_309 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_321 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_333 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_345 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_16_357 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_363 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_365 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_377 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_389 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_401 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_16_413 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_16_419 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_421 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_16_445 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_16_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_27 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_39 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_17_51 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_55 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_81 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_93 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_17_105 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_111 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_113 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_125 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_137 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_2 FILLER_17_149 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_157 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_17_160 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_17_169 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_179 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_182 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_191 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_17_194 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_198 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_17_203 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_17_212 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_17_219 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_223 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_225 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_237 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_249 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_261 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_17_273 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_279 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_17_281 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_285 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_17_301 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_309 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_320 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_8 FILLER_17_326 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_17_334 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_337 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_348 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_360 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_372 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_17_384 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_393 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_417 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_429 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_17_441 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_17_447 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_17_449 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_17_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_53 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_65 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_18_77 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_83 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_109 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_121 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_18_133 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_139 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_141 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_153 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_165 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_177 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_18_189 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_195 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_197 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_209 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_221 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_233 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_18_245 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_251 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_8 FILLER_18_253 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_18_261 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_278 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_290 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_296 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_309 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_321 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_338 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_350 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_2 FILLER_18_362 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_365 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_377 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_389 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_401 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_6 FILLER_18_413 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_18_419 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_421 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_18_445 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_8 FILLER_18_457 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_3 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_15 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_19_27 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_29 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_41 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_53 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_57 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_69 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_81 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_85 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_97 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_109 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_113 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_125 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_137 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_141 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_153 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_165 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_169 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_181 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_193 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_197 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_209 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_221 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_225 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_237 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_249 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_6 FILLER_19_253 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_4 FILLER_19_269 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_19_276 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_8 FILLER_19_290 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_1 FILLER_19_304 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_320 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_fd_sc_hd__fill_2 FILLER_19_344 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_367 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_379 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__fill_1 FILLER_19_391 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_393 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_405 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_417 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_421 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_433 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_3 FILLER_19_445 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
 sky130_ef_sc_hd__decap_12 FILLER_19_449 (.VPWR(vccd0),
    .VGND(vssd0),
    .VPB(vccd0),
    .VNB(vssd0));
 sky130_fd_sc_hd__decap_4 FILLER_19_461 (.VGND(vssd0),
    .VNB(vssd0),
    .VPB(vccd0),
    .VPWR(vccd0));
endmodule
