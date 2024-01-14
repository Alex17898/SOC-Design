	.file	"counter_la_uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/caravel-soc_fpga-lab-main/Final/Final/lab-wlos_baseline/testbench/uart" "counter_la_uart.c"
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
	.align	2
	.type	csr_write_simple, @function
csr_write_simple:
.LFB23:
	.file 2 "../../firmware/hw/common.h"
	.loc 2 33 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 2 34 5
	lw	a5,-24(s0)
	.loc 2 34 32
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 2 35 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	csr_write_simple, .-csr_write_simple
	.align	2
	.type	user_irq_0_ev_enable_write, @function
user_irq_0_ev_enable_write:
.LFB209:
	.file 3 "../../firmware/csr.h"
	.loc 3 805 59
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 3 806 2
	li	a5,-268406784
	addi	a1,a5,-2028
	lw	a0,-20(s0)
	call	csr_write_simple
	.loc 3 807 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE209:
	.size	user_irq_0_ev_enable_write, .-user_irq_0_ev_enable_write
	.align	2
	.type	irq_getmask, @function
irq_getmask:
.LFB318:
	.file 4 "../../firmware/irq_vex.h"
	.loc 4 23 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 4 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	.loc 4 26 9
	lw	a5,-20(s0)
	.loc 4 27 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	irq_getmask, .-irq_getmask
	.align	2
	.type	irq_setmask, @function
irq_setmask:
.LFB319:
	.loc 4 30 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 4 31 2
	lw	a5,-20(s0)
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
	.loc 4 32 1
 #NO_APP
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE319:
	.size	irq_setmask, .-irq_setmask
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB321:
	.file 5 "counter_la_uart.c"
	.loc 5 47 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 5 77 6
	li	a5,-268419072
	addi	a5,a5,-2048
	.loc 5 77 53
	li	a4,1
	sw	a4,0(a5)
	.loc 5 79 6
	li	a5,637534208
	addi	a5,a5,160
	.loc 5 79 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 80 6
	li	a5,637534208
	addi	a5,a5,156
	.loc 5 80 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 81 6
	li	a5,637534208
	addi	a5,a5,152
	.loc 5 81 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 82 6
	li	a5,637534208
	addi	a5,a5,148
	.loc 5 82 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 83 6
	li	a5,637534208
	addi	a5,a5,144
	.loc 5 83 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 84 6
	li	a5,637534208
	addi	a5,a5,140
	.loc 5 84 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 85 6
	li	a5,637534208
	addi	a5,a5,136
	.loc 5 85 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 86 6
	li	a5,637534208
	addi	a5,a5,132
	.loc 5 86 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 87 6
	li	a5,637534208
	addi	a5,a5,128
	.loc 5 87 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 88 6
	li	a5,637534208
	addi	a5,a5,124
	.loc 5 88 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 89 6
	li	a5,637534208
	addi	a5,a5,120
	.loc 5 89 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 90 6
	li	a5,637534208
	addi	a5,a5,116
	.loc 5 90 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 91 6
	li	a5,637534208
	addi	a5,a5,112
	.loc 5 91 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 92 6
	li	a5,637534208
	addi	a5,a5,108
	.loc 5 92 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 93 6
	li	a5,637534208
	addi	a5,a5,104
	.loc 5 93 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 94 6
	li	a5,637534208
	addi	a5,a5,100
	.loc 5 94 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 96 6
	li	a5,637534208
	addi	a5,a5,96
	.loc 5 96 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 97 6
	li	a5,637534208
	addi	a5,a5,92
	.loc 5 97 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 98 6
	li	a5,637534208
	addi	a5,a5,88
	.loc 5 98 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 99 6
	li	a5,637534208
	addi	a5,a5,84
	.loc 5 99 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 100 6
	li	a5,637534208
	addi	a5,a5,80
	.loc 5 100 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 101 6
	li	a5,637534208
	addi	a5,a5,76
	.loc 5 101 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 102 6
	li	a5,637534208
	addi	a5,a5,72
	.loc 5 102 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 103 6
	li	a5,637534208
	addi	a5,a5,68
	.loc 5 103 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 104 6
	li	a5,637534208
	addi	a5,a5,64
	.loc 5 104 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 105 6
	li	a5,637534208
	addi	a5,a5,52
	.loc 5 105 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 106 6
	li	a5,637534208
	addi	a5,a5,48
	.loc 5 106 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 107 6
	li	a5,637534208
	addi	a5,a5,44
	.loc 5 107 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 108 6
	li	a5,637534208
	addi	a5,a5,40
	.loc 5 108 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 109 6
	li	a5,637534208
	addi	a5,a5,36
	.loc 5 109 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 5 111 6
	li	a5,637534208
	addi	a5,a5,60
	.loc 5 111 39
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 5 112 6
	li	a5,637534208
	addi	a5,a5,56
	.loc 5 112 39
	li	a4,1026
	sw	a4,0(a5)
	.loc 5 116 3
	li	a5,637534208
	.loc 5 116 36
	li	a4,1
	sw	a4,0(a5)
	.loc 5 117 8
	nop
