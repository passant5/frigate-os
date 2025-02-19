#include "hazard3_csr.h"

#define IO_BASE 0x80000000
#define IO_PRINT_CHAR (IO_BASE + 0x0)
#define IO_PRINT_U32  (IO_BASE + 0x4)
#define IO_EXIT       (IO_BASE + 0x8)

// Provide trap vector table, reset handler and weak default trap handlers for
// Hazard3. This is not a crt0: the reset handler calls an external _start

.option push
.option norelax

.section .vectors

.macro VEC name:req
.p2align 2
j \name
.p2align 2
.endm

// ----------------------------------------------------------------------------
// Vector table (must be at least aligned to its size rounded up to power of 2)

.p2align 12
.vector_table:

// Single exception vector, also takes IRQs if vectoring is disabled

	VEC handle_exception

// Standard interrupts, if vectoring is enabled
// Note: global EIRQ does not fire. Instead we have 16 separate vectors

	// handle_exception ^^^ takes the slot where U-mode softirq would be
	VEC .halt
	VEC .halt
	VEC isr_machine_softirq
	VEC .halt
	VEC .halt
	VEC .halt
	VEC isr_machine_timer
	VEC .halt
	VEC .halt
	VEC .halt
	VEC isr_external_irq
	VEC .halt
	VEC .halt
	VEC .halt
	VEC .halt

// ----------------------------------------------------------------------------
// Reset handler


.reset_handler:
	// Set counters running, as they are off by default. This may trap if counters
	// are unimplemented, so catch the trap and continue.
	la a0, 1f
	csrw mtvec, a0
	csrci mcountinhibit, 0x5
.p2align 2
1:
	// Set up trap vector table. mtvec LSB enables vectoring
	la a0, .vector_table + 1
	csrw mtvec, a0

	// Put spare cores to sleep before setting up core 0 stack
	csrr a0, mhartid
	bnez a0, .core1_wait

	jal _start
	j .halt

_start:
	# enable gating for ahb1
	li a0, 0x3  # Load the value 1 into temporary register a0
	lui	a1,0x23000
	sw a0, 24(a1)   # Store the value in a0 at address 0x23000018

	# enable gating for user
	li a0, 1  # Load the value 1 into temporary register a0
	lui	a1,0x23000
	sw a0, 32(a1)   # Store the value in a0 at address 0x23000020
	
	# enable user interface 
	li  a0, 1  # Load the value 1 into temporary register a0
	lui	a1,0x27000
 	sw	a0,4(a1) # Store the value in a0 at address 0x27000004

	# enable USER RAM clock 
	li a0, 1  # Load the value 1 into temporary register a0
	lui	a1,0x6d000
	sw a0, -4(a1)   # Store the value in a0 at address 0x6CFFFFFC (0x6d000000 - 4)

	# use external clock instead of ring clock
	li a0, 14  # Load the value 14 into temporary register a0
	lui	a1,0x23000
	sw a0, 16(a1)  # Store the value in a0 at address 0x23000010
	# enable clock for ahb0
	li a0, 2  # Load the value 2 into temporary register a0
	lui	a1,0x23000
	sw a0, 24(a1)  # Store the value in a0 at address 0x23000024
    # enable user interface to use ram for flashing
	# write 0x1 to address 0x27000004
	li a0, 0x1  # Load the value 0x1 into temporary register a0
	lui	a1,0x27000
	sw a0, 4(a1)  # Store the value in a0 at address 0x27000004
    j		___App


.align 8
___App:
	# Initialize the BSS section with 0s
init_bss:	
	la a0, __bss_start__
	la a1, __bss_end__
	bge a0, a1, end_init_bss
loop_init_bss:
	sw zero, 0(a0)
	addi a0, a0, 4
	blt a0, a1, loop_init_bss
end_init_bss:

# Initialize the sram data section with 0s
init_sram_data:	
	la a0, __sram_data_start__
	la a1, __sram_data_end__
	bge a0, a1, end_init_sram_data
loop_init_sram_data:
	sw zero, 0(a0)
	addi a0, a0, 4
	blt a0, a1, loop_init_sram_data
end_init_sram_data:

	# Move initialized data to RAM
init_data:
	la a0, __idata__
	la a1, __data_start__
	la a2, __data_end__
	bge a1, a2, end_init_data
loop_init_data:
	lw a3, 0(a0)
	sw a3, 0(a1)
	addi a0, a0, 4
	addi a1, a1, 4
	blt a1, a2, loop_init_data
