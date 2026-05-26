.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
    targetString BYTE "123ABC342432", 0
    sourceString BYTE "ABC", 0

.code
main PROC

    mov esi, OFFSET sourceString
    mov edi, OFFSET targetString

L1:
    cmp BYTE PTR [edi], 0
    je NotFound

    mov ebx, OFFSET sourceString
    xor ecx, ecx

CountSrc:
    cmp BYTE PTR [ebx], 0
    je LenReady
    inc ebx
    inc ecx
    jmp CountSrc

LenReady:

    push edi
    push esi

    mov esi, OFFSET sourceString
    mov edx, edi
    cld
    repe cmpsb
    je MatchFound

NoMatch:
    pop esi
    pop edi
    inc edi
    jmp L1

MatchFound:
    pop esi
    pop edi
    mov eax, edx
    jmp Done

NotFound:
    mov eax, -1
    or eax, eax

Done:
    INVOKE ExitProcess, eax

main ENDP
END main