
input="$1"

echo "$input" > fulltext

sed "s/was not equal to.*//g" fulltext | sed 's/ $//g' | tr , '\n' > firsttext

sed "s/.*was not equal to//g" fulltext | sed 's/^ //g' | tr , '\n' > lasttext

/usr/local/bin/ksdiff firsttext lasttext