end_init_data:

	# Move sram code to RAM
init_sram_code:
	la a0, __sram_text_lma_start__
	la a1, __sram_text_vma_start__
	la a2, __sram_text_vma_end__
	bge a1, a2, end_init_sram_code
loop_init_sram_code:
	lw a3, 0(a0)
	sw a3, 0(a1)
	addi a0, a0, 4
	addi a1, a1, 4
	blt a1, a2, loop_init_sram_code
end_init_sram_code:

	# Initialize the stack pointer!
	// Set up stack pointer before doing anything else
	la sp, __stack_top
	jal main
	
    # Infinite loop after main
infinite_loop:
    j infinite_loop

	.align 8


.core1_wait:
	// IRQs disabled, but soft IRQ unmasked -> soft IRQ will exit WFI.
	csrci mstatus, 0x8
	csrw mie, 0x8
.core1_wait_loop:
	wfi
	la a0, core1_entry_vector
	lw a0, (a0)
	beqz a0, .core1_wait_loop
	la sp, __stack_top - 0x10000
	jalr a0
.core1_finish:
	wfi
	j .core1_finish

.p2align 2
.global core1_entry_vector
core1_entry_vector:
	.word 0

.global _exit
_exit:
	li a1, IO_EXIT
	sw a0, (a1)

.global _sbrk
_sbrk:
	la a1, heap_ptr
	lw a2, (a1)
	add a0, a0, a2
	sw a0, (a1)
	mv a0, a2
	ret

.p2align 2
heap_ptr:
	.word _end

.global .halt
.halt:
	j .halt

progname:
	.asciz "hazard3-testbench"

// ----------------------------------------------------------------------------
// Weak handler/ISR symbols

// Routine to print out trap name, trap address, and some core registers
// (x8..x15, ra, sp). The default  handlers are all patched into this routine,
// so the CPU will print some basic diagnostics on any unhandled trap
// (assuming the processor is not internally completely broken)

// argument in x28, return in x27, trashes x28...x30
_tb_puts:
	li x29, IO_PRINT_CHAR
1:
	lbu x30, (x28)
	addi x28, x28, 1
	beqz x30, 2f
	sw x30, (x29)
	j 1b
2:
	jr x27

.macro print_reg str reg
	la x28, \str
	jal x27, _tb_puts
	sw \reg, (x31)
.endm

_weak_handler_name_in_x31:
	la x28, _str_unhandled_trap
	jal x27, _tb_puts
	mv x28, x31
	jal x27, _tb_puts
	la x28, _str_at_mepc
	jal x27, _tb_puts
	li x31, IO_PRINT_U32
	csrr x28, mepc
	sw x28, (x31)
	csrr x26, mcause
	bltz x26, 1f
	print_reg _str_mcause x26
1:
	print_reg _str_s0 s0
	print_reg _str_s1 s1
	print_reg _str_a0 a0
	print_reg _str_a1 a1
	print_reg _str_a2 a2
	print_reg _str_a3 a3
	print_reg _str_a4 a4
	print_reg _str_a5 a5
	print_reg _str_ra ra
	print_reg _str_sp sp
	li x31, IO_EXIT
	li x30, -1
	sw x30, (x31)
	// Should be unreachable:
	j .halt

_str_unhandled_trap: .asciz "*** Unhandled trap ***\n"
_str_at_mepc:        .asciz " @ mepc = "
_str_mcause:         .asciz "                 mcause = "
_str_s0:             .asciz "s0: "
_str_s1:             .asciz "s1: "
_str_a0:             .asciz "a0: "
_str_a1:             .asciz "a1: "
_str_a2:             .asciz "a2: "
_str_a3:             .asciz "a3: "
_str_a4:             .asciz "a4: "
_str_a5:             .asciz "a5: "
_str_ra:             .asciz "ra: "
_str_sp:             .asciz "sp: "

// Provide a default weak handler for each trap, which calls into the above
// diagnostic routine with the trap name (a null-terminated string) in x31

.macro weak_handler name:req
.p2align 2
.global \name
.weak \name
\name:
	la x31, _str_\name
	j _weak_handler_name_in_x31
_str_\name:
	.asciz "\name"
.endm

weak_handler handle_exception
weak_handler isr_machine_softirq
weak_handler isr_machine_timer
weak_handler isr_external_irq




// You can relax now
.option pop