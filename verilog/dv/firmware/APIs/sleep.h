#ifndef SLEEP_H
#define SLEEP_H
#include <hazard3_csr.h>
#include <irqs.h>

void enable_deepSleep(bool enable){
    if (enable){
     	write_csr(hazard3_csr_msleep, 0x1);

    }
    else {
     	write_csr(hazard3_csr_msleep, 0x0);
    }
}


#endif // SLEEP_H