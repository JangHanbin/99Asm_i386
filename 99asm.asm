extern printf
extern exit

global _start

SECTION .data
	format db "%d * %d = %d",10,0

SECTION .text

_start:
	mov eax,2
	push eax
	push eax
	mul eax
	push eax
	push format
	call printf

	add esp, 8

_end:
	mov eax,1
	xor ebx,ebx
	int 0x80
	

