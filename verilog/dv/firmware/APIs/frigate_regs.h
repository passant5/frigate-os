#ifndef FRIGATE_REGS_H
#define FRIGATE_REGS_H

enum gpio_select
{
    PORT_A = 0x40000000,
    PORT_B = 0x40010000,
    PORT_C = 0x40020000,
    PORT_D = 0x40030000,
    PORT_E = 0x40040000,
    PORT_F = 0x40050000,
    PORT_G = 0x40060000,
    PORT_H = 0x40070000,
    PORT_I = 0x40080000,
    PORT_J = 0x40090000
};

enum i2s_select
{
    I2S0 = 0x40090000,
    I2S1 = 0x400A0000
};

enum uart_select
{
    UART0 = 0x42000000,
    UART1 = 0x42010000,
    UART2 = 0x42020000,
    UART3 = 0x42030000
};

enum tmr_select
{
    TMR0 = 0x42040000,
    TMR1 = 0x42050000,
    TMR2 = 0x42060000,
    TMR3 = 0x42070000,
    TMR4 = 0x42080000,
    TMR5 = 0x42090000,

};

enum wdt_select{

    WDT0 = 0x420A0000
};

enum spi_select
{
    SPI0 = 0x420B0000,
    SPI1 = 0x420C0000
};


enum i2c_select
{
    I2C0 = 0x420D0000,
    I2C1 = 0x420E0000
};

enum analog_regs
{
    ANALOG_REGS= 0x420F0000
};

enum user_select {
    USER_GPIO0    = 0x60000000,
    USER_GPIO1    = 0x61000000,
    USER_GPIO2    = 0x62000000,
    USER_GPIO3    = 0x63000000,
    USER_GPIO4    = 0x64000000,
    USER_GPIO5    = 0x65000000,
    USER_GPIO6    = 0x66000000,
    USER_GPIO7    = 0x67000000,
    USER_SIO      = 0x68000000,
    USER_AES      = 0x69000000,
    USER_SHA      = 0x6a000000,
    USER_CONV2D   = 0x6b000000,
    USER_SRAM     = 0x6c000000,
    USER_SP_FPU   = 0x6d000000
};

enum pin_mux_select{
    PIN_MUX_BASE = 0x25000000     
};

enum sys_regs{
    SYS_REGS = 0x27000000
};

void dummyDelay(int num){
    for (volatile int i=0;i < num;i++){
        __asm__("nop");  // delay until the input is provided
    }
}

#endif
