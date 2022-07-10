; chapter - 04 sumAarray

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
arrayB BYTE 10,20,30,40


.code
main PROC
    mov ecx,LENGTHOF arrayB
    mov eax,0
    mov esi,OFFSET arrayB    ; using offset address
    L1:
        add al,[esi]
        inc esi
        LOOP L1

    mov ecx,LENGTHOF arrayB
    mov ebx,0
    mov esi,0
    L2:
        add bl,arrayB[esi] ; can be also written as [arrayB + esi]
        inc esi
        LOOP L2
    INVOKE ExitProcess,0
main endp
end main