; chapter 04 signextention practice and offset
; movzx -> zero extends the value to 16 or 32 bit
; movsx -> sign extends the value to 16 or 32 bit



.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
val WORD 1
zero DWORD 0
signedVal  SWORD -16
arrayB BYTE 10,20,30,40
arrayW WORD 041h,042h,043h,044h

one WORD 8002h
two WORD 4321h

.code
main PROC
    mov cx,val    ; debug and check value of ECX register

    mov ecx,zero
    mov cx,val

    mov ecx,zero
    mov cx,signedVal ; we get value 0000FFF0h (+65502 in dec)   why?
    ; 16 in hex 0x10 - > hex 1st com 0xef + 1 -> 0xf0 (2nd compliments)
    
    ; try to load the unsigned value using movzx
    movzx eax,val

    movsx ecx,cx    ;  ECX = FFFFFFF0

    mov edx,21348041h
    movsx edx,one         ; FFFF8002h
    movsx edx,two         ; 00004321h

    ; using offset to access other elements in array or list
    mov edx,zero
    mov dl,arrayB  ; 1st byte will get copied from mem to EDX -> dl
    mov dl,[arrayB+1]
    mov dl,[arrayB+3]

    mov edx,zero
    mov dx,[arrayW]     
    mov dx,[arrayW+2]       ; for WORD offset must be incremented by 2 as WORD take up 2byte

    INVOKE ExitProcess,0

main endp
end main