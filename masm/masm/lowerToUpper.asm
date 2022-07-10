; Chapter - 06  
; Converts lower case to upper case


.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
source BYTE "abcdefgh"
target BYTE $-source DUP(?)
upper_mask BYTE 01011111b

COMMENT !
 Refer ASCII Table
 'a' -> 97d -> 1100001b -> 65h
 'A' -> 65d -> 1000001b -> 41h
  we can see bit at position 5 differ
  'a' -> 'A' clear bit at position 5             
!

.code
main PROC
    mov esi,OFFSET source
    mov eax,OFFSET target
    mov ecx,LENGTHOF source
    L1:
        mov bl,[esi]
        and bl,upper_mask
        mov [eax],bl
        inc esi
        inc eax
        LOOP L1
    INVOKE ExitProcess,0
main endp
end main