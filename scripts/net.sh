#!/bin/bash

ifstat_output=$(ifstat)

# change the network interface for different device
interface="wlp1s0"

get_network_stat_download() {
    interface_rx=$(echo "$ifstat_output" | awk -v key="$interface" '$0 ~ "^" key {print $6}')

    if [[ $interface_rx =~ ^([0-9]+)$ ]]; then
        interface_rx="$(echo "scale=0; $interface_rx / 1024" | bc)K"
    elif [[ $interface_rx =~ ^([0-9]+)K$ ]]; then
        number_part="${BASH_REMATCH[1]}"
        interface_rx="$(echo "scale=1; $number_part / 1024" | bc)M"
    fi

    echo "$interface_rx"
}

get_network_stat_upload() {
    interface_tx=$(echo "$ifstat_output" | awk -v key="$interface" '$0 ~ "^" key {print $8}')

    if [[ $interface_tx =~ ^([0-9]+)$ ]]; then
        interface_tx="$(echo "scale=0; $interface_tx / 1024" | bc)K"
    elif [[ $interface_rx =~ ^([0-9]+)K$ ]]; then
        number_part="${BASH_REMATCH[1]}"
        interface_tx="$(echo "scale=1; $number_part / 1024" | bc)M"

    fi

    echo "$interface_tx"
}

echo "$(get_network_stat_download)b $(get_network_stat_upload)b"
