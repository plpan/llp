1. 函数调用
- call address 指令用来调用函数
- call 指令等价于
	- push rip
	- jmp <address>
- 保存在栈中的内容就是返回地址，也即之前rip寄存器中的内容

2. 参数
- 函数可以接收任意个参数，前六个是通过rdi, rsi, rdx, rcx, r8, r9传递，剩余的参数则是以相反的顺序被推入栈
	- 与系统调用参数列表有所区别，系统调用第四个参数被存储在r10中,因为syscall会隐式使用rcx
	- 系统调用最多6个参数

3. 函数结束
- ret指令表示函数的终结。ret指令与pop rip完全一致

4. 寄存器保护
- call和ret调用策略非常脆弱，必须通过其他方式来保证栈的状态能够正确转换。函数调用过程中会修改寄存器的内容，因此必须要保护好寄存器
	- callee-saved寄存器：必须由被调用的过程来恢复，如果函数修改了这些寄存器的值，在调用返回之前必须恢复原先的值
		- rbx, rbp, rsp, r12-r15
	- caller-saved寄存器：在函数调用之前保存，在调用之后恢复
		- 其他所有寄存器

5. 返回值
- 习惯上，函数的返回值会被存储在rax寄存器中，如果有两个返回值，另一个值可以存储在rdx中

6. 测试
- nasm -felf64 print.asm -o print.o && ld -o print print.o && chmod u+x print && ./print
