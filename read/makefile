#makefile for read.asm

read: read.o
	gcc -o read read.o -no-pie
read.o: read.asm
	nasm -f elf64 -g -F dwarf read.asm -l read.lst
