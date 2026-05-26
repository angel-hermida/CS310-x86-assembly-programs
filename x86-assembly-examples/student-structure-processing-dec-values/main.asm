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
	studentA Student<110, 85, 90>
	studentB Student<202, 78, 88>
	totalA BYTE ?
	totalB BYTE ?

.code
	main PROC
	mov eax, 0
	mov al, studentA.quiz1
	add al, studentA.quiz2
	mov totalA, al
	mov eax, 0
	mov al, studentB.quiz1
	add al, studentB.quiz2
	mov totalB, al

	INVOKE ExitProcess, 0
	main ENDP
END main