.386
.model flat, stdcall
.stack 4096

.data
	num DWORD 7
.code
	main PROC

	push num

	call evenOrOdd

	ret
	main ENDP

	evenOrOdd PROC

	push ebp
	mov ebp, esp
	mov eax, DWORD PTR[ebp + 8] ;move num to eax
	and eax, 1 ;test if least significant bit is 1 
	xor eax, 1  

	pop ebp
	ret 4

	evenOrOdd ENDP

	END main