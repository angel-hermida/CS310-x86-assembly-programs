.386
.model flat, stdcall
.stack 4096

.code
	main PROC
		push 10 ;z
		push 20 ;y
		push 30 ;x

		Call SumPAvg

	main ENDP

	SumPAvg PROC

		push ebp
		mov ebp, esp
		sub esp, 12
		mov eax, 0
		mov eax, DWORD PTR[ebp + 16]
		add eax, DWORD PTR[ebp + 12]
		add eax, DWORD PTR[ebp + 8]
		mov DWORD PTR[ebp - 4], eax ;stores sum

		mov eax, 0
		mov eax, DWORD PTR[ebp + 16]
		mov ebx, 0
		mov ebx, DWORD PTR[ebp + 12]
		mul ebx
		mov eax, DWORD PTR[ebp + 8]
		mul ebx
		mov DWORD PTR[ebp - 8], eax

		mov edx, 0
		mov eax, 0
		mov eax, DWORD PTR[ebp - 4]
		mov ecx, 3
		div ecx
		mov DWORD PTR[ebp - 12], eax

		pop ecx
		pop ebx
		pop eax
		pop ebp

		ret 12 ; or ret 12

	SumPAvg ENDP
END main