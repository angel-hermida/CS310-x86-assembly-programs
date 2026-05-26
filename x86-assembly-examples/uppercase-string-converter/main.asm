.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode: DWORD

.data
    testString BYTE "hello world", 0

.code
main PROC
    push OFFSET testString
    call ConvertToUpper

    INVOKE ExitProcess, 0
main ENDP


ConvertToUpper PROC
    push ebp
    mov  ebp, esp

    push esi
    push edi

    mov  esi, [ebp+8]
    mov  edi, esi
    cld

L1:
    lodsb
    cmp  al, 0
    je   Done

    cmp  al, 'a'
    jb   L2
    cmp  al, 'z'
    ja   L2
    and  al, 0DFh

L2:
    stosb
    jmp  L1

Done:
    stosb

    pop  edi
    pop  esi
    pop  ebp
    ret 4
ConvertToUpper ENDP

END main
