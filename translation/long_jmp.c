#include <stdio.h>
#include <setjmp.h>

/**
 * 默认情况下setjmp返回0，val值为0，因此执行longjmp函数
 * 当执行longjmp时，因为传入val的值为1，因此当再次执行setjmp时，返回的值为1
 * 此时val的值为1，因此输出之后会退出
 */
int main(void) {
	jmp_buf jb;
	int val;
	val = setjmp(jb);
	puts("hello!");
	if (val == 0) longjmp(jb, 1);
	else puts("world!");
	return 0;
}
