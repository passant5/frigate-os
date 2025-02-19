#ifndef SW_SHA256_H
#define SW_SHA256_H
#include <common.h>
#include <frigate_regs.h>

#define SW_SHA256_AHBL_BASE			USER_SHA

#define	SW_SHA256_AHBL_STATUS_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x0)
#define	SW_SHA256_AHBL_CTRL_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x4)
#define	SW_SHA256_AHBL_BLOCK0_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x8)
#define	SW_SHA256_AHBL_BLOCK1_REG_ADDR		(SW_SHA256_AHBL_BASE + 0xc)
#define	SW_SHA256_AHBL_BLOCK2_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x10)
#define	SW_SHA256_AHBL_BLOCK3_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x14)
#define	SW_SHA256_AHBL_BLOCK4_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x18)
#define	SW_SHA256_AHBL_BLOCK5_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x1c)
#define	SW_SHA256_AHBL_BLOCK6_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x20)
#define	SW_SHA256_AHBL_BLOCK7_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x24)
#define	SW_SHA256_AHBL_BLOCK8_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x28)
#define	SW_SHA256_AHBL_BLOCK9_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x2c)
#define	SW_SHA256_AHBL_BLOCK10_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x30)
#define	SW_SHA256_AHBL_BLOCK11_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x34)
#define	SW_SHA256_AHBL_BLOCK12_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x38)
#define	SW_SHA256_AHBL_BLOCK13_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x3c)
#define	SW_SHA256_AHBL_BLOCK14_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x40)
#define	SW_SHA256_AHBL_BLOCK15_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x44)
#define	SW_SHA256_AHBL_DIGEST0_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x48)
#define	SW_SHA256_AHBL_DIGEST1_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x4c)
#define	SW_SHA256_AHBL_DIGEST2_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x50)
#define	SW_SHA256_AHBL_DIGEST3_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x54)
#define	SW_SHA256_AHBL_DIGEST4_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x58)
#define	SW_SHA256_AHBL_DIGEST5_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x5c)
#define	SW_SHA256_AHBL_DIGEST6_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x60)
#define	SW_SHA256_AHBL_DIGEST7_REG_ADDR		(SW_SHA256_AHBL_BASE + 0x64)
#define	SW_SHA256_AHBL_ICR_REG_ADDR		(SW_SHA256_AHBL_BASE + 0xf00)
#define	SW_SHA256_AHBL_RIS_REG_ADDR		(SW_SHA256_AHBL_BASE + 0xf04)
#define	SW_SHA256_AHBL_IM_REG_ADDR		(SW_SHA256_AHBL_BASE + 0xf08)
#define	SW_SHA256_AHBL_MIS_REG_ADDR		(SW_SHA256_AHBL_BASE + 0xf0c)
#define	SW_SHA256_AHBL_GCLK_REG_ADDR		(SW_SHA256_AHBL_BASE + 0xf000)



void SW_SHA256_writeBlock(int *block, enum condition isFirst){
    if (isFirst){
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK0_REG_ADDR)) = block[7];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK1_REG_ADDR)) = block[6];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK2_REG_ADDR)) = block[5];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK3_REG_ADDR)) = block[4];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK4_REG_ADDR)) = block[3];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK5_REG_ADDR)) = block[2];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK6_REG_ADDR)) = block[1];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK7_REG_ADDR)) = block[0]; 
    }else{
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK8_REG_ADDR)) = block[7];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK9_REG_ADDR)) = block[6];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK10_REG_ADDR)) = block[5];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK11_REG_ADDR)) = block[4];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK12_REG_ADDR)) = block[3];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK13_REG_ADDR)) = block[2];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK14_REG_ADDR)) = block[1];
        (*(volatile int*)(SW_SHA256_AHBL_BLOCK15_REG_ADDR)) = block[0];
    }
    
    
}

int SW_SHA256_ready(){
    return ((*(volatile int*)(SW_SHA256_AHBL_STATUS_REG_ADDR)) & 0x2) >> 1;
}

void SW_SHA256_waitReady(){
    // dummy delay 
    dummyDelay(50);
    while(!SW_SHA256_ready());
}

int SW_SHA256_resultValid(){
    return ((*(volatile int*)(SW_SHA256_AHBL_STATUS_REG_ADDR)) & 0x1);
}

void SW_SHA256_waitResultValid(){
    while(!SW_SHA256_resultValid());
}

int SW_SHA256_readControl(){
    return (*(volatile int*)(SW_SHA256_AHBL_CTRL_REG_ADDR));
}

void SW_SHA256_writeControl(int control){
    (*(volatile int*)(SW_SHA256_AHBL_CTRL_REG_ADDR)) = control;
}


void SW_SHA256_writeMode(enum condition is265){
    volatile int control = SW_SHA256_readControl();
    if (is265 == TRUE)
        control |= 0x4;
    else
        control &= ~(0x4);
    SW_SHA256_writeControl(control);
}

void SW_SHA256_sendInit(){
    volatile int control = SW_SHA256_readControl();
    control |= 0x1;
    SW_SHA256_writeControl(control);
    control &= ~(0x1);
    SW_SHA256_writeControl(control);

}

void SW_SHA256_sendNext(){
    volatile int control = SW_SHA256_readControl();
    control |= 0x2;
    SW_SHA256_writeControl(control);
}

void SW_SHA256_readDigest(int *digest){
    digest[7] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST0_REG_ADDR));
    digest[6] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST1_REG_ADDR));
    digest[5] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST2_REG_ADDR));
    digest[4] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST3_REG_ADDR));
    digest[3] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST4_REG_ADDR));
    digest[2] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST5_REG_ADDR));
    digest[1] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST6_REG_ADDR));
    digest[0] = (*(volatile int*)(SW_SHA256_AHBL_DIGEST7_REG_ADDR));
}

void SW_SHA256_sendBlockFirst(int *blocks0,int *blocks1, enum condition is265){
    SW_SHA256_writeMode(is265);
    SW_SHA256_writeBlock(blocks1, 1);
    SW_SHA256_writeBlock(blocks0, 0);
    SW_SHA256_sendInit();
    SW_SHA256_waitReady();
}

void SW_SHA256_sendBlock(int *blocks0,int *blocks1){
    SW_SHA256_writeBlock(blocks1, 1);
    SW_SHA256_writeBlock(blocks0, 0);
    SW_SHA256_sendNext();
    SW_SHA256_waitReady();
}

void SW_SHA256_waitGetResult(int *result){
    SW_SHA256_waitResultValid();
    SW_SHA256_readDigest(result);
}

void SW_SHA256_setInterruptMask(int mask){
    // bit 0: result valid
    // bit 1: ready
    (*(volatile int*)(SW_SHA256_AHBL_IM_REG_ADDR)) = mask;
}

void SW_SHA256_setGclkEnable(int value){
    (*(volatile int*)(SW_SHA256_AHBL_GCLK_REG_ADDR)) = value;
}

#endif //SW_SHA256_H