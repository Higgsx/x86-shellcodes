// Description: C code to test our generated shellcode
// Compile: gcc -o test-shellcode test-shellcode.c -fno-stack-protector -z execstack
#include <stdio.h>

unsigned char shellcode[] = \
"\xeb\x19\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xb0\x04\xb3\x01\x59\xb2\x0c\xcd\x80\x31\xc0\xb0\x01\x31\xdb\xcd\x80\xe8\xe2\xff\xff\xff\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x0a";
int main()
{
	void (*code)() = (void (*)())shellcode;
	code();
}
