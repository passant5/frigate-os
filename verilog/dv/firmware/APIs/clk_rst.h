#ifndef CLK_RST_H
#define CLK_RST_H
#include <common.h>
#define CLK_RST_BASE		0x23000000

#define DLL_CTRL_BASE           (CLK_RST_BASE + 0x00)
#define DLL_EXT_TRIM_BASE       (CLK_RST_BASE + 0x04)
#define CLK_SRC_EN_BASE         (CLK_RST_BASE + 0x08)
#define CLK_MON_SEL_BASE        (CLK_RST_BASE + 0x0c)
#define MUX_CTRL_BASE           (CLK_RST_BASE + 0x10)
#define CLK_DIV_BASE            (CLK_RST_BASE + 0x14)
#define GCLKS_EN_BASE           (CLK_RST_BASE + 0x18)
#define XO_STANDBY_BASE         (CLK_RST_BASE + 0x1c)
#define USER_CLK_CTRL_BASE      (CLK_RST_BASE + 0x20)

inline void CLK_RST_writeMux(int val) __attribute__((always_inline));
inline void CLK_RST_writeClkDiv(int val) __attribute__((always_inline));

inline void CLK_RST_writeMux(int val){
    *(volatile int*)(MUX_CTRL_BASE) = val;
}


inline void CLK_RST_writeClkDiv(int val){
    *(volatile int*)(CLK_DIV_BASE) = val;
}


void CLK_RST_GCLK_EN(int val){
    *(volatile int*)(GCLKS_EN_BASE) = val;
}

void CLK_RST_SRC_EN(int val){
    *(volatile int*)(CLK_SRC_EN_BASE) = val;
}

void CLK_RST_MON_SEL(int val){
    *(volatile int*)(CLK_MON_SEL_BASE) = val;
}

void CLK_RST_DLL_EN(int val){
    *(volatile int*)(DLL_CTRL_BASE) = val & 0x01;
}

void CLK_RST_USER_CLK_CTRL(int val){
    *(volatile int*)(USER_CLK_CTRL_BASE) = val;
}

#endif // CLK_RST_H