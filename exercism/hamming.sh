if [[ $# -ne 2 || ${#1} -ne ${#2} ]]; then
    echo invalid arguments
    exit 1
fi

declare -i cnt=0

for ((i = 0; i < ${#1}; ++i)) {
    [[ "${1:i:1}" == "${2:i:1}" ]] || cnt+=1
}

echo "$cnt"