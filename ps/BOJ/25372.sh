# 문자열 길이

#1
read
while read a
do
    [[ ${#a} == [6-9] ]] && echo yes || echo no
done

#2
# read n
# while ((n--))
# do
#     read a
#     a=${#a}
#     [[ 6 -le $a && $a -le 9 ]] && echo yes || echo no
# done