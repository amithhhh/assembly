; print.asm

extern printf

section .data
	fmt db "%d",10,0

section .bss
section .text
	global main

main:
	push rbp
	mov rbp, rsp

	mov rbx, 0

bloop:
	mov rdi, fmt
	mov rsi, rbx
	mov rax, 0
	call printf
	inc rbx
	loop bloop

	mov rsp, rbp
	pop rbp
	ret
