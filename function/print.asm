section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text
global _start

print_newline:
	mov rax, 1				; 'write' syscall identifier
	mov rdi, 1				; stdout file descriptor
	mov rsi, newline_char	; where do we take data from
	mov rdx, 1				; the amount of bytes to write
	syscall
	ret

print_hex:
	mov rax, rdi

	mov rdi, 1
	mov rdx, 1
	mov rcx, 64				; shifting rax
iterate:
	push rax				; save rax
	sub rcx, 4
	sar rax, cl				; shift to 60, 56, ... 4, 0
	and rax, 0xf
	lea rsi, [codes + rax]	; take a digit

	mov rax, 1
	push rcx				; syscall will use rcx
	syscall					; rax, rdi, rsi: see above

	pop rcx
	pop rax
	test rcx, rcx			; rcx = 0 when all digits are shown
	jnz iterate

	ret

_start:
	mov rdi, 0x1122334455667788
	call print_hex
	call print_newline

	mov rax, 60
	xor rdi, rdi
	syscall
