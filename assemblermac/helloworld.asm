section .text

%assign SYS_EXIT        1
%assign SYS_WRITE       4
%assign STDOUT          1


global _start                ; make the main function externally visible
; a procedure wrapping the system call to write
_write:
mov eax, 0x4              ; system call write code
int 0x80                  ; make system call
ret
; a procedure wrapping the system call to exit
myexit:
mov eax, 0x1              ; system call exit code
int 0x80                  ; make system call
; no need to return


_start:
mov 	eax, 0
add 	eax, 4
add 	eax, 3
add 	eax, 15

mov  dword[z], eax
add  dword[z], 48

push dword 1
push dword z
push dword 1
call _write
add esp,12

push dword mylen
push dword mymsg
push dword 1
call _write
add esp, 12

mov 	eax, 3
push dword 0
 mov   eax, 1
mov   ebx, 2
int   80h
section .data
mymsg db "Greetings!", 0xa
mylen equ $-mymsg
z dd 100000