.L9:
	.loc 5 117 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 5 117 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L9
	.loc 5 121 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 5 121 114
	li	a5,0
	sw	a5,0(a4)
	.loc 5 121 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 5 121 57
	sw	a5,0(a4)
	.loc 5 122 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 5 122 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 5 122 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 5 122 56
	sw	a5,0(a4)
	.loc 5 123 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 5 123 112
	li	a5,0
	sw	a5,0(a4)
	.loc 5 123 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 5 123 56
	sw	a5,0(a4)
	.loc 5 124 53
	li	a4,-268423168
	.loc 5 124 100
	li	a5,0
	sw	a5,0(a4)
	.loc 5 124 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 5 124 50
	sw	a5,0(a4)
	.loc 5 127 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 127 36
	li	a4,-1421869056
	sw	a4,0(a5)
	.loc 5 130 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 5 130 56
	sw	zero,0(a5)
	.loc 5 133 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 5 133 112
	li	a5,0
	sw	a5,0(a4)
	.loc 5 133 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 5 133 56
	sw	a5,0(a4)
.LBB2:
	.loc 5 143 10
	sw	zero,-20(s0)
	.loc 5 143 2
	j	.L10
.L11:
	.loc 5 144 4 discriminator 3
	lw	a0,-20(s0)
	call	uart_write
	.loc 5 143 27 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L10:
	.loc 5 143 19 discriminator 1
	lw	a4,-20(s0)
	li	a5,99
	ble	a4,a5,.L11
