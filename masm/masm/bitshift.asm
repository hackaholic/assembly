; Bitshift practice
; Author: Kumar Shubham


.386
.model flat,stdcall
.stack 1024

ExitProcess PROTO,dwExitCode:DWORD

.data
myBytes BYTE 5
myWord word 9BA6h

.code
main PROC
    mov eax,0
    mov al,myBytes
    shl al,1

    shr al,1
    shr al,1

    mov al,0
    mov al,myBytes
    rol al,1

    ror al,1

    mov ax,0
    mov ax,0AC36h
    shld myWord,ax,4

    INVOKE ExitProcess,0
main ENDP

END main