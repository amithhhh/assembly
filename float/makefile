#makefile for float.asm

float: float.o
	gcc -o float float.o -no-pie
float.o: float.asm
	nasm -f elf64 -g -F dwarf float.asm -l float.lst
