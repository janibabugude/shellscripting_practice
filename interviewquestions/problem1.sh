#write the  scripit to accept two inputs. if both are numbers, print their sum 
# otherwise error

#!/bin/bash
read -p "enter first number: " num1
read -p "enter second number: " num2
isdigit()
{
    if [[ "$1" =~ ^[+-]?[0-9]+$ ]];then
     return 0
    elif [[ "$1" =~ ^[+-]?[0-9]*\.[0-9]+$ ]];then
        return 0
    else
     return 1
    fi
}


if  isdigit "$num1" && isdigit "$num2" ;then
    sum=$(echo "$num1 + $num2" | bc)
    echo "Sum of $num1 and $num2 are: $sum"
else
    echo "ERROR, both the inputs are in numbers"
fi


