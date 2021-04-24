nasm bootloader.asm -f bin -o bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o

clang --target=x86_64-elf -ffreestanding -mno-red-zone -m64 -c Kernel.cpp -o Kernel.o

ld.lld -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o Kernel.o

llvm-objcopy -O binary kernel.tmp kernel.bin

cat bootloader.bin kernel.bin >> bootloader.flp
