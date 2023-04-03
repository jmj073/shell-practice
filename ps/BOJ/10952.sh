#!/bin/bash
while read a b; ((a)); do
    echo $((a+b))
done