#ifndef SW_AES_H
#define SW_AES_H
#include <common.h>
#include <frigate_regs.h>

#define SW_AES_AHBL_BASE			USER_AES

#define	SW_AES_AHBL_STATUS_REG_ADDR		0x0
#define	SW_AES_AHBL_CTRL_REG_ADDR		0x4
#define	SW_AES_AHBL_KEY0_REG_ADDR		0x8
#define	SW_AES_AHBL_KEY1_REG_ADDR		0xc
#define	SW_AES_AHBL_KEY2_REG_ADDR		0x10
#define	SW_AES_AHBL_KEY3_REG_ADDR		0x14
#define	SW_AES_AHBL_KEY4_REG_ADDR		0x18
#define	SW_AES_AHBL_KEY5_REG_ADDR		0x1c
#define	SW_AES_AHBL_KEY6_REG_ADDR		0x20
#define	SW_AES_AHBL_KEY7_REG_ADDR		0x24
#define	SW_AES_AHBL_BLOCK0_REG_ADDR		0x28
#define	SW_AES_AHBL_BLOCK1_REG_ADDR		0x2c
#define	SW_AES_AHBL_BLOCK2_REG_ADDR		0x30
#define	SW_AES_AHBL_BLOCK3_REG_ADDR		0x34
#define	SW_AES_AHBL_RESULT0_REG_ADDR		0x38
#define	SW_AES_AHBL_RESULT1_REG_ADDR		0x3c
#define	SW_AES_AHBL_RESULT2_REG_ADDR		0x40
#define	SW_AES_AHBL_RESULT3_REG_ADDR		0x44
#define	SW_AES_AHBL_ICR_REG_ADDR		0xf00
#define	SW_AES_AHBL_RIS_REG_ADDR		0xf04
#define	SW_AES_AHBL_IM_REG_ADDR		0xf08
#define	SW_AES_AHBL_MIS_REG_ADDR		0xf0c
#define	SW_SHA256_AHBL_GCLK_REG_ADDR	0xf000


void SW_AES_writeKey(int *keys, enum condition is128){
    SW_AES_writeIs128Key(is128);
    if (is128 == FALSE){
        (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY0_REG_ADDR)) = keys[7];
        (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY1_REG_ADDR)) = keys[6];
        (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY2_REG_ADDR)) = keys[5];
        (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY3_REG_ADDR)) = keys[4];
    }
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY4_REG_ADDR)) = keys[3];
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY5_REG_ADDR)) = keys[2];
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY6_REG_ADDR)) = keys[1];
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_KEY7_REG_ADDR)) = keys[0];
}

void SW_AES_writeBlock(int *block){
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_BLOCK0_REG_ADDR)) = block[3];
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_BLOCK1_REG_ADDR)) = block[2];
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_BLOCK2_REG_ADDR)) = block[1];
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_BLOCK3_REG_ADDR)) = block[0];
}

int SW_AES_ready(){
    return ((*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_STATUS_REG_ADDR)) & 0x2) >> 1;
}

void SW_AES_waitReady(){
    while(!SW_AES_ready());
}

int SW_AES_resultValid(){
    return ((*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_STATUS_REG_ADDR)) & 0x1);
}

void SW_AES_waitResultValid(){
    while(!SW_AES_resultValid());
}

int SW_AES_readControl(){
    return (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_CTRL_REG_ADDR));
}

void SW_AES_writeControl(int control){
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_CTRL_REG_ADDR)) = control;
}

void SW_AES_writeIs128Key(enum condition is128){
    int control = SW_AES_readControl();
    if (is128 == TRUE)
        control &= ~(0x8);
    else
        control |= 0x8;
    SW_AES_writeControl(control);
}

void SW_AES_writeIsEncrypt(enum condition isEncrypt){
    int control = SW_AES_readControl();
    if (isEncrypt == TRUE)
        control |= 0x4;
    else
        control &= ~(0x4);
    SW_AES_writeControl(control);
}

void SW_AES_sendInit(){
    int control = SW_AES_readControl();
    control |= 0x1;
    control &= ~(0x2);
    SW_AES_writeControl(control);

}

void SW_AES_sendNext(){
    int control = SW_AES_readControl();
    control |= 0x2;
    control &= ~(0x1);
    SW_AES_writeControl(control);
}

void SW_AES_readResult(int *result){
    result[3] = (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_RESULT0_REG_ADDR));
    result[2] = (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_RESULT1_REG_ADDR));
    result[1] = (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_RESULT2_REG_ADDR));
    result[0] = (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_RESULT3_REG_ADDR));
}

void SW_AES_sendBlockWithKey(int *keys, enum condition is128, int *blocks, enum condition isEncrypt){
    SW_AES_writeControl(0x0);
    SW_AES_writeKey(keys, is128);
    SW_AES_writeIsEncrypt(isEncrypt);
    SW_AES_sendInit();
    SW_AES_waitReady();
    SW_AES_writeBlock(blocks);
    SW_AES_sendNext();
}

void SW_AES_sendBlock(int *blocks, enum condition isEncrypt){
    SW_AES_writeIsEncrypt(isEncrypt);
    SW_AES_sendInit();
    SW_AES_waitReady();
    SW_AES_writeBlock(blocks);
    SW_AES_sendNext();
}

void SW_AES_waitGetResult(int *result){
    SW_AES_waitResultValid();
    SW_AES_readResult(result);
}

void SW_AES_setInterruptMask(int mask){
    // bit 0: result valid
    // bit 1: ready
    (*(volatile int*)(SW_AES_AHBL_BASE + SW_AES_AHBL_IM_REG_ADDR)) = mask;
}

void SW_AES_setGclkEnable(int value){
    (*(volatile int*)(SW_AES_AHBL_BASE +SW_SHA256_AHBL_GCLK_REG_ADDR)) = value;
}

#endif //SW_AES_H