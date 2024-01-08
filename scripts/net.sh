#!/usr/bin/env sh

get_network_stat_upload() {
    # 获取网络上传的数据
    upload_kb=$(ifstat -i en0 -n 1 1 | awk 'NR==3 {print $2}')

    # 将速度从 KB 转换为 MB（保留两位小数）
    upload_mb=$(echo "scale=2; $upload_kb / 8192" | bc)

    # 如果流量为负数或0，将输出设为 0
    upload_kb=$(awk -v upload_kb="$upload_kb" 'BEGIN {if (upload_kb <= 0) print 0; else print upload_kb}')

    # 格式化 MB 输出，至少显示一位整数和两位小数
    upload_mb=$(printf "%.2f" "$upload_mb")

	echo "$upload_mb"
}

get_network_stat_download() {
    # 获取网络下载的数据
    download_kb=$(ifstat -i en0 -n 1 1 | awk 'NR==3 {print $1}')

    # 将速度从 KB 转换为 MB（保留两位小数）
    download_mb=$(echo "scale=2; $download_kb / 8192" | bc)

    # 如果流量为负数或0，将输出设为 0
    download_kb=$(awk -v download_kb="$download_kb" 'BEGIN {if (download_kb <= 0) print 0; else print download_kb}')

    # 格式化 MB 输出，至少显示一位整数和两位小数
    download_mb=$(printf "%.2f" "$download_mb")

	echo "$download_mb"
}

echo "$(get_network_stat_download)Mb $(get_network_stat_upload)Mb"
