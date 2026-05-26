.386
.model flat, stdcall
.stack 4096

.data
myArray DWORD 10h, 20h, 30h, 40h, 50h
sum DWORD 0

.code
main PROC
mov eax, 0
mov ecx, 0
mov ebx, 0
mov edx, 0

mov edx, OFFSET myArray
mov ecx, LENGTHOF myArray
mov ebx, TYPE myArray

l1:
	add eax, [edx]
	add edx, ebx
loop l1

mov sum, eax

main ENDP

END main