#ifndef ADC1008_H
#define ADC1008_H

#define ADC0_BASE				0x400A0000
#define ADC1_BASE				0x400B0000

#define	ADC0_TCTRL_REG_ADDR		(ADC0_BASE+0x0)
#define	ADC0_CHSEL_REG_ADDR		(ADC0_BASE+0x4)
#define	ADC0_CTRL_REG_ADDR		(ADC0_BASE+0x8)
#define	ADC0_SOC_REG_ADDR		(ADC0_BASE+0xc)
#define	ADC0_SEQCTRL0_REG_ADDR	(ADC0_BASE+0x10)
#define	ADC0_SEQCTRL1_REG_ADDR	(ADC0_BASE+0x14)
#define	ADC0_DATA_REG_ADDR		(ADC0_BASE+0x18)
#define	ADC0_FIFOLEVEL_REG_ADDR	(ADC0_BASE+0x1c)
#define	ADC0_ICR_REG_ADDR		(ADC0_BASE+0xf00)
#define	ADC0_RIS_REG_ADDR		(ADC0_BASE+0xf04)
#define	ADC0_IM_REG_ADDR		(ADC0_BASE+0xf08)
#define	ADC0_MIS_REG_ADDR		(ADC0_BASE+0xf0c)

#define	ADC1_TCTRL_REG_ADDR		(ADC1_BASE+0x0)
#define	ADC1_CHSEL_REG_ADDR		(ADC1_BASE+0x4)
#define	ADC1_CTRL_REG_ADDR		(ADC1_BASE+0x8)
#define	ADC1_SOC_REG_ADDR		(ADC1_BASE+0xc)
#define	ADC1_SEQCTRL0_REG_ADDR	(ADC1_BASE+0x10)
#define	ADC1_SEQCTRL1_REG_ADDR	(ADC1_BASE+0x14)
#define	ADC1_DATA_REG_ADDR		(ADC1_BASE+0x18)
#define	ADC1_FIFOLEVEL_REG_ADDR	(ADC1_BASE+0x1c)
#define	ADC1_ICR_REG_ADDR		(ADC1_BASE+0xf00)
#define	ADC1_RIS_REG_ADDR		(ADC1_BASE+0xf04)
#define	ADC1_IM_REG_ADDR		(ADC1_BASE+0xf08)
#define	ADC1_MIS_REG_ADDR		(ADC1_BASE+0xf0c)

#define ADC0_TCTRL_REG_CLKDIV		    0
#define ADC0_TCTRL_REG_CLKDIV_LEN	    8
#define ADC0_TCTRL_REG_SAMPLE_DIV		8
#define ADC0_TCTRL_REG_SAMPLE_DIV_LEN	8
#define ADC0_TCTRL_REG_SWIDTH		    16
#define ADC0_TCTRL_REG_SWIDTH_LEN	    4
#define ADC0_CHSEL_REG_CHANNEL		    0
#define ADC0_CHSEL_REG_CHANNEL_LEN	    3
#define ADC0_CTRL_REG_EN		        0
#define ADC0_CTRL_REG_EN_LEN	        1
#define ADC0_CTRL_REG_SEQEN		        1
#define ADC0_CTRL_REG_SEQEN_LEN	        1
#define ADC0_SOC_REG_SOC		        0
#define ADC0_SOC_REG_SOC_LEN	        1
#define ADC0_SEQCTRL0_REG_SEQ0		    0
#define ADC0_SEQCTRL0_REG_SEQ0_LEN	    5
#define ADC0_SEQCTRL0_REG_SEQ1		    8
#define ADC0_SEQCTRL0_REG_SEQ1_LEN	    5
#define ADC0_SEQCTRL0_REG_SEQ2		    16
#define ADC0_SEQCTRL0_REG_SEQ2_LEN	    5
#define ADC0_SEQCTRL0_REG_SEQ3		    24
#define ADC0_SEQCTRL0_REG_SEQ3_LEN	    5
#define ADC0_SEQCTRL1_REG_SEQ4		    0
#define ADC0_SEQCTRL1_REG_SEQ4_LEN	    5
#define ADC0_SEQCTRL1_REG_SEQ5		    8
#define ADC0_SEQCTRL1_REG_SEQ5_LEN	    5
#define ADC0_SEQCTRL1_REG_SEQ6		    16
#define ADC0_SEQCTRL1_REG_SEQ6_LEN	    5
#define ADC0_SEQCTRL1_REG_SEQ7		    24
#define ADC0_SEQCTRL1_REG_SEQ7_LEN	    5
#define ADC0_DATA_REG_DATA		        0
#define ADC0_DATA_REG_DATA_LEN	        10
#define ADC0_FIFOLEVEL_REG_VALUE		0
#define ADC0_FIFOLEVEL_REG_VALUE_LEN	5
#define INT_FIFO_FULL_FLAG	            0x1
#define INT_FIFO_LEVEL_FLAG	            0x2
#define INT_EOC_FLAG	                0x4




