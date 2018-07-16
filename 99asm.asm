extern printf
extern exit

global _start

SECTION .data
	format db "%d * %d = %d",10,0
	first dd 2
	second dd 2

SECTION .text

_start:
	mov ecx,0xff
_loop:
	call print_str
	call inc_second
	loop _loop
	call _end

inc_first:
	mov edi, 1
	mov [second], edi ; reset second num to 1
	mov edi,[first]
	cmp edi,19
	je _end
	mov edi,[first]
	inc edi
	mov [first],edi
	ret

inc_second:
	mov esi,[second]
	cmp esi,9
	je inc_first
	mov esi,[second]
	inc esi
	mov [second], esi
	ret
	
print_str:
	mov esi, [first]
	mov edi, [second]	
	mov eax, esi
	mul edi
	push eax
	push edi
	push esi
	push format
	call printf
	add esp,16 
	ret	
_end:
	mov eax,1
	xor ebx,ebx
	int 0x80
	

