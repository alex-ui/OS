nasm bootloader.asm -f bin -o bootloader.bin

nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o

x86_64-w64-mingw32-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

ld -T"link.ld"

copy /b bootloader.bin+kernel.bin bootloader.flp

pause