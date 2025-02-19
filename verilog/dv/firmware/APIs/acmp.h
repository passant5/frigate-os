#ifndef ACMP_H
#define ACMP_H

#define ACMP_BASE				0x40110000

#define	ACMP_SEL_REG_ADDR		(ACMP_BASE+0x0)
#define	ACMP_ICR_REG_ADDR		(ACMP_BASE+0xf00)
#define	ACMP_RIS_REG_ADDR		(ACMP_BASE+0xf04)
#define	ACMP_IM_REG_ADDR		(ACMP_BASE+0xf08)
#define	ACMP_MIS_REG_ADDR		(ACMP_BASE+0xf0c)

#define ACMP_SEL_REG_SELA		0
#define ACMP_SEL_REG_SELA_LEN	1
#define ACMP_SEL_REG_SELB		1
#define ACMP_SEL_REG_SELB_LEN	1
#define INT_HI_FLAG	0x1

void ACMP_setSelectReg (int value){

    (*(volatile int*)ACMP_SEL_REG_ADDR) = value;

}

int ACMP_getSelectReg (){

    return (*(volatile int*)ACMP_SEL_REG_ADDR);

}

int ACMP_getRawStatusReg () {

    return (*(volatile int*)ACMP_RIS_REG_ADDR);
}

int ACMP_getMaskStatusReg () {

    return (*(volatile int*)ACMP_MIS_REG_ADDR);
}

void ACMP_setInterruptMaskReg (int value) {

    (*(volatile int*)ACMP_IM_REG_ADDR) = value;
}

int ACMP_getInterruptMaskReg () {

    return (*(volatile int*)ACMP_IM_REG_ADDR);
}

void ACMP_setInterruptClearReg (int value) {

    (*(volatile int*)ACMP_ICR_REG_ADDR) = value;
}

#endif