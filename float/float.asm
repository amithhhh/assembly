; float.asm

extern printf

section .data
	number1		dq		9.0
	number2		dq		73.0
	fmt		db		"The Numbers are %f and %f",10,0
	fmtfloat  	db		"%s %f",10,0
	f_sum		db		"The Float sum of %f and %f is %f",10,0
	f_dif           db              "The Float difference of %f and %f is %f",10,0
	f_mul           db              "The Float product of %f and %f is %f",10,0
	f_div           db              "The Float division of %f by %f is %f",10,0
	f_sqrt           db              "The Float square root of %f is %f",10,0

section .bss

section .text
	global main

main:
	push rbp
	mov rbp, rsp

;print all numbers

	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rdi, fmt
	mov rax, 2		;2 floats
	call printf

;sum of the numbers

	movsd xmm2, [number1]		;double precision float to xmm
	addsd xmm2, [number2]		;add double precision to xmm

	;print result

	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rdi, f_sum
	mov rax, 3			;3 floats
	call printf

;difference of the numbers

	movsd xmm2, [number1]
	subsd xmm2, [number2]

	;print result

	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rdi, f_dif
	mov rax, 3
	call printf

;product of the numbers

	movsd xmm2, [number1]
	mulsd xmm2, [number1]

	;print result

	mov rdi, f_mul
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rax, 3
	call printf

;division of the numbers

	movsd xmm2, [number1]
	divsd xmm2, [number2]

	;print result

	mov rdi, f_div
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rax, 3
	call printf

;squareroot of the numbers

	sqrtsd xmm1, [number1]

	;print result

	mov rdi, f_sqrt	
	movsd xmm0, [number1]
	mov rax, 2
	call printf

;exit

	mov rsp, rbp
	pop rbp
	ret
