# Write a script to check whether a given number is prime or not.

#!/bin/bash

# Check if input is a number
check_number() {
    [[ "$1" =~ ^[0-9]+$ ]]
}

# Function to check prime number
is_prime() {
    local num=$1
    if (( num < 2 )); then
        return 1  # Not prime
    fi
    for ((i=2; i*i<=num; i++)); do
        if (( num % i == 0 )); then
            return 1  # Not prime
        fi
    done
    return 0  # Prime
}

# Get valid number from user
while true; do
    read -p "Enter number: " num
    if check_number "$num"; then
        break
    else
        echo "ERROR: Please enter a valid number."
    fi
done

# Check if prime
if is_prime "$num"; then
    echo "$num is Prime"
else
    echo "$num is Not Prime"
fi
