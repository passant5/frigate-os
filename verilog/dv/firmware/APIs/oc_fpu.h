/*
        Copyright 2024 Efabless Corp.

        Author: Mohamed Shalan (mshalan@efabless.com)

        Licensed under the Apache License, Version 2.0 (the "License");
        you may not use this file except in compliance with the License.
        You may obtain a copy of the License at

            http://www.apache.org/licenses/LICENSE-2.0

        Unless required by applicable law or agreed to in writing, software
        distributed under the License is distributed on an "AS IS" BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        See the License for the specific language governing permissions and
        limitations under the License.

*/

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

void SP_FPU_setGclkEnable (uint32_t sp_fpu_base, int value){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)sp_fpu_base;
    sp_fpu->GCLK = value;
}

static inline void __attribute__((always_inline))  SP_FPU_setOperation (uint32_t sp_fpu_base, int value){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)sp_fpu_base;
    sp_fpu->fn = value;
}

static inline void __attribute__((always_inline))  SP_FPU_setOperand1 (uint32_t sp_fpu_base, uint32_t value){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)sp_fpu_base;
    sp_fpu->op1 = value;
}

static inline void __attribute__((always_inline))  SP_FPU_setOperand2 (uint32_t sp_fpu_base, uint32_t value){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)sp_fpu_base;
    sp_fpu->op2 = value;
}

static inline float __attribute__((always_inline))  SP_FPU_getResult (uint32_t sp_fpu_base){

    SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)sp_fpu_base;
    return (sp_fpu->result);
}

// float SP_FPU_add (float a, float b){
//     SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
//     sp_fpu->fn = 0b00;
//     sp_fpu->op1 = *(unsigned int *)(&a);
//     sp_fpu->op2 = *(unsigned int *)(&b);
//     return (sp_fpu->result);
// }

// float SP_FPU_sub (float a, float b){
//     SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
//     sp_fpu->fn = 0b01;
//     sp_fpu->op1 = *(unsigned int *)(&a);
//     sp_fpu->op2 = *(unsigned int *)(&b);
//     return (sp_fpu->result);
// }

// float SP_FPU_mul (float a, float b){
//     SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
//     sp_fpu->fn = 0b10;
//     sp_fpu->op1 = *(unsigned int *)(&a);
//     sp_fpu->op2 = *(unsigned int *)(&b);
//     return (sp_fpu->result);
// }

// float SP_FPU_div (float a, float b){
//     SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
//     sp_fpu->fn = 0b11;
//     sp_fpu->op1 = *(unsigned int *)(&a);
//     sp_fpu->op2 = *(unsigned int *)(&b);
//     return (sp_fpu->result);
// }

float SP_FPU_add (float a, float b){
SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;

    // return a-b;
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

float SP_FPU_sub (float a, float b){
SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;

    // return a-b;
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

float SP_FPU_mul (float a, float b){
SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
    // return a-b;
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

float SP_FPU_div (float a, float b){
SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
    // return a-b;
    sp_fpu->fn = 0b11; //0x6D000000
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





// inline float __addsf3 (float a, float b){
//     return(a+b);
// }

// float __subsf3 (float a, float b){
//     SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
//     sp_fpu->fn = 0b01;
//     sp_fpu->op1 = *(unsigned int *)(&a);
//     sp_fpu->op2 = *(unsigned int *)(&b);
//     return (sp_fpu->result);
// }

// float __mulsf3 (float a, float b){
//     SP_FPU_TYPE* sp_fpu = (SP_FPU_TYPE*)USER_SP_FPU;
//     sp_fpu->fn = 0b10;
//     sp_fpu->op1 = *(unsigned int *)(&a);
//     sp_fpu->op2 = *(unsigned int *)(&b);
//     return (sp_fpu->result);
// }