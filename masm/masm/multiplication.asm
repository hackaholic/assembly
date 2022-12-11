; multiplication practice
; Author: Kumar Shubham

.386
.model flat,stdcall
.stack 1024

ExitProcess PROTO,dwExitCode:DWORD

.data
testbyte BYTE 10h

.code
main PROC

    pushad
    pushfd

    mov eax,0
    mov edx,0
    mov ebx,0

    ; mul instruction
    ; Byte multiplication
    mov al,5          
    mov bl,2
    mul bl        ; result will be in AX -> 000A

    ; word multiplication   
    mov ax,2020h
    mov bx,1000h
    mul bx          ; retul will be in DX:AX  -> 0202:0000


    mov eax,12345h
    mov ebx,1000h
    mul ebx              ;result will be stored in EDX:EAX -> 00000000:12345000


    mov eax,0
    mov ebx,0
    mov edx,0

    ;imul instruction , unlike mul instruction, imul preserve the sign of the product
    mov al,48
    mov bl,4
    imul bl

    mov al,4
    mov bl,-4
    imul bl

    popfd
    popad

    INVOKE ExitProcess,0
main ENDP

END main