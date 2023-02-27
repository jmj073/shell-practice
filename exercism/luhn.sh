num=$* num=${num//[[:space:]]/}
[[ ${#num} -le 1 || $num == *[^0-9]* ]] && { echo invalid argument; exit 1; }

sum=0

for ((i = 1; i <= ${#num}; i += 2)) do
    one=${num: -i:1} two=${num: -i-1:1}
    (( sum += one + two * 2 - (two > 4 ? 9 : 0) ))
done

((sum % 10)) && echo invalid || echo valid