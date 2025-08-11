# Write a script that accepts a filename and 
# prints the count of lines, words, and characters in the file.

#!/bin/bash

# This is basic level script
: <<"comment"

function is_file_exist(){
    if [[ ! -f "$1" ]]; then
        echo "The File $1 does not exist."
        exit 1
    else
        content_count=$(wc "$1" | awk '{print "Lines = " $1, "Words = " $2, "Characters = "$3 }')
        echo "The count of lines, words, and characters in file "$1" is: "
        echo "$content_count"
    fi
}
# Checking filename is exist or not
read -p "Enter your file/path/filename : " filename
is_file_exist "$filename"
comment

# This is professional, clean and smarter shell script

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

# -------- USAGE Function --------
usage(){
    echo -e "${YELLOW}Usage:${RESET} $0 [filename]"
    echo "If no filename is provided, you'll be prompted to enter one"
}
# ----- Get filename from argument or prompt ------
filename="$1"
if [[ -z "$filename" ]]; then
    read -rp "Enter your filename: " filename
fi
# ---- Check file existance and Readability ---
if [[ ! -f "$filename" ]]; then
    echo -e "${RED}Error:${RESET} file '$filename' does not exist."
    usage
    exit 1
fi
if [[ ! -r "$filename" ]]; then
    echo -e "${RED}Error:${RESET} file '$filename' does not have read permission."
    exit 1
fi

# ------ count and display ------

read -r lines words chars _ < <(wc "$filename")
echo -e "${GREEN}File:${RESET} $filename"
echo -e "${GREEN}Lines:${RESET} $lines"
echo -e "${GREEN}Words:${RESET} $words"
echo -e "${GREEN}Characters:${RESET} $chars"
