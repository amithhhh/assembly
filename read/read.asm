; read.asm

section .data
	prompt db "Enter a number: ",10,0
	prompt_len equ $ - prompt
	buffer db 20
	buffer_len equ 20

section .bss

section .text
	global main

main:
	push rbp
	mov rbp, rsp

	mov rax, 1		;system call for write
	mov rdi, 1		;represents stdout
	mov rsi, prompt
	mov rdx, prompt_len
	syscall

	;reading----------------------------------------------------------------------------------------------------------------

	mov rax, 0
	mov rdi, 0
	mov rsi, buffer
	mov rdx, buffer_len
	syscall

	;printing-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	mov rax, 1
	mov rdi, 1
	mov rsi, buffer
	syscall

	mov rsp, rbp
	pop rbp
	ret
