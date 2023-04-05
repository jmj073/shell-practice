#!/bin/bash

read N M

a=( $(eval echo "{0..$N}") )

while ((M--)); do
    read i j
    while ((i < j)); do
        eval a[i++]=${a[j]} a[j--]=${a[i]}
    done
done

echo -n "${a[*]:1}"