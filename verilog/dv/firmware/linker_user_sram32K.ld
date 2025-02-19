
MEMORY
{
  FLASH         (rx)  : ORIGIN = 0x00000000, LENGTH = 1024K
  SRAM          (rwx) : ORIGIN = 0x20000000, LENGTH = 8K
  stack         (rw)  : ORIGIN = 0x48000000, LENGTH = 8K
  USER_SRAM     (rwx) : ORIGIN = 0x6C000000, LENGTH = 32K
}

PROVIDE(__stack_top = ORIGIN(stack) + LENGTH(stack) );


/* Section Definitions */
SECTIONS
{
    
    .text : {
        *(.vectors)
        *(.text*)
        *(.rodata*)
        *(.srodata.cst16) 
        *(.srodata.cst8) 
        *(.srodata.cst4) 
        *(.srodata.cst2) 
        *(.srodata .srodata.*) 
        . = ALIGN(8);
        __idata__ = .;

    } > FLASH


     .data : 
    {
        __data_start__ = .;
        *(.sdata .sdata.* .gnu.linkonce.s.*)
        *(.data*);
        __data_end__ = .;
    PROVIDE( __global_pointer$ = . + 0x800 );
        
    } > USER_SRAM AT > FLASH

    /* Custom section for code to be executed from soc sram*/
    .sram_text () :
    {
        __sram_text_lma_start__ = LOADADDR(.sram_text);
        __sram_text_vma_start__ = .;
        *(.sram_text*)
        __sram_text_vma_end__ = .;

    } > SRAM AT > FLASH
    
    .sram_data ():
    {
        __sram_data_start__ = .;
        *(.sram_data*)
        __sram_data_end__ = .;

    } > SRAM

    .bss (NOLOAD) :
    {
        __bss_start__ = .;
        *(.sbss*)
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
        _end = .;
    } > USER_SRAM
    
}