.LBE2:
	.loc 5 147 14
	call	fir
	sw	a0,-24(s0)
	.loc 5 148 38
	lw	a5,-24(s0)
	lw	a5,0(a5)
	.loc 5 148 44
	slli	a4,a5,16
	.loc 5 148 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 148 36
	sw	a4,0(a5)
	.loc 5 149 44
	lw	a5,-24(s0)
	addi	a5,a5,4
	.loc 5 149 38
	lw	a5,0(a5)
	.loc 5 149 48
	slli	a4,a5,16
	.loc 5 149 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 149 36
	sw	a4,0(a5)
	.loc 5 150 44
	lw	a5,-24(s0)
	addi	a5,a5,8
	.loc 5 150 38
	lw	a5,0(a5)
	.loc 5 150 48
	slli	a4,a5,16
	.loc 5 150 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 150 36
	sw	a4,0(a5)
	.loc 5 151 44
	lw	a5,-24(s0)
	addi	a5,a5,12
	.loc 5 151 38
	lw	a5,0(a5)
	.loc 5 151 48
	slli	a4,a5,16
	.loc 5 151 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 151 36
	sw	a4,0(a5)
	.loc 5 152 44
	lw	a5,-24(s0)
	addi	a5,a5,16
	.loc 5 152 38
	lw	a5,0(a5)
	.loc 5 152 48
	slli	a4,a5,16
	.loc 5 152 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 152 36
	sw	a4,0(a5)
	.loc 5 153 44
	lw	a5,-24(s0)
	addi	a5,a5,20
	.loc 5 153 38
	lw	a5,0(a5)
	.loc 5 153 48
	slli	a4,a5,16
	.loc 5 153 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 153 36
	sw	a4,0(a5)
	.loc 5 154 44
	lw	a5,-24(s0)
	addi	a5,a5,24
	.loc 5 154 38
	lw	a5,0(a5)
	.loc 5 154 48
	slli	a4,a5,16
	.loc 5 154 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 154 36
	sw	a4,0(a5)
	.loc 5 155 44
	lw	a5,-24(s0)
	addi	a5,a5,28
	.loc 5 155 38
	lw	a5,0(a5)
	.loc 5 155 48
	slli	a4,a5,16
	.loc 5 155 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 155 36
	sw	a4,0(a5)
	.loc 5 156 44
	lw	a5,-24(s0)
	addi	a5,a5,32
	.loc 5 156 38
	lw	a5,0(a5)
	.loc 5 156 48
	slli	a4,a5,16
	.loc 5 156 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 156 36
	sw	a4,0(a5)
	.loc 5 157 44
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 5 157 38
	lw	a5,0(a5)
	.loc 5 157 48
	slli	a4,a5,16
	.loc 5 157 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 157 36
	sw	a4,0(a5)
	.loc 5 158 44
	lw	a5,-24(s0)
	addi	a5,a5,40
	.loc 5 158 38
	lw	a5,0(a5)
	.loc 5 158 49
	slli	a4,a5,16
	.loc 5 158 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 158 36
	sw	a4,0(a5)
	.loc 5 159 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 159 36
	li	a4,-1421803520
	sw	a4,0(a5)
	.loc 5 161 14
	call	matmul
	sw	a0,-28(s0)
	.loc 5 162 38
	lw	a5,-28(s0)
	lw	a5,0(a5)
	.loc 5 162 44
	slli	a4,a5,16
	.loc 5 162 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 162 36
	sw	a4,0(a5)
	.loc 5 163 44
	lw	a5,-28(s0)
	addi	a5,a5,4
	.loc 5 163 38
	lw	a5,0(a5)
	.loc 5 163 48
	slli	a4,a5,16
	.loc 5 163 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 163 36
	sw	a4,0(a5)
	.loc 5 164 44
	lw	a5,-28(s0)
	addi	a5,a5,8
	.loc 5 164 38
	lw	a5,0(a5)
	.loc 5 164 48
	slli	a4,a5,16
	.loc 5 164 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 164 36
	sw	a4,0(a5)
	.loc 5 165 44
	lw	a5,-28(s0)
	addi	a5,a5,12
	.loc 5 165 38
	lw	a5,0(a5)
	.loc 5 165 48
	slli	a4,a5,16
	.loc 5 165 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 165 36
	sw	a4,0(a5)
	.loc 5 166 44
	lw	a5,-28(s0)
	addi	a5,a5,36
	.loc 5 166 38
	lw	a5,0(a5)
	.loc 5 166 48
	slli	a4,a5,16
	.loc 5 166 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 166 36
	sw	a4,0(a5)
	.loc 5 167 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 167 36
	li	a4,-1421737984
	sw	a4,0(a5)
	.loc 5 169 14
	call	qsort
	sw	a0,-32(s0)
	.loc 5 170 38
	lw	a5,-32(s0)
	lw	a5,0(a5)
	.loc 5 170 44
	slli	a4,a5,16
	.loc 5 170 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 170 36
	sw	a4,0(a5)
	.loc 5 171 44
	lw	a5,-32(s0)
	addi	a5,a5,4
	.loc 5 171 38
	lw	a5,0(a5)
	.loc 5 171 48
	slli	a4,a5,16
	.loc 5 171 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 171 36
	sw	a4,0(a5)
	.loc 5 172 44
	lw	a5,-32(s0)
	addi	a5,a5,8
	.loc 5 172 38
	lw	a5,0(a5)
	.loc 5 172 48
	slli	a4,a5,16
	.loc 5 172 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 172 36
	sw	a4,0(a5)
	.loc 5 173 44
	lw	a5,-32(s0)
	addi	a5,a5,12
	.loc 5 173 38
	lw	a5,0(a5)
	.loc 5 173 48
	slli	a4,a5,16
	.loc 5 173 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 173 36
	sw	a4,0(a5)
	.loc 5 174 44
	lw	a5,-32(s0)
	addi	a5,a5,16
	.loc 5 174 38
	lw	a5,0(a5)
	.loc 5 174 48
	slli	a4,a5,16
	.loc 5 174 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 174 36
	sw	a4,0(a5)
	.loc 5 175 44
	lw	a5,-32(s0)
	addi	a5,a5,20
	.loc 5 175 38
	lw	a5,0(a5)
	.loc 5 175 48
	slli	a4,a5,16
	.loc 5 175 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 175 36
	sw	a4,0(a5)
	.loc 5 176 44
	lw	a5,-32(s0)
	addi	a5,a5,24
	.loc 5 176 38
	lw	a5,0(a5)
	.loc 5 176 48
	slli	a4,a5,16
	.loc 5 176 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 176 36
	sw	a4,0(a5)
	.loc 5 177 44
	lw	a5,-32(s0)
	addi	a5,a5,28
	.loc 5 177 38
	lw	a5,0(a5)
	.loc 5 177 48
	slli	a4,a5,16
	.loc 5 177 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 177 36
	sw	a4,0(a5)
	.loc 5 178 44
	lw	a5,-32(s0)
	addi	a5,a5,32
	.loc 5 178 38
	lw	a5,0(a5)
	.loc 5 178 48
	slli	a4,a5,16
	.loc 5 178 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 178 36
	sw	a4,0(a5)
	.loc 5 179 44
	lw	a5,-32(s0)
	addi	a5,a5,36
	.loc 5 179 38
	lw	a5,0(a5)
	.loc 5 179 48
	slli	a4,a5,16
	.loc 5 179 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 179 36
	sw	a4,0(a5)
	.loc 5 180 38
	lw	a5,-32(s0)
	lw	a5,0(a5)
	.loc 5 180 44
	slli	a4,a5,16
	.loc 5 180 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 180 36
	sw	a4,0(a5)
	.loc 5 181 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 181 36
	li	a4,-1421672448
	sw	a4,0(a5)
	.loc 5 195 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 5 195 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 5 199 9
	call	irq_getmask
	mv	a5,a0
	.loc 5 199 7
	sw	a5,-36(s0)
	.loc 5 200 7
	lw	a5,-36(s0)
	ori	a5,a5,4
	sw	a5,-36(s0)
	.loc 5 201 2
	lw	a5,-36(s0)
	mv	a0,a5
	call	irq_setmask
	.loc 5 203 2
	li	a0,1
	call	user_irq_0_ev_enable_write
	.loc 5 205 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE321:
	.size	main, .-main
