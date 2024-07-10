#makefile for integer.asm

integer: integer.o
	gcc -o integer integer.o -no-pie
integer.o: integer.asm
	nasm -f elf64 -g -F dwarf integer.asm -l integer.lst
