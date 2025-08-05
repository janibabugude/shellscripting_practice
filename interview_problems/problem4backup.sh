# Create a backup script that backs up all .conf files from /etc 
# to a directory ~/backup_conf and appends the current date to the filename.

#!/bin/bash
script_date=$(date +%F)
function check_dir(){
    if [[ -d "$1" ]];then
        return 0
    else
        return 1
    fi
}
dir_name=~/backup_conf
if check_dir "$dir_name";then
    echo "$dir_name exists."
else
    mkdir -p "$dir_name"
    echo "$dir_name is created."
fi
# Find all .conf files in /etc and copy to backup directory with date appended
while IFS= read -r conf_file;do
    base_name=$(basename "$conf_file")
    cp -p "$conf_file" "$dir_name/${base_name}_$script_date"
done < <(find /etc -name "*.conf" -type f)

echo "Backup completed."

: <<"comment"
mapfile -t conf_files < <(find /etc -name "*.conf" -type f)
for conf_file in "${conf_files[@]}";do
    backupfile=$(cp -r "$conf_file" "$dir_name/$conf_file")
    renameconf_file=$(mv "$backup" "$backup_$script_date")
done
comment