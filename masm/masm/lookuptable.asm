; chaptop 06 ->  lookup table practice

.model flat,stdcall
.stack 4096

ExitProcess PROTO dwExitCode:DWORD

.data

lookuptable BYTE 'A'
            DWORD Process_A
entrySize = ($-lookuptable)
            BYTE 'B'
            DWORD Process_B
            BYTE 'C'
            DWORD Process_C

noOfEntries = ($-lookuptable)/entrySize
input BYTE 'B'
output BYTE ?

.code
main PROC
    mov eax,0
    mov ecx,0
    mov ebx,0
    mov ecx,noOfEntries
    mov esi,OFFSET lookuptable
    L1: 
        movzx eax,input
        sub al,[esi]
        jnz L2
        call NEAR PTR [esi+1]

    L2:
        add esi,entrySize
        LOOP L1

    INVOKE ExitProcess,0
main endp

Process_A PROC
    movzx eax,input
    mov output,al
    ret
Process_A endp

Process_B PROC
    movzx eax,input
    mov output,al
    ret
Process_B endp

Process_C PROC
    movzx eax,input
    mov output,al
    ret
Process_C endp

end main