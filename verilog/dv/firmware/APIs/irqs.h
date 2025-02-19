#ifndef IRQS_H
#define IRQS_H
#include<hazard3_irq.h>
#define __wfi()         asm volatile ("wfi")

enum IRQ_line {
DMAC_irq     = 0,
USB0_irq     = 1,
GPIOA_irq    = 2,
GPIOB_irq    = 3,
GPIOC_irq    = 4,
GPIOD_irq    = 5,
GPIOE_irq    = 6,
GPIOF_irq    = 7,
GPIOG_irq    = 8,
GPIOH_irq    = 9,
GPIOI_irq    = 10,
UART0_irq    = 11,
UART1_irq    = 12,
UART2_irq    = 13,
UART3_irq    = 14,
TMR0_irq     = 15,
TMR1_irq     = 16,
TMR2_irq     = 17,
TMR3_irq     = 18,
TMR4_irq     = 19,
TMR5_irq     = 20,
WDT0_irq     = 21,
SPI0_irq     = 22,
SPI1_irq     = 23,
I2C0_irq     = 24,
I2C1_irq     = 25,
I2S0_irq     = 26,
ADC0_irq     = 27,
ADC1_irq     = 28,
AUDIODAC_irq = 29,
CAN0_irq     = 30,
HK_irq       = 31,
USER0_irq    = 32,
USER1_irq    = 33,
USER2_irq    = 34,
USER3_irq    = 35,
USER4_irq    = 36,
USER5_irq    = 37,
USER6_irq    = 38,
USER7_irq    = 39,
USER8_irq    = 40,
USER9_irq    = 41,
USER10_irq   = 42,
USER11_irq   = 43,
USER12_irq   = 44,
USER13_irq   = 45,
USER14_irq   = 46,
USER15_irq   = 47 };


void enable_ext_irq(enum IRQ_line irq, bool enable){
    external_irq_enable(true);
    global_irq_enable(true);
    if (enable){
        h3irq_enable(irq, true);
    }
    else{
        h3irq_enable(irq, false);
    }
}

bool ext_irq_pending(enum IRQ_line irq){
    return h3irq_pending(irq);
}
#endif // IRQS_H
