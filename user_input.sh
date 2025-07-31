# take input from user next line using read coomand
: << 'com'
echo "enter the number : "
read num1
echo "enter the number: "
read num2

# take input from user same line using read -p (prompt)coomand
read -p "enter your first number: " num1
read -p "enter your second number: " num2
addition=$(($num1+$num2))
echo "The addition of two numbers ${num1} and ${num2} is $addition"
multiplication=$(($num1 * $num2))
echo -n "the multipilication of two numbers $num1 and $num2 is: $multiplication"
com
# take input from user with secert data like hiding password using read -s commond
read -p "enter username " username
read -p "enter password "$'\n' -s -N 5 -t 10 password
echo " the username is $username and password is $password" 