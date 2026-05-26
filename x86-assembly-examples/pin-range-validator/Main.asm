.386
.model flat, stdcall
.stack 4096

.data
    Pin BYTE 9, 5, 8, 4, 6     
    minRange BYTE 5, 2, 4, 1, 3
    maxRange BYTE 9, 5, 8, 4, 6

.code
main PROC

    mov esi, OFFSET Pin       
    mov edi, OFFSET minRange   
    mov ebx, OFFSET maxRange    

    mov ecx, LENGTHOF Pin       
    mov eax, 1                 

ValidateLoop:

    mov dl, [esi]              
    cmp dl, [edi]             
    jl Invalid                 

    cmp dl, [ebx]               
    jg Invalid                   

    inc esi                     
    inc edi
    inc ebx
    inc eax                      
    loop ValidateLoop            

    xor eax, eax                 ; return 0
    jmp EndProgram

Invalid:

EndProgram:
    ret

main ENDP
END main
