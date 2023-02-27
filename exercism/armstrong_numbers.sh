declare -i sum=0
for ((i = 0; i < ${#1}; ++i)) {
    sum+=${1:$i:1}**${#1}
}

if (($1 == sum)); then
    echo true
else
    echo false;
fi