; chapter 04; Data related operators and directive

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
val1 BYTE 10
val2 WORD 11
val3 DWORD 0ABCh

; syntax ALIGN bound  
; bound values are 1,2,4,8 or 16
ALIGN 1
val4 BYTE 10
ALIGN 2                  ; next address will be multiple of 2
val5 WORD 11
ALIGN 4                  ; next address will be multiple of 4
val6 DWORD 12

val16 WORD 0ABCDh
val32 DWORD 12345678h
wordlist WORD 5678h,1234h

arrayB BYTE "ABCDEF"
arrayW WORD 10,11,12,13,14,15

dval DWORD 12345678h
dval1 DWORD ?

.code
main PROC
    
    ; offset operator -> load variable offset into reg since beginning of data-segment
    mov esi,OFFSET val1
    mov eax,0
    mov eax,OFFSET val1

    mov ebx,0
    mov bx,WORD PTR [val32]    ; 5678h
    mov bx,WORD PTR [val32+2]  ; 1234h

    mov ecx,0
    mov cl,TYPE val32         ; 04h
    mov ch,TYPE val16         ; 02h

    mov edx,0
    mov edx,LENGTHOF arrayB

    mov eax,0
    mov eax,SIZEOF arrayB

    mov ebx,0
    mov ebx,LENGTHOF arrayW
    
    mov ecx,0
    mov ebx,SIZEOF arrayW

    mov edx,DWORD PTR wordlist

    mov dx,3
    mov WORD PTR [dval+2],dx     ; 78560300h
    mov eax,dval                 ; 00036778h

    mov dval1,12345678h          ; 78563412h
    mov cx,WORD PTR [dval1+2]    ; 1234
    add cx,3                     ; 1237
    mov WORD PTR dval1,cx        ; 37123412h
    mov ecx,dval1                ; 12341237h

    ;xchg practice
    mov eax,1
    mov ebx,2
    xchg eax,ebx    ; eax: 2, ebx: 1

    INVOKE ExitProcess,0
main endp
end main