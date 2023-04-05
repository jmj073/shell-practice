#!/bin/bash

while read n; do a[n % 42]=; done
echo ${#a[@]}