#ifndef DAC1001_H
#define DAC1001_H

volatile unsigned int DAC_BASES[3] = { 0x400E0000, 0x40100000, 0xdeadbeaf }; 

enum dac_select {DAC0 = 0, DAC1 = 1};

#define	DAC_DATA_REG_ADDR		(DAC_BASE + 0x0)
#define	DAC_CTRL_REG_ADDR		(DAC_BASE + 0x4)
#define	DAC_FIFOT_REG_ADDR		(DAC_BASE + 0x8)
#define	DAC_SAMPCTRL_REG_ADDR	(DAC_BASE + 0xc)
#define	DAC_ICR_REG_ADDR		(DAC_BASE + 0xf00)
#define	DAC_RIS_REG_ADDR		(DAC_BASE + 0xf04)
#define	DAC_IM_REG_ADDR		    (DAC_BASE + 0xf08)
#define	DAC_MIS_REG_ADDR		(DAC_BASE + 0xf0c)

#define DAC_DATA_REG_DATA		            0
#define DAC_DATA_REG_DATA_LEN	            10
#define DAC_CTRL_REG_EN		                0
#define DAC_CTRL_REG_EN_LEN	                1
#define DAC_FIFOT_REG_FIFO_THRESHOLD		0
#define DAC_FIFOT_REG_FIFO_THRESHOLD_LEN	5
#define DAC_SAMPCTRL_REG_CLK_EN		        0
#define DAC_SAMPCTRL_REG_CLK_EN_LEN	        1
#define DAC_SAMPCTRL_REG_CLKDIV		        8
#define DAC_SAMPCTRL_REG_CLKDIV_LEN	        20
#define INT_FIFO_EMPTY_FLAG	                0x1
#define INT_FIFO_LOW_FLAG	                0x2




void DAC_setDataReg (enum dac_select dac, int value) {

    unsigned int DAC_BASE = DAC_BASES[dac];

    (*(volatile int*)DAC_DATA_REG_ADDR) = value;

}

void DAC_setCtrlReg (enum dac_select dac, int value) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    (*(volatile int*)DAC_CTRL_REG_ADDR) = value;

}

int DAC_getCtrlReg (enum dac_select dac) {

    unsigned int DAC_BASE = DAC_BASES[dac];

   return (*(volatile int*)DAC_CTRL_REG_ADDR);

}

void DAC_setFIFOlevel (enum dac_select dac, int value) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    (*(volatile int*)DAC_FIFOT_REG_ADDR) = value;

}

int DAC_getFIFOlevel (enum dac_select dac) {

    unsigned int DAC_BASE = DAC_BASES[dac];
   
   return (*(volatile int*)DAC_FIFOT_REG_ADDR);

}

void DAC_setSampleCtrlReg (enum dac_select dac, int value) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    (*(volatile int*)DAC_SAMPCTRL_REG_ADDR) = value;

}

int DAC_getSampleCtrlReg (enum dac_select dac) {

    unsigned int DAC_BASE = DAC_BASES[dac];
   
   return (*(volatile int*)DAC_SAMPCTRL_REG_ADDR);

}

int DAC_getRawStatusReg (enum dac_select dac) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    return (*(volatile int*)DAC_RIS_REG_ADDR);
}

int DAC_getMaskStatusReg (enum dac_select dac) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    return (*(volatile int*)DAC_MIS_REG_ADDR);
}

void DAC_setInterruptMaskReg (enum dac_select dac, int value) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    (*(volatile int*)DAC_IM_REG_ADDR) = value;
}

int DAC_getInterruptMaskReg (enum dac_select dac) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    return (*(volatile int*)DAC_IM_REG_ADDR);
}

void DAC_setInterruptClearReg (enum dac_select dac, int value) {

    unsigned int DAC_BASE = DAC_BASES[dac];
    
    (*(volatile int*)DAC_ICR_REG_ADDR) = value;
}



#endif