void ADC_setClockDivider(char value){

    unsigned int mask = ((1 << ADC0_TCTRL_REG_CLKDIV_LEN) - 1) << ADC0_TCTRL_REG_CLKDIV;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_TCTRL_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_TCTRL_REG_ADDR) |= (value << ADC0_TCTRL_REG_CLKDIV);

}

void ADC_setSampleDivider(char value){

    unsigned int mask = ((1 << ADC0_TCTRL_REG_SAMPLE_DIV_LEN) - 1) << ADC0_TCTRL_REG_SAMPLE_DIV;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_TCTRL_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_TCTRL_REG_ADDR) |= (value << ADC0_TCTRL_REG_SAMPLE_DIV);


}

void ADC_setTimerCtrlReg(int value){

     (*(volatile int*)ADC0_TCTRL_REG_ADDR) = value;

}

int ADC_getTimerCtrlReg(){

     return (*(volatile int*)ADC0_TCTRL_REG_ADDR);

}

void ADC_setChannelNumber (int value){

    (*(volatile int*)ADC0_CHSEL_REG_ADDR) = value;

}

int ADC_getChannelNumber (){

    return (*(volatile int*)ADC0_CHSEL_REG_ADDR);

}

void ADC_enable (int enable){

     if(enable){
        (*(volatile int*)ADC0_CTRL_REG_ADDR) |= 0x1; 
    }
    else {

        (*(volatile int*)ADC0_CTRL_REG_ADDR) &= 0xFFFFFFFE; 
    }

}

void ADC1_enable (int enable){

     if(enable){
        (*(volatile int*)ADC1_CTRL_REG_ADDR) |= 0x1; 
    }
    else {

        (*(volatile int*)ADC1_CTRL_REG_ADDR) &= 0xFFFFFFFE; 
    }

}

void ADC_sequencerEnable (int enable){

     if(enable){
        (*(volatile int*)ADC0_CTRL_REG_ADDR) |= 0x2; 
    }
    else {

        (*(volatile int*)ADC0_CTRL_REG_ADDR) &= 0xFFFFFFFD; 
    }

}

void ADC_setCtrlReg(int value){

    (*(volatile int*)ADC0_CTRL_REG_ADDR) = value;
}

int ADC_getCtrlReg () {

    return (*(volatile int*)ADC0_CTRL_REG_ADDR);

}

void ADC_setStartConversion (int start){

    if(start){

        (*(volatile int*)ADC0_SOC_REG_ADDR) = 1;
    }
    else{

        (*(volatile int*)ADC0_SOC_REG_ADDR) = 0;
    }
}

void ADC1_setStartConversion (int start){

    if(start){

        (*(volatile int*)ADC1_SOC_REG_ADDR) = 1;
    }
    else{

        (*(volatile int*)ADC1_SOC_REG_ADDR) = 0;
    }
}

