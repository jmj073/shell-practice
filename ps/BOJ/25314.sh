#!/bin/bash
read N
tmp=`printf '%*s' $((N/4))`
echo "${tmp// /long }int"