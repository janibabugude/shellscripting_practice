# Write a script that reads multiple filenames as arguments and 
# checks if they all exist. If any does not, print the missing files.

#!/bin/bash
# --- Colours
BOLD='\e[1m'
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
CYAN='\e[1;36m'
RESET='\e[0m'

existing_files=()
permissiondenied_files=()
missing_files=()

# Get input 
function get_input(){
    if [ "$#" -gt 0 ]; then
        files=("$@")
    else
        echo -e "${CYAN}Enter your files (space-separated):${RESET}"
        read -r -a files
    fi
}
# Check file existance and Perissions
check_files(){
    for file_path in "${files[@]}";do
        if [[ -e "$file_path" ]];then
            if has_user_or_group_rw "$file_path";then
                existing_files+=("$file_path")
            else
                permissiondenied_files+=("$file_path")
            fi
        else
            missing_files+=("$file_path")
        fi
    done
}

has_user_or_group_rw(){
    local file="$1"
    local file_user=$(stat -c "%U" "$file")
    local file_group=$(stat -c "%G" "$file")
    # check if existing file is owned by current user and read+write permissions
    if [[ "$file_user" == "$USER" && -r "$file" &&  -w "$file" ]];then 
        return 0
    fi
    # check if existing file is owned by group, current user in the group and read+write permissions
    if id -nG "$USER" | grep -qw "$file_group"; then
        # check group read/write permissions
        if [[ $(stat -c "%A" "$file" | cut -c5) == "r" && $(stat -c "%A" "$file" | cut -c6) == "w" ]];then
            return 0
        fi
    fi
    return 1
}
print_results(){
    print_category "Existing Files" "${GREEN}" existing_files
    print_category "Permission Denied Files" "${YELLOW}" permissiondenied_files
    print_category "Missing Files" "${RED}" missing_files
}

print_category(){
    local title="$1"
    local colour="$2"
    local -n arr_files=$3
    if (( ${#arr_files[@]} )); then
        echo -e "${colour}${BOLD}${title}:${RESET}"
        for f in "${arr_files[@]}";do
            if [[ -e "$f" ]]; then
                perms=$(stat -c "%A" "$f" )
                Owner=$(stat -c "%U" "$f" )
                Group=$(stat -c "%G" "$f" )
                echo -e " ${colour}$f${RESET}   (${perms}, Owner: ${Owner}, Group: ${Group})"
         else
                echo -e "  ${colour}$f${RESET}"
            fi
        done
    else
        echo -e "${colour}${BOLD}No ${title,,}.${RESET}"
    fi
}

# --- Main Execution ---
get_input "$@"
check_files
print_results
