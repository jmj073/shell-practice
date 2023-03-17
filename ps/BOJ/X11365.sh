# 문자열 뒤집기

#1
a=$(</dev/stdin)
rev <<< "${a%$'\n'*END*}"

#2 16%에서 런타임에러
# head -n-1 | rev