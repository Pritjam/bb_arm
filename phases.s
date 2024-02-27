	.arch armv8-a
	.file	"phases.c"
	.text
	.global	buf
	.bss
	.align	3
	.type	buf, %object
	.size	buf, 80
buf:
	.zero	80
	.section	.rodata
	.align	3
.LC0:
	.string	"Bomb exploded! If this was a real assignment, you'd have lost 5%% of the assignment score now.\n"
	.text
	.align	2
	.global	explode
	.type	explode, %function
explode:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, -1
	bl	exit
	.cfi_endproc
.LFE6:
	.size	explode, .-explode
	.align	2
	.global	read_line
	.type	read_line, %function
read_line:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	adrp	x0, :got:stdin
	ldr	x0, [x0, #:got_lo12:stdin]
	ldr	x0, [x0]
	mov	x2, x0
	mov	w1, 79
	adrp	x0, buf
	add	x0, x0, :lo12:buf
	bl	fgets
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L6
	mov	x0, 0
	b	.L4
.L6:
	nop
.L5:
	ldr	x0, [sp, 24]
	add	x1, x0, 1
	str	x1, [sp, 24]
	ldrb	w0, [x0]
	cmp	w0, 10
	bne	.L5
	ldr	x0, [sp, 24]
	sub	x0, x0, #1
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	strb	wzr, [x0]
	adrp	x0, buf
	add	x0, x0, :lo12:buf
.L4:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	read_line, .-read_line
	.align	2
	.global	len
	.type	len, %function
len:
.LFB8:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	str	wzr, [sp, 28]
	b	.L8
.L9:
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L8:
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L9
	ldr	w0, [sp, 28]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	len, .-len
	.align	2
	.global	cmp
	.type	cmp, %function
cmp:
.LFB9:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	str	x1, [sp]
	str	wzr, [sp, 28]
	b	.L12
.L14:
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L12:
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldrsw	x0, [sp, 28]
	ldr	x2, [sp]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bne	.L13
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L14
.L13:
	ldr	w0, [sp, 28]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	cmp, .-cmp
	.section	.rodata
	.align	3
.LC1:
	.string	"custom string"
	.text
	.align	2
	.global	phase_1
	.type	phase_1, %function
phase_1:
.LFB10:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -48
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	bl	len
	mov	w19, w0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	len
	cmp	w19, w0
	bne	.L17
	adrp	x0, .LC1
	add	x1, x0, :lo12:.LC1
	ldr	x0, [sp, 40]
	bl	cmp
	str	w0, [sp, 60]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	len
	mov	w1, w0
	ldr	w0, [sp, 60]
	cmp	w0, w1
	beq	.L19
.L17:
	bl	explode
	b	.L16
.L19:
	nop
.L16:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	phase_1, .-phase_1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
