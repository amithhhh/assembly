; print.asm
extern printf
section .data
	radius dd 357
	fmtint db "Radius: %d",10,0
	pie dq 3.14
	fmtfpt db "pie: %lf",10,0
section .bss
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	; print radius

	mov rax, 0	; no floating-point number
	mov rdi, fmtint
	mov rsi, [radius]
	call printf

	; print pie

	mov rax, 1	; floating-point number is printing
	movq xmm0, [pie]
	mov rdi, fmtfpt
	call printf

	mov rsp, rbp
	pop rbp
ret

