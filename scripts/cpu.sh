#!/usr/bin/env sh

get_total_cpu_usage() {
    # 使用 top 命令获取总 CPU 使用率信息
    total_cpu=$(top -l 1 -n 0 -F | grep "CPU usage" | awk '{print $3}' | cut -d% -f1)

    # 输出总 CPU 使用率
    echo "$total_cpu%"
}

echo "$(get_total_cpu_usage)"
