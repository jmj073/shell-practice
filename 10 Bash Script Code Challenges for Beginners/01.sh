# 1. Creating commands

cd /usr/local
# recursive
[ "$1" = '-r' ] && shopt -s globstar
printf '%s\n' **