#include <stdint.h>


#ifndef SP_FPUREGS_H
#define SP_FPUREGS_H

#ifndef IO_TYPES
#define IO_TYPES
#define   __R     volatile const unsigned int
#define   __W     volatile       unsigned int
#define   __RW    volatile       unsigned int
#endif


#define SP_FPU_RDY_FLAG 0x1

typedef struct _SP_FPU_TYPE_ {
        __W     fn;
        __W     op1;
        __W     op2;
        __R     result;
        __R     reserved_0[16316];
        __RW    IM;
        __R     MIS;
        __R     RIS;
        __W     IC;
        __W     GCLK;
} SP_FPU_TYPE;

#endif

float __addsf3 (float a, float b){
    
    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
    sp_fpu->fn = 0b00; //0x6D000000
    unsigned int * pa = &a;
    unsigned int * pb = &b;
    sp_fpu->op1 = *pa; //0x6D000004
    sp_fpu->op2 = *pb; //0x6D000008
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    unsigned int z = sp_fpu->result;
    float r;
    *(unsigned int *)(&r)=z;
    return (r);            //0x6D00000C
}

float __subsf3 (float a, float b){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
    sp_fpu->fn = 0b01; //0x6D000000
    unsigned int * pa = &a;
    unsigned int * pb = &b;
    sp_fpu->op1 = *pa; //0x6D000004
    sp_fpu->op2 = *pb; //0x6D000008
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    unsigned int z = sp_fpu->result;
    float r;
    *(unsigned int *)(&r)=z;
    return (r);            //0x6D00000C
}

float __mulsf3 (float a, float b){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
    sp_fpu->fn = 0b10; //0x6D000000
    unsigned int * pa = &a;
    unsigned int * pb = &b;
    sp_fpu->op1 = *pa; //0x6D000004
    sp_fpu->op2 = *pb; //0x6D000008
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    __asm__("nop");
    unsigned int z = sp_fpu->result;
    float r;
    *(unsigned int *)(&r)=z;
    return (r);            //0x6D00000C
}