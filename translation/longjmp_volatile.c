#include <stdio.h>
#include <setjmp.h>

/**
 * 正常情况下，ival的值应该始终为1，而vval的值则一直递增
 *     longjmp能够将非volatile类型变量ival的恢复了出来，所以每次longjmp之后ival的值都变回0
 * 异常情况下（关闭gcc优化），ival和vval的值都是一直递增
 *     正是因为关闭gcc优化，触发了setjmp的隐藏bug，没有恢复非volatile类型变量ival
 */

jmp_buf jb;

int main(int argc, char **argv) {
	int ival = 0;
	volatile int vval = 0;
	setjmp(jb);
	while(vval < 3) {
		ival++;
		vval++;
		printf("ival: %d vval: %d\n", ival, vval);
		longjmp(jb, 1);
	}
	return 0;
}
