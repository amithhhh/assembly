#makefile for print.asm

print: print.o
	gcc -o print print.o -no-pie
print.o: print.asm
	nasm -f elf64 -g -F dwarf print.asm -l print.lst
