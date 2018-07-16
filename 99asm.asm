extern printf
extern scanf
extern exit

global _start

SECTION .data
	info db "Choose a number 1: whole 99dan,  N: N9dan -> ",0
	strFormat db "%s",0
	scanfFormat db "%d",0
	format db "%d * %d = %d",10,0
	first dd 2
	second dd 2
	maximum dd 19
	answer dd 0
SECTION .text

_start:
	push info
	push strFormat
	call printf
	add esp,8

	push answer
	push scanfFormat
	call scanf
	add esp,8

	mov ebx, [answer]
	cmp ebx, 1
	jne set_maximum
init_done:

	mov ecx,0xff
_loop:
	call print_str
	call inc_second
	loop _loop
	call _end


set_maximum :
	mov ebx, [answer]
	mov [maximum],ebx
	jmp init_done
	
inc_first:
	mov edi, 2
	mov [second], edi ; reset second num to 1
	mov edi,[first]
	cmp edi,[maximum]
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
	