.Letext0:
	.file 6 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1e6
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.4byte	.LASF22
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x9
	.4byte	.LASF23
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.4byte	.LASF11
	.byte	0x22
	.4byte	0x88
	.4byte	0x88
	.byte	0x3
	.byte	0
	.byte	0xb
	.byte	0x4
	.4byte	0x6a
	.byte	0x4
	.4byte	.LASF12
	.byte	0x21
	.4byte	0x88
	.4byte	0x9e
	.byte	0x3
	.byte	0
	.byte	0xc
	.string	"fir"
	.byte	0x5
	.byte	0x20
	.byte	0xd
	.4byte	0x88
	.4byte	0xb0
	.byte	0x3
	.byte	0
	.byte	0xd
	.4byte	.LASF24
	.byte	0x5
	.byte	0x1a
	.byte	0xd
	.4byte	0xbe
	.byte	0x3
	.byte	0
	.byte	0xe
	.4byte	.LASF25
	.byte	0x5
	.byte	0x2e
	.byte	0x6
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.4byte	0x128
	.byte	0x2
	.4byte	.LASF13
	.byte	0x5
	.byte	0x31
	.byte	0x9
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x2
	.4byte	.LASF14
	.byte	0x5
	.byte	0x93
	.byte	0x7
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.4byte	.LASF15
	.byte	0x5
	.byte	0xa1
	.byte	0x7
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x2
	.4byte	.LASF16
	.byte	0x5
	.byte	0xa9
	.byte	0x7
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xf
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x10
	.string	"i"
	.byte	0x5
	.byte	0x8f
	.byte	0xa
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF17
	.byte	0x4
	.byte	0x1d
	.4byte	.LFB319
	.4byte	.LFE319-.LFB319
	.byte	0x1
	.byte	0x9c
	.4byte	0x14d
	.byte	0x11
	.4byte	.LASF13
	.byte	0x4
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x12
	.4byte	.LASF26
	.byte	0x4
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0x177
	.byte	0x2
	.4byte	.LASF13
	.byte	0x4
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x13
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x325
	.byte	0x14
	.4byte	.LFB209
	.4byte	.LFE209-.LFB209
	.byte	0x1
	.byte	0x9c
	.4byte	0x19d
	.byte	0x14
	.string	"v"
	.byte	0x3
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x5
	.4byte	.LASF19
	.byte	0x2
	.byte	0x20
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x1c9
	.byte	0x6
	.string	"v"
	.byte	0x33
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.string	"a"
	.byte	0x44
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.4byte	.LASF20
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF21
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
	.byte	0xb
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
	.byte	0x3
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x5
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x14
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0x21
	.byte	0x20
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0x1
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0x7c
	.byte	0x19
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
	.byte	0x10
	.byte	0x34
	.byte	0
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
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
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF24:
	.string	"uart_write"
.LASF20:
	.string	"flush_cpu_dcache"
.LASF19:
	.string	"csr_write_simple"
.LASF14:
	.string	"tmp1"
.LASF15:
	.string	"tmp2"
.LASF16:
	.string	"tmp3"
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF22:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF25:
	.string	"main"
.LASF26:
	.string	"irq_getmask"
.LASF17:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF18:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF21:
	.string	"flush_cpu_icache"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"mask"
.LASF3:
	.string	"short int"
.LASF23:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/caravel-soc_fpga-lab-main/Final/Final/lab-wlos_baseline/testbench/uart"
.LASF0:
	.string	"counter_la_uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
