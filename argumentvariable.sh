# argumentvariable.sh
#!/bin/bash
# passing argument along with scriptname
variable_name1=$1
variable_name2=$2
echo "$1 and $variable_name2"
echo "This is your script_file: $0"
echo "number of argument passed: $#"
#echo " this is last argument: ${!@}"
#echo "what are the aruguments passed in between ${5-9}"
echo "what arguments are passed by user is: $@"
echo "what are the arguments are passed by user is: $*"
asdf
echo "provide exit status code for previous command 0 for succuss 127 for failed $?"
echo "this is process id : $$" 