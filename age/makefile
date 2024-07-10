#makefile for age.asm

age: age.o
	gcc -o age age.o -no-pie
age.o: age.asm
	nasm -f elf64 -g -F dwarf age.asm -l age.lst
