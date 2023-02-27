res=
(($1 % 3)) || res+=Pling
(($1 % 5)) || res+=Plang
(($1 % 7)) || res+=Plong
echo ${res:-$1}