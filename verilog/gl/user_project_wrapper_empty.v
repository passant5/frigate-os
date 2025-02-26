module user_project_wrapper (HCLK,
    HREADY,
    HREADYOUT,
    HRESETn,
    HSEL,
    HWRITE,
    adc0,
    adc1,
    comp_n,
    comp_p,
    dac0,
    dac1,
    gpio3_0_analog,
    gpio3_1_analog,
    gpio3_2_analog,
    gpio3_3_analog,
    gpio3_4_analog,
    gpio3_5_analog,
    gpio3_6_analog,
    gpio3_7_analog,
    gpio4_0_analog,
    gpio4_1_analog,
    gpio4_2_analog,
    gpio4_3_analog,
    gpio4_4_analog,
    gpio4_5_analog,
    gpio4_6_analog,
    gpio4_7_analog,
    ibias100,
    ibias50,
    left_vref,
    right_vref,
    tempsense,
    ulpcomp_n,
    ulpcomp_p,
    vbgsc,
    vbgtc,
    vdda1,
    vdda2,
    vinref,
    voutref,
    vssa1,
    vssa2,
    vssd2,
    vccd2,
    vssd1,
    vccd1,
    HADDR,
    HRDATA,
    HSIZE,
    HTRANS,
    HWDATA,
    gpio0_in,
    gpio0_oeb,
    gpio0_out,
    gpio1_in,
    gpio1_oeb,
    gpio1_out,
    gpio2_in,
    gpio2_oeb,
    gpio2_out,
    gpio3_in,
    gpio3_oeb,
    gpio3_out,
    gpio4_in,
    gpio4_oeb,
    gpio4_out,
    gpio5_in,
    gpio5_oeb,
    gpio5_out,
    gpio6_in,
    gpio6_oeb,
    gpio6_out,
    gpio7_in,
    gpio7_oeb,
    gpio7_out,
    sio_in,
    sio_oeb,
    sio_out,
    user_irq);
 input HCLK;
 input HREADY;
 output HREADYOUT;
 input HRESETn;
 input HSEL;
 input HWRITE;
 inout adc0;
 inout adc1;
 inout comp_n;
 inout comp_p;
 inout dac0;
 inout dac1;
 inout gpio3_0_analog;
 inout gpio3_1_analog;
 inout gpio3_2_analog;
 inout gpio3_3_analog;
 inout gpio3_4_analog;
 inout gpio3_5_analog;
 inout gpio3_6_analog;
 inout gpio3_7_analog;
 inout gpio4_0_analog;
 inout gpio4_1_analog;
 inout gpio4_2_analog;
 inout gpio4_3_analog;
 inout gpio4_4_analog;
 inout gpio4_5_analog;
 inout gpio4_6_analog;
 inout gpio4_7_analog;
 inout ibias100;
 inout ibias50;
 inout left_vref;
 inout right_vref;
 inout tempsense;
 inout ulpcomp_n;
 inout ulpcomp_p;
 inout vbgsc;
 inout vbgtc;
 inout vdda1;
 inout vdda2;
 inout vinref;
 inout voutref;
 inout vssa1;
 inout vssa2;
 inout vssd2;
 inout vccd2;
 inout vssd1;
 inout vccd1;
 input [31:0] HADDR;
 output [31:0] HRDATA;
 input [2:0] HSIZE;
 input [1:0] HTRANS;
 input [31:0] HWDATA;
 input [7:0] gpio0_in;
 output [7:0] gpio0_oeb;
 output [7:0] gpio0_out;
 input [7:0] gpio1_in;
 output [7:0] gpio1_oeb;
 output [7:0] gpio1_out;
 input [7:0] gpio2_in;
 output [7:0] gpio2_oeb;
 output [7:0] gpio2_out;
 input [7:0] gpio3_in;
 output [7:0] gpio3_oeb;
 output [7:0] gpio3_out;
 input [7:0] gpio4_in;
 output [7:0] gpio4_oeb;
 output [7:0] gpio4_out;
 input [7:0] gpio5_in;
 output [7:0] gpio5_oeb;
 output [7:0] gpio5_out;
 input [7:0] gpio6_in;
 output [7:0] gpio6_oeb;
 output [7:0] gpio6_out;
 input [7:0] gpio7_in;
 output [7:0] gpio7_oeb;
 output [7:0] gpio7_out;
 input [1:0] sio_in;
 output [1:0] sio_oeb;
 output [1:0] sio_out;
 output [15:0] user_irq;

endmodule
