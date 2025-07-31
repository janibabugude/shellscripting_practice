#!/bin/bash
# learn about conditional statement
# if then elif else
:<<"comment"
read -p "enter a number: " number
if [ $number == $number ]
then
    echo "number is matched ${number}"
fi
comment
# to take the age and check age < or > = using if
read -p"enter you age: " age

if [ $age < 10 ]; then
    echo "you are child"
elif [ $age > 10 -a $age < 20 ];then
    echo "you are a teenager.."
elif [ $age -gt 20 -a $age -lt 30 ]; then
    echo "you are adult"
else
    echo "you are older.."
fi