.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

Student STRUCT
	id WORD ?
	quiz1 BYTE ?
	quiz2 BYTE ?
Student ENDS

.data
	studentA Student<110h, 85h, 90h>
	studentB Student<202h, 78h, 88h>
	totalA BYTE ?
	totalB BYTE ?

.code
	main PROC
	mov eax, studentA.quiz1
	add eax, studentA,quiz2
	mov totalA, eax
	mov eax, studentB.quiz1
	add eax, studentB.quiz2
	mov totalB, eax

	INVOKE ExitProcess, eax
	main ENDP
END main