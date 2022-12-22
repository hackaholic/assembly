;section .data


section .text
global _start

_start:
    mov eax,0
    mov ebx,0
    mov eax,1
    mov ebx,5
    int 0x80
