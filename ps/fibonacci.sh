# 피보나치 수열

#1
# n=$1
# a=( 0 1 )
# while ((n-- > 0)); do a=( "${a[1]}" $((a[0] + a[1])) ); done
# echo "${a[0]}"


#2
# 1. $n parameter expansion
# 2. brace expansion
# 3. arithmetic expansion

n=$1
a=0 b=1
((n > 0)) && eval eval "'((b = a + (a = b),'"{1.."$n"}"'));'"
echo "$a"