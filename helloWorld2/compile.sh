#!/bin/bash
echo "[*] Compiling..."
nasm -f elf32 helloWorld2.asm -o helloWorld2.o
echo "[*] Linking..."
ld -o helloWorld2 helloWorld2.o
echo "[*] Hex bytes: "
objdump -d ./helloWorld2 | grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'

echo "[*] Done!"
