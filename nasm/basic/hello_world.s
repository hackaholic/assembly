; Author: Kumar Shubham

section .data
    message db "hello world",10
    msglen equ ($-message)

section .text
global _start

_start:
    mov eax,0
    mov ebx,0
    mov ecx,0

    mov eax,0x4           ; write syscall
    mov ebx,0             ; fd for stdout
    mov ecx,message       ; message address
    mov edx,msglen        ; lenght of message
    int 0x80              ; call kernel

    ; exit gracefull
    mov eax,1
    mov ebx,0
    int 80h
