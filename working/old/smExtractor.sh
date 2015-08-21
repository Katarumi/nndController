#!/bin/bash


# Args:
# $1: raw Utaite mylist; 
# $2: Cut bit from $5, starting with :"sm, now cutSM 
# $3: the first ten characters of $2, appended.
# $4: Final output.
# $5: Copy of $1, destroyed. Now temp



cp $1 temp
cat temp | sed '0,/.*:\"sm/s//sm/' > cutSM
cut -c 1-10 cutSM >> $3
ccount=$(wc -m < cutSM) 
oldcount=0 
echo "$ccount"

while [ "$ccount" -ne $oldcount ]

do  

	sed -r -i 's/.{77}$//' temp 
	cat temp | sed '0,/.*video_id\":\"sm/s//sm/' > cutSM
	cut -c 1-10 cutSM >> $3
	oldcount=$ccount
	ccount=$(wc -m < cutSM)
	echo "count: $ccount"
	echo "oldcout: $oldcount"
done

awk 'length($0)>9' sm.out > awktemp 
uniq awktemp > $4
rm awktemp
rm temp
rm cutSM
rm sm.out
