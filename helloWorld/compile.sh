#!/bin/bash
echo "[*] Compiling..."
nasm -f elf32 helloWorld.asm -o helloWorld.o
echo "[*] Linking..."
ld -o helloWorld helloWorld.o
echo "[*] Hex bytes: "
objdump -d ./helloWorld | grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'

echo "[*] Done!"
