# Implement a script to parse /var/log/syslog and
# print all ERROR or WARNING messages from the last 24 hours.
syslog_file="/var/log/syslog"
if [[ ! -f "$syslog_file" ]];then
    echo "$syslog_file does not exist."
    exit 1
fi
# Get current time stamp and 24 hours ago time_stamp
current_time=$(date +%s)
cutoff_time=$(( $current_time - 86400 )) # 86400 seconds for 24 hours
#parse syslogs and filtering ERROR or WARNING messages from the last 24 hours
while IFS= read -r line;do
    # extract date for log line month day HH:MM:SS
    log_date_str=$(echo "$line" | awk '{print $1, $2, $3}')
    # convert log date to epouch
    log_epouch=$(date -d "$log_date_str" +%s 2>/dev/null)
    # if date conversion successed and log is within last 24 hours
    if [[ $? -eq 0 && $log_epouch -ge $cutoff_time ]]; then
        if echo "$line" | grep -E "ERROR|WARNING" >/dev/null; then
            echo "$line"
        fi
    fi 
done < "$syslog_file"