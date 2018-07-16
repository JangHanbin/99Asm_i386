99Asm : 99Asm.o
	ld -m elf_i386 99Asm.o -lc -I /lib/ld-linux.so.2 -o 99Asm


99Asm.o : 99asm.asm
	nasm -f elf 99asm.asm -o 99Asm.o


clean :
	rm 99Asm.o
	rm 99Asm
