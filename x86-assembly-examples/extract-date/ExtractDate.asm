.386
.model flat, stdcall
.stack 4096

.data
DXval   WORD 0010011001101010b
Day     BYTE ?
Month   BYTE ?
Year    BYTE ?

.code
main PROC
    mov ax, DXval

    mov cx, ax
    and cx, 1Fh
    mov Day, cl

    mov cx, ax
    shr cx, 5
    and cx, 0Fh
    mov Month, cl

    mov cx, ax
    shr cx, 9
    and cx, 7Fh
    mov Year, cl

    ret
main ENDP
END main
