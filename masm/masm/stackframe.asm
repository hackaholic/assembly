; stack frame practice
; Author Kumar shubham

.386
.model flat,stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD
.data
val1 BYTE 5
val2 BYTE 6


.code
main PROC

    movzx eax,val1
    movzx ebx,val2
    mov edx,0
    push eax
    push ebx
    call addTwo2
    pop ebx
    pop eax
    INVOKE ExitProcess,0
main ENDP

addTwo PROC
    push ebp
    mov ebp,esp
    mov edx,[ebp+12]
    add edx,[ebp+8]
    pop ebp
    ret
addTwo ENDP

addTwo1 PROC
    push ebp
    mov ebp,esp
    push 5
    push 6

    mov eax,[ebp-4]
    add eax,[ebp-8]

    add esp,12
    ret
addTwo1 ENDP

addTwo2 PROC
    ENTER 8,0
    mov DWORD PTR [ebp-4],5
    mov DWORD PTR[ebp-8],6

    mov eax,[ebp-4]
    add eax,[ebp-8]
    LEAVE
    ret
addTwo2 ENDP

END main