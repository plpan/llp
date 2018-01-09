#!/bin/bash

MAP=map_daemon
SEG=map_segfault

echo "# view maps of /proc/"'$PID'
make map
PID=$(ps -ef | grep ${MAP} | awk '{print $2}')
cat /proc/${PID}/maps

# kill ${MAP}
pkill ${MAP}

# separator
echo ""

echo "# test segment fault of accessing invalid address"
make segfault
