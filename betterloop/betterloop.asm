; betterloop.asm

extern printf

section .data
	number dq 5
	fmt db "The sum from 0 to %ld is %ld",10,0

section .bss
section .text
	global main

main:
	push rbp
	mov rbp, rsp
	mov rcx, [number]	;initialize rcx with number

	mov rax, 0

bloop:
	add rax, rcx		;add rcx to sum
	loop bloop		;loop while decreasing rcx with 1
	
	mov rdi,fmt
	mov rsi, [number]
	mov rdx, rax
	mov rax, 0
	call printf

	mov rsp,rbp
	pop rbp
	ret
