global _start

; global data section: always can be accessed when executing
section .data
message : db 'hello, world!', 10

; program section
section .text
_start:		; label (_start label is the entry of program)
	mov		rax, 1			; system call number should be stored in rax
	mov		rdi, 1			; argument #1 in rdi: where to write (descriptor)?
	mov		rsi, message	; argument #2 in rsi: where does the string start?
	mov		rdx, 14			; argument #3 in rdx: how many bytes to write?
	syscall
