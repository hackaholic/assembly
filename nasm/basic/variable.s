section .data
    hello db 10


section .text
global _start

_start:
    mov eax,0
    mov ebx,0
    mov eax,1   ; syscall exit
    mov ebx,[hello]   ; exitcode 
    int 0x80    ; call kernel by interupt 0x80
