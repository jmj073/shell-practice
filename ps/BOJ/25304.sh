#!/bin/bash
read X
read N
declare -i total=0
while ((N--)); do
    read a b
    total+=a*b
done
((X == total)) && echo Yes || echo No
