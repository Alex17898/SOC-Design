	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/caravel-soc_fpga-lab-main/lab-caravel_fir/testbench/counter_la_fir" "fir.c"
	.globl	taps
	.data
	.align	2
	.type	taps, @object
	.size	taps, 44
taps:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.globl	inputbuffer
	.bss
	.align	2
	.type	inputbuffer, @object
	.size	inputbuffer, 44
inputbuffer:
	.zero	44
	.globl	x
	.align	2
	.type	x, @object
	.size	x, 256
x:
	.zero	256
	.globl	y
	.align	2
	.type	y, @object
	.size	y, 256
y:
	.zero	256
	.globl	expect
	.data
	.align	2
	.type	expect, @object
	.size	expect, 256
expect:
	.word	0
	.word	-10
	.word	-29
	.word	-25
	.word	35
	.word	158
	.word	337
	.word	539
	.word	732
	.word	915
	.word	1098
	.word	1281
	.word	1464
	.word	1647
	.word	1830
	.word	2013
	.word	2196
	.word	2379
	.word	2562
	.word	2745
	.word	2928
	.word	3111
	.word	3294
	.word	3477
	.word	3660
	.word	3843
	.word	4026
	.word	4209
	.word	4392
	.word	4575
	.word	4758
	.word	4941
	.word	5124
	.word	5307
	.word	5490
	.word	5673
	.word	5856
	.word	6039
	.word	6222
	.word	6405
	.word	6588
	.word	6771
	.word	6954
	.word	7137
	.word	7320
	.word	7503
	.word	7686
	.word	7869
	.word	8052
	.word	8235
	.word	8418
	.word	8601
	.word	8784
	.word	8967
	.word	9150
	.word	9333
	.word	9516
	.word	9699
	.word	9882
	.word	10065
	.word	10248
	.word	10431
	.word	10614
	.word	10797
	.text
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB316:
	.file 2 "fir.c"
	.loc 2 5 61
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 8 10
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 8 42
	li	a4,10813440
	sw	a4,0(a5)
.LBB2:
	.loc 2 9 10
	sw	zero,-20(s0)
	.loc 2 9 2
	j	.L4
.L5:
	.loc 2 10 8 discriminator 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 10 40 discriminator 3
	li	a4,-1419771904
	sw	a4,0(a5)
	.loc 2 11 47 discriminator 3
	lui	a5,%hi(taps)
	addi	a4,a5,%lo(taps)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 2 11 8 discriminator 3
	li	a5,805306368
	.loc 2 11 41 discriminator 3
	sw	a4,0(a5)
	.loc 2 9 21 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L4:
	.loc 2 9 15 discriminator 1
	lw	a4,-20(s0)
	li	a5,10
	ble	a4,a5,.L5
.LBE2:
	.loc 2 13 4
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 13 36
	li	a4,-1419771904
	sw	a4,0(a5)
	.loc 2 14 3
	li	a5,805306368
	.loc 2 14 36
	li	a4,64
	sw	a4,0(a5)
.LBB3:
	.loc 2 15 11
	sw	zero,-24(s0)
	.loc 2 15 3
	j	.L6
.L10:
	.loc 2 16 11
	lw	a5,-24(s0)
	addi	a4,a5,1
	.loc 2 16 9
	lui	a5,%hi(x)
	addi	a3,a5,%lo(x)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 2 17 6
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 17 38
	li	a4,-1419771904
	sw	a4,0(a5)
	.loc 2 18 41
	lui	a5,%hi(x)
	addi	a4,a5,%lo(x)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 2 18 5
	li	a5,805306368
	.loc 2 18 38
	sw	a4,0(a5)
.L9:
	.loc 2 20 10
	li	a5,805306368
	lw	a5,0(a5)
	.loc 2 20 50
	lui	a4,%hi(expect)
	addi	a3,a4,%lo(expect)
	lw	a4,-24(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	.loc 2 20 8
	bne	a5,a4,.L9
	.loc 2 21 19
	lui	a5,%hi(expect)
	addi	a4,a5,%lo(expect)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 2 21 12
	lui	a5,%hi(y)
	addi	a3,a5,%lo(y)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 2 22 9
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 22 41
	li	a4,-1419706368
	sw	a4,0(a5)
	.loc 2 23 8
	nop
	.loc 2 15 21
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L6:
	.loc 2 15 16 discriminator 1
	lw	a4,-24(s0)
	li	a5,63
	ble	a4,a5,.L10
.LBE3:
	.loc 2 27 51
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	lw	a5,252(a5)
	.loc 2 27 55
	slli	a4,a5,24
	.loc 2 27 48
	li	a5,5898240
	or	a5,a4,a5
	.loc 2 27 61
	mv	a3,a5
	.loc 2 27 4
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 27 61
	li	a4,-65536
	and	a4,a3,a4
	.loc 2 27 36
	sw	a4,0(a5)
	.loc 2 28 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	initfir, .-initfir
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB317:
	.loc 2 30 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 31 2
	call	initfir
	.loc 2 33 9
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	.loc 2 34 1
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	fir, .-fir
	.text
.Letext0:
	.file 3 "fir.h"
	.file 4 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x164
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.4byte	.LASF16
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x3
	.4byte	0x3d
	.4byte	0x36
	.byte	0x4
	.4byte	0x36
	.byte	0xa
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF3
	.byte	0x6
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x2
	.4byte	.LASF4
	.byte	0x7
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x3
	.4byte	0x3d
	.4byte	0x74
	.byte	0x4
	.4byte	0x36
	.byte	0x3f
	.byte	0
	.byte	0x5
	.string	"x"
	.byte	0x9
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	x
	.byte	0x5
	.string	"y"
	.byte	0xa
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	y
	.byte	0x2
	.4byte	.LASF5
	.byte	0xb
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	expect
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.byte	0xa
	.4byte	.LASF17
	.byte	0x4
	.byte	0x34
	.byte	0x1b
	.4byte	0xd6
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0xb
	.string	"fir"
	.byte	0x2
	.byte	0x1e
	.byte	0x33
	.4byte	0xfa
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.byte	0x4
	.4byte	0x3d
	.byte	0xd
	.4byte	.LASF18
	.byte	0x2
	.byte	0x5
	.byte	0x33
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x147
	.byte	0xe
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x130
	.byte	0x6
	.string	"i"
	.byte	0x9
	.byte	0xa
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xf
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x6
	.string	"n"
	.byte	0xf
	.byte	0xb
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF14
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF15
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x25
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"initfir"
.LASF14:
	.string	"flush_cpu_dcache"
.LASF5:
	.string	"expect"
.LASF10:
	.string	"unsigned char"
.LASF12:
	.string	"long unsigned int"
.LASF11:
	.string	"short unsigned int"
.LASF17:
	.string	"uint32_t"
.LASF16:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF13:
	.string	"long long unsigned int"
.LASF15:
	.string	"flush_cpu_icache"
.LASF9:
	.string	"long long int"
.LASF7:
	.string	"short int"
.LASF4:
	.string	"inputbuffer"
.LASF8:
	.string	"long int"
.LASF6:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"fir.c"
.LASF1:
	.string	"/home/ubuntu/caravel-soc_fpga-lab-main/lab-caravel_fir/testbench/counter_la_fir"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
