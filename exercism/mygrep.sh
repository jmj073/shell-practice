#!/bin/bash

options=$(getopt -o nlivx -- "$@") || exit
eval set -- "$options"

while true; do
    case "$1" in
        -n) # print
            NUMBER=1
            shift ;;
        -l) # print
            FILE_NAME=1
            shift ;;
        -i) # matching
            shopt -s nocasematch
            shift ;;
        -v) # matching
            INVERT=1
            shift ;;
        -x) # matching
            LINE=1
            shift ;;
        --)
            shift
            break
    esac
done

pattern=${1?there is no pattern}
[ -v "$LINE" ] && pattern="^$pattern\$" # ...?
shift

files=( "${@-/dev/stdin}" )

print() { # 1(file), 2(string), 3(number)
    if [ -v FILE_NAME ]; then
        ((cnt == 1)) && echo "$file"
    else        
        ((${#files[@]} > 1)) && echo -n "$file:"
        [ -v NUMBER ] && echo -n "$cnt:"
        echo "$line"
    fi
}

eval 'match2() {' "${INVERT:+!}" '[[ $line =~ $pattern ]]; }'

match1() {
    local cnt=0
    while IFS= read -r line || [ -n "$line" ]; do
        match2 && { ((++cnt)); print; }
    done
}

main() {
    for file in "${files[@]}"; do
        match1 < "$file"
    done
}

main