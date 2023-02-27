question() {
    [ "${input: -1}" = '?' ]
}

yell() {
    [[ $input = *[A-Z]* && $input != *[a-z]* ]]
}

main() {
    local input="$*"

    if [ -z "$1" ]; then
        echo 'Whatever.'
    elif question && yell; then
        echo 'Calm down, I know what I'\''m doing!'
    elif question; then
        echo 'Sure.'
    elif yell; then
        echo 'Whoa, chill out!'
    else
        echo 'Fine. Be that way!'
    fi
}

main "$@"