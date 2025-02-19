MEMORY
{
  SRAM     (rwx) : ORIGIN = 0x20000000, LENGTH = 4K
  stack    (rw)  : ORIGIN = 0x20000000 + 3K, LENGTH = 1K
  SRAM_1    (rw) : ORIGIN = 0x48000000, LENGTH = 4K

}

PROVIDE(__stack_top = ORIGIN(stack) + LENGTH(stack) );


/* Section Definitions */
SECTIONS
{
    
    .text : {
        *(.vectors)
        *(.text*)
        *(.rodata*)
        . = ALIGN(8);
        __idata__ = .;
    } > SRAM
    
    .data : 
    {
        __data_start__ = .;
        *(.data*);
        __data_end__ = .;
        _edata = .;
    PROVIDE( __global_pointer$ = . + 0x800 );
        
    } > SRAM_1
    
    .bss (NOLOAD) :
    {
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
        _end = .;
    } > SRAM_1


}