#ifndef Q7_UNIT_H
#define Q7_UNIT_H

#define Q7U_BASE				0x49000000
#define TANH_VALUE
#define SIGMOID_VALUE

#define	Q7U_CTRL_REG_ADDR		(Q7U_BASE+0x0000)
#define	Q7U_V0_REG_ADDR		    (Q7U_BASE+0x0400)
#define	Q7U_V1_REG_ADDR		    (Q7U_BASE+0x0800)
#define	Q7U_R_REG_ADDR		    (Q7U_BASE+0x0c00)
#define	Q7U_SIGMOID_REG_ADDR	(Q7U_BASE+0x1000)
#define	Q7U_TANH_REG_ADDR		(Q7U_BASE+0x2000)

#define Q7U_CTRL_REG_ADD_MUL		0
#define Q7U_CTRL_REG_ADD_MUL_LEN	1
#define Q7U_CTRL_REG_VEC_M		    1
#define Q7U_CTRL_REG_VEC_M_LEN	    1
#define Q7U_CTRL_REG_CLR		    2
#define Q7U_CTRL_REG_CLR_LEN	    1
#define Q7U_SIGMOID_REG_SIGMOID		0
#define Q7U_SIGMOID_REG_SIGMOID_LEN	8
#define Q7U_TANH_REG_TANH		    0
#define Q7U_TANH_REG_TANH_LEN	    8


void Q7_setCtrlReg (int value){

    (*(volatile int*)Q7U_CTRL_REG_ADDR) = value;
}

int Q7_getCtrlReg (){

    return (*(volatile int*)Q7U_CTRL_REG_ADDR);
}

void Q7_setV0Reg (int value){

    (*(volatile int*)Q7U_V0_REG_ADDR) = value;
}

int Q7_getV0Reg (){

    return (*(volatile int*)Q7U_V0_REG_ADDR);
}

void Q7_setV1Reg (int value){

    (*(volatile int*)Q7U_V1_REG_ADDR) = value;
}

int Q7_getV1Reg (){

    return (*(volatile int*)Q7U_V1_REG_ADDR);
}

void Q7_setResultReg (int value){

    (*(volatile int*)Q7U_R_REG_ADDR) = value;
}

int Q7_getResultReg (){

    return (*(volatile int*)Q7U_R_REG_ADDR);
}


unsigned char Q7_getTanh (char value){

    return (*(volatile unsigned char*)(Q7U_TANH_REG_ADDR + (value << 2)));
}

unsigned char  Q7_getSigmoid (char value){

    return (*(volatile unsigned char*)(Q7U_SIGMOID_REG_ADDR + (value << 2)));
}



#endif