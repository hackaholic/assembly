; AddTwo number program
; chapter 3

.386
.model flat,stdcall
.stack 4096

ExitProcess proto,dwExitCode:DWORD

.data
sum DWORD ?

.code
main PROC
    mov eax,5
    add eax,6
    mov sum,eax
    INVOKE ExitProcess,0
main endp
end main