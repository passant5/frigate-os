/*
        Copyright 2024 None

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

#ifndef CONV2DREGS_H
#define CONV2DREGS_H

#ifndef IO_TYPES
#define IO_TYPES
#define   __R     volatile const unsigned int
#define   __W     volatile       unsigned int
#define   __RW    volatile       unsigned int
#endif

#define CONV2D_DATA_SIZE_CFG_REG_DATA_WIDTH_BIT 0
#define CONV2D_DATA_SIZE_CFG_REG_DATA_WIDTH_MASK        0x1ff
#define CONV2D_DATA_SIZE_CFG_REG_DATA_HEIGHT_BIT        16
#define CONV2D_DATA_SIZE_CFG_REG_DATA_HEIGHT_MASK       0x1ff0000
#define CONV2D_RESULT_SIZE_CFG_REG_RESULT_WIDTH_BIT     0
#define CONV2D_RESULT_SIZE_CFG_REG_RESULT_WIDTH_MASK    0x1ff
#define CONV2D_RESULT_SIZE_CFG_REG_RESULT_HEIGHT_BIT    16
#define CONV2D_RESULT_SIZE_CFG_REG_RESULT_HEIGHT_MASK   0x1ff0000
#define CONV2D_STRIDE_SIZE_CFG_REG_STRIDE_X_BIT 0
#define CONV2D_STRIDE_SIZE_CFG_REG_STRIDE_X_MASK        0xf
#define CONV2D_STRIDE_SIZE_CFG_REG_STRIDE_Y_BIT 4
#define CONV2D_STRIDE_SIZE_CFG_REG_STRIDE_Y_MASK        0xf0
#define CONV2D_KERNEL_SIZE_CFG_REG_KERNEL_WIDTH_BIT     0
#define CONV2D_KERNEL_SIZE_CFG_REG_KERNEL_WIDTH_MASK    0xf
#define CONV2D_KERNEL_SIZE_CFG_REG_KERNEL_HEIGHT_BIT    4
#define CONV2D_KERNEL_SIZE_CFG_REG_KERNEL_HEIGHT_MASK   0xf0
#define CONV2D_RELU_CFG_REG_RELU_MAX_BIT        0
#define CONV2D_RELU_CFG_REG_RELU_MAX_MASK       0x7f
#define CONV2D_RELU_CFG_REG_RELU_THRESHOLD_BIT  8
#define CONV2D_RELU_CFG_REG_RELU_THRESHOLD_MASK 0xff00
#define CONV2D_RELU_CFG_REG_RELU_NEG_SLOPE_BIT  16
#define CONV2D_RELU_CFG_REG_RELU_NEG_SLOPE_MASK 0xff0000
#define CONV2D_MAX_POOL_KERNEL_SIZE_REG_POOL_KERNEL_WIDTH_BIT   0
#define CONV2D_MAX_POOL_KERNEL_SIZE_REG_POOL_KERNEL_WIDTH_MASK  0xf
#define CONV2D_MAX_POOL_KERNEL_SIZE_REG_POOL_KERNEL_HEIGHT_BIT  4
#define CONV2D_MAX_POOL_KERNEL_SIZE_REG_POOL_KERNEL_HEIGHT_MASK 0xf0
#define CONV2D_MAX_POOL_STRIDE_SIZE_REG_POOL_STRIDE_X_BIT       0
#define CONV2D_MAX_POOL_STRIDE_SIZE_REG_POOL_STRIDE_X_MASK      0xf
#define CONV2D_MAX_POOL_STRIDE_SIZE_REG_POOL_STRIDE_Y_BIT       4
#define CONV2D_MAX_POOL_STRIDE_SIZE_REG_POOL_STRIDE_Y_MASK      0xf0
#define CONV2D_MAX_POOL_RESULT_SIZE_REG_POOL_RES_WIDTH_BIT      0
#define CONV2D_MAX_POOL_RESULT_SIZE_REG_POOL_RES_WIDTH_MASK     0x1ff
#define CONV2D_MAX_POOL_RESULT_SIZE_REG_POOL_RES_HEIGHT_BIT     16
#define CONV2D_MAX_POOL_RESULT_SIZE_REG_POOL_RES_HEIGHT_MASK    0x1ff0000

#define CONV2D_DONE_FLAG        0x1
#define CONV2D_DONE_ALL_FLAG    0x2

typedef struct _CONV2D_TYPE_ {
        __W     DATA_SIZE_CFG;
        __W     RESULT_SIZE_CFG;
        __W     STRIDE_SIZE_CFG;
        __W     KERNEL_SIZE_CFG;
        __W     BIAS_0;
        __W     OUT_SHIFT_0;
        __W     BIAS_1;
        __W     OUT_SHIFT_1;
        __W     RELU_CTRL;
        __W     RELU_CFG;
        __W     MAX_POOL_CTRL;
        __W     MAX_POOL_KERNEL_SIZE;
        __W     MAX_POOL_STRIDE_SIZE;
        __W     MAX_POOL_RESULT_SIZE;
        __W     START;
        __W     FIRST;
        __W     LAST;
        __W     MEM_IN_CHANNEL;
        __W     MEM_IN;
        __W     KERNEL;
        __R     MEM_OUT;
        __W     MEM_OUT_CHANNEL;
        __R     reserved_0[16298];
        __RW    IM;
        __R     MIS;
        __R     RIS;
        __W     IC;
        __W     GCLK;
} CONV2D_TYPE;

#endif

void CONV2D_setGclkEnable (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    conv2d->GCLK = value;
}


void CONV2D_setDataSize (uint32_t conv2d_base, int width, int height){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> DATA_SIZE_CFG = ((height&0x1FF) << 16) | (width&0x1FF);

}

void CONV2D_setResultSize (uint32_t conv2d_base, int width, int height){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> RESULT_SIZE_CFG = ((height&0x1FF) << 16) | (width&0x1FF);

}
void CONV2D_setStrideSize (uint32_t conv2d_base, int x, int y){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> STRIDE_SIZE_CFG = ((y&0xF) << 4) | (x&0xF);

}

void CONV2D_setKernelSize (uint32_t conv2d_base, int width, int height){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> KERNEL_SIZE_CFG = ((height&0xF) << 4) | (width&0xF);

}

void CONV2D_setBias0Value (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> BIAS_0 = value;

}

void CONV2D_setOutShift0Value (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> OUT_SHIFT_0 = value;

}

void CONV2D_setBias1Value (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> BIAS_1 = value;

}

void CONV2D_setOutShift1Value (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> OUT_SHIFT_1 = value;

}

void CONV2D_setReluEnable (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    
    conv2d -> RELU_CTRL = value;
}

void CONV2D_setReluConfig (uint32_t conv2d_base, int max, int threshold, int neg_slope){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    
    conv2d -> RELU_CFG = ((neg_slope&0xFF) << 16) | ((threshold&0xFF) << 8) | (max&0xFF);
}


void CONV2D_setMaxPoolEnable (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    
    conv2d -> MAX_POOL_CTRL = value;
}

void CONV2D_setMaxPoolKernelSize (uint32_t conv2d_base, int width, int height){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    
    conv2d -> MAX_POOL_KERNEL_SIZE = ((height&0xF) << 4) | (width&0xF);
}

void CONV2D_setMaxPoolStrideSize (uint32_t conv2d_base, int x, int y){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    
    conv2d -> MAX_POOL_STRIDE_SIZE = ((y&0xF) << 4) | (x&0xF);
}

void CONV2D_setMaxPoolResultSize (uint32_t conv2d_base, int width, int height){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;
    
    conv2d -> MAX_POOL_RESULT_SIZE = ((height&0x1FF) << 16) | (width&0x1FF);
}


void CONV2D_Start (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> START = value;

}

void CONV2D_FirstChannel (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> FIRST = value;

}

void CONV2D_LastChannel (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> LAST = value;

}

void CONV2D_setMemInChannel (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> MEM_IN_CHANNEL = value;

}


void CONV2D_WriteToMemIn (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> MEM_IN = value;

}

void CONV2D_WriteToKernel (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> KERNEL = value;

}

int CONV2D_ReadMemOut (uint32_t conv2d_base){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    return (conv2d -> MEM_OUT);

}

void CONV2D_setMemOutChannel (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> MEM_OUT_CHANNEL = value;

}

void CONV2D_setIM (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> IM = value;

}

int CONV2D_getRIS (uint32_t conv2d_base){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    return (conv2d -> RIS);

}

int CONV2D_getMIS (uint32_t conv2d_base){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    return (conv2d -> MIS);

}

void CONV2D_setIC (uint32_t conv2d_base, int value){

    CONV2D_TYPE* conv2d = (CONV2D_TYPE*)conv2d_base;

    conv2d -> IC = value;

}
