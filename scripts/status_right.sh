#!/usr/bin/env sh

icon_style="#[bg=default, fg=colour178, bold]"
text_style="#[bg=default, fg=colour255, nobold]"
split_line="#[bg=default, fg=colour126, bold]|"

cpu_usage=$(sh ~/.config/tmux/scripts/cpu.sh)
cpu_usage="${icon_style} ${text_style}${cpu_usage}"

memory_free=$(sh ~/.config/tmux/scripts/memory.sh)
memory_free="${icon_style} ${text_style}${memory_free}"

net_stat=$(sh ~/.config/tmux/scripts/net.sh)
read -r net_download net_upload <<< "$(echo "$net_stat" | sed 's/ / /')"
net_stat="${icon_style} ${text_style}${net_download} ${icon_style} ${text_style}${net_upload}"

echo "$cpu_usage $split_line $memory_free $split_line $net_stat"
