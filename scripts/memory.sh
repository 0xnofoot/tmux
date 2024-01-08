#!/usr/bin/env sh

# 计算当前剩余内存
get_free_memory() {
    # 获取页面大小
    page_size=$(getconf PAGE_SIZE)
    # 获取空闲页数
    free_pages=$(vm_stat | awk '/Pages free/ {print $3}' | sed 's/\.$//')
    # 计算剩余内存
    free_memory=$((free_pages * page_size / 1024 / 1024)) # 转换为MB
    # 返回剩余内存
    echo "$free_memory"
}

echo "$(get_free_memory)M"
