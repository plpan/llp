
%define O_RDONLY 0
%define PROT_READ 0x1
%define MAP_PRIVATE 0x2

section .data
frame: db 'test.txt', 0

section .text
global _start

print_string:
	push rdi
	call string_length
	pop rsi
	mov rdx, rax
	mov rax, 1
	mov rdi, 1
	syscall
	ret

string_length:
	xor rax, rax
.loop:
	cmp byte[rax + rdi], 0
	je .end
	inc rax
	jmp .loop
.end:
	ret

_start:
	; call open
	mov rax, 2
	mov rdi, frame       ; open file readonly
	mov rsi, O_RDONLY
	mov rdx, 0           ; no used parameter
	syscall

	; call mmap
	mov r8, rax
	mov rax, 9
	mov rdi, 0           ; choose by os
	mov rsi, 4096        ; page size
	mov rdx, PROT_READ   ; new memory region is read-only
	mov r10, MAP_PRIVATE ; private page
	mov r9, 0            ; offset of file
	syscall

	mov rdi, rax
	call print_string

	mov rax, 60        ; exit
	xor rdi, rdi
	syscall
