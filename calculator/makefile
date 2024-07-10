#makefile for calculator.asm

calculator: calculator.o
	gcc -o calculator calculator.o -no-pie
calculator.o: calculator.asm
	nasm -f elf64 -g -F dwarf calculator.asm -l calculator.lst

