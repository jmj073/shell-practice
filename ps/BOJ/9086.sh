# 문자열의 첫글자와 마지막 글자 출력

read
while read n || [ -n "$n" ]; do
    echo "${n::1}${n: -1}"
done