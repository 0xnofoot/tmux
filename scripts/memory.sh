#!/bin/bash

# 计算当前剩余内存
get_free_memory() {
	free_memory=$(free -m | awk '/Mem:/ {print $4}')
    echo "$free_memory"
}


echo "$(get_free_memory)M"
