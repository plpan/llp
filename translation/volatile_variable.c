#include <stdio.h>

int main() {
	int temp = 0;
	temp++;
	printf("%d\n", temp);

	volatile int vola = 3;
	vola++;
	printf("%d\n", vola);

	return 0;
}
