/*
 * Code adapted from kanndil/mfcc_optimization
 * Copyright (C) 2018 Arm Limited or its affiliates. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Modified by Jianjia Ma for C implementation
 *
 * Modified by Youssef Kandil embedded optimization
 */

#ifndef __MFCC_H__
#define __MFCC_H__

#include <math.h>

#include <stdint.h>
#include <math.h>
#include <float.h>

#define SAMP_FREQ 16000
#define SAMP_FREQ_INV (1/1600)
#define MEL_LOW_FREQ 20
#define MEL_HIGH_FREQ 4000
#define M_2PI 6.283185307179586476925286766559005
#define FFT_N 512
#define N_WAVE      1024    /* full length of Sinewave[] */
#define LOG2_N_WAVE 10      /* log2(N_WAVE) */


typedef struct _mfcc_t{ // MARK: - this can be static
    int num_mfcc_features;      // this is the number of 
	int num_features_offset;
	int num_fbank;
    int frame_len;
    int frame_len_padded;           // MARK: - this can be static // this can be fixed to make other variables static
    
	short preempha;
    float frame[512];                                  
    float mel_energies[26];            
    short window_func[512];            
    int mel_fbins[28];
    float dct_matrix[338];             

} mfcc_t;


void mfcc_create(mfcc_t *mfcc,int num_mfcc_features, int feature_offset, int num_fbank, int frame_len, float preempha, int is_append_energy);
void create_dct_matrix(int32_t input_length, int32_t coefficient_count, mfcc_t* mfcc);
void create_mel_fbank(mfcc_t *mfcc);
__attribute__((section(".sram_text"))) void mfcc_compute(mfcc_t *mfcc, const int16_t * audio_data, float* mfcc_out);
__attribute__((section(".sram_text"))) void apply_filter_banks2(mfcc_t *mfcc);
__attribute__((section(".sram_text"))) short FIX_MPY(short a, short b);
__attribute__((section(".sram_text"))) int fix_fft(short fr1[], short fi1[], short m, short inverse);
__attribute__((section(".sram_text"))) void quantize_data(float* din, int8_t* dout, uint32_t size, uint32_t int_bit);


#define FFT_N 512
#define N_WAVE      1024    /* full length of Sinewave[] */
#define LOG2_N_WAVE 10      /* log2(N_WAVE) */

#define inv_2595 (1.0f / 2595.0f)
#define inv_700 (1.0f / 700.0f)

static inline float InverseMelScale(float mel_freq) {
    return 700.0f * (pow(10, mel_freq * inv_2595) - 1.0f);
}
static inline float MelScale(float freq) {
    return 2595.0f * log10(1.0f + freq * inv_700);
}

int32_t log2fix (uint32_t x, size_t precision);

int32_t logfix (uint32_t x, size_t precision);



#endif