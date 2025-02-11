module sram_2048x32 

(DO, ScanOutCC, AD, BEN, CLKin, DI, EN, R_WB, ScanInCC, ScanInDL, ScanInDR, SM, TM, WLBI, WLOFF, vgnd, vnb, vpb, vpwra, vpwrac, vpwrm, vpwrp, vpwrpc);

    output wire [31:0] DO;
    output wire ScanOutCC;
    input wire [31:0] DI;
    input wire [31:0] BEN;
    input wire [10:0] AD;
    input wire EN;
    input wire R_WB;
    input wire CLKin;
    input wire WLBI;
    input wire WLOFF;
    input wire TM;
    input wire SM;
    input wire ScanInCC;
    input wire ScanInDL;
    input wire ScanInDR;
    input wire vpwrac;
    input wire vpwrpc;
    inout wire vgnd;
    inout wire vpwrm;

    `ifdef EF_SRAM_PA_SIM
    inout wire vpwra;
    `else
    input wire vpwra;
    `endif


    `ifdef EF_SRAM_PA_SIM
    inout wire vpwrp;
    `else
    input wire vpwrp;
    `endif

    input wire vnb;
    input wire vpb;


    ef_sram #(.RAM_BLOCKS(2)) ef_sram_two_blocks (
        .vgnd(vgnd),
        .vnb(vnb),
        .vpb(vpb),
        .vpwra(vpwra),
        .vpwrm(vpwrm),
        .vpwrp(vpwrp),
        .vpwrac(vpwrac),
        .vpwrpc(vpwrpc),
        // access ports
        .DO(DO),
        .DI(DI),
        .BEN(BEN),
        .AD(AD),
        .EN(EN),
        .R_WB(R_WB),
        .CLKin(CLKin),
        // scan ports
        .TM(TM),
        .SM(SM),
        .ScanInCC(ScanInCC),
        .ScanInDL(ScanInDL),
        .ScanInDR(ScanInDR),
        .ScanOutCC(ScanOutCC),
        .WLBI(WLBI),
        .WLOFF(WLOFF)
    );

endmodule