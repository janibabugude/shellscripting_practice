# Write a script to check whether a given number is prime or not.

#!/bin/bash
#!/bin/bash

# Colors
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
RESET="\033[0m"

# Keep prompting until valid input
while true; do
    read -p "Enter number: " num
    [[ "$num" =~ ^[0-9]+$ ]] && break
    echo -e "${RED}ERROR: Please enter a valid number.${RESET}"
done

# Prime check
if (( num < 2 )); then
    echo -e "${YELLOW}$num is Not Prime${RESET}"
    exit
fi

for ((i=2; i*i<=num; i++)); do
    if (( num % i == 0 )); then
        echo -e "${RED}$num is Not Prime${RESET}"
        exit
    fi
done

echo -e "${GREEN}$num is Prime${RESET}"
