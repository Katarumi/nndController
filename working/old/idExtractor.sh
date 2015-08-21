#!/bin/bash


# Args:
# $1: raw Utaite mylist; 
# $2: Cut bit from $5, starting with :"sm, now cutSM 
# $3: the first ten characters of $2, appended.
# $4: Final output.
# $5: Copy of $1, destroyed. Now temp

a=1
sp="/-\|"
echo -n ' '

cp $1 temp
cat temp | sed '0,/.*:\"sm/s//sm/' > cutSM
cut -c 1-10 cutSM >> $3
ccount=$(wc -m < cutSM) 
oldcount=0 

while [ "$ccount" -ne $oldcount ]

	sed -r -i 's/.{77}$//' temp 
	cat temp | sed '0,/.*video_id\":\"sm/s//sm/' > cutSM
	cut -c 1-10 cutSM >> $3
	oldcount=$ccount
	ccount=$(wc -m < cutSM)
    	printf "\b${sp:a++%${#sp}:1}"

done

awk 'length($0)>9' sm.out > awktemp 
uniq awktemp > uniqtemp 
grep -e '^sm' uniqtemp > $4  
rm awktemp
rm uniqtemp
rm temp
rm cutSM
rm sm.out
