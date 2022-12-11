; chaptor 07 - bcd 
; write a program to convet bcd to unpacked bytes

.model flat,stdcall
.stack 100

ExitProcess PROTO,dwExitWord:DWORD

.data
bcd BYTE 89h
unpacked BYTE 2 DUP(10h)
bytestr BYTE "0123456789"     ; 30 31 32 33 34 35 36 37 38 39

.code
main PROC
    mov eax,0
    mov al,bcd
    and al,00001111b
    mov unpacked[1],al
    mov al,bcd
    shr al,4
    and al,00001111b
    mov unpacked,al

    ; daa set CY=1 when carries out
    mov al,99h
    add al,33h
    daa                 ; set CY=1

    mov al,33h
    add al,33h
    daa                 ; set CY=0
    INVOKE ExitPRocess,0
main endp
end main