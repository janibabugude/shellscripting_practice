# Write a script to find the top 5 largest files in a specified directory
# and print their names and sizes in human-readable format.

function check_dir(){
    [[ -d "$1" ]]
}
dir_name="$1"
if check_dir "$dir_name"; then
    echo "$dir_name exists."
else 
    echo "$dir_name does not exists.\n
    please check directory name."
fi

while IFS= read -r largest_file;do
    base_name=$(basename "$largest_file")
    