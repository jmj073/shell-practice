# 1=================================================

shopt -s patsub_replacement || echo 'since bash 5.2'

al=( {a..z} )
eval ii={0..25}' eval eval \${al[-ii-1]}=\$ii;'
plain=$* plain=${plain//[[:space:]]/}
cipher=''

while read -n1 char; do
    if [[ $char == [a-z] ]]; then
        cipher+=${al[char]}
    else
        cipher+=$char
    fi
done <<< "$plain"

echo "encoding: $cipher"
echo -n "decoding: "
# echo "${cipher/?????/& }" # shopt -s patsub_replacement
sed 's/.\{5\}/& /g' <<< "$cipher"

# 2=================================================

# shopt -s patsub_replacement || echo 'since bash 5.2'

# az=( {a..z} )
# declare -A al
# eval i={0..25}' al[${az[-i-1]}]=${az[i]} '
# plain=$* plain=${plain//[[:space:]]/}
# cipher=''

# while read -n1 char; do
#     cipher+=${al[${char:- }]:-$char}
# done <<< "$plain"

# echo "encoding: $cipher"
# echo -n "decoding: "
# echo "${cipher/?????/& }" # shopt -s patsub_replacement
# sed 's/.\{5\}/& /g' <<< "$cipher"