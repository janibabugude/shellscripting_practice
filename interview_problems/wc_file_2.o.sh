#!/bin/bash
# -------------------------------------------------------------
# File Info Script - Counts lines, words, characters + metadata
# Author : Johnny Gude
# Version: 2.0
# -------------------------------------------------------------

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

# ---------- Usage Function ----------
usage() {
    echo -e "${YELLOW}Usage:${RESET} $0 [file1 file2 ...]"
    echo "If no file is provided, you'll be prompted to enter one."
    exit 1
}

# ---------- File Check Function ----------
check_file() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        echo -e "${RED}Error:${RESET} '$file' does not exist."
        return 1
    elif [[ ! -r "$file" ]]; then
        echo -e "${RED}Error:${RESET} '$file' is not readable."
        return 1
    fi
    return 0
}

# ---------- File Info Function ----------
print_file_info() {
    local file="$1"
    read lines words chars _ < <(wc "$file")
    local size
    size=$(stat -c%s "$file")
    local modtime
    modtime=$(stat -c%y "$file" | cut -d'.' -f1)

    echo -e "${BLUE}File:${RESET} $file"
    echo -e "  ${GREEN}Lines     :${RESET} $lines"
    echo -e "  ${GREEN}Words     :${RESET} $words"
    echo -e "  ${GREEN}Characters:${RESET} $chars"
    echo -e "  ${GREEN}Size      :${RESET} $size bytes"
    echo -e "  ${GREEN}Modified  :${RESET} $modtime"
    echo
}

# ---------- Main Script ----------
if [[ $# -eq 0 ]]; then
    read -rp "Enter filename(s): " -a files
else
    files=("$@")
fi

for file in "${files[@]}"; do
    if check_file "$file"; then
        print_file_info "$file"
    fi
done
