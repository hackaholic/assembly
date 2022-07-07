; chapter 3
; data definition practice

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:DWORD

.data
; syntax: name directive initializer [,initilizer] ....
byte_val BYTE 14

; multiple initializers
list BYTE 10,20,30,40

list1 BYTE 10,20,30,40
      BYTE 50,60,70,80
      BYTE 90,100,110,13

; Different radix can be used . char and string can be freely mixed

list_radix BYTE 10h,0011b,'A',12

; byte string Initialization
str_byte BYTE "hello",0

; dup operator
list_dup BYTE  10 DUP(0)                 ; 10 bytes, all equals to 0
list_dup1 BYTE 10 DUP(?)                 ; 10 bytes, all uninitialized
list_byte BYTE 4 DUP("ABCD")             ; 16 bytes bytes

; BCD (binary coded decimal) TBYTE

tbyte_test TBYTE 12345    ; this will get stored same as hex  0x3930
tbyte_test1 TBYTE 1234    ;  0xd204
test_ok BYTE "ABCDEF"

; current location counter $ 
len_test_ok = ($ - test_ok)

; EQU directive , symbolic 
; name EQU integer_expression
; name EQU symbol
; name EQU <text>
equ_test EQU 10*5
equ_test1 EQU equ_test        ; using already defined symbol constant
equ_string EQU <"pi: 3.14">

.code
main PROC
    mov eax,0h
    add eax, len_test_ok
    mov al,byte_val

    INVOKE ExitProcess,0
main ENDP
END main
  