#!/bin/bash

get_total_cpu_usage() {
    # 输出总 CPU 使用率
	cpu_usage=$(top -b -n 1 | awk '/Cpu\(s\)/ {print $2}' | cut -d '%' -f 1)
    echo "$cpu_usage"
}

echo "$(get_total_cpu_usage)%"

