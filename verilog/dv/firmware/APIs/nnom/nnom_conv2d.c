/*
 * Copyright (c) 2018-2020
 * Jianjia Ma
 * majianjia@live.com
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2019-07-23     Jianjia Ma   The first version
 */

#include <frigate_regs.h>
#include <conv2d.h>

#include <stdint.h>
#include <string.h>
#include <stdbool.h>

#include "nnom.h"
#include "nnom_local.h"
#include "nnom_layers.h"
#include "nnom_conv2d.h"

#define MEM_IN_OFF  0x48
#define KERNEL_MEM_OFF  0x4C
#define MEM_OUT_OFF  0x50

#ifdef NNOM_USING_CMSIS_NN
#include "arm_math.h"
#include "arm_nnfunctions.h"
#endif

// a machine friendly api, with suffix _s for structured configuration.
nnom_layer_t *conv2d_s(const nnom_conv2d_config_t *config)
{
    nnom_conv2d_layer_t *layer;
    nnom_buf_t *comp;
    nnom_layer_io_t *in, *out;
    size_t mem_size;

    // allocate a block memory for all the sub handles and shifts.
    mem_size = sizeof(nnom_conv2d_layer_t) + sizeof(nnom_layer_io_t) * 2 + sizeof(nnom_buf_t);
    layer = nnom_mem(mem_size);
    if (layer == NULL)
        return NULL;
    
    // distribut the memory to sub handles.
    in = (void *)((uint8_t*)layer + sizeof(nnom_conv2d_layer_t));
    out = (void *)((uint8_t*)in + sizeof(nnom_layer_io_t));
    comp = (void *)((uint8_t*)out + sizeof(nnom_layer_io_t));

    // set type in layer parent
    layer->super.type = NNOM_CONV_2D;
    // set buf state
    in->type = NNOM_TENSOR_BUF_TEMP;
    out->type = NNOM_TENSOR_BUF_TEMP;
    comp->type = NNOM_TENSOR_BUF_TEMP;
    // put in & out on the layer.
    layer->super.in = io_init(layer, in);
    layer->super.out = io_init(layer, out);
    #ifdef NNOM_USING_CMSIS_NN
    layer->super.comp = comp;
    #endif
    // set run method & output shape
    layer->super.run = conv2d_run;
    layer->super.build = conv2d_build;
    layer->super.free = conv2d_free;

    // save the config
    layer->super.config = (void*) config;

    // get the private parameters
    // test: for 1d input, expend h = 1
    if(config->weight->num_dim == 3)
    {
        layer->kernel = kernel(1, config->kernel_size[0]);
        layer->stride = stride(1, config->stride_size[0]);
        layer->dilation = dilation(1, config->dilation_size[0]);
    }
    else
    {
        layer->kernel = kernel(config->kernel_size[0], config->kernel_size[1]);
        layer->stride = stride(config->stride_size[0], config->stride_size[1]);
        layer->dilation = dilation(config->dilation_size[0], config->dilation_size[1]);
    }

    layer->filter_mult = config->filter_size; // for convs, this means filter number
    layer->padding_type = config->padding_type;

    // get bias and weight tensor, this should be created by script.
    layer->weight = config->weight;
    layer->bias = config->bias;
    
    // get shifts
    layer->output_rshift = (nnom_qformat_param_t *)config->output_shift;
    layer->bias_lshift = (nnom_qformat_param_t *)config->bias_shift;

    // padding
    if (layer->padding_type == PADDING_SAME)
    {
        layer->pad.h = layer->dilation.h * (layer->kernel.h - 1) / 2;
        layer->pad.w = layer->dilation.w * (layer->kernel.w - 1) / 2;
        layer->pad.c = (1 - 1) / 2;
    }

    return (nnom_layer_t *)layer;
}


