#!/bin/bash

#listing all files in given directory
executetime=$(date +%H:%M)
echo "the script execution time is $executetime "
 check_dir(){
    if [[ -d "$1" ]];then
    return 0
    else
        return 1
    fi
 }

 while true;do
    read -p "Enter your dirctory full path like /home/../..: " dir
    if check_dir "$dir";then
    echo "$dir is valid"
    break
    else
    echo "ERROR, please enter full directory path.."
    fi
done
: <<"comment"
# Using find and reading line by line:
found_any=false
find "$dir"  -maxdepth 1 -name "*.log" -type f -mtime +90 | while IFS= read -r file;do
    found_any=true
    file_name=$(basename "$file")
    echo "$file_name"
done
comment


mapfile -t files < <(find "$dir"  -maxdepth 1 -name "*.log" -type f -mtime +90)
#mapfile is also called as READARRAY
if [[ ${#files[@]} -eq 0 ]];then
    # for counting files
    echo "No, .log files are older than 90 days found in $dir "
else 
    echo "Listing .log files are older than 90 days in $dir:"
    for file in "${files[@]}";do
        file_name=$(basename "$file")
        echo "$file_name"
    done
fi