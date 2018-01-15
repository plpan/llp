MAP_DAEMON=map_daemon
MAP_SEGFAULT=map_segfault
MAP_MAPPING=map_mapping

${MAP_DAEMON}: ${MAP_DAEMON}.asm
	nasm -felf64 ${MAP_DAEMON}.asm -o ${MAP_DAEMON}.o
	ld -o ${MAP_DAEMON} ${MAP_DAEMON}.o

map: ${MAP_DAEMON}
	./${MAP_DAEMON} & # 后台运行，执行 cat /proc/$$PID/maps 查看进程maps信息

${MAP_SEGFAULT}: ${MAP_SEGFAULT}.asm
	nasm -felf64 ${MAP_SEGFAULT}.asm -o ${MAP_SEGFAULT}.o
	ld -o ${MAP_SEGFAULT} ${MAP_SEGFAULT}.o

segfault: ${MAP_SEGFAULT}
	./${MAP_SEGFAULT} # 前台运行，查看错误

${MAP_MAPPING}: ${MAP_MAPPING}.asm
	nasm -g -felf64 ${MAP_MAPPING}.asm -o ${MAP_MAPPING}.o
	ld -o ${MAP_MAPPING} ${MAP_MAPPING}.o

mapping: ${MAP_MAPPING}
	./${MAP_MAPPING}

clean:
	-rm ${MAP_DAEMON} ${MAP_DAEMON}.o ${MAP_SEGFAULT} ${MAP_SEGFAULT}.o ${MAP_MAPPING} ${MAP_MAPPING}.o