// Conv2D
// multiplier of (output/input channel),
// shape of kernal, shape of strides, weight struct, bias struct
nnom_layer_t *Conv2D(uint32_t filters, nnom_3d_shape_t k, nnom_3d_shape_t s, nnom_3d_shape_t d,  nnom_padding_t pad_type,
                     const nnom_weight_t *w, const nnom_bias_t *b)
{
    nnom_conv2d_layer_t *layer;
    nnom_buf_t *comp;
    nnom_layer_io_t *in, *out;
    // apply a block memory for all the sub handles.
    size_t mem_size = sizeof(nnom_conv2d_layer_t) + sizeof(nnom_layer_io_t) * 2 + sizeof(nnom_buf_t);
    layer = nnom_mem(mem_size);
    if (layer == NULL)
        return NULL;

    // distribut the memory to sub handles.
    in = (void *)((uint8_t*)layer + sizeof(nnom_conv2d_layer_t));
    out = (void *)((uint8_t*)in + sizeof(nnom_layer_io_t));
    comp = (void *)((uint8_t*)out + sizeof(nnom_layer_io_t));

    // set type in layer parent
    layer->super.type = NNOM_CONV_2D;
    // set buf state
    in->type = NNOM_TENSOR_BUF_TEMP;
    out->type = NNOM_TENSOR_BUF_TEMP;
    comp->type = NNOM_TENSOR_BUF_TEMP;
    // put in & out on the layer.
    layer->super.in = io_init(layer, in);
    layer->super.out = io_init(layer, out);
    #ifdef NNOM_USING_CMSIS_NN
    layer->super.comp = comp;
    #endif
    // set run method & output shape
    layer->super.run = conv2d_run;
    layer->super.build = conv2d_build;

    // get the private parameters
    layer->kernel = k;
    layer->stride = s;
    layer->dilation = d;
    layer->filter_mult = filters;         // for convs, this means filter number
    layer->padding_type = pad_type;

    // create weight and bias tensor
    layer->weight = new_tensor(NNOM_QTYPE_PER_TENSOR, 4, filters);
    layer->bias = new_tensor(NNOM_QTYPE_PER_TENSOR, 1, filters);

    // configure weight tensor manually to support new tensor based backends.
    // needs to be very careful
    {
        // config weight
        nnom_shape_data_t dim[4] = {k.h, k.w, k.c, filters};
        *(layer->weight->q_offset) = 0;            // we have no support of offset here
        *(layer->weight->q_dec) = 0;        // not using it
        layer->weight->p_data = (void*)w->p_value;
        layer->weight->bitwidth = 8;
        layer->weight->qtype = NNOM_QTYPE_PER_TENSOR;
        nnom_memcpy(layer->weight->dim, dim, layer->weight->num_dim * sizeof(nnom_shape_data_t));

        // config bias
        dim[0] = filters;
        *(layer->bias->q_offset) = 0;            // we have no support of offset here
        *(layer->bias->q_dec) = 0;        // not using it
        layer->bias->p_data = (void*) b->p_value;
        layer->bias->bitwidth = 8;
        layer->weight->qtype = NNOM_QTYPE_PER_TENSOR;
        nnom_memcpy(layer->bias->dim, dim, layer->bias->num_dim * sizeof(nnom_shape_data_t));
        
        // output shift and bias shift
        layer->output_rshift = (nnom_qformat_param_t *)&w->shift;
        layer->bias_lshift = (nnom_qformat_param_t *)&b->shift;
    }

    return (nnom_layer_t *)layer;
}

// keras's implementation.
// source: https://github.com/keras-team/keras/blob/7a39b6c62d43c25472b2c2476bd2a8983ae4f682/keras/utils/conv_utils.py#L85
uint32_t conv_output_length(uint32_t input_length, uint32_t filter_size, nnom_padding_t padding, uint32_t stride, uint32_t dilation)
{
    if (input_length == 0)
        return 0;
    uint32_t dilated_filter_size = (filter_size - 1) * dilation + 1;
    uint32_t output_length;
    if(padding == PADDING_SAME)
        output_length = input_length;
    else
        output_length = input_length - dilated_filter_size + 1;
    return (output_length + stride - 1) / stride;
}

nnom_status_t conv2d_build(nnom_layer_t *layer)
{
    nnom_conv2d_layer_t *cl = (nnom_conv2d_layer_t *)layer;

    // get the tensor from last layer's output
    layer->in->tensor = layer->in->hook.io->tensor;

    // create new tensor for the output
    layer->out->tensor = new_tensor(NNOM_QTYPE_PER_TENSOR, layer->in->tensor->num_dim, cl->filter_mult);
    // copy then change later.
    tensor_cpy_attr(layer->out->tensor, layer->in->tensor);
    
    // calculate the output tensor q format, only support per tensor quantise now
    layer->out->tensor->q_dec[0] = layer->in->tensor->q_dec[0] + cl->weight->q_dec[0] - cl->output_rshift[0]; // need some modification for 16bit.
    // see if the activation will change the q format
    if(layer->actail)
        layer->out->tensor->q_dec[0] = act_get_dec_bit(layer->actail->type, layer->out->tensor->q_dec[0]);
    
    // now we set up the tensor shape, always HWC format
    layer->out->tensor->dim[0] = conv_output_length(layer->in->tensor->dim[0], cl->kernel.h, cl->padding_type, cl->stride.h, cl->dilation.h);
    layer->out->tensor->dim[1] = conv_output_length(layer->in->tensor->dim[1], cl->kernel.w, cl->padding_type, cl->stride.w, cl->dilation.w);
    layer->out->tensor->dim[2] = cl->filter_mult; // channel stays the same
    
    // fill padding
    if (cl->padding_type == PADDING_SAME)
    {
        cl->pad.w = cl->dilation.w * (cl->kernel.w - 1) / 2;
        cl->pad.h = cl->dilation.h * (cl->kernel.h - 1) / 2;
        cl->pad.c = 0;
    }

    #ifdef NNOM_USING_CMSIS_NN
    // bufferA size: (1D shape)
    // 2*ch_im_in*dim_kernel*dim_kernel
    layer->comp->size = 2 * 2 * layer->in->tensor->dim[2] * cl->kernel.w * cl->kernel.h;
    #endif
    // computational cost: K x K x Cin x Hour x Wout x Cout
    layer->stat.macc = cl->kernel.w * cl->kernel.h * layer->in->tensor->dim[2] * tensor_size(layer->out->tensor);
    return NN_SUCCESS;
}

nnom_status_t conv2d_free(nnom_layer_t *layer)
{
    // free weight and bias tensor when we are not initialised from structured configuration.
    if(!layer->config)
    {
        nnom_conv2d_layer_t* cl = (nnom_conv2d_layer_t*)layer;
        delete_tensor(cl->weight);
        delete_tensor(cl->bias);
    }
    return NN_SUCCESS;
}

