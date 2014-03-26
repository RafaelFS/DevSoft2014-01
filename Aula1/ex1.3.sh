wget -O output $1 
grep $2 output | wc -l
rm output



