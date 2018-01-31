
volatile:
	gcc -O2 -o volatile valatile_variable.c

longjmp:
	gcc -o longjmp longjmp.c

longjmp_volatile: longjmp_volatile_asm
	gcc -o longjmp_volatile_O2 longjmp_volatile_O2.s
	gcc -o longjmp_volatile_O0 longjmp_volatile_O0.s

longjmp_volatile_asm:
	gcc -O2 -S -o longjmp_volatile_O2.s longjmp_volatile.c
	gcc -O0 -S -o longjmp_volatile_O0.s longjmp_volatile.c

clean:
	-rm -rf volatile long_jmp
