; integer.asm

extern printf

section .data
	number1 dq 128
	number2 dq 19
	neg_num dq -12
	fmt db "The numbers are %ld and %ld",10,0
	fmtint db "%s %ld",10,0
	sumi db "sum is",0
	difi db "difference is",0
	inci db "Number 1 Incremented",0
	deci db "Number 1 Decremented",0
	multi db "The product is",0
	divi db "The quotient is",0
	remi db "The Modulo is",0

section .bss
	resulti resq 1
	modulo resq 1

section .text
	global main

main:
	push rbp
	mov rbp, rsp
	; displaying Numbers

	mov rdi, fmt
	mov rsi, [number1]
	mov rdx, [number2]
	mov rax, 0
	call printf

	;adding-------------------------------------------------------------------------------

	mov rax, [number1]
	add rax, [number2]
	mov [resulti], rax
	;displaying

	mov rdi, fmtint
	mov rsi, sumi
	mov rdx, [resulti]
	mov rax, 0
	call printf

	;subtracting------------------------------------------------------------------------------------------------------------------

	mov rax, [number1]
	sub rax, [number2]
	mov [resulti], rax
	;displaying the result

	mov rdi,fmtint
	mov rsi, difi
	mov rdx, [resulti]
	mov rax, 0
	call printf
	
	;incrementing-----------------------------------------------------------------------------------------------------------------------------------

	mov rax, [number1]
	inc rax
	mov [resulti], rax
	;displaying

	mov rdi, fmtint
	mov rsi, inci
	mov rdx, [resulti]
	mov rax, 0
	call printf

	;decrementing-----------------------------------------------------------------------------------------------------------------------------------------

	mov rax, [number1]
	dec rax
	mov [resulti], rax
	;displaying
	
	mov rdi, fmtint
	mov rsi, deci
	mov rdx, [resulti]
	mov rax, 0
	call printf

	;sal rax, 2 left shift by 2
	; sar rax, 2 right shift by 2

	;multiply---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	mov rax, [number1]
	imul qword [number2]	;multiply rax with number 2
	mov	[resulti], rax

	;displaying

	mov rdi, fmtint
	mov rsi, multi
	mov rdx, [resulti]
	mov rax, 0
	call printf

	;divide-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	mov rax, [number1]
	mov rdx, 0		;rdx needs to be zero before idiv

	idiv qword [number2]	;divide rax with number2
	mov [resulti], rax
	mov [modulo], rdx

	;displaying

	mov rdi, fmtint
	mov rsi, divi
	mov rdx, [resulti]
	mov rax, 0
	call printf

	mov rdi, fmtint
	mov rsi, remi
	mov rdx, [modulo]
	mov rax, 0
	call printf

	mov rsp, rbp
	pop rbp
	ret
