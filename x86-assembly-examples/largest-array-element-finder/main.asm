.386
.model flat, stdcall
.stack 4096

.data
    myArray SDWORD 10, -5, 22, 13, -40, 22
    arrayLength DWORD LENGTHOF myArray

.code
main PROC

    push arrayLength
    push OFFSET myArray
    call FindLargest

    ; result is in EAX

    ret
main ENDP



FindLargest PROC

    push ebp
    mov  ebp, esp

    mov ecx, DWORD PTR [ebp + 12]
    mov esi, DWORD PTR [ebp + 8]

    mov eax, [esi]
    add esi, 4
    dec ecx

L1:
    cmp ecx, 0
    je  Done

    mov ebx, [esi]
    cmp ebx, eax
    jle Skip
    mov eax, ebx

Skip:
    add esi, 4
    dec ecx
    jmp L1

Done:
    pop ebp
    ret 8

FindLargest ENDP

END main
