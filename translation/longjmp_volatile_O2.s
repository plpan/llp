	.file	"longjmp_volatile.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ival: %d vval: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$jb, %edi
	movl	$0, 12(%rsp)
	call	_setjmp
	movl	12(%rsp), %eax
	cmpl	$2, %eax
	jle	.L5
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movl	12(%rsp), %eax
	movl	$1, %esi
	movl	$.LC0, %edi
	addl	$1, %eax
	movl	%eax, 12(%rsp)
	movl	12(%rsp), %edx
	xorl	%eax, %eax
	call	printf
	movl	$1, %esi
	movl	$jb, %edi
	call	longjmp
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.comm	jb,200,32
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-16)"
	.section	.note.GNU-stack,"",@progbits
