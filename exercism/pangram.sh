declare -A alphabet

cnt=26

for ((i = 0; i < ${#1}; ++i)) {
    a=${1:i:1} a=${a,}
    [[ $a == [a-z] ]] || continue
    ((cnt += alphabet[$a] - 1))
    ((cnt)) || break
    alphabet[$a]=1
}

exit $((cnt))