#ifndef AUDIODAC_H
#define AUDIODAC_H

#define AUDIODAC_BASE                   0x400C0000
#define	AUDIODAC_DATA_REG_ADDR		    (AUDIODAC_BASE + 0x0)
#define	AUDIODAC_FRDY_REG_ADDR		    (AUDIODAC_BASE + 0x4)
#define	AUDIODAC_FACK_REG_ADDR		    (AUDIODAC_BASE + 0x8)
#define	AUDIODAC_CFG_REG_ADDR           (AUDIODAC_BASE + 0xc)
#define	AUDIODAC_TST_FIFO_LOOP_REG_ADDR	(AUDIODAC_BASE + 0x10)
#define	AUDIODAC_IM_REG_ADDR	        (AUDIODAC_BASE + 0xff00)
#define	AUDIODAC_MIS_REG_ADDR		    (AUDIODAC_BASE + 0xff04)
#define	AUDIODAC_RIS_REG_ADDR		    (AUDIODAC_BASE + 0xff08)
#define	AUDIODAC_ICR_REG_ADDR		    (AUDIODAC_BASE + 0xff0c)



void AUDIODAC_setDataReg (int value) {

    (*(volatile int*)AUDIODAC_DATA_REG_ADDR) = value;

}

void AUDIODAC_setMode (int mode) {

    int cfg = (*(volatile int*)AUDIODAC_CFG_REG_ADDR) & 0xFFFFFFFE;
    (*(volatile int*)AUDIODAC_CFG_REG_ADDR) = cfg | (mode&0b1) ;

}

void AUDIODAC_setVolume (int value) {
    int cfg = (*(volatile int*)AUDIODAC_CFG_REG_ADDR) & 0xFFFFFFE1;
    (*(volatile int*)AUDIODAC_CFG_REG_ADDR) = cfg | ((value<<1)&0b11110) ;
}

int AUDIODAC_setOsr (int value) {
    int cfg = (*(volatile int*)AUDIODAC_CFG_REG_ADDR) & 0xFFFFFF9F;
    (*(volatile int*)AUDIODAC_CFG_REG_ADDR) = cfg | ((value<<5)&0b1100000) ;
}

void AUDIODAC_setIM (int value) {
    (*(volatile int*)AUDIODAC_IM_REG_ADDR) = value;
}

#endif // AUDIODAC_H