# Write a script to find the top 5 largest files in a specified directory
# and print their names and sizes in human-readable format.

$dir_name="$1"

if [[ -d "$dir_name" ]]; then
    echo "$dir_name exists."
else 
    echo "$dir_name does not exists.\n
    please check directory name."
    exit 1
fi
echo "The top 5 largest files in $dir_name"
largest_files=$(find "$dir_name" -type f -exec du -h {} + | sort -hr | head -n 5)
    