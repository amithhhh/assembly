; jump.asm

extern printf

section .data
	number1 dq 42
	number2 dq 41
	fmt1 db "NUMBER1 >= NUMBER2",10,0
	fmt2 db "NUMBER1 < NUMBER2",10,0

section .bss
section .text
	global main

main:
	push rbp
	mov rbp, rsp
	mov rax, [number1]		;move number1 to rax
	mov rbx, [number2]		;move number2 to rbx
	cmp rax, rbx
	jge greater			;jump to greater when rax  >= rbx
	
	;if rax < rbx we continue here
	
	mov rdi, fmt2
	mov rax, 0			;no xmm register involved
	call printf
	jmp exit

greater:
	mov rdi, fmt1
	mov rax, 0
	call printf

exit:
	mov rsp, rbp
	pop rbp
