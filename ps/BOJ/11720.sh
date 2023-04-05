read
read a
declare -i s
for ((i = 0; i < ${#a}; ++i)) {
    s+=${a:i:1}
}
echo -n $s