void Read_OutputChannel(int out_image_size, int8_t* im_out){
    int data_out;
    for (int j =0; j<out_image_size; j+=2){
            data_out = CONV2D_ReadMemOut(USER_CONV2D);
            im_out[j]=data_out & 0xFF;
            if (j+1 != out_image_size)
                im_out[j+1]= (data_out >> 16) & 0xFF;
        }
}


void Accelerator_Convolution(
    q7_t *Im_in,                      // input image
    const uint16_t dim_im_in_x,             // input image dimention x
    const uint16_t dim_im_in_y,             // input image dimention y
    const uint16_t ch_im_in,                // number of input image channels

    // CONV2D
    q7_t *wt,                         // kernel weights
    const uint16_t ch_im_out,               // number of filters, i.e., output image channels
    const uint16_t dim_kernel_x,            // filter kernel size x
    const uint16_t dim_kernel_y,            // filter kernel size y
    const uint16_t stride_x,                // stride x
    const uint16_t stride_y,                // stride y

    const q7_t *bias,                       // bias
    const nnom_qformat_param_t *bias_shift, // bias shifts
    const nnom_qformat_param_t *out_shift,  // output shift
    const nnom_qtype_t q_type,              // per channel or per tensor

    const uint16_t dim_im_out_x,            // output image dimension x
    const uint16_t dim_im_out_y,            // output image dimension y

    // ReLU
    const uint8_t relu_en,                  // relu enable
    const q7_t relu_negative_slope,         // relu negative slope
    const q7_t relu_max,                    // relu max value
    const q7_t relu_threshold,              // relu threshold value

    // MAXPOOL2D
    const uint8_t pool_en,                  // pooling enable
    const uint16_t pool_dim_kernel_x,       // pooling kernel size x
    const uint16_t pool_dim_kernel_y,       // pooling kernel size y
    const uint16_t pool_stride_x,           // pooling stride x
    const uint16_t pool_stride_y,           // pooling stride y
    const uint16_t pool_dim_im_out_x,       // pool result image dimension x
    const uint16_t pool_dim_im_out_y,       // pool result image dimension y

    q7_t *Im_out                            // output image
){


    // Todo: this should be removed later
    // Todo: change the memory layout in NNOM
    uint8_t Image_channels[ch_im_in][dim_im_in_y*dim_im_in_x];
    // Copy the input image into the 2d array
    for (int i = 0; i < dim_im_in_y; i++)
        for (int j = 0; j < dim_im_in_x; j++)
            for (int k = 0; k < ch_im_in; k++)
                Image_channels[k][i*dim_im_in_x + j] = Im_in[(i*dim_im_in_x + j)*ch_im_in + k];



    CONV2D_setDataSize(USER_CONV2D, dim_im_in_x, dim_im_in_y);
    CONV2D_setKernelSize(USER_CONV2D, dim_kernel_x, dim_kernel_y);
    CONV2D_setStrideSize(USER_CONV2D, stride_x, stride_y); 
    CONV2D_setResultSize(USER_CONV2D, dim_im_out_x, dim_im_out_y); 

    CONV2D_setReluEnable(USER_CONV2D, relu_en);
    CONV2D_setReluConfig(USER_CONV2D, relu_max, relu_threshold, relu_negative_slope);

    CONV2D_setMaxPoolEnable(USER_CONV2D, pool_en);
    CONV2D_setMaxPoolKernelSize(USER_CONV2D, pool_dim_kernel_x, pool_dim_kernel_y);
    CONV2D_setMaxPoolStrideSize(USER_CONV2D, pool_stride_x, pool_stride_y);
    CONV2D_setMaxPoolResultSize(USER_CONV2D, pool_dim_im_out_x, pool_dim_im_out_y);

    CONV2D_setIM (USER_CONV2D, 1); // mask the done one channel interrupt 
    // EF_GPIO8_writeData(PORT_B, 0b0001); // done with configuration 

    int shift_idx, shift_steps;

    int final_output_width  =   dim_im_out_x;
    int final_output_height =   dim_im_out_y;

    if (pool_en){
        final_output_width  =   pool_dim_im_out_x;
        final_output_height =   pool_dim_im_out_y;
    }

    int in_image_bytes = dim_im_in_x*dim_im_in_y;                           // number of elements (bytes) in one input channel  (used with accessing image channels)
    int in_image_words = in_image_bytes / 4;                                // number of words in one input channel  (used with dma controller)
    int out_image_bytes = final_output_width * final_output_height;         // number of bytes in one output channel 
    int kernel_words = dim_kernel_x * dim_kernel_y ;                        // number of words in four kernels (two channels from two filters)
    int data_word, channel_bytes_index;
    int kernel_bytes_index =0;
    unsigned kernel_word;
    int next_kernel_address, kernel_address_3d, kernel_address_4d;
    int size_2d = kernel_words;
    int size_4d;


    // EF_GPIO8_writeData(PORT_B, 0b1100); // done with calculating  required variables 


    if(q_type == NNOM_QTYPE_PER_AXIS)  shift_steps = 1;
    else  shift_steps = 0;

    for (int out_channel = 0, shift_idx = 0; out_channel < ch_im_out; out_channel+=2, shift_idx += (2*shift_steps))  // TODO: shift steps should be reviewed  
    {
        int next_idx = shift_idx +1;
        if (shift_steps==0)
            next_idx = 0;
        int temp_bias_0 = 0;
        int temp_bias_1 = 0;
        int outshift_0 = out_shift[shift_idx];
        int outshift_1 = out_shift[next_idx];

        if(bias){
            temp_bias_0 = ((q31_t)(bias[out_channel]) << bias_shift[shift_idx]) + NNOM_ROUND(out_shift[shift_idx]);
            if (!(out_channel+1 == ch_im_out)) 
                temp_bias_1 = ((q31_t)(bias[out_channel+1]) << bias_shift[next_idx]) + NNOM_ROUND(out_shift[next_idx]);
        }     
        else{
            temp_bias_0 = (q31_t) NNOM_ROUND(out_shift[shift_idx]);
            if (!(out_channel+1 == ch_im_out)) 
                temp_bias_1 = (q31_t) NNOM_ROUND(out_shift[next_idx]);
        }

            
        CONV2D_setBias0Value(USER_CONV2D, temp_bias_0);
        CONV2D_setOutShift0Value(USER_CONV2D, outshift_0);

        CONV2D_setBias1Value(USER_CONV2D, temp_bias_1);
        CONV2D_setOutShift1Value(USER_CONV2D, outshift_1);

        // EF_GPIO8_writeData(PORT_B, 0b1110); 


        for (int in_channel =0; in_channel<ch_im_in; in_channel+=2){

            size_4d = out_channel*ch_im_in*size_2d;
            for (int i =0; i<size_2d; i++){
                kernel_address_3d = (in_channel + (i*ch_im_in));
                kernel_address_4d = kernel_address_3d + size_4d;

                next_kernel_address = kernel_address_4d + ch_im_in*size_2d;
                if (out_channel+1 != ch_im_out){
                    if (in_channel+1 != ch_im_in){
                        kernel_word = ((uint8_t)wt[next_kernel_address+1]<<24) | ((uint8_t) wt[kernel_address_4d+1] << 16) | ((uint8_t) wt[next_kernel_address] << 8) | (uint8_t)wt[kernel_address_4d];
                    }else{
                        kernel_word = ((uint8_t)wt[next_kernel_address] << 8)  | (uint8_t)wt[kernel_address_4d];
                    }
                }else {
                    if (in_channel+1 != ch_im_in){
                        kernel_word = ((uint8_t)wt[kernel_address_4d+1] << 16) | (uint8_t)wt[kernel_address_4d];
                    }else{
                        kernel_word = ((uint8_t)wt[kernel_address_4d]);
                    }
                }

                CONV2D_WriteToKernel(USER_CONV2D, kernel_word);
            }

                
            // EF_GPIO8_writeData(PORT_B, 0b0001);
            
            
            CONV2D_setMemInChannel(USER_CONV2D, 0);

            for (int i=0; i<in_image_bytes; i+=4){
                    data_word = (Image_channels[in_channel][i+3] << 24) | (Image_channels[in_channel][i+2] << 16) | (Image_channels[in_channel][i+1] << 8) | (Image_channels[in_channel][i]);
                    CONV2D_WriteToMemIn(USER_CONV2D, data_word);
                }

            // EF_GPIO8_writeData(PORT_B, 0b1010);
            
            if (in_channel+1 == ch_im_in){  // the channel before the last one (if number of input channels is odd)
                CONV2D_setMemInChannel(USER_CONV2D, 1);
                for (int i =0; i<in_image_words; i++){
                    CONV2D_WriteToMemIn(USER_CONV2D, 0);  // set the second channel to be equal to 0
                }
            }
            else { // write the second channel 
                CONV2D_setMemInChannel(USER_CONV2D, 1);

                for (int i=0; i<in_image_bytes; i+=4){
                    data_word = (Image_channels[in_channel+1][i+3] << 24) | (Image_channels[in_channel+1][i+2] << 16) | (Image_channels[in_channel+1][i+1] << 8) | (Image_channels[in_channel+1][i]);
                    CONV2D_WriteToMemIn(USER_CONV2D, data_word);
                }

            }
            
            // set first signal to 1 if first channel 
            if (in_channel == 0)
                CONV2D_FirstChannel(USER_CONV2D, 1);
            else 
                CONV2D_FirstChannel(USER_CONV2D, 0);
            
            // set last signal to 1 if last channel 
            if (in_channel >= ch_im_in-2)
                CONV2D_LastChannel(USER_CONV2D, 1);
            else
                CONV2D_LastChannel(USER_CONV2D, 0);

            // start convolution calculation for the first channel 

            CONV2D_Start(USER_CONV2D, 1);  // self cleared 

            while (CONV2D_getMIS(USER_CONV2D) != 1);  // wait until the done one channel interrupt is one 

            CONV2D_setIC(USER_CONV2D, 1); // clear the interrupt

        }

        CONV2D_setMemOutChannel(USER_CONV2D, 0);

        int data_out; 
        for (int i =0; i<final_output_width*final_output_height; i++){

            data_out = CONV2D_ReadMemOut(USER_CONV2D);
            Im_out[i*ch_im_out + out_channel]=data_out & 0xFF;

        }
        // Read_OutputChannel(out_image_bytes,  Im_out+out_channel * final_output_width * final_output_height);

        if(out_channel+1 != ch_im_out){  // read second channel 
            CONV2D_setMemOutChannel(USER_CONV2D, 1);

            for (int i =0; i<final_output_width*final_output_height; i++){

                data_out = CONV2D_ReadMemOut(USER_CONV2D);
                Im_out[i*ch_im_out + out_channel+1]=data_out & 0xFF;

            }
            // Read_OutputChannel(out_image_bytes, Im_out+(out_channel+1) * final_output_width * final_output_height);   
        }
    }

    
    if (0){  // only used for debugging 

        // bias 
        EF_UART_writeChar(UART0, 0xA1);
        EF_UART_writeChar(UART0, ch_im_out&0xFF);
        EF_UART_writeChar(UART0, (ch_im_out>>8)&0xFF); 
        for (int i=0; i<ch_im_out; i++){
            EF_UART_writeChar(UART0, bias[i]);
        }

        // bias shift 
        EF_UART_writeChar(UART0, 0xA2);
        EF_UART_writeChar(UART0, ch_im_out&0xFF);
        EF_UART_writeChar(UART0, (ch_im_out>>8)&0xFF); 
        for (int i=0; i<ch_im_out; i++){
            EF_UART_writeChar(UART0, bias_shift[i]);
        }

        // out shift 
        EF_UART_writeChar(UART0, 0xA3);
        EF_UART_writeChar(UART0, ch_im_out&0xFF);
        EF_UART_writeChar(UART0, (ch_im_out>>8)&0xFF); 
        for (int i=0; i<ch_im_out; i++){
            EF_UART_writeChar(UART0, out_shift[i]);
        }

        // input image 
        int in_image_size = dim_im_in_x*dim_im_in_y*ch_im_in;
        EF_UART_writeChar(UART0, 0xA4);
        EF_UART_writeChar(UART0, in_image_size&0xFF);
        EF_UART_writeChar(UART0, (in_image_size>>8)&0xFF); 
        for (int i=0; i<in_image_size; i++){
            EF_UART_writeChar(UART0, Im_in[i]);
        }

        // kernel
        int kernel_size = dim_kernel_x*dim_kernel_y*ch_im_in*ch_im_out; 
        EF_UART_writeChar(UART0, 0xA5);
        EF_UART_writeChar(UART0, kernel_size&0xFF);
        EF_UART_writeChar(UART0, (kernel_size>>8)&0xFF); 
        for (int i=0; i<kernel_size; i++){
            EF_UART_writeChar(UART0, wt[i]);
        }

        // q_type
        EF_UART_writeChar(UART0, 0xA6);
        EF_UART_writeChar(UART0, q_type);


        // output image 
        int out_image_size = ch_im_out  * final_output_height * final_output_width;
        EF_UART_writeChar(UART0, 0xA7);
        EF_UART_writeChar(UART0, out_image_size&0xFF);
        EF_UART_writeChar(UART0, (out_image_size>>8)&0xFF); 
        for (int i=0; i<out_image_size; i++){
            EF_UART_writeChar(UART0, Im_out[i]);
        }
    }
    
}





