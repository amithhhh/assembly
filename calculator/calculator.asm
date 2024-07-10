; calculator.asm

extern printf

section .data
	prompt		db		"Enter The numbers",10,0
	format      	db      	"%ld", 10, 0
	length		dq		20
section .bss
	num1            resq              20
        num2            resq              20

section .text
	global main

main:
	push rbp
	mov rbp, rsp

	;print prompt

	mov rdi, prompt
	mov rax, 0
	call printf

	;reading num1

	mov rax, 0
	mov rdi, 0
	mov rsi, num1
	mov rdx, length
	syscall

	;reading num2

	mov rax, 0
	mov rdi, 0
	mov rsi, num2
	mov rdx, length
	syscall

	mov rax, 0
	mov rdi, format
	mov rsi, num1
	call printf

	mov rsp, rbp
	pop rbp
	ret
