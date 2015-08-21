#!/bin/bash

cat $1 | sed '0,/.*:\"sm/s//sm/' > $2
cut -c 1-10 $2 >> $3
ccount=$(wc -m $2) 
echo "$ccount"

while [ 2 -ge 0 ]
do  

	sed -r 's/.{77}$//' $1 > temp 
	cp temp $1
	rm temp
	cat $1 | sed '0,/.*:\"sm/s//sm/' > $2
	cut -c 1-10 $2 >> $3
	ccount=$(wc -m $2)
	echo "$ccount"

done


