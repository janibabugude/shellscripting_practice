#!/bin/bash

# accept  filename and check is exist, is readable, is writable....
# check file is exist or not
is_exist(){
    if [[ -f "$1" ]];then
        return 0
    else
        return 1
    fi
}
#check the file has read permission or not
is_readable(){
    if [[ -r "$1" ]];then
        return 0
    else
        return 1
    fi
}

#check the file has write permission or not
is_writable(){
    if [[ -w "$1" ]];then
        return 0
    else
        return 1
    fi
}   
#check the file has execute permission or not
is_execute(){
    if [[ -x "$1" ]];then
        return 0
    else
        return 1
    fi
}   

while true;do
    read -p "enter your filename: " filename
    if is_exist "$filename";then 
        echo "$filename exists."
        permit_list=""
        if is_readable "$filename";then
            permit_list+="read "
           # echo -e " $filename is existed and have read permission"
        fi
        if is_writable "$filename";then
            permit_list+="write "
            #echo -e " $filename is existed and have write permission"
        fi
        if is_execute "$filename";then
            permit_list+="execute "
            #echo -e " $filename is existed and have write permission"
        fi
        # check for permissions of filename
        if [[ -n "$permit_list" ]];then
            echo "Permissions for $filename: $permit_list"
        else
            echo "No permissions for $filename."
        fi
        break
    else
        echo "$filename does not exist."
        echo -e "enter your filename with full filepath..:\n
         e.g /home/ec2-user/filename.extension"
    fi
done 
 