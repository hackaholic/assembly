; chapter - 04 , CPU EFLAGS practice


.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
zero DWORD 0
val1 BYTE 255
val2 SBYTE -128
val3 WORD 0800h

.code
main PROC
    ;zero flag example
    mov eax,zero
    mov ax,1
    sub ax,1

    mov al,0FFh    ; -1 in hex 0FFh
    add al,1

    ;sign flag example (PL)
    mov eax,5
    sub eax,6

    mov cl,7Fh
    add cl,1

    ; carray flag example (CY)
    mov eax,zero
    mov al,val1
    add al,1
    
    ;overflow example (OV)
    mov ebx,zero
    mov bl,val2
    sub bl,1

    inc val3

    mov ecx,0
    mov cl,1
    add cl,-130          ; -130(82h -> 7Dh + 1 -> 7Eh) + 1 = 7Fh


    mov ebx,0
    mov bl,-1
    add bl,1
    INVOKE ExitProcess,0
main endp
end main