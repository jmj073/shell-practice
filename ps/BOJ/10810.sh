#!/bin/bash

read N M
while ((M--)); do
    read i j k
    eval eval "' arr['{"$i..$j}]=$k
done
eval eval echo -n "' \$((arr['{1..$N}']))' "