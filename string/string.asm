; string.asm

extern printf

section .data
	text db "abcdef",0
	fmtstmt db "string is %s",10,0

section .bss

section .text
	global main

main:
	push rbp
	mov rbp,rsp

	mov rax, 0
	mov rsi, [text+1]
	mov rdx, fmtstmt
	call printf

	mov rsp, rbp
	pop rbp
	ret
