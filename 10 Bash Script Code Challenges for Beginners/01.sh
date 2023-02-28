#!/bin/bash
# 1. Creating commands
# just use ls...

# 1=======================================================
# cd /usr/local
# # recursive
# [ "$1" = '-r' ] && shopt -s globstar
# printf '%s\n' **
# 2=======================================================

options=$(getopt -o ri:d -- "$@") || exit
eval set -- "$options"
shopt -s extglob 
shopt -s nullglob

while true; do
    case "$1" in
        -r)
            RECURSIVE=1
            shift ;;
        -i)
            INDENT="$2"
            shift 2 ;;
        -d)
            DIR= # print directory
            shift ;;
        --)
            shift
            break
    esac
done

: "${INDENT:=4}"
[[ $INDENT =~ ^[0-9]+$ ]] || { echo "$0: $INDENT: invalid indent argument"; exit 1; }

if [ -z "$RECURSIVE" ]; then
    run() {
        local flist=( "$1"* )
        printf '%s\n' "${flist[@]##${DIR-*/}}"
        exit
    }
else
    run() { # directory, depth
        for path in "$1"*; do
            printf '%*.s' "$2"

            if [ -d "$path" ]; then
                echo "${path##${DIR-*/}}":
                run "$path"/ $(($2 + INDENT))
            else
                echo "${path##${DIR-*/}}"
            fi
        done
    }
fi

run "${1%%+(/)}${1:+/}" 0