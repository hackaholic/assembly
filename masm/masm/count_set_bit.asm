; count the set bit
; Author: Kumar Shubham


.386
.model flat,stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data

myData BYTE 100
no_of_bits BYTE 32
setbit BYTE 0
binary BYTE 32 DUP(30h)

.code
main PROC
    movzx eax,myData
    movzx ecx,no_of_bits  
    mov ebx,0
    mov esi,offset binary + 32

    L1:
        shr eax,1
        jnc L2
        mov BYTE PTR [esi],'1'
        add ebx,1
    L2:
       dec esi
       LOOP L1 

    INVOKE ExitProcess,0
main ENDP

END main
