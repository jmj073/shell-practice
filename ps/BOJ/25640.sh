# 문자열 비교

#1
cnt=0
read a
read
while read b
do
    [[ $a = $b ]] && ((++cnt))
done
echo "$cnt"