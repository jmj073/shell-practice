#!/bin/bash

read N M
arr=( $(eval echo "{0..$N}") )
while ((M--)); do
    read i j
    tmp=${arr[i]}
    arr[i]=${arr[j]}
    arr[j]=$tmp
done
echo -n "${arr[*]:1}"