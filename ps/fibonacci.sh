# 피보나치 수열

#1
read n
a=( 0 1 )
while ((n--))
do
    a=( "${a[1]}" $((a[0] + a[1])) )
done
echo "${a[0]}"