
#ifndef BITBANG_C_HEADER_FILE
#define BITBANG_C_HEADER_FILE
#include <housekeeping.h>
/*
reg_mprj_xfer contain 
bit 0 : busy 
bit 1 : bitbang enable
bit 2 : bitbang reset active low
bit 3 : bitbang load registers
bit 4 : bitbang clock
bit 5 : serial data 1
bit 6 : serial data 2
*/

void bb_clock11(){
    reg_mprj_xfer = 0x66;
    reg_mprj_xfer = 0x76;
}

void bb_clock00(){
    reg_mprj_xfer = 0x06;
    reg_mprj_xfer = 0x16;
}

void bb_clock10(){
    reg_mprj_xfer = 0x46; 
    reg_mprj_xfer = 0x56;
}

void bb_clock01(){
    reg_mprj_xfer = 0x26; 
    reg_mprj_xfer = 0x36;
}

void bb_load(){
    reg_mprj_xfer = 0x06;
    reg_mprj_xfer = 0x0e; 
    reg_mprj_xfer = 0x06;	
}

void bb_reset(){
    reg_mprj_xfer = 0x04;
    reg_mprj_xfer = 0x06;			

}

// configure the GPIO  in the left chain with configL and the GPIO  in 
// the right chain with configR
// left | right
// 18	& 19
// 17	& 20
// 16	& 21
// 15	& 22
// 14	& 23
// 13	& 24
// 12	& 25
// 11	& 26
// 10	& 27
// 9	& 28
// 8	& 29
// 7	& 30
// 6	& 31
// 5	& 32
// 4	& 33
// 3	& 34
// 2	& 35
// 1	& 36
// 0	& 37
void bb_configure2Gpios(unsigned int configL,unsigned int configR){
    int num_bits,mask;
    int left,right;
    num_bits = CTRL_BITS_SIZE;
    mask = 0x1 << num_bits-1;
    for (int i = num_bits-1; i >= 0; i--){
        left = (configL & mask ) >> i;
        right= (configR & mask ) >> i;
        mask = mask >> 1;
        if (left){
            if (right)
                bb_clock11();
            else
                bb_clock10();

        }else{
            if(right) 
                bb_clock01();
            else
                bb_clock00();
        }
    }   
}

void bb_configureAllGpios(unsigned int config){
    bb_reset();
    bb_configure2Gpios(config,config);// 32	& 33
    bb_configure2Gpios(config,config);// 31	& 34
    bb_configure2Gpios(config,config);// 30	& 35
    bb_configure2Gpios(config,config);// 29	& 36
    bb_configure2Gpios(config,config);// 28	& 37
    bb_configure2Gpios(config,config);// 27	& 38
    bb_configure2Gpios(config,config);// 26	& 39
    bb_configure2Gpios(config,config);// 25	& 40
    bb_configure2Gpios(config,config);// 24	& 41
    bb_configure2Gpios(config,config);// 23	& 42
    bb_configure2Gpios(config,config);// 22	& 43
    bb_configure2Gpios(config,config);// 21	& 44
    bb_configure2Gpios(config,config);// 20	& 45
    bb_configure2Gpios(config,config);// 19	& 46
    bb_configure2Gpios(config,config);// 18	& 47
    bb_configure2Gpios(config,config);// 17	& 48
    bb_configure2Gpios(config,config);// 16	& 49
    bb_configure2Gpios(config,config);// 15	& 50
    bb_configure2Gpios(config,config);// 14	& 51
    bb_configure2Gpios(config,config);// 13	& 52
    bb_configure2Gpios(config,config);// 12	& 53
    bb_configure2Gpios(config,config);// 11	& 54
    bb_configure2Gpios(config,config);// 10	& 55
    bb_configure2Gpios(config,config);// 9	& 56
    bb_configure2Gpios(config,config);// 8	& 57
    bb_configure2Gpios(config,config);// 7	& 58
    bb_configure2Gpios(config,config);// 6	& 59
    bb_configure2Gpios(config,config);// 5	& 60
    bb_configure2Gpios(config,config);// 4	& 51
    bb_configure2Gpios(config,config);// 3	& 62
    bb_configure2Gpios(config,config);// 2	& 63
    bb_configure2Gpios(config,config);// 1	& 64
    bb_configure2Gpios(config,config);// 0	& 65
    bb_load();
}

#endif // BITBANG_C_HEADER_FILE