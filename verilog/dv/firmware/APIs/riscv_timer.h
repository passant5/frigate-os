#ifndef RISCV_TIMER_H
#define RISCV_TIMER_H
#include <common.h>
#define RISCV_TIMER_BASE		0x400E0000

#define RISCV_TIMER_CTRL		(RISCV_TIMER_BASE + 0x0)
#define RISCV_TIMER_MTIME		(RISCV_TIMER_BASE + 0x8)
#define RISCV_TIMER_MTIMEH		(RISCV_TIMER_BASE + 0xc)
#define RISCV_TIMER_MTIMECMP	(RISCV_TIMER_BASE + 0x10)
#define RISCV_TIMER_MTIMECMPH	(RISCV_TIMER_BASE + 0x14)


void riscv_timer_en(void){
    *(volatile int*)RISCV_TIMER_CTRL = 0x1;
}

void risc_timer_setMtime(int high, int low){
    *(volatile int*)RISCV_TIMER_MTIME = low;
    *(volatile int*)RISCV_TIMER_MTIMEH = high;
}

void risc_timer_setMtimecmp(int high, int low){
    *(volatile int*)RISCV_TIMER_MTIMECMP = low;
    *(volatile int*)RISCV_TIMER_MTIMECMPH = high;
}
#endif // RISCV_TIMER_H