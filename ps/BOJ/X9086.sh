# 문자열의 첫글자와 마지막 글자 출력

#1: 25%에서 틀림
read
while read n
do
    echo "${n::1}${n: -1}"
done