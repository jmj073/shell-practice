#!/bin/bash

declare -A arr
eval arr=\( \[{a..z}\]=-1 \)
read s
N=${#s}
while ((N--)); do
    arr[${s:N:1}]=$N
done

eval echo '${arr['{a..z}']}'