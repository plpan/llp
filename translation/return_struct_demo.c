// 这个并非是可执行文件，只是一个用来演示的demo

// 结构体定义
struct s {
	char vals[1024];
}

// 正常的结构体声明使用及返回
struct s f(int x) {
	struct s tmp;
	tmp->vals[10] = x;
	return s
}

// 实际上编译器内部是这样去操作的，这个是返回值优化，感兴趣的可以找详细资料看看
void f(int x, struct s *ret) {
	ret->vals[10] = x;
}
