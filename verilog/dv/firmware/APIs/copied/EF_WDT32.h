#ifndef EF_WDT32_H
#define EF_WDT32_H

#include <EF_WDT32_regs.h>
#include <stdint.h>
#include <stdbool.h>

void WDT32_enable(uint32_t wdt_base, int is_enable);

int WDT32_readTimer(uint32_t wdt_base);

int WDT32_loadTimer(uint32_t wdt_base, int load_val);

int WDT32_getRIS(uint32_t wdt_base);

int WDT32_getMIS(uint32_t wdt_base);

void WDT32_setIM(uint32_t wdt_base, int mask);

int WDT32_getIM(uint32_t wdt_base);

void WDT32_setICR(uint32_t wdt_base, int mask);


#endif