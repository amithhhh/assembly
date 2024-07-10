; age.asm

extern printf

section .data
	age dq 12
	fmt1 db "[+] Tu estas eligible",10,0
	fmt2 db "[-] Tu no estas eligible",10,0

section .bss
section .text
	global main

main:
	push rbp
	mov rbp, rsp

	mov rax, [age]		;moving age to rax
	cmp rax, 0x12
	jge eligible		;if age >= 18 control goes to eligible

	mov rdi, fmt2
	mov rax, 0		;no xmm is using
	call printf
	jmp exit

eligible:
	mov rdi, fmt1
	mov rax, 0
	call printf
	
exit:
	mov rsp, rbp
	pop rbp