void Accelerator_Convolution_golden_model(
    const q7_t *Im_in,                      // input image
    const uint16_t dim_im_in_x,             // input image dimention x
    const uint16_t dim_im_in_y,             // input image dimention y
    const uint16_t ch_im_in,                // number of input image channels

    // CONV2D
    const q7_t *wt,                         // kernel weights
    const uint16_t ch_im_out,               // number of filters, i.e., output image channels
    const uint16_t dim_kernel_x,            // filter kernel size x
    const uint16_t dim_kernel_y,            // filter kernel size y
    const uint16_t stride_x,                // stride x
    const uint16_t stride_y,                // stride y

    const q7_t *bias,                       // bias
    const nnom_qformat_param_t *bias_shift, // bias shifts
    const nnom_qformat_param_t *out_shift,  // output shift
    const nnom_qtype_t q_type,              // per channel or per tensor

    const uint16_t dim_im_out_x,            // output image dimension x
    const uint16_t dim_im_out_y,            // output image dimension y

    // ReLU
    const uint8_t relu_en,                  // relu enable
    const q7_t relu_negative_slope,         // relu negative slope
    const q7_t relu_max,                    // relu max value
    const q7_t relu_threshold,              // relu threshold value

    // MAXPOOL2D
    const uint8_t pool_en,                  // pooling enable
    const uint16_t pool_dim_kernel_x,       // pooling kernel size x
    const uint16_t pool_dim_kernel_y,       // pooling kernel size y
    const uint16_t pool_stride_x,           // pooling stride x
    const uint16_t pool_stride_y,           // pooling stride y
    const uint16_t pool_dim_im_out_x,       // pool result image dimension x
    const uint16_t pool_dim_im_out_y,       // pool result image dimension y

    q7_t *Im_out,                            // output image
    q7_t *mid_out                            // output image
){

    int relu_size = dim_im_out_x * dim_im_out_y*ch_im_out;

    
    local_convolve_HWC_q7_nonsquare(    Im_in, dim_im_in_x, dim_im_in_y, ch_im_in,
                                        wt, ch_im_out, dim_kernel_x, dim_kernel_y,0,0, stride_x, stride_y,1,1,
                                        bias, bias_shift, out_shift, q_type,
                                    mid_out, dim_im_out_x, dim_im_out_y,
                                        NULL, NULL);
    if (relu_en == 1) {
        
        local_adv_relu_q7(mid_out, relu_negative_slope, relu_max, relu_threshold, relu_size);
    }

    if (pool_en == 1) {
        local_maxpool_q7_HWC(   mid_out, dim_im_out_x, dim_im_out_y,
                                ch_im_out, pool_dim_kernel_x, pool_dim_kernel_y,
                                0, 0, pool_stride_x, pool_stride_y, pool_dim_im_out_x, pool_dim_im_out_y,
                                NULL, Im_out);
    }


    int final_output_width  =   (pool_en == 1) ? pool_dim_im_out_x : dim_im_out_x;
    int final_output_height =   (pool_en == 1) ? pool_dim_im_out_y : dim_im_out_y;

    if (0){  // only used for debugging 
        // bias 
        EF_UART_writeChar(UART0, 0xA1);
        EF_UART_writeChar(UART0, ch_im_out&0xFF);
        EF_UART_writeChar(UART0, (ch_im_out>>8)&0xFF); 
        for (int i=0; i<ch_im_out; i++){
            EF_UART_writeChar(UART0, bias[i]);
        }

        // bias shift 
        EF_UART_writeChar(UART0, 0xA2);
        EF_UART_writeChar(UART0, ch_im_out&0xFF);
        EF_UART_writeChar(UART0, (ch_im_out>>8)&0xFF); 
        for (int i=0; i<ch_im_out; i++){
            EF_UART_writeChar(UART0, bias_shift[i]);
        }

        // out shift 
        EF_UART_writeChar(UART0, 0xA3);
        EF_UART_writeChar(UART0, ch_im_out&0xFF);
        EF_UART_writeChar(UART0, (ch_im_out>>8)&0xFF); 
        for (int i=0; i<ch_im_out; i++){
            EF_UART_writeChar(UART0, out_shift[i]);
        }

        // input image 
        int in_image_size = dim_im_in_x*dim_im_in_y*ch_im_in;
        EF_UART_writeChar(UART0, 0xA4);
        EF_UART_writeChar(UART0, in_image_size&0xFF);
        EF_UART_writeChar(UART0, (in_image_size>>8)&0xFF); 
        for (int i=0; i<in_image_size; i++){
            EF_UART_writeChar(UART0, Im_in[i]);
        }

        // kernel
        int kernel_size = dim_kernel_x*dim_kernel_y*ch_im_in*ch_im_out; 
        EF_UART_writeChar(UART0, 0xA5);
        EF_UART_writeChar(UART0, kernel_size&0xFF);
        EF_UART_writeChar(UART0, (kernel_size>>8)&0xFF); 
        for (int i=0; i<kernel_size; i++){
            EF_UART_writeChar(UART0, wt[i]);
        }

        // q_type
        EF_UART_writeChar(UART0, 0xA6);
        EF_UART_writeChar(UART0, q_type);

        // output image 
        int out_image_size = ch_im_out * final_output_height * final_output_width;
        EF_UART_writeChar(UART0, 0xA7);
        EF_UART_writeChar(UART0, out_image_size&0xFF);
        EF_UART_writeChar(UART0, (out_image_size>>8)&0xFF); 
        for (int i=0; i<out_image_size; i++){
            EF_UART_writeChar(UART0, Im_out[i]);
        }
    }
}

