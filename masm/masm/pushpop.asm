; push pop practice
; Author Kumar Shubham


.386
.model flat,stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data
mybyte BYTE 10h

.code
main PROC
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0
    pushfd            ; push status flag to runtime stack
    
    pushad            ; push all base resister to runtimestack like eax,ebx,..,esi,edi,ebp,eip,esp

    ; changes to the some basic register?
    mov eax,1
    mov ebx,1
    mov ecx,1
    mov edx,1

    popad            ; pop 
    popfd            ; pop status flag from runtime stack to status flags registers

    push 0
    call ExitProcess
main ENDP

END main