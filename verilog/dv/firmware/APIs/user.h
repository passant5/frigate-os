#ifndef USER_H
#define USER_H
#include <frigate_regs.h>

#define USER_BASE = 0x60000000

void USER_enable_if(){
    
}

void USER_enableRamClk(){
    *(volatile int*)(USER_SRAM + 0xFFFFFC) = 1;
}
void USER_disableRamClk(){
    *(volatile int*)(USER_SRAM + 0xFFFFFC) = 0;
}


#endif // USER_H