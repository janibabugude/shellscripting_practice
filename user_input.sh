# take input from user using read coomand
<<com
echo "enter the number : "
read num1
echo "enter the number: "
read num2
com
read -p "enter your first number: " num1
read -p "enter your second number: " num2
addition=$(($num1+$num2))
echo "The addition of two numbers ${num1} and ${num2} is $addition"