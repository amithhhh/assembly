; rect.asm

extern printf

section .data
	length         dq              10.0
        breadth                dq              20.0
	fmt             db              "The area of rectangle is: %f",10,0

section .bss

section .text
	global main

area:
	section .data

	section .text

	push rbp
	mov rbp, rsp

	movsd xmm0, [length]
	mulsd xmm0, [breadth]

	leave
	ret

print_area:
	section .data
		
	section .text

	push rbp
	mov rbp, rsp

	call area
	mov rdi, fmt
	mov rax, 1
	call printf

	leave
	ret

main:
	push rbp
	mov rbp, rsp

	call print_area
	
	leave
	ret



