#!/bin/bash

while read n; do arr[n]=; done
for i in {1..30}; do
    [ -v arr[i] ] || echo $i
done