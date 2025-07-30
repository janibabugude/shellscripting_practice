
# This is the comment for doing project

# The first topic is variables in linux. system variables , user-defined variable
# System variables is nothing but environmental variables that are representing captital variables
# to watch the system variables using "printenv"
"""
SSH_CONNECTION=18.206.107.29 16415 172.31.91.48 22
XDG_SESSION_CLASS=user
SELINUX_ROLE_REQUESTED=
TERM=xterm
LESSOPEN=||/usr/bin/lesspipe.sh %s
USER=ec2-user
SELINUX_USE_CURRENT_RANGE=
SHLVL=1
XDG_SESSION_ID=5
XDG_RUNTIME_DIR=/run/user/1000
S_COLORS=auto
SSH_CLIENT=18.206.107.29 16415 22
which_declare=declare -f
PATH=/home/ec2-user/.local/bin:/home/ec2-user/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
SELINUX_LEVEL_REQUESTED=
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
MAIL=/var/spool/mail/ec2-user
SSH_TTY=/dev/pts/0
BASH_FUNC_which%%=() {  ( alias;
 eval ${which_declare} ) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot "$@"
}
_=/usr/bin/printenv
"""

# echo is command to display the content 
echo " welcome to  shell scripting"
echo " Today learning the variable concept"
env_variables=$(printenv)
current_dir=$PWD
user_name=$USER
echo "username is $user_name"
echo "this is your present working directory $current_dir"
# performing calcuator operations
first_value=20
second_value=30
additon='expr($first_value + $second_value)'

subtraction=$($first_value - $second_value)

echo $additon
echo "The subration of $first_value and $second_value is $subtraction"