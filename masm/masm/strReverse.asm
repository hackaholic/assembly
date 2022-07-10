; chapter 05, string reverse

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
mystr BYTE "ABCDEF",0
mystr_rev BYTE ?
strlen DWORD ?

.code

main PROC
    
    mov ecx,0
    mov eax,0
    mov ecx,LENGTHOF mystr-1
    mov esi,OFFSET mystr
    COMMENT !
    L1:
        push [esi]           ; push values stores at address pointed by ESI to runtime stack 
        inc esi
        LOOP L1

    mov esi,OFFSET mystr_rev
    mov ecx,LENGTHOF mystr
    
    L2:
       pop [esi]
       inc esi
       LOOP L2
    !
    call strrev
    INVOKE ExitProcess,0
main endp

strrev PROC
    ; Reverse the string
    ; parameter:
    ;        esi -> for address reference
    ;        ecx -> length of string
    ; return value is stored in eax register
    
    push esi
    push ecx
    ;strlen DWORD ?
    mov strlen,ecx
    L1:
        mov ebx,0
        mov ebx,[esi]
        PUSH ebx
        inc esi
        LOOP L1
    
    mov esi,OFFSET mystr_rev
    mov ecx,strlen
    L2:
        pop ebx
        mov [esi],bl
        inc esi
        LOOP L2

    pop ecx
    pop esi
    ret
strrev endp

end main