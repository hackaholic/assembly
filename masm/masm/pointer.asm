; pointer practice
; Author Kumar Shubham

.386
.model flat,stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data

test_byte BYTE 10,20,30,40,50,60,70 ; in memory -> 0a 14 1e 28 32 3c
test_PTR DWORD test_byte       ; pointer size is affected by processor mode, dword for 32 bit
;above can also be decleared as
; test_PTR DWORD OFFSET test_byte
INC_PTR EQU <add esi,2>

myBytes BYTE 10h,20h,30h,40h

.code
main PROC
    ;mov esi,WORD PTR OFFSET test_byte
    mov esi,OFFSET test_byte
    mov edi,test_PTR
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0
    mov ecx,LENGTHOF test_byte
    mov ax,WORD PTR test_byte
    mov bx,WORD PTR [esi]
    mov dx,WORD PTR [edi]

    mov esi,OFFSET myBytes
    mov eax,0
    mov eax,DWORD PTR [esi]   ;-> 40302010

    INVOKE ExitProcess,0
main ENDP
END main