int ADC_getStartConversion (){

    return (*(volatile int*)ADC0_SOC_REG_ADDR);

}

void ADC_setStep0 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL0_REG_SEQ0_LEN) - 1) << ADC0_SEQCTRL0_REG_SEQ0;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) |= (value << ADC0_SEQCTRL0_REG_SEQ0);

}
void ADC_setStep1 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL0_REG_SEQ1_LEN) - 1) << ADC0_SEQCTRL0_REG_SEQ1;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) |= (value << ADC0_SEQCTRL0_REG_SEQ1);

}

void ADC_setStep2 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL0_REG_SEQ2_LEN) - 1) << ADC0_SEQCTRL0_REG_SEQ2;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) |= (value << ADC0_SEQCTRL0_REG_SEQ2);

}

void ADC_setStep3 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL0_REG_SEQ3_LEN) - 1) << ADC0_SEQCTRL0_REG_SEQ3;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) |= (value << ADC0_SEQCTRL0_REG_SEQ3);

}

void ADC_setSeqCtrlReg0 (int value){

    (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR) = value;
}

int ADC_getSeqCtrlReg0 (){

    return (*(volatile int*)ADC0_SEQCTRL0_REG_ADDR);
}

void ADC_setStep4 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL1_REG_SEQ4_LEN) - 1) << ADC0_SEQCTRL1_REG_SEQ4;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) |= (value << ADC0_SEQCTRL1_REG_SEQ4);

}

void ADC_setStep5 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL1_REG_SEQ5_LEN) - 1) << ADC0_SEQCTRL1_REG_SEQ5;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) |= (value << ADC0_SEQCTRL1_REG_SEQ5);

}

void ADC_setStep6 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL1_REG_SEQ6_LEN) - 1) << ADC0_SEQCTRL1_REG_SEQ6;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) |= (value << ADC0_SEQCTRL1_REG_SEQ6);

}

void ADC_setStep7 (int value){

     unsigned int mask = ((1 << ADC0_SEQCTRL1_REG_SEQ7_LEN) - 1) << ADC0_SEQCTRL1_REG_SEQ7;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) |= (value << ADC0_SEQCTRL1_REG_SEQ7);

}

void ADC_setSeqCtrlReg1 (int value){

    (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR) = value;
}


int ADC_getSeqCtrlReg1 (){

    return (*(volatile int*)ADC0_SEQCTRL1_REG_ADDR);
}

int ADC_getDataReg () {

    return (*(volatile int*)ADC0_DATA_REG_ADDR);
}

int ADC1_getDataReg () {

    return (*(volatile int*)ADC1_DATA_REG_ADDR);
}

void ADC_setFIFOlevel (int value){

    (*(volatile int*)ADC0_FIFOLEVEL_REG_ADDR) = value;
}


int ADC_getRawStatusReg () {

    return (*(volatile int*)ADC0_RIS_REG_ADDR);
}

int ADC_getMaskStatusReg () {

    return (*(volatile int*)ADC0_MIS_REG_ADDR);
}

int ADC1_getMaskStatusReg () {

    return (*(volatile int*)ADC1_MIS_REG_ADDR);
}

void ADC_setInterruptMaskReg (int value) {

    (*(volatile int*)ADC0_IM_REG_ADDR) = value;
}

void ADC1_setInterruptMaskReg (int value) {

    (*(volatile int*)ADC1_IM_REG_ADDR) = value;
}

int ADC_getInterruptMaskReg () {

    return (*(volatile int*)ADC0_IM_REG_ADDR);
}

void ADC_setInterruptClearReg (int value) {

    (*(volatile int*)ADC0_ICR_REG_ADDR) = value;
}

void ADC1_setInterruptClearReg (int value) {

    (*(volatile int*)ADC1_ICR_REG_ADDR) = value;
}


#endif