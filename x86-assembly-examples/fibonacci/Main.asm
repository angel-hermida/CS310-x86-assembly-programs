.386
.model flat, stdcall
.stack 4096

.data
FibSeq WORD 7 DUP(?)   ; 7 Fibonacci numbers (16-bit each)

.code
main PROC
    mov ax, 1          ; Fib(1)
    mov bx, 1          ; Fib(2)
    mov esi, OFFSET FibSeq

    mov WORD PTR [esi], ax   ; store Fib(1)
    add esi, 2
    mov WORD PTR [esi], bx   ; store Fib(2)
    add esi, 2

    mov ecx, 5               ; 5 more Fibonacci numbers to compute

fib_loop:
    mov dx, ax
    add dx, bx
    mov WORD PTR [esi], dx   ; store Fib(n)
    add esi, 2               ; move 2 bytes (WORD)

    mov ax, bx               ; shift for next iteration
    mov bx, dx
    loop fib_loop

    ret
main ENDP
END main
