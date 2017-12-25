section .data
codes:
	db		'0123456789ABCDEF'

section .text
global _start
_start:
	; hex format
	mov rax, 0x1122334455667788

	mov rdi, 1
	mov rdx, 1
	mov rcx, 64

.loop:
	push rax
	sub  rcx, 4
	; rax > eax > ax = ah + al
	; rcx > ecx > cx = ch + cl
	sar rax, cl
	and rax, 0xf

	lea rsi, [codes + rax]	; address of (codes + rax)
	mov rax, 1
	; syscall will change rcx and r11
	push rcx
	syscall
	pop rcx

	pop rax

	test rcx, rcx	; fastest 'is it a zero?' check, implements with '&', not '-' 
	jnz .loop
	mov rax, 60		; exit syscall
	xor rdi, rdi
	syscall
