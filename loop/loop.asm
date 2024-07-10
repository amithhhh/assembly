; loop.asm

extern printf

section .data
	num dq 500
	fmt db "sum of (0-%ld) is: %ld",10,0

section .bss
section .text
	global main

main:
	push rbp
	mov rbp, rsp

	mov rbx, 0		;counter
	mov rax, 0		;sum will be stored here

jloop:
	add rax, rbx
	inc rbx
	cmp rbx, [num]		;compare counter with num
	jle jloop		;if it is less jloop will execute again

	;after loop control comes here

	mov rdi, fmt
	mov rsi, [num]
	mov rdx, rax
	mov rax, 0
	call printf
	mov rsp, rbp
	pop rbp
	ret
