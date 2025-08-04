#!/bin/bash
# write a script for two inputs, check whether the inputs are digits their out is summition
#other wise print ERROR

function check_digits(){
    if [[ "$1" =~ ^[+-]?[0-9]+$ ]];then 
        return 0
    elif [[ "$1" =~ ^[+-]?[0-9]*\.[0-9]+$ ]];then
        return 0
    else
        return 1
    fi
} 

while true;do
    read -p " enter first number: " num1
    read -p " enter second number: " num2
    if check_digits "$num1" && check_digits "$num2";then
        echo "Both the inputs are valid"
        break
    else
        echo "ERROR, please enter both numbers must have digits or floating numbers only.."
    fi
done

    sum=$(echo "$num1 + $num2" | bc)
    echo "The sum of $num1 and $num2 are $sum" 
