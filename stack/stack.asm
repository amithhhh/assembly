; stack.asm

extern printf

section .data
	string		db		"ABCDE",0
	stringlen	equ		$ - string - 1
	fmt1		db		"The Original String: %s",10,0
	fmt2		db		"The Reversed String: %s",10,0
section .bss
section .text
	global main

main:
	push rbp
	mov rbp, rsp

	;print original string

	mov rdi, fmt1
	mov rsi, string
	mov rax, 0
	call printf

	;push the string char per char on stack

	xor rax, rax
	mov rbx, string
	mov rcx, stringlen
	mov r12, 0

	pushLoop:
		mov al, byte [rbx+r12]
		push rax
		inc r12
		loop pushLoop

	;pop the char per char from stack

	mov rbx, string
	mov rcx, stringlen
	mov r12, 0

	popLoop:
		pop rax
		mov byte [rbx+r12], al
		inc r12
		loop popLoop
		mov byte [rbx+r12], 0

	;print the reversed string

	mov rdi, fmt2
	mov rsi, string
	mov rax, 0
	call printf

	mov rsp, rbp
	pop rbp
	ret

