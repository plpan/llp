1. 局部标签
- 以一个点开头的标签。可以在其他地方使用相同的标签，而不会冲突
- 局部标签出现在global标签中，那么他的全名为[全局标签名.局部标签名]，本例中就是_start.loop

2. 相对寻址
- lea rsi, [codes + rax]	; lea: load effective address - 取有效地址
	- 方括号表示间接寻址，地址被写到方括号里
	- lea允许计算一个内存单元的地址并把值存在其他地方

3. 指令跳转
- jmp addr 称为无条件跳转指令，其效果等价于mov rip, addr
- 此外，还有条件跳转指令，这些语句都依赖于rflags寄存器
	- 一般可以借助test指令或者cmp指令来设置rflags寄存器 （test是异或操作，cmp则是减操作）
	- jz：当zero flag被设置时跳转
	- ja (above) | jb (below) 无符号数比较
	- jg (great) | jl (less) 有符号数比较
	- jae (above or equal) | jle (less or equal)
