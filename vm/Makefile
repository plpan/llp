MAP_DAEMON=map_daemon
MAP_SEGFAULT=map_segfault

${MAP_DAEMON}: ${MAP_DAEMON}.asm
	nasm -felf64 ${MAP_DAEMON}.asm -o ${MAP_DAEMON}.o
	ld -o ${MAP_DAEMON} ${MAP_DAEMON}.o

map: ${MAP_DAEMON}
	./${MAP_DAEMON} & # 后台运行，执行 cat /proc/$$PID/maps 查看进程maps信息
	# TODO make this work
	#PID=$(shell ps -ef | grep ${MAP_DAEMON} | awk '{print $$2}')
	#cat /proc/${PID}/maps


${MAP_SEGFAULT}: ${MAP_SEGFAULT}.asm
	nasm -felf64 ${MAP_SEGFAULT}.asm -o ${MAP_SEGFAULT}.o
	ld -o ${MAP_SEGFAULT} ${MAP_SEGFAULT}.o

segfault: ${MAP_SEGFAULT}
	./${MAP_SEGFAULT} # 前台运行，查看错误

clean:
	-rm ${MAP_DAEMON} ${MAP_DAEMON}.o ${MAP_SEGFAULT} ${MAP_SEGFAULT}.o
