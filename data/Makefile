App = endian

$(App) : $(App).o print.o
	ld -o $(App) $(App).o print.o

$(App).o : $(App).asm
	nasm -f elf64 $(App).asm

print.o : print.asm
	nasm -f elf64 print.asm
