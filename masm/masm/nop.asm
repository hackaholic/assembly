; nop (no operation instruction)
; Author Kumar Shubham

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
test_data BYTE 10

.code
main PROC
    movzx eax,test_data
    nop
    INVOKE ExitProcess,0
main ENDP
END main