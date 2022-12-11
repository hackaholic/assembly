; chapter - 04 copyString

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
sourceStrB BYTE "Hello World",0
targetStrB BYTE  SIZEOF sourceStrB DUP(?)

.code
main PROC
    mov ecx,0
    mov ecx,LENGTHOF sourceStrB
    mov esi,0
    L1:
        mov al,sourceStrB[esi]
        mov targetStrB[esi],al
        inc esi
        LOOP L1
    INVOKE ExitProcess,0
main endp
end main