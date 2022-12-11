; chapter -06
; find first negative number

.386
.model flat,stdcall
.stack 4096

.data
slist SWORD 0,1,2,3,-9,10,20

ExitProcess PROTO,dwExitCode:DWORD

.code

main PROC
    
    mov ecx,LENGTHOF slist
    mov esi,OFFSET slist
    mov ebx,0
        
    L1:
        mov eax,0
        add ax,[esi]     ; if result is negative PL(sign flag will be set PL=1)
        js found
        pushfd           ; backup 32 bit eflag to runtime stack
        add esi,4        ; jump to next signed number in slist
        popfd            ; restore EFLAGS
        LOOP L1
        jmp notfound

    found:
        mov bx,[esi]  ; update ebx with 1st negative number found
        mov ecx,0     ; set ECX to 0 to exit loop
        INVOKE ExitProcess,0

    notfound:
        mov ebx,0
    INVOKE ExitProcess,0

main endp
end main