#makefile for ddd

example: example.o
	gcc -o example example.o -no-pie
example.o: example.asm
	nasm -f elf64 -g -F dwarf example.asm -l example.lst 