volatile int layer_counter =0;

nnom_status_t conv2d_accelerator_run(nnom_layer_t *layer)
{
    layer_counter++;
    nnom_conv2d_Accelerator_layer_t *cl = (nnom_conv2d_Accelerator_layer_t *)layer;

    #ifdef NNOM_USING_EFABLESS_GOLDEN_MODEL
        Accelerator_Convolution_golden_model(
                layer->in->tensor->p_data,
                layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                                
                cl->weight->p_data,cl->mid_out.tensor->dim[2],
                cl->kernel.w, cl->kernel.h, cl->stride.w, cl->stride.h,
                                
                cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
                cl->mid_out.tensor->dim[1],cl->mid_out.tensor->dim[0],

                cl->relu_en,
                cl->relu_negative_slope,
                cl->relu_max,
                cl->relu_threshold,
                
                cl->pool_en,
                cl->pool_kernel.w, cl->pool_kernel.h,
                cl->pool_stride.w, cl->pool_stride.h,
                layer->shortcut->in->tensor->dim[1],
                layer->shortcut->in->tensor->dim[0],
                layer->out->tensor->p_data,
                cl->mid_out.tensor->p_data);
    #else

        Accelerator_Convolution(
            layer->in->tensor->p_data,
            layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                            
            cl->weight->p_data,cl->mid_out.tensor->dim[2],
            cl->kernel.w, cl->kernel.h, cl->stride.w, cl->stride.h,
                            
            cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
            cl->mid_out.tensor->dim[1],cl->mid_out.tensor->dim[0],

            cl->relu_en,
            cl->relu_negative_slope,
            cl->relu_max,
            cl->relu_threshold,
            
            cl->pool_en,
            cl->pool_kernel.w, cl->pool_kernel.h,
            cl->pool_stride.w, cl->pool_stride.h,
            layer->shortcut->in->tensor->dim[1],
            layer->shortcut->in->tensor->dim[0],
            layer->out->tensor->p_data);

    if (0) { // only used for debugging 
        EF_UART_writeChar(UART0, 0xA8);
        EF_UART_writeChar(UART0, layer->in->tensor->dim[1]);
        EF_UART_writeChar(UART0, layer->in->tensor->dim[0]); 
        EF_UART_writeChar(UART0, cl->kernel.w); 
        EF_UART_writeChar(UART0, cl->kernel.h); 
        EF_UART_writeChar(UART0, layer->out->tensor->dim[1]); 
        EF_UART_writeChar(UART0, layer->out->tensor->dim[0]); 
        EF_UART_writeChar(UART0, cl->relu_en); 
        EF_UART_writeChar(UART0, cl->pool_en); 
    }

        
    #endif

    return NN_SUCCESS;

}

