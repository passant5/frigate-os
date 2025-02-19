#ifndef SYSTEM_REGS_H
#define SYSTEM_REGS_H

#define SYSTEM_REGS_BASE_ADDR 0x27000000

#define MUXSPLIT_CTRL_ADDR  (SYSTEM_REGS_BASE_ADDR + 0x0)

#define USER_AHB_EN_ADDR    (SYSTEM_REGS_BASE_ADDR + 0x4)

#define USER_IRQS_EN_ADDR   (SYSTEM_REGS_BASE_ADDR + 0x8)

void SYSREG_setMuxSplitCtrl(int val) {
    *((volatile int *)MUXSPLIT_CTRL_ADDR) = val;
}

void SYSREG_setUserAHBEn(int val) {
    *((volatile int *)USER_AHB_EN_ADDR) = val;
}

void SYSREG_setUserIRQsEn(int val) {
    *((volatile int *)USER_IRQS_EN_ADDR) = val;
}

#endif // SYSTEM_REGS_H