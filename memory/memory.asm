; memory.asm

section .data
	bNum	db	123
	wNum	dw	12345
	warray	times	5 dw 0		;array of 5 words containing zero

	dNum	dd	12345
	qNum1	dq	12345
	text1	db	"abc",0
	qNum2	dq	3.141592654
	text2	db	"cde",0

section .bss
	bvar	resb	1
	dvar	resd	1
	wvar	resw	10
	qvar	resq	3

section .text
	global main

main:
	push rbp
	mov rsp, rbp

	lea rax, [bNum]		;load address of bNUm in rax
	mov rax, bNum		;load address of bNum in rax
	mov rax, [bNum]		;load value in bNum in rax

	mov rsp, rbp
	pop rbp
	ret
