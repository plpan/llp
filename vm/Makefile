
loop: loop.asm
	nasm -felf64 loop.asm -o loop.o
	ld -o loop loop.o

run: loop
	./loop & # 后台运行，执行 cat /proc/${PID}/maps 查看进程maps信息


loop_segfault: loop_segfault.asm
	nasm -felf64 loop_segfault.asm
	ld -o loop_segfault loop_segfault.o

run_segfault: loop_segfault
	./loop_segfault # 前台运行，查看错误
