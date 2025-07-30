# take input from user using read coomand
<<com
echo "enter the number : "
read num1
echo "enter the number: "
read num2
com
echo "enter your first number: " read -p num1
echo "enter your second number: " read -p num2
addition=$(($num1+$num2))
echo "The addition of two numbers ${num1} and ${num2} is $addition"