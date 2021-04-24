nasm bootloader.asm -f bin -o bootloader.bin

nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o

x86_64-w64-mingw32-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

ld -o Kernel.tmp -Ttext 0x8000 ExtendedProgram.o Kernel.o

ld -T"link.ld"

objcopy -O binary Kernel.tmp Kernel.bin

copy /b bootloader.bin+kernel.bin bootloader.flp

pause