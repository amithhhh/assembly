; function2.asm

extern printf

section .data
	radius		dq		10.0
section .bss
section .text
	global main
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

area:
	section .data
		.pi		dq		3.141592654		;local to area

	section .text

	push rbp
	mov rbp, rsp

	movsd xmm0, [radius]
	mulsd xmm0, [radius]
	mulsd xmm0, [.pi]

	leave
	ret

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

circle:
	section .data
		.fmt_area		db		"The area is %f",10,0

	section .text

	push rbp
	mov rbp, rsp

	call area
	mov rdi, .fmt_area
	mov rax, 1
	call printf

	leave
	ret

main:

	push rbp
	mov rbp, rsp
	call circle
	leave
	ret
