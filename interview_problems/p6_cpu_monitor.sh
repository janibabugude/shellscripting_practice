#!/bin/bash

# Script: Monitor CPU and Memory usage every 5 seconds for 1 minute
# Logs are saved in /var/log/cpu_monitor with timestamped filenames

log_dir="/var/log/cpu_monitor"
log_file="$log_dir/cpu_usage_$(date '+%F_%H-%M-%S').log"

# Ensure log directory exists
if [[ ! -d "$log_dir" ]]; then 
    echo "[INFO] Log directory '$log_dir' not found. Creating..."
    mkdir -p "$log_dir" || { echo "[ERROR] Could not create log directory."; exit 1; }
fi

# Ensure log file is writable
touch "$log_file" || { echo "[ERROR] Cannot create log file '$log_file'."; exit 1; }

# Header info
echo "[INFO] Monitoring CPU and Memory usage every 5 seconds for 1 minute."
echo "[INFO] Logs will be saved to: $log_file"
echo -e "Timestamp\t\tCPU_Usage(%)\tMemory_Usage(%)" | tee -a "$log_file"

# Sample every 5 seconds for 60 seconds (12 iterations)
for ((i=1; i<=12; i++)); do
    timestamp=$(date '+%F %T')

    # Sum CPU and memory usage from all processes
    read cpu mem <<< $(ps -eo %cpu,%mem --no-headers | \
        awk '{cpu+=$1; mem+=$2} END {printf "%.1f %.1f", cpu, mem}')

    # Output to console and log file
    printf "%s\t%10.1f\t%14.1f\n" "$timestamp" "$cpu" "$mem" | tee -a "$log_file"

    sleep 5
done
