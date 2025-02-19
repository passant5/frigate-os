#ifndef AUDIODAC_USER_H
#define AUDIODAC_USER_H

#define AUDIODAC_USER_BASE                   0x0
#define	AUDIODAC_USER_DATA_REG_ADDR		    (AUDIODAC_USER_BASE + 0x0)
#define	AUDIODAC_USER_FRDY_REG_ADDR		    (AUDIODAC_USER_BASE + 0x4)
#define	AUDIODAC_USER_FACK_REG_ADDR		    (AUDIODAC_USER_BASE + 0x8)
#define	AUDIODAC_USER_CFG_REG_ADDR           (AUDIODAC_USER_BASE + 0xc)
#define	AUDIODAC_USER_TST_FIFO_LOOP_REG_ADDR	(AUDIODAC_USER_BASE + 0x10)
#define	AUDIODAC_USER_IM_REG_ADDR	        (AUDIODAC_USER_BASE + 0xff00)
#define	AUDIODAC_USER_MIS_REG_ADDR		    (AUDIODAC_USER_BASE + 0xff04)
#define	AUDIODAC_USER_RIS_REG_ADDR		    (AUDIODAC_USER_BASE + 0xff08)
#define	AUDIODAC_USER_ICR_REG_ADDR		    (AUDIODAC_USER_BASE + 0xff0c)



void AUDIODAC_USER_setDataReg (int value) {

    (*(volatile int*)AUDIODAC_USER_DATA_REG_ADDR) = value;

}

void AUDIODAC_USER_setMode (int mode) {

    int cfg = (*(volatile int*)AUDIODAC_USER_CFG_REG_ADDR) & 0xFFFFFFFE;
    (*(volatile int*)AUDIODAC_USER_CFG_REG_ADDR) = cfg | (mode&0b1) ;

}

void AUDIODAC_USER_setVolume (int value) {
    int cfg = (*(volatile int*)AUDIODAC_USER_CFG_REG_ADDR) & 0xFFFFFFE1;
    (*(volatile int*)AUDIODAC_USER_CFG_REG_ADDR) = cfg | ((value<<1)&0b11110) ;
}

int AUDIODAC_USER_setOsr (int value) {
    int cfg = (*(volatile int*)AUDIODAC_USER_CFG_REG_ADDR) & 0xFFFFFF9F;
    (*(volatile int*)AUDIODAC_USER_CFG_REG_ADDR) = cfg | ((value<<5)&0b1100000) ;
}

void AUDIODAC_USER_setIM (int value) {
    (*(volatile int*)AUDIODAC_USER_IM_REG_ADDR) = value;
}

#endif // AUDIODAC_USER_H