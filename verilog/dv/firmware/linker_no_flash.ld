
MEMORY
{
  SRAM1    (rx)  : ORIGIN = 0x48000000, LENGTH = 8K
  SRAM     (rwx) : ORIGIN = 0x20000000 , LENGTH = 7K
  stack    (rw)  : ORIGIN = 0x20000000 + 7K, LENGTH = 1K
}

/* when run long program that needs long stack
  SRAM     (rwx) : ORIGIN = 0x48000000, LENGTH = 8K
  stack    (rw)  : ORIGIN = 0x20000000, LENGTH = 8K
*/
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
    } > SRAM1


    .data : 
    {
        __data_start__ = .;
        *(.sdata .sdata.* .gnu.linkonce.s.*)
        *(.data*);
        __data_end__ = .;
        _edata = .;
    PROVIDE( __global_pointer$ = . + 0x800 );
        
    } > SRAM AT > SRAM1
    
    .bss (NOLOAD) :
    {
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
        _end = .;
    } > SRAM

    


}