nnom_status_t conv2d_run(nnom_layer_t *layer)
{
    nnom_conv2d_layer_t *cl = (nnom_conv2d_layer_t *)layer;

#ifdef NNOM_USING_CHW
    // CHW format
    if(layer->in->tensor->bitwidth == 16)
        local_convolve_CHW_q15_nonsquare(
                layer->in->tensor->p_data,
                layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                cl->weight->p_data, layer->out->tensor->dim[2],
                cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h, cl->dilation.w, cl->dilation.h,
                cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
                layer->out->tensor->p_data,
                layer->out->tensor->dim[1], layer->out->tensor->dim[0], NULL, NULL);
    else
        local_convolve_CHW_q7_nonsquare(
                    layer->in->tensor->p_data,
                    layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                    cl->weight->p_data, layer->out->tensor->dim[2],
                    cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h, cl->dilation.w, cl->dilation.h,
                    cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
                    layer->out->tensor->p_data,
                    layer->out->tensor->dim[1], layer->out->tensor->dim[0], NULL, NULL);
    return NN_SUCCESS;
#else
    // HWC format
    #ifdef NNOM_USING_CMSIS_NN
    // current cmsis nn does not support dilation
    if(cl->dilation.w == 1 && cl->dilation.h == 1 && cl->weight->qtype == NNOM_QTYPE_PER_TENSOR)
    {
        // 8 bit cmsis nn
        if(layer->in->tensor->bitwidth == 8)
        {
            //RGB
            // ch_im_in = 3, w = h
            if (layer->in->tensor->dim[2] == 3 && layer->in->tensor->dim[0] == layer->in->tensor->dim[1])
                // squared
                if((cl->kernel.w == cl->kernel.h) && (cl->pad.w == cl->pad.h) && (cl->stride.w == cl->stride.h))
                    return (nnom_status_t)arm_convolve_HWC_q7_RGB(
                        layer->in->tensor->p_data, layer->in->tensor->dim[1], layer->in->tensor->dim[2],
                        cl->weight->p_data,
                        layer->out->tensor->dim[2],
                        cl->kernel.w, cl->pad.w, cl->stride.w,
                        cl->bias->p_data, cl->bias_lshift[0],
                        cl->output_rshift[0], layer->out->tensor->p_data, layer->out->tensor->dim[1],
                        (q15_t *)(layer->comp->mem->blk), NULL);

            // check if can use optimized function
            //    ch_im_in is multiple of 4
            //    ch_im_out is multiple of 2
            if ((layer->in->tensor->dim[2] % 4 == 0) && (layer->out->tensor->dim[2] % 2 == 0))
            {
                // squared
                if((layer->in->tensor->dim[0] == layer->in->tensor->dim[1])
                && (layer->out->tensor->dim[0] == layer->out->tensor->dim[1])
                && (cl->kernel.w == cl->kernel.h) && (cl->pad.w == cl->pad.h) && (cl->stride.w == cl->stride.h))
                {
                    // 1x1 fast
                    if (cl->kernel.w == 1 && cl->kernel.h == 1 && cl->stride.w == 1 && cl->stride.h == 1 && cl->pad.w == 0 && cl->pad.h == 0)
                        return (nnom_status_t)arm_convolve_1x1_HWC_q7_fast_nonsquare(
                            layer->in->tensor->p_data,
                            layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                            cl->weight->p_data,
                            layer->out->tensor->dim[2],
                            cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h,
                            cl->bias->p_data, cl->bias_lshift[0],
                            cl->output_rshift[0], layer->out->tensor->p_data, layer->out->tensor->dim[1], layer->out->tensor->dim[0],
                            (q15_t *)(layer->comp->mem->blk), NULL);
                    // opt square shape
                    else
                        return (nnom_status_t)arm_convolve_HWC_q7_fast(
                            layer->in->tensor->p_data, layer->in->tensor->dim[1], layer->in->tensor->dim[2],
                            cl->weight->p_data,
                            layer->out->tensor->dim[2], cl->kernel.w, cl->pad.w, cl->stride.w,
                            cl->bias->p_data, cl->bias_lshift[0],
                            cl->output_rshift[0], layer->out->tensor->p_data,
                            layer->out->tensor->dim[1], (q15_t *)(layer->comp->mem->blk), NULL);
                }
                // opt none square shape
                else
                    return (nnom_status_t)arm_convolve_HWC_q7_fast_nonsquare(
                        layer->in->tensor->p_data,
                        layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                        cl->weight->p_data, layer->out->tensor->dim[2],
                        cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h,
                        cl->bias->p_data, cl->bias_lshift[0], cl->output_rshift[0],
                        layer->out->tensor->p_data,
                        layer->out->tensor->dim[1], layer->out->tensor->dim[0], (q15_t *)(layer->comp->mem->blk), NULL);
            }
            // none optimized
            else
            {
                // none opt square shape
                if ((layer->in->tensor->dim[0] == layer->in->tensor->dim[1] &&
                    layer->out->tensor->dim[0] == layer->out->tensor->dim[1]) &&
                    (cl->kernel.w == cl->kernel.h) && (cl->pad.w == cl->pad.h) && (cl->stride.w == cl->stride.h))
                    return (nnom_status_t)arm_convolve_HWC_q7_basic(
                        layer->in->tensor->p_data, layer->in->tensor->dim[1], layer->in->tensor->dim[2],
                        cl->weight->p_data,
                        layer->out->tensor->dim[2], cl->kernel.w, cl->pad.w, cl->stride.w,
                        cl->bias->p_data, cl->bias_lshift[0],
                        cl->output_rshift[0], layer->out->tensor->p_data,
                        layer->out->tensor->dim[1], (q15_t *)(layer->comp->mem->blk), NULL);
                // none opt none square shape
                else
                    return (nnom_status_t)arm_convolve_HWC_q7_basic_nonsquare(
                        layer->in->tensor->p_data,
                        layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                        cl->weight->p_data, layer->out->tensor->dim[2],
                        cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h,
                        cl->bias->p_data, cl->bias_lshift[0], cl->output_rshift[0],
                        layer->out->tensor->p_data,
                        layer->out->tensor->dim[1], layer->out->tensor->dim[0], (q15_t *)(layer->comp->mem->blk), NULL);
            } //end of cmsis-nn none-opt
        }  //end of 8 bit cmsis-nn
        else if (layer->in->tensor->bitwidth == 16)
        {
            // fast opt
            if ((layer->in->tensor->dim[2] % 2 == 0) && (layer->out->tensor->dim[2] % 2 == 0))
            {
                if((layer->in->tensor->dim[0] == layer->in->tensor->dim[1])
                    && (layer->out->tensor->dim[0] == layer->out->tensor->dim[1])
                    && (cl->kernel.w == cl->kernel.h) && (cl->pad.w == cl->pad.h) && (cl->stride.w == cl->stride.h))
                    return (nnom_status_t)arm_convolve_HWC_q15_fast(
                        layer->in->tensor->p_data, layer->in->tensor->dim[1], layer->in->tensor->dim[2],
                        cl->weight->p_data,
                        layer->out->tensor->dim[2], cl->kernel.w, cl->pad.w, cl->stride.w,
                        cl->bias->p_data, cl->bias_lshift[0],
                        cl->output_rshift[0], layer->out->tensor->p_data,
                        layer->out->tensor->dim[1], (q15_t *)(layer->comp->mem->blk), NULL);
                else
                    return (nnom_status_t)arm_convolve_HWC_q15_fast_nonsquare(
                        layer->in->tensor->p_data,
                        layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                        cl->weight->p_data, layer->out->tensor->dim[2],
                        cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h,
                        cl->bias->p_data, cl->bias_lshift[0], cl->output_rshift[0],
                        layer->out->tensor->p_data,
                        layer->out->tensor->dim[1], layer->out->tensor->dim[0], (q15_t *)(layer->comp->mem->blk), NULL);
            }
            // none opt basic
            else
            {
                local_convolve_HWC_q7_nonsquare(
                    layer->in->tensor->p_data,
                    layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                    cl->weight->p_data, layer->out->tensor->dim[2],
                    cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h, cl->dilation.w, cl->dilation.h,
                    cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
                    layer->out->tensor->p_data,
                    layer->out->tensor->dim[1], layer->out->tensor->dim[0], NULL, NULL);
                return NN_SUCCESS;
            }

        } // end of 16 bit cmsis-nn
    } // end of dilation == 1
    else
    #endif // NNOM_USING_CMSIS_NN
    {

        if(layer->in->tensor->bitwidth == 16)
        local_convolve_HWC_q15_nonsquare(
                layer->in->tensor->p_data,
                layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                cl->weight->p_data, layer->out->tensor->dim[2],
                cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h, cl->dilation.w, cl->dilation.h,
                cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
                layer->out->tensor->p_data,
                layer->out->tensor->dim[1], layer->out->tensor->dim[0], NULL, NULL);
        else
        local_convolve_HWC_q7_nonsquare(
                    layer->in->tensor->p_data,
                    layer->in->tensor->dim[1], layer->in->tensor->dim[0], layer->in->tensor->dim[2],
                    cl->weight->p_data, layer->out->tensor->dim[2],
                    cl->kernel.w, cl->kernel.h, cl->pad.w, cl->pad.h, cl->stride.w, cl->stride.h, cl->dilation.w, cl->dilation.h,
                    cl->bias->p_data, cl->bias_lshift, cl->output_rshift, cl->weight->qtype,
                    layer->out->tensor->p_data,
                    layer->out->tensor->dim[1], layer->out->tensor->dim[0], NULL, NULL);
        return NN_SUCCESS;
    }
#endif // end of CHW/HWC
    return NN_SUCCESS;
}

