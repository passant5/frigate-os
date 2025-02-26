module clk_rst (clk,
    clk_mon,
    clk_mux1_out,
    dll_clk,
    dll_clk90,
    hkrst_n,
    hsxo,
    hsxo_en,
    hsxo_en_tf,
    hsxo_standby,
    hsxo_standby_tf,
    lsxo,
    lsxo_en,
    lsxo_en_tf,
    lsxo_standby,
    lsxo_standby_tf,
    pclk,
    por_n,
    rcosc_16m,
    rcosc_16m_en,
    rcosc_16m_en_tf,
    rcosc_500k,
    rcosc_500k_en,
    rcosc_500k_en_tf,
    rst_n,
    sel_mux0,
    sel_mux1,
    sel_mux2,
    sel_mux3,
    sel_mux4,
    sel_mux5,
    usb_clk,
    user_clk,
    xclk,
    xrst_n,
    VPWR,
    VGND,
    clk_mon_sel,
    sel_clkdiv0,
    sel_clkdiv1,
    sel_clkdiv2);
 output clk;
 output clk_mon;
 output clk_mux1_out;
 input dll_clk;
 input dll_clk90;
 input hkrst_n;
 input hsxo;
 input hsxo_en;
 output hsxo_en_tf;
 input hsxo_standby;
 output hsxo_standby_tf;
 input lsxo;
 input lsxo_en;
 output lsxo_en_tf;
 input lsxo_standby;
 output lsxo_standby_tf;
 output pclk;
 input por_n;
 input rcosc_16m;
 input rcosc_16m_en;
 output rcosc_16m_en_tf;
 input rcosc_500k;
 input rcosc_500k_en;
 output rcosc_500k_en_tf;
 output rst_n;
 input sel_mux0;
 input sel_mux1;
 input sel_mux2;
 input sel_mux3;
 input sel_mux4;
 input sel_mux5;
 output usb_clk;
 output user_clk;
 input xclk;
 input xrst_n;
 inout VPWR;
 inout VGND;
 input [2:0] clk_mon_sel;
 input [2:0] sel_clkdiv0;
 input [2:0] sel_clkdiv1;
 input [2:0] sel_clkdiv2;

 wire \CLKDIV_0.CLK_DIV_MUX.clk0 ;
 wire \CLKDIV_0.CLK_DIV_MUX.clk1 ;
 wire \CLKDIV_0.CLK_DIV_MUX.clk2 ;
 wire \CLKDIV_0.CLK_DIV_MUX.clk3 ;
 wire \CLKDIV_0.CLK_DIV_MUX.clko ;
 wire \CLKDIV_0.CLK_DIV_MUX.m1.Q1a ;
 wire \CLKDIV_0.CLK_DIV_MUX.m1.Q1b ;
 wire \CLKDIV_0.CLK_DIV_MUX.m1.Q2a ;
 wire \CLKDIV_0.CLK_DIV_MUX.m1.Q2b ;
 wire \CLKDIV_0.CLK_DIV_MUX.m1.q1a_in ;
 wire \CLKDIV_0.CLK_DIV_MUX.m1.q2a_in ;
 wire \CLKDIV_0.CLK_DIV_MUX.m2.Q1a ;
 wire \CLKDIV_0.CLK_DIV_MUX.m2.Q1b ;
 wire \CLKDIV_0.CLK_DIV_MUX.m2.Q2a ;
 wire \CLKDIV_0.CLK_DIV_MUX.m2.Q2b ;
 wire \CLKDIV_0.CLK_DIV_MUX.m2.q1a_in ;
 wire \CLKDIV_0.CLK_DIV_MUX.m2.q2a_in ;
 wire \CLKDIV_0.CLK_DIV_MUX.m3.Q1a ;
 wire \CLKDIV_0.CLK_DIV_MUX.m3.Q1b ;
 wire \CLKDIV_0.CLK_DIV_MUX.m3.Q2a ;
 wire \CLKDIV_0.CLK_DIV_MUX.m3.Q2b ;
 wire \CLKDIV_0.CLK_DIV_MUX.m3.q1a_in ;
 wire \CLKDIV_0.CLK_DIV_MUX.m3.q2a_in ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.Q1a ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.Q1b ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.Q2a ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.Q2b ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.clk1 ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.q1a_in ;
 wire \CLKDIV_0.DIV_BYPASS_MUX.q2a_in ;
 wire \CLKDIV_1.CLK_DIV_MUX.clk0 ;
 wire \CLKDIV_1.CLK_DIV_MUX.clk1 ;
 wire \CLKDIV_1.CLK_DIV_MUX.clk2 ;
 wire \CLKDIV_1.CLK_DIV_MUX.clk3 ;
 wire \CLKDIV_1.CLK_DIV_MUX.clko ;
 wire \CLKDIV_1.CLK_DIV_MUX.m1.Q1a ;
 wire \CLKDIV_1.CLK_DIV_MUX.m1.Q1b ;
 wire \CLKDIV_1.CLK_DIV_MUX.m1.Q2a ;
 wire \CLKDIV_1.CLK_DIV_MUX.m1.Q2b ;
 wire \CLKDIV_1.CLK_DIV_MUX.m1.q1a_in ;
 wire \CLKDIV_1.CLK_DIV_MUX.m1.q2a_in ;
 wire \CLKDIV_1.CLK_DIV_MUX.m2.Q1a ;
 wire \CLKDIV_1.CLK_DIV_MUX.m2.Q1b ;
 wire \CLKDIV_1.CLK_DIV_MUX.m2.Q2a ;
 wire \CLKDIV_1.CLK_DIV_MUX.m2.Q2b ;
 wire \CLKDIV_1.CLK_DIV_MUX.m2.q1a_in ;
 wire \CLKDIV_1.CLK_DIV_MUX.m2.q2a_in ;
 wire \CLKDIV_1.CLK_DIV_MUX.m3.Q1a ;
 wire \CLKDIV_1.CLK_DIV_MUX.m3.Q1b ;
 wire \CLKDIV_1.CLK_DIV_MUX.m3.Q2a ;
 wire \CLKDIV_1.CLK_DIV_MUX.m3.Q2b ;
 wire \CLKDIV_1.CLK_DIV_MUX.m3.q1a_in ;
 wire \CLKDIV_1.CLK_DIV_MUX.m3.q2a_in ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.Q1a ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.Q1b ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.Q2a ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.Q2b ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.clk0 ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.clk1 ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.clko ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.q1a_in ;
 wire \CLKDIV_1.DIV_BYPASS_MUX.q2a_in ;
 wire \CLKDIV_2.CLK_DIV_MUX.clk0 ;
 wire \CLKDIV_2.CLK_DIV_MUX.clk1 ;
 wire \CLKDIV_2.CLK_DIV_MUX.clk2 ;
 wire \CLKDIV_2.CLK_DIV_MUX.clk3 ;
 wire \CLKDIV_2.CLK_DIV_MUX.clko ;
 wire \CLKDIV_2.CLK_DIV_MUX.m1.Q1a ;
 wire \CLKDIV_2.CLK_DIV_MUX.m1.Q1b ;
 wire \CLKDIV_2.CLK_DIV_MUX.m1.Q2a ;
 wire \CLKDIV_2.CLK_DIV_MUX.m1.Q2b ;
 wire \CLKDIV_2.CLK_DIV_MUX.m1.q1a_in ;
 wire \CLKDIV_2.CLK_DIV_MUX.m1.q2a_in ;
 wire \CLKDIV_2.CLK_DIV_MUX.m2.Q1a ;
 wire \CLKDIV_2.CLK_DIV_MUX.m2.Q1b ;
 wire \CLKDIV_2.CLK_DIV_MUX.m2.Q2a ;
 wire \CLKDIV_2.CLK_DIV_MUX.m2.Q2b ;
 wire \CLKDIV_2.CLK_DIV_MUX.m2.q1a_in ;
 wire \CLKDIV_2.CLK_DIV_MUX.m2.q2a_in ;
 wire \CLKDIV_2.CLK_DIV_MUX.m3.Q1a ;
 wire \CLKDIV_2.CLK_DIV_MUX.m3.Q1b ;
 wire \CLKDIV_2.CLK_DIV_MUX.m3.Q2a ;
 wire \CLKDIV_2.CLK_DIV_MUX.m3.Q2b ;
 wire \CLKDIV_2.CLK_DIV_MUX.m3.q1a_in ;
 wire \CLKDIV_2.CLK_DIV_MUX.m3.q2a_in ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.Q1a ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.Q1b ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.Q2a ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.Q2b ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.clk1 ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.clko ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.q1a_in ;
 wire \CLKDIV_2.DIV_BYPASS_MUX.q2a_in ;
 wire \CLKMUX_0.Q1a ;
 wire \CLKMUX_0.Q1b ;
 wire \CLKMUX_0.Q2a ;
 wire \CLKMUX_0.Q2b ;
 wire \CLKMUX_0.q1a_in ;
 wire \CLKMUX_0.q2a_in ;
 wire \CLKMUX_1.Q1a ;
 wire \CLKMUX_1.Q1b ;
 wire \CLKMUX_1.Q2a ;
 wire \CLKMUX_1.Q2b ;
 wire \CLKMUX_1.q1a_in ;
 wire \CLKMUX_1.q2a_in ;
 wire \CLKMUX_2.Q1a ;
 wire \CLKMUX_2.Q1b ;
 wire \CLKMUX_2.Q2a ;
 wire \CLKMUX_2.Q2b ;
 wire \CLKMUX_2.q1a_in ;
 wire \CLKMUX_2.q2a_in ;
 wire \CLKMUX_3.Q1a ;
 wire \CLKMUX_3.Q1b ;
 wire \CLKMUX_3.Q2a ;
 wire \CLKMUX_3.Q2b ;
 wire \CLKMUX_3.q1a_in ;
 wire \CLKMUX_3.q2a_in ;
 wire \CLKMUX_4.Q1a ;
 wire \CLKMUX_4.Q1b ;
 wire \CLKMUX_4.Q2a ;
 wire \CLKMUX_4.Q2b ;
 wire \CLKMUX_4.clko ;
 wire \CLKMUX_4.q1a_in ;
 wire \CLKMUX_4.q2a_in ;
 wire \CLKMUX_5.Q1a ;
 wire \CLKMUX_5.Q1b ;
 wire \CLKMUX_5.Q2a ;
 wire \CLKMUX_5.Q2b ;
 wire \CLKMUX_5.q1a_in ;
 wire \CLKMUX_5.q2a_in ;
 wire \CLK_MON_MUX_0.m1.Q1a ;
 wire \CLK_MON_MUX_0.m1.Q1b ;
 wire \CLK_MON_MUX_0.m1.Q2a ;
 wire \CLK_MON_MUX_0.m1.Q2b ;
 wire \CLK_MON_MUX_0.m1.q1a_in ;
 wire \CLK_MON_MUX_0.m1.q2a_in ;
 wire \CLK_MON_MUX_0.m2.Q1a ;
 wire \CLK_MON_MUX_0.m2.Q1b ;
 wire \CLK_MON_MUX_0.m2.Q2a ;
 wire \CLK_MON_MUX_0.m2.Q2b ;
 wire \CLK_MON_MUX_0.m2.q1a_in ;
 wire \CLK_MON_MUX_0.m2.q2a_in ;
 wire \CLK_MON_MUX_0.m3.Q1a ;
 wire \CLK_MON_MUX_0.m3.Q1b ;
 wire \CLK_MON_MUX_0.m3.Q2a ;
 wire \CLK_MON_MUX_0.m3.Q2b ;
 wire \CLK_MON_MUX_0.m3.q1a_in ;
 wire \CLK_MON_MUX_0.m3.q2a_in ;
 wire \CLK_MON_MUX_1.Q1a ;
 wire \CLK_MON_MUX_1.Q1b ;
 wire \CLK_MON_MUX_1.Q2a ;
 wire \CLK_MON_MUX_1.Q2b ;
 wire \CLK_MON_MUX_1.clko ;
 wire \CLK_MON_MUX_1.q1a_in ;
 wire \CLK_MON_MUX_1.q2a_in ;
 wire \RST_SYNC.delay[0] ;
 wire \RST_SYNC.delay[1] ;
 wire \RST_SYNC.delay[2] ;
 wire \RST_SYNC.rst_n_in ;
 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire \clk_div1_delay.dly[1] ;
 wire \clk_div1_delay.dly[2] ;
 wire \clk_div1_delay.dly[3] ;
 wire \clk_div1_delay.dly[4] ;
 wire \clk_div1_delay.dly[5] ;
 wire \clk_div1_delay.dly[6] ;
 wire \clk_div1_delay.dly[7] ;
 wire \clk_div1_delay.dly[8] ;
 wire \clk_mon_div[0] ;
 wire pclk_div;
 wire \pclk_div_skewed_delay.dly[1] ;
 wire \pclk_div_skewed_delay.dly[2] ;
 wire \pclk_div_skewed_delay.dly[3] ;
 wire \pclk_div_skewed_delay.dly[4] ;
 wire \pclk_div_skewed_delay.dly[5] ;
 wire \usb_clk_delayed.dly[1] ;
 wire \usb_clk_delayed.dly[2] ;
 wire \usb_clk_delayed.dly[3] ;
 wire \usb_clk_delayed.dly[4] ;
 wire \usb_clk_delayed.dly[5] ;
 wire \usb_clk_delayed.dly[6] ;
 wire \usb_clk_delayed.dly[7] ;
 wire \usb_clk_delayed.dly[8] ;
 wire \usb_clk_delayed.dly[9] ;
 wire \user_clk_delay.dly[1] ;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;

 sky130_fd_sc_hd__xnor2_2 _096_ (.A(_081_),
    .B(_089_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_027_));
 sky130_fd_sc_hd__xor2_2 _097_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .B(\CLKDIV_1.CLK_DIV_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_021_));
 sky130_fd_sc_hd__and3_2 _098_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .B(\CLKDIV_1.CLK_DIV_MUX.clk1 ),
    .C(\CLKDIV_1.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_091_));
 sky130_fd_sc_hd__a21oi_2 _099_ (.A1(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .A2(\CLKDIV_1.CLK_DIV_MUX.clk1 ),
    .B1(\CLKDIV_1.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_092_));
 sky130_fd_sc_hd__nor2_2 _100_ (.A(_091_),
    .B(_092_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_022_));
 sky130_fd_sc_hd__xnor2_2 _101_ (.A(_068_),
    .B(_091_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_023_));
 sky130_fd_sc_hd__xor2_1 _102_ (.A(net6),
    .B(clk_mon),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_029_));
 sky130_fd_sc_hd__xor2_2 _103_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .B(\CLKDIV_0.CLK_DIV_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_017_));
 sky130_fd_sc_hd__and3_2 _104_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .B(\CLKDIV_0.CLK_DIV_MUX.clk1 ),
    .C(\CLKDIV_0.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_093_));
 sky130_fd_sc_hd__a21oi_2 _105_ (.A1(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .A2(\CLKDIV_0.CLK_DIV_MUX.clk1 ),
    .B1(\CLKDIV_0.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_094_));
 sky130_fd_sc_hd__nor2_2 _106_ (.A(_093_),
    .B(_094_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_018_));
 sky130_fd_sc_hd__xnor2_2 _107_ (.A(_049_),
    .B(_093_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_019_));
 sky130_fd_sc_hd__inv_2 _108_ (.A(hsxo),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_039_));
 sky130_fd_sc_hd__inv_2 _109_ (.A(rcosc_16m),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_041_));
 sky130_fd_sc_hd__a22o_2 _110_ (.A1(rcosc_16m),
    .A2(\CLKMUX_1.Q1b ),
    .B1(\CLKMUX_1.Q2b ),
    .B2(_040_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_042_));
 sky130_fd_sc_hd__inv_2 _111_ (.A(dll_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _112_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_046_));
 sky130_fd_sc_hd__a22o_2 _113_ (.A1(dll_clk),
    .A2(\CLKMUX_2.Q1b ),
    .B1(\CLKMUX_2.Q2b ),
    .B2(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_052_));
 sky130_fd_sc_hd__a22o_2 _114_ (.A1(dll_clk),
    .A2(\CLKMUX_2.Q1b ),
    .B1(\CLKMUX_2.Q2b ),
    .B2(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_053_));
 sky130_fd_sc_hd__a22o_2 _115_ (.A1(dll_clk),
    .A2(\CLKMUX_2.Q1b ),
    .B1(\CLKMUX_2.Q2b ),
    .B2(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_054_));
 sky130_fd_sc_hd__a22o_2 _116_ (.A1(dll_clk),
    .A2(\CLKMUX_2.Q1b ),
    .B1(\CLKMUX_2.Q2b ),
    .B2(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_055_));
 sky130_fd_sc_hd__a22o_2 _117_ (.A1(dll_clk),
    .A2(\CLKMUX_2.Q1b ),
    .B1(\CLKMUX_2.Q2b ),
    .B2(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_056_));
 sky130_fd_sc_hd__inv_2 _118_ (.A(rcosc_500k),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_058_));
 sky130_fd_sc_hd__inv_2 _119_ (.A(lsxo),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_059_));
 sky130_fd_sc_hd__inv_2 _120_ (.A(rcosc_16m),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_062_));
 sky130_fd_sc_hd__a22o_2 _121_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_063_));
 sky130_fd_sc_hd__inv_2 _122_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_065_));
 sky130_fd_sc_hd__a22o_2 _123_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_071_));
 sky130_fd_sc_hd__a22o_2 _124_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_072_));
 sky130_fd_sc_hd__a22o_2 _125_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_073_));
 sky130_fd_sc_hd__a22o_2 _126_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_074_));
 sky130_fd_sc_hd__a22o_2 _127_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_075_));
 sky130_fd_sc_hd__a22o_2 _128_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_076_));
 sky130_fd_sc_hd__inv_2 _129_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_078_));
 sky130_fd_sc_hd__a22o_2 _130_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_084_));
 sky130_fd_sc_hd__a22o_2 _131_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_085_));
 sky130_fd_sc_hd__a22o_2 _132_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_086_));
 sky130_fd_sc_hd__a22o_2 _133_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_087_));
 sky130_fd_sc_hd__a22o_2 _134_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_088_));
 sky130_fd_sc_hd__inv_2 _135_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_024_));
 sky130_fd_sc_hd__inv_2 _136_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_020_));
 sky130_fd_sc_hd__inv_1 _137_ (.A(net6),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _138_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_016_));
 sky130_fd_sc_hd__inv_2 _139_ (.A(hsxo),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_033_));
 sky130_fd_sc_hd__inv_2 _140_ (.A(lsxo),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _141_ (.A(rcosc_500k),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_035_));
 sky130_fd_sc_hd__inv_2 _142_ (.A(rcosc_16m),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_034_));
 sky130_fd_sc_hd__inv_2 _143_ (.A(dll_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _144_ (.A(xclk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_038_));
 sky130_fd_sc_hd__inv_2 _145_ (.A(\CLKDIV_0.DIV_BYPASS_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_045_));
 sky130_fd_sc_hd__inv_2 _146_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _147_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_048_));
 sky130_fd_sc_hd__inv_2 _148_ (.A(\CLKDIV_0.CLK_DIV_MUX.clk3 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_049_));
 sky130_fd_sc_hd__inv_2 _149_ (.A(\CLKDIV_1.DIV_BYPASS_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_064_));
 sky130_fd_sc_hd__inv_2 _150_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_066_));
 sky130_fd_sc_hd__inv_2 _151_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_067_));
 sky130_fd_sc_hd__inv_2 _152_ (.A(\CLKDIV_1.CLK_DIV_MUX.clk3 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_068_));
 sky130_fd_sc_hd__inv_2 _153_ (.A(\CLKDIV_2.DIV_BYPASS_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_077_));
 sky130_fd_sc_hd__inv_2 _154_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_079_));
 sky130_fd_sc_hd__inv_2 _155_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_080_));
 sky130_fd_sc_hd__inv_2 _156_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk3 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_081_));
 sky130_fd_sc_hd__inv_2 _157_ (.A(pclk_div),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_000_));
 sky130_fd_sc_hd__and3_1 _158_ (.A(por_n),
    .B(xrst_n),
    .C(hkrst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\RST_SYNC.rst_n_in ));
 sky130_fd_sc_hd__a22o_2 _159_ (.A1(hsxo),
    .A2(\CLK_MON_MUX_0.m2.Q1b ),
    .B1(lsxo),
    .B2(\CLK_MON_MUX_0.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_031_));
 sky130_fd_sc_hd__inv_2 _160_ (.A(_031_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_001_));
 sky130_fd_sc_hd__a22o_2 _161_ (.A1(rcosc_500k),
    .A2(\CLK_MON_MUX_0.m1.Q1b ),
    .B1(rcosc_16m),
    .B2(\CLK_MON_MUX_0.m1.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_030_));
 sky130_fd_sc_hd__inv_2 _162_ (.A(_030_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_002_));
 sky130_fd_sc_hd__a22o_2 _163_ (.A1(\CLK_MON_MUX_0.m3.Q2b ),
    .A2(_031_),
    .B1(_030_),
    .B2(\CLK_MON_MUX_0.m3.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_037_));
 sky130_fd_sc_hd__inv_2 _164_ (.A(_037_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_003_));
 sky130_fd_sc_hd__nor2_1 _165_ (.A(\CLK_MON_MUX_0.m3.Q2b ),
    .B(clk_mon_sel[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLK_MON_MUX_0.m3.q1a_in ));
 sky130_fd_sc_hd__and2b_1 _166_ (.A_N(\CLK_MON_MUX_0.m3.Q1b ),
    .B(clk_mon_sel[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLK_MON_MUX_0.m3.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _167_ (.A(\CLK_MON_MUX_0.m2.Q2b ),
    .B(clk_mon_sel[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLK_MON_MUX_0.m2.q1a_in ));
 sky130_fd_sc_hd__and2b_1 _168_ (.A_N(\CLK_MON_MUX_0.m2.Q1b ),
    .B(clk_mon_sel[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLK_MON_MUX_0.m2.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _169_ (.A(\CLK_MON_MUX_0.m1.Q2b ),
    .B(clk_mon_sel[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLK_MON_MUX_0.m1.q1a_in ));
 sky130_fd_sc_hd__and2b_1 _170_ (.A_N(\CLK_MON_MUX_0.m1.Q1b ),
    .B(clk_mon_sel[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLK_MON_MUX_0.m1.q2a_in ));
 sky130_fd_sc_hd__and2b_1 _171_ (.A_N(\CLK_MON_MUX_1.Q1b ),
    .B(clk_mon_sel[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLK_MON_MUX_1.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _172_ (.A(clk_mon_sel[2]),
    .B(\CLK_MON_MUX_1.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLK_MON_MUX_1.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _173_ (.A1(\CLK_MON_MUX_1.Q2b ),
    .A2(dll_clk),
    .B1(_037_),
    .B2(\CLK_MON_MUX_1.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLK_MON_MUX_1.clko ));
 sky130_fd_sc_hd__and2b_1 _174_ (.A_N(\CLKMUX_0.Q1b ),
    .B(sel_mux0),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_0.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _175_ (.A(sel_mux0),
    .B(\CLKMUX_0.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKMUX_0.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _176_ (.A1(hsxo),
    .A2(\CLKMUX_0.Q2b ),
    .B1(xclk),
    .B2(\CLKMUX_0.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_040_));
 sky130_fd_sc_hd__inv_2 _177_ (.A(_040_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_004_));
 sky130_fd_sc_hd__and2b_1 _178_ (.A_N(\CLKMUX_1.Q1b ),
    .B(sel_mux1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_1.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _179_ (.A(sel_mux1),
    .B(\CLKMUX_1.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKMUX_1.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _180_ (.A1(rcosc_16m),
    .A2(\CLKMUX_1.Q1b ),
    .B1(\CLKMUX_1.Q2b ),
    .B2(_040_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clk_mux1_out));
 sky130_fd_sc_hd__inv_2 _181_ (.A(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_005_));
 sky130_fd_sc_hd__and2b_1 _182_ (.A_N(\CLKMUX_2.Q1b ),
    .B(sel_mux2),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_2.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _183_ (.A(sel_mux2),
    .B(\CLKMUX_2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKMUX_2.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _184_ (.A1(dll_clk),
    .A2(\CLKMUX_2.Q1b ),
    .B1(\CLKMUX_2.Q2b ),
    .B2(clk_mux1_out),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_044_));
 sky130_fd_sc_hd__inv_2 _185_ (.A(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_006_));
 sky130_fd_sc_hd__a22o_2 _186_ (.A1(\CLKDIV_0.DIV_BYPASS_MUX.clk1 ),
    .A2(\CLKDIV_0.DIV_BYPASS_MUX.Q2b ),
    .B1(_044_),
    .B2(\CLKDIV_0.DIV_BYPASS_MUX.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_057_));
 sky130_fd_sc_hd__inv_2 _187_ (.A(_057_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_007_));
 sky130_fd_sc_hd__nor2_2 _188_ (.A(\CLKDIV_0.DIV_BYPASS_MUX.Q2b ),
    .B(sel_clkdiv0[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_0.DIV_BYPASS_MUX.q1a_in ));
 sky130_fd_sc_hd__and2b_2 _189_ (.A_N(\CLKDIV_0.DIV_BYPASS_MUX.Q1b ),
    .B(sel_clkdiv0[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_0.DIV_BYPASS_MUX.q2a_in ));
 sky130_fd_sc_hd__a22o_2 _190_ (.A1(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .A2(\CLKDIV_0.CLK_DIV_MUX.m1.Q1b ),
    .B1(\CLKDIV_0.CLK_DIV_MUX.clk1 ),
    .B2(\CLKDIV_0.CLK_DIV_MUX.m1.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_051_));
 sky130_fd_sc_hd__inv_2 _191_ (.A(_051_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_008_));
 sky130_fd_sc_hd__and2b_1 _192_ (.A_N(\CLKDIV_0.CLK_DIV_MUX.m1.Q1b ),
    .B(sel_clkdiv0[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_0.CLK_DIV_MUX.m1.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _193_ (.A(\CLKDIV_0.CLK_DIV_MUX.m1.Q2b ),
    .B(sel_clkdiv0[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_0.CLK_DIV_MUX.m1.q1a_in ));
 sky130_fd_sc_hd__and2b_1 _194_ (.A_N(\CLKDIV_0.CLK_DIV_MUX.m2.Q1b ),
    .B(sel_clkdiv0[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_0.CLK_DIV_MUX.m2.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _195_ (.A(sel_clkdiv0[0]),
    .B(\CLKDIV_0.CLK_DIV_MUX.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_0.CLK_DIV_MUX.m2.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _196_ (.A1(\CLKDIV_0.CLK_DIV_MUX.m2.Q1b ),
    .A2(\CLKDIV_0.CLK_DIV_MUX.clk2 ),
    .B1(\CLKDIV_0.CLK_DIV_MUX.clk3 ),
    .B2(\CLKDIV_0.CLK_DIV_MUX.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_050_));
 sky130_fd_sc_hd__inv_2 _197_ (.A(_050_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_009_));
 sky130_fd_sc_hd__and2b_1 _198_ (.A_N(\CLKDIV_0.CLK_DIV_MUX.m3.Q1b ),
    .B(sel_clkdiv0[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_0.CLK_DIV_MUX.m3.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _199_ (.A(sel_clkdiv0[1]),
    .B(\CLKDIV_0.CLK_DIV_MUX.m3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_0.CLK_DIV_MUX.m3.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _200_ (.A1(\CLKDIV_0.CLK_DIV_MUX.m3.Q1b ),
    .A2(_051_),
    .B1(_050_),
    .B2(\CLKDIV_0.CLK_DIV_MUX.m3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_0.CLK_DIV_MUX.clko ));
 sky130_fd_sc_hd__and2b_1 _201_ (.A_N(\CLKMUX_3.Q1b ),
    .B(sel_mux3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_3.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _202_ (.A(sel_mux3),
    .B(\CLKMUX_3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKMUX_3.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _203_ (.A1(rcosc_500k),
    .A2(\CLKMUX_3.Q1b ),
    .B1(\CLKMUX_3.Q2b ),
    .B2(_057_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_060_));
 sky130_fd_sc_hd__inv_2 _204_ (.A(_060_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_010_));
 sky130_fd_sc_hd__and2b_1 _205_ (.A_N(\CLKMUX_4.Q1b ),
    .B(sel_mux4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_4.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _206_ (.A(sel_mux4),
    .B(\CLKMUX_4.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKMUX_4.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _207_ (.A1(lsxo),
    .A2(\CLKMUX_4.Q2b ),
    .B1(_060_),
    .B2(\CLKMUX_4.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_4.clko ));
 sky130_fd_sc_hd__inv_2 _208_ (.A(\CLKMUX_4.clko ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_061_));
 sky130_fd_sc_hd__and2b_1 _209_ (.A_N(\CLKMUX_5.Q1b ),
    .B(sel_mux5),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKMUX_5.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _210_ (.A(sel_mux5),
    .B(\CLKMUX_5.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKMUX_5.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _211_ (.A1(rcosc_16m),
    .A2(\CLKMUX_5.Q2b ),
    .B1(\CLKMUX_4.clko ),
    .B2(\CLKMUX_5.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.DIV_BYPASS_MUX.clk0 ));
 sky130_fd_sc_hd__inv_2 _212_ (.A(\CLKDIV_1.DIV_BYPASS_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_011_));
 sky130_fd_sc_hd__a22o_2 _213_ (.A1(\CLKDIV_1.DIV_BYPASS_MUX.clk1 ),
    .A2(\CLKDIV_1.DIV_BYPASS_MUX.Q2b ),
    .B1(\CLKDIV_1.DIV_BYPASS_MUX.clk0 ),
    .B2(\CLKDIV_1.DIV_BYPASS_MUX.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.DIV_BYPASS_MUX.clko ));
 sky130_fd_sc_hd__nor2_2 _214_ (.A(\CLKDIV_1.DIV_BYPASS_MUX.Q2b ),
    .B(sel_clkdiv1[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_1.DIV_BYPASS_MUX.q1a_in ));
 sky130_fd_sc_hd__and2b_2 _215_ (.A_N(\CLKDIV_1.DIV_BYPASS_MUX.Q1b ),
    .B(sel_clkdiv1[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.DIV_BYPASS_MUX.q2a_in ));
 sky130_fd_sc_hd__a22o_2 _216_ (.A1(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .A2(\CLKDIV_1.CLK_DIV_MUX.m1.Q1b ),
    .B1(\CLKDIV_1.CLK_DIV_MUX.clk1 ),
    .B2(\CLKDIV_1.CLK_DIV_MUX.m1.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_070_));
 sky130_fd_sc_hd__inv_2 _217_ (.A(_070_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_012_));
 sky130_fd_sc_hd__and2b_1 _218_ (.A_N(\CLKDIV_1.CLK_DIV_MUX.m1.Q1b ),
    .B(sel_clkdiv1[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.CLK_DIV_MUX.m1.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _219_ (.A(\CLKDIV_1.CLK_DIV_MUX.m1.Q2b ),
    .B(sel_clkdiv1[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_1.CLK_DIV_MUX.m1.q1a_in ));
 sky130_fd_sc_hd__and2b_1 _220_ (.A_N(\CLKDIV_1.CLK_DIV_MUX.m2.Q1b ),
    .B(sel_clkdiv1[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.CLK_DIV_MUX.m2.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _221_ (.A(sel_clkdiv1[0]),
    .B(\CLKDIV_1.CLK_DIV_MUX.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_1.CLK_DIV_MUX.m2.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _222_ (.A1(\CLKDIV_1.CLK_DIV_MUX.m2.Q1b ),
    .A2(\CLKDIV_1.CLK_DIV_MUX.clk2 ),
    .B1(\CLKDIV_1.CLK_DIV_MUX.clk3 ),
    .B2(\CLKDIV_1.CLK_DIV_MUX.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_069_));
 sky130_fd_sc_hd__inv_2 _223_ (.A(_069_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_013_));
 sky130_fd_sc_hd__and2b_1 _224_ (.A_N(\CLKDIV_1.CLK_DIV_MUX.m3.Q1b ),
    .B(sel_clkdiv1[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.CLK_DIV_MUX.m3.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _225_ (.A(sel_clkdiv1[1]),
    .B(\CLKDIV_1.CLK_DIV_MUX.m3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_1.CLK_DIV_MUX.m3.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _226_ (.A1(\CLKDIV_1.CLK_DIV_MUX.m3.Q1b ),
    .A2(_070_),
    .B1(_069_),
    .B2(\CLKDIV_1.CLK_DIV_MUX.m3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_1.CLK_DIV_MUX.clko ));
 sky130_fd_sc_hd__a22o_2 _227_ (.A1(\CLKDIV_2.DIV_BYPASS_MUX.clk1 ),
    .A2(\CLKDIV_2.DIV_BYPASS_MUX.Q2b ),
    .B1(\CLKDIV_1.DIV_BYPASS_MUX.clk0 ),
    .B2(\CLKDIV_2.DIV_BYPASS_MUX.Q1b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_2.DIV_BYPASS_MUX.clko ));
 sky130_fd_sc_hd__nor2_2 _228_ (.A(\CLKDIV_2.DIV_BYPASS_MUX.Q2b ),
    .B(sel_clkdiv2[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_2.DIV_BYPASS_MUX.q1a_in ));
 sky130_fd_sc_hd__and2b_2 _229_ (.A_N(\CLKDIV_2.DIV_BYPASS_MUX.Q1b ),
    .B(sel_clkdiv2[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_2.DIV_BYPASS_MUX.q2a_in ));
 sky130_fd_sc_hd__a22o_2 _230_ (.A1(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .A2(\CLKDIV_2.CLK_DIV_MUX.m1.Q1b ),
    .B1(\CLKDIV_2.CLK_DIV_MUX.clk1 ),
    .B2(\CLKDIV_2.CLK_DIV_MUX.m1.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_083_));
 sky130_fd_sc_hd__inv_2 _231_ (.A(_083_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_014_));
 sky130_fd_sc_hd__and2b_1 _232_ (.A_N(\CLKDIV_2.CLK_DIV_MUX.m1.Q1b ),
    .B(sel_clkdiv2[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_2.CLK_DIV_MUX.m1.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _233_ (.A(\CLKDIV_2.CLK_DIV_MUX.m1.Q2b ),
    .B(sel_clkdiv2[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_2.CLK_DIV_MUX.m1.q1a_in ));
 sky130_fd_sc_hd__and2b_1 _234_ (.A_N(\CLKDIV_2.CLK_DIV_MUX.m2.Q1b ),
    .B(sel_clkdiv2[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_2.CLK_DIV_MUX.m2.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _235_ (.A(sel_clkdiv2[0]),
    .B(\CLKDIV_2.CLK_DIV_MUX.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_2.CLK_DIV_MUX.m2.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _236_ (.A1(\CLKDIV_2.CLK_DIV_MUX.m2.Q1b ),
    .A2(\CLKDIV_2.CLK_DIV_MUX.clk2 ),
    .B1(\CLKDIV_2.CLK_DIV_MUX.clk3 ),
    .B2(\CLKDIV_2.CLK_DIV_MUX.m2.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_082_));
 sky130_fd_sc_hd__inv_2 _237_ (.A(_082_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_015_));
 sky130_fd_sc_hd__and2b_1 _238_ (.A_N(\CLKDIV_2.CLK_DIV_MUX.m3.Q1b ),
    .B(sel_clkdiv2[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_2.CLK_DIV_MUX.m3.q2a_in ));
 sky130_fd_sc_hd__nor2_1 _239_ (.A(sel_clkdiv2[1]),
    .B(\CLKDIV_2.CLK_DIV_MUX.m3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\CLKDIV_2.CLK_DIV_MUX.m3.q1a_in ));
 sky130_fd_sc_hd__a22o_2 _240_ (.A1(\CLKDIV_2.CLK_DIV_MUX.m3.Q1b ),
    .A2(_083_),
    .B1(_082_),
    .B2(\CLKDIV_2.CLK_DIV_MUX.m3.Q2b ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\CLKDIV_2.CLK_DIV_MUX.clko ));
 sky130_fd_sc_hd__xor2_2 _241_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .B(\CLKDIV_2.CLK_DIV_MUX.clk1 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_025_));
 sky130_fd_sc_hd__and3_2 _242_ (.A(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .B(\CLKDIV_2.CLK_DIV_MUX.clk1 ),
    .C(\CLKDIV_2.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_089_));
 sky130_fd_sc_hd__a21oi_2 _243_ (.A1(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .A2(\CLKDIV_2.CLK_DIV_MUX.clk1 ),
    .B1(\CLKDIV_2.CLK_DIV_MUX.clk2 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_090_));
 sky130_fd_sc_hd__nor2_2 _244_ (.A(_089_),
    .B(_090_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_026_));
 sky130_fd_sc_hd__dfrtp_2 _245_ (.CLK(\CLKDIV_1.DIV_BYPASS_MUX.clko ),
    .D(_000_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(pclk_div));
 sky130_fd_sc_hd__dfrtp_1 _246_ (.CLK(\CLK_MON_MUX_1.clko ),
    .D(_028_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\clk_mon_div[0] ));
 sky130_fd_sc_hd__dfrtp_4 _247_ (.CLK(\CLK_MON_MUX_1.clko ),
    .D(_029_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(clk_mon));
 sky130_fd_sc_hd__dfrtp_1 _248_ (.CLK(rcosc_500k),
    .D(_095_),
    .RESET_B(\RST_SYNC.rst_n_in ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\RST_SYNC.delay[0] ));
 sky130_fd_sc_hd__dfrtp_1 _249_ (.CLK(rcosc_500k),
    .D(net4),
    .RESET_B(\RST_SYNC.rst_n_in ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\RST_SYNC.delay[1] ));
 sky130_fd_sc_hd__dfrtp_1 _250_ (.CLK(rcosc_500k),
    .D(net5),
    .RESET_B(\RST_SYNC.rst_n_in ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(net30));
 sky130_fd_sc_hd__dfrtp_1 _251_ (.CLK(_030_),
    .D(\CLK_MON_MUX_0.m3.q1a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m3.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _252_ (.CLK(_001_),
    .D(\CLK_MON_MUX_0.m3.Q2a ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m3.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _253_ (.CLK(_002_),
    .D(\CLK_MON_MUX_0.m3.Q1a ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m3.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _254_ (.CLK(_031_),
    .D(\CLK_MON_MUX_0.m3.q2a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m3.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _255_ (.CLK(hsxo),
    .D(\CLK_MON_MUX_0.m2.q1a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m2.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _256_ (.CLK(_032_),
    .D(\CLK_MON_MUX_0.m2.Q2a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m2.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _257_ (.CLK(_033_),
    .D(\CLK_MON_MUX_0.m2.Q1a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m2.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _258_ (.CLK(lsxo),
    .D(\CLK_MON_MUX_0.m2.q2a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m2.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _259_ (.CLK(rcosc_500k),
    .D(\CLK_MON_MUX_0.m1.q1a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m1.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _260_ (.CLK(_034_),
    .D(\CLK_MON_MUX_0.m1.Q2a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m1.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _261_ (.CLK(_035_),
    .D(\CLK_MON_MUX_0.m1.Q1a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m1.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _262_ (.CLK(rcosc_16m),
    .D(\CLK_MON_MUX_0.m1.q2a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_0.m1.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _263_ (.CLK(dll_clk),
    .D(\CLK_MON_MUX_1.q2a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_1.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _264_ (.CLK(_003_),
    .D(\CLK_MON_MUX_1.Q1a ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_1.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _265_ (.CLK(_036_),
    .D(\CLK_MON_MUX_1.Q2a ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_1.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _266_ (.CLK(_037_),
    .D(\CLK_MON_MUX_1.q1a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLK_MON_MUX_1.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _267_ (.CLK(hsxo),
    .D(\CLKMUX_0.q2a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_0.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _268_ (.CLK(_038_),
    .D(\CLKMUX_0.Q1a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_0.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _269_ (.CLK(_039_),
    .D(\CLKMUX_0.Q2a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_0.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _270_ (.CLK(xclk),
    .D(\CLKMUX_0.q1a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_0.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _271_ (.CLK(_040_),
    .D(\CLKMUX_1.q2a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_1.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _272_ (.CLK(_041_),
    .D(\CLKMUX_1.Q1a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_1.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _273_ (.CLK(_004_),
    .D(\CLKMUX_1.Q2a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_1.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _274_ (.CLK(rcosc_16m),
    .D(\CLKMUX_1.q1a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_1.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _275_ (.CLK(_042_),
    .D(\CLKMUX_2.q2a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_2.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _276_ (.CLK(_043_),
    .D(\CLKMUX_2.Q1a ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_2.Q1b ));
 sky130_fd_sc_hd__dfrtp_2 _277_ (.CLK(_005_),
    .D(\CLKMUX_2.Q2a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_2.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _278_ (.CLK(dll_clk),
    .D(\CLKMUX_2.q1a_in ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_2.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _279_ (.CLK(_044_),
    .D(\CLKDIV_0.DIV_BYPASS_MUX.q1a_in ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.DIV_BYPASS_MUX.Q1a ));
 sky130_fd_sc_hd__dfrtp_2 _280_ (.CLK(_045_),
    .D(\CLKDIV_0.DIV_BYPASS_MUX.Q2a ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.DIV_BYPASS_MUX.Q2b ));
 sky130_fd_sc_hd__dfrtp_2 _281_ (.CLK(_006_),
    .D(\CLKDIV_0.DIV_BYPASS_MUX.Q1a ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.DIV_BYPASS_MUX.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _282_ (.CLK(\CLKDIV_0.DIV_BYPASS_MUX.clk1 ),
    .D(\CLKDIV_0.DIV_BYPASS_MUX.q2a_in ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.DIV_BYPASS_MUX.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _283_ (.CLK(\CLKDIV_0.CLK_DIV_MUX.clk1 ),
    .D(\CLKDIV_0.CLK_DIV_MUX.m1.q2a_in ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m1.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _284_ (.CLK(_046_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m1.Q1a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m1.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _285_ (.CLK(_047_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m1.Q2a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m1.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _286_ (.CLK(\CLKDIV_0.CLK_DIV_MUX.clk0 ),
    .D(\CLKDIV_0.CLK_DIV_MUX.m1.q1a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m1.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _287_ (.CLK(\CLKDIV_0.CLK_DIV_MUX.clk3 ),
    .D(\CLKDIV_0.CLK_DIV_MUX.m2.q2a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m2.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _288_ (.CLK(_048_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m2.Q1a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m2.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _289_ (.CLK(_049_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m2.Q2a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m2.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _290_ (.CLK(\CLKDIV_0.CLK_DIV_MUX.clk2 ),
    .D(\CLKDIV_0.CLK_DIV_MUX.m2.q1a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m2.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _291_ (.CLK(_050_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m3.q2a_in ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m3.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _292_ (.CLK(_008_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m3.Q1a ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m3.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _293_ (.CLK(_009_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m3.Q2a ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m3.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _294_ (.CLK(_051_),
    .D(\CLKDIV_0.CLK_DIV_MUX.m3.q1a_in ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.m3.Q1a ));
 sky130_fd_sc_hd__dfrtp_2 _295_ (.CLK(_052_),
    .D(\CLKDIV_0.CLK_DIV_MUX.clko ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.DIV_BYPASS_MUX.clk1 ));
 sky130_fd_sc_hd__dfrtp_2 _296_ (.CLK(_053_),
    .D(_016_),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.clk0 ));
 sky130_fd_sc_hd__dfrtp_2 _297_ (.CLK(_054_),
    .D(_017_),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.clk1 ));
 sky130_fd_sc_hd__dfrtp_2 _298_ (.CLK(_055_),
    .D(_018_),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.clk2 ));
 sky130_fd_sc_hd__dfrtp_2 _299_ (.CLK(_056_),
    .D(_019_),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_0.CLK_DIV_MUX.clk3 ));
 sky130_fd_sc_hd__dfrtp_1 _300_ (.CLK(_057_),
    .D(\CLKMUX_3.q2a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_3.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _301_ (.CLK(_058_),
    .D(\CLKMUX_3.Q1a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_3.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _302_ (.CLK(_007_),
    .D(\CLKMUX_3.Q2a ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_3.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _303_ (.CLK(rcosc_500k),
    .D(\CLKMUX_3.q1a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_3.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _304_ (.CLK(lsxo),
    .D(\CLKMUX_4.q2a_in ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_4.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _305_ (.CLK(_010_),
    .D(\CLKMUX_4.Q1a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_4.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _306_ (.CLK(_059_),
    .D(\CLKMUX_4.Q2a ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_4.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _307_ (.CLK(_060_),
    .D(\CLKMUX_4.q1a_in ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_4.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _308_ (.CLK(rcosc_16m),
    .D(\CLKMUX_5.q2a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_5.Q2a ));
 sky130_fd_sc_hd__dfrtp_4 _309_ (.CLK(_061_),
    .D(\CLKMUX_5.Q1a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_5.Q1b ));
 sky130_fd_sc_hd__dfrtp_4 _310_ (.CLK(_062_),
    .D(\CLKMUX_5.Q2a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_5.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _311_ (.CLK(\CLKMUX_4.clko ),
    .D(\CLKMUX_5.q1a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKMUX_5.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _312_ (.CLK(_063_),
    .D(\CLKDIV_1.DIV_BYPASS_MUX.q1a_in ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.DIV_BYPASS_MUX.Q1a ));
 sky130_fd_sc_hd__dfrtp_2 _313_ (.CLK(_064_),
    .D(\CLKDIV_1.DIV_BYPASS_MUX.Q2a ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.DIV_BYPASS_MUX.Q2b ));
 sky130_fd_sc_hd__dfrtp_2 _314_ (.CLK(_011_),
    .D(\CLKDIV_1.DIV_BYPASS_MUX.Q1a ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.DIV_BYPASS_MUX.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _315_ (.CLK(\CLKDIV_1.DIV_BYPASS_MUX.clk1 ),
    .D(\CLKDIV_1.DIV_BYPASS_MUX.q2a_in ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.DIV_BYPASS_MUX.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _316_ (.CLK(\CLKDIV_1.CLK_DIV_MUX.clk1 ),
    .D(\CLKDIV_1.CLK_DIV_MUX.m1.q2a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m1.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _317_ (.CLK(_065_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m1.Q1a ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m1.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _318_ (.CLK(_066_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m1.Q2a ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m1.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _319_ (.CLK(\CLKDIV_1.CLK_DIV_MUX.clk0 ),
    .D(\CLKDIV_1.CLK_DIV_MUX.m1.q1a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m1.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _320_ (.CLK(\CLKDIV_1.CLK_DIV_MUX.clk3 ),
    .D(\CLKDIV_1.CLK_DIV_MUX.m2.q2a_in ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m2.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _321_ (.CLK(_067_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m2.Q1a ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m2.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _322_ (.CLK(_068_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m2.Q2a ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m2.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _323_ (.CLK(\CLKDIV_1.CLK_DIV_MUX.clk2 ),
    .D(\CLKDIV_1.CLK_DIV_MUX.m2.q1a_in ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m2.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _324_ (.CLK(_069_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m3.q2a_in ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m3.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _325_ (.CLK(_012_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m3.Q1a ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m3.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _326_ (.CLK(_013_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m3.Q2a ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m3.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _327_ (.CLK(_070_),
    .D(\CLKDIV_1.CLK_DIV_MUX.m3.q1a_in ),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.m3.Q1a ));
 sky130_fd_sc_hd__dfrtp_2 _328_ (.CLK(_071_),
    .D(\CLKDIV_1.CLK_DIV_MUX.clko ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.DIV_BYPASS_MUX.clk1 ));
 sky130_fd_sc_hd__dfrtp_2 _329_ (.CLK(_072_),
    .D(_020_),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.clk0 ));
 sky130_fd_sc_hd__dfrtp_2 _330_ (.CLK(_073_),
    .D(_021_),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.clk1 ));
 sky130_fd_sc_hd__dfrtp_2 _331_ (.CLK(_074_),
    .D(_022_),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.clk2 ));
 sky130_fd_sc_hd__dfrtp_2 _332_ (.CLK(_075_),
    .D(_023_),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_1.CLK_DIV_MUX.clk3 ));
 sky130_fd_sc_hd__dfrtp_1 _333_ (.CLK(_076_),
    .D(\CLKDIV_2.DIV_BYPASS_MUX.q1a_in ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.DIV_BYPASS_MUX.Q1a ));
 sky130_fd_sc_hd__dfrtp_2 _334_ (.CLK(_077_),
    .D(\CLKDIV_2.DIV_BYPASS_MUX.Q2a ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.DIV_BYPASS_MUX.Q2b ));
 sky130_fd_sc_hd__dfrtp_2 _335_ (.CLK(_011_),
    .D(\CLKDIV_2.DIV_BYPASS_MUX.Q1a ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.DIV_BYPASS_MUX.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _336_ (.CLK(\CLKDIV_2.DIV_BYPASS_MUX.clk1 ),
    .D(\CLKDIV_2.DIV_BYPASS_MUX.q2a_in ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.DIV_BYPASS_MUX.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _337_ (.CLK(\CLKDIV_2.CLK_DIV_MUX.clk1 ),
    .D(\CLKDIV_2.CLK_DIV_MUX.m1.q2a_in ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m1.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _338_ (.CLK(_078_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m1.Q1a ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m1.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _339_ (.CLK(_079_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m1.Q2a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m1.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _340_ (.CLK(\CLKDIV_2.CLK_DIV_MUX.clk0 ),
    .D(\CLKDIV_2.CLK_DIV_MUX.m1.q1a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m1.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _341_ (.CLK(\CLKDIV_2.CLK_DIV_MUX.clk3 ),
    .D(\CLKDIV_2.CLK_DIV_MUX.m2.q2a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m2.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _342_ (.CLK(_080_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m2.Q1a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m2.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _343_ (.CLK(_081_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m2.Q2a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m2.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _344_ (.CLK(\CLKDIV_2.CLK_DIV_MUX.clk2 ),
    .D(\CLKDIV_2.CLK_DIV_MUX.m2.q1a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m2.Q1a ));
 sky130_fd_sc_hd__dfrtp_1 _345_ (.CLK(_082_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m3.q2a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m3.Q2a ));
 sky130_fd_sc_hd__dfrtp_1 _346_ (.CLK(_014_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m3.Q1a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m3.Q1b ));
 sky130_fd_sc_hd__dfrtp_1 _347_ (.CLK(_015_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m3.Q2a ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m3.Q2b ));
 sky130_fd_sc_hd__dfrtp_1 _348_ (.CLK(_083_),
    .D(\CLKDIV_2.CLK_DIV_MUX.m3.q1a_in ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.m3.Q1a ));
 sky130_fd_sc_hd__dfrtp_2 _349_ (.CLK(_084_),
    .D(\CLKDIV_2.CLK_DIV_MUX.clko ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.DIV_BYPASS_MUX.clk1 ));
 sky130_fd_sc_hd__dfrtp_2 _350_ (.CLK(_085_),
    .D(_024_),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.clk0 ));
 sky130_fd_sc_hd__dfrtp_2 _351_ (.CLK(_086_),
    .D(_025_),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.clk1 ));
 sky130_fd_sc_hd__dfrtp_2 _352_ (.CLK(_087_),
    .D(_026_),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.clk2 ));
 sky130_fd_sc_hd__dfrtp_2 _353_ (.CLK(_088_),
    .D(_027_),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\CLKDIV_2.CLK_DIV_MUX.clk3 ));
 sky130_fd_sc_hd__conb_1 _354_ (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(_095_));
 sky130_fd_sc_hd__buf_2 _355_ (.A(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\RST_SYNC.delay[2] ));
 sky130_fd_sc_hd__buf_12 _356_ (.A(hsxo_en),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(hsxo_en_tf));
 sky130_fd_sc_hd__buf_12 _357_ (.A(hsxo_standby),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(hsxo_standby_tf));
 sky130_fd_sc_hd__buf_12 _358_ (.A(lsxo_en),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(lsxo_en_tf));
 sky130_fd_sc_hd__buf_12 _359_ (.A(lsxo_standby),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(lsxo_standby_tf));
 sky130_fd_sc_hd__buf_12 _360_ (.A(rcosc_16m_en),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(rcosc_16m_en_tf));
 sky130_fd_sc_hd__buf_12 _361_ (.A(rcosc_500k_en),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(rcosc_500k_en_tf));
 sky130_fd_sc_hd__clkbuf_8 \clk_div1_delay.dly_clkbuf  (.A(\clk_div1_delay.dly[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clk));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[1].dlygen  (.A(\CLKDIV_1.DIV_BYPASS_MUX.clko ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[1] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[2].dlygen  (.A(\clk_div1_delay.dly[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[2] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[3].dlygen  (.A(\clk_div1_delay.dly[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[3] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[4].dlygen  (.A(\clk_div1_delay.dly[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[4] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[5].dlygen  (.A(\clk_div1_delay.dly[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[5] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[6].dlygen  (.A(\clk_div1_delay.dly[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[6] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[7].dlygen  (.A(\clk_div1_delay.dly[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[7] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \clk_div1_delay.gen_dlygen[8].dlygen  (.A(\clk_div1_delay.dly[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clk_div1_delay.dly[8] ));
 sky130_fd_sc_hd__clkbuf_8 \pclk_div_skewed_delay.dly_clkbuf  (.A(\pclk_div_skewed_delay.dly[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(pclk));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \pclk_div_skewed_delay.gen_dlygen[1].dlygen  (.A(pclk_div),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\pclk_div_skewed_delay.dly[1] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \pclk_div_skewed_delay.gen_dlygen[2].dlygen  (.A(\pclk_div_skewed_delay.dly[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\pclk_div_skewed_delay.dly[2] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \pclk_div_skewed_delay.gen_dlygen[3].dlygen  (.A(\pclk_div_skewed_delay.dly[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\pclk_div_skewed_delay.dly[3] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \pclk_div_skewed_delay.gen_dlygen[4].dlygen  (.A(\pclk_div_skewed_delay.dly[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\pclk_div_skewed_delay.dly[4] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \pclk_div_skewed_delay.gen_dlygen[5].dlygen  (.A(\pclk_div_skewed_delay.dly[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\pclk_div_skewed_delay.dly[5] ));
 sky130_fd_sc_hd__clkbuf_8 \usb_clk_delayed.dly_clkbuf  (.A(\usb_clk_delayed.dly[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(usb_clk));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[1].dlygen  (.A(\CLKDIV_1.DIV_BYPASS_MUX.clk0 ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[1] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[2].dlygen  (.A(\usb_clk_delayed.dly[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[2] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[3].dlygen  (.A(\usb_clk_delayed.dly[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[3] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[4].dlygen  (.A(\usb_clk_delayed.dly[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[4] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[5].dlygen  (.A(\usb_clk_delayed.dly[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[5] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[6].dlygen  (.A(\usb_clk_delayed.dly[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[6] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[7].dlygen  (.A(\usb_clk_delayed.dly[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[7] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[8].dlygen  (.A(\usb_clk_delayed.dly[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[8] ));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \usb_clk_delayed.gen_dlygen[9].dlygen  (.A(\usb_clk_delayed.dly[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\usb_clk_delayed.dly[9] ));
 sky130_fd_sc_hd__clkbuf_8 \user_clk_delay.dly_clkbuf  (.A(\user_clk_delay.dly[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(user_clk));
 sky130_fd_sc_hd__clkdlybuf4s18_2 \user_clk_delay.gen_dlygen[1].dlygen  (.A(\CLKDIV_2.DIV_BYPASS_MUX.clko ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\user_clk_delay.dly[1] ));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Right_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Right_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_30 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_31 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_34 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_37 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_42 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Left_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Left_45 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_46 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_47 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_48 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_49 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_50 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_51 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_52 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_53 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_54 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_55 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_56 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_57 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_58 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_59 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_60 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_61 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_62 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_63 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_64 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_65 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_66 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_67 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_68 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_69 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_70 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_71 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_72 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_73 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_74 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_75 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_76 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_77 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_78 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_79 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_80 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_81 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_82 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_83 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_84 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_85 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_86 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_87 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_88 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_89 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_90 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_91 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_92 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_93 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_94 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_95 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_96 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_97 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_98 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_99 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_100 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_101 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_102 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_103 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_104 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_105 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_106 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_107 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_108 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_109 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_110 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_111 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_112 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_113 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_114 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_115 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_116 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_117 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_118 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_119 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_120 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_121 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_122 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_123 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_124 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_125 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_126 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_127 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_128 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_129 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_130 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_131 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_132 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_133 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_134 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_135 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_136 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_137 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_138 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_139 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_140 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_141 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_142 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_143 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_144 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_145 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__buf_6 fanout25 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_4 fanout26 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net26));
 sky130_fd_sc_hd__buf_6 fanout27 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net27));
 sky130_fd_sc_hd__buf_6 fanout28 (.A(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net28));
 sky130_fd_sc_hd__buf_6 fanout29 (.A(net2),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net29));
 sky130_fd_sc_hd__buf_12 fanout30 (.A(net2),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(rst_n));
 sky130_fd_sc_hd__buf_6 fanout31 (.A(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net31));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net1));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net2));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net3));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\RST_SYNC.delay[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net4));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(\RST_SYNC.delay[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net5));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(\clk_mon_div[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net6));
 sky130_ef_sc_hd__decap_12 FILLER_0_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_209 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_221 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_1_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_1_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_1_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_1_44 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_81 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_1_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_1_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_1_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_1_149 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_1_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_193 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_1_205 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_1_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_1_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_1_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_2_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_2_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_2_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_65 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_2_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_2_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_2_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_2_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_2_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_2_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_165 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_2_177 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_2_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_2_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_2_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_2_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_3_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_3_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_3_28 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_40 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_3_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_3_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_3_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_3_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_3_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_3_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_3_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_149 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_3_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_3_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_3_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_193 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_3_205 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_3_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_3_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_3_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_4_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_4_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_4_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_4_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_4_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_4_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_4_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_4_123 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_4_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_4_132 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_4_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_4_161 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_4_173 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_4_185 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_4_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_4_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_4_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_4_209 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_4_221 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_5_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_5_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_5_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_5_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_5_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_5_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_5_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_5_200 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_5_210 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_5_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_5_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_6_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_6_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_6_130 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_6_135 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_144 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_6_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_6_171 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_6_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_6_213 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_6_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_7_34 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_7_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_7_90 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_7_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_7_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_7_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_7_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_7_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_8_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_8_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_8_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_8_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_8_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_8_115 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_8_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_8_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_8_184 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_8_217 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_8_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_9_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_9_91 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_9_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_9_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_9_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_10_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_10_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_10_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_10_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_10_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_10_224 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_10_232 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_11_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_11_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_11_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_11_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_11_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_11_127 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_11_162 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_11_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_11_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_11_213 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_11_221 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_11_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_12_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_12_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_12_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_12_79 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_12_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_12_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_12_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_12_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_12_155 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_12_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_12_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_12_219 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_12_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_13_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_13_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_13_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_13_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_13_125 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_13_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_13_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_13_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_14_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_14_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_14_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_14_66 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_14_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_14_105 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_14_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_14_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_14_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_14_207 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_14_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_14_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_15_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_15_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_15_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_15_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_15_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_15_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_15_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_15_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_15_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_15_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_15_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_15_219 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_15_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_16_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_16_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_16_37 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_16_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_16_94 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_16_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_16_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_16_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_16_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_16_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_16_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_17_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_17_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_17_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_17_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_17_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_17_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_17_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_17_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_17_200 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_17_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_17_219 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_17_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_18_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_18_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_18_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_18_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_18_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_18_117 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_18_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_18_162 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_18_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_18_221 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_19_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_19_17 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_19_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_19_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_19_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_19_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_19_99 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_19_103 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_19_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_19_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_19_174 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_19_186 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_19_198 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_19_210 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_19_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_19_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_20_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_20_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_20_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_20_75 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_20_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_20_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_20_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_20_144 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_20_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_20_162 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_20_174 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_20_182 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_20_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_20_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_20_205 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_20_217 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_20_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_21_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_21_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_21_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_21_158 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_21_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_21_201 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_21_205 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_21_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_21_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_21_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_22_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_22_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_22_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_22_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_22_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_22_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_22_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_22_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_22_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_22_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_22_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_22_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_22_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_22_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_22_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_22_208 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_22_220 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_22_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
endmodule
