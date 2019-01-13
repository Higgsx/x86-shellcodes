; Compile: nasm -f elf32 -o helloWorld.o helloWorld.asm
; ld -o helloWorld helloWorld.o
; To get hex bytes: objdump -d ./PROGRAM | grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
; Compiled and tested on Ubuntu 12.04 32-bit

; Define .text section where all necessary code will be
section .text
; Tell linker about entry point
global _start

_start:
	; call write(0, "Hello World", 12)
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	
	mov al, 0x4
	mov bl, 0x1
	
	push 0x0a646c72
	push 0x6f57206f
	push 0x6c6c6548
	mov ecx, esp
	
	mov dl, 0xc
	int 0x80

	; call exit(0)
	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	int 0x80
