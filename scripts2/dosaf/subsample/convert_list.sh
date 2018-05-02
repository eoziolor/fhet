#!/bin/bash

files=/data/oziolore/fhet/data/list2
pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB
main=/data/oziolore/fhet/data/list2/pop_samples

for i in {1..7}
	do x=$(echo $pops | cut -f $i -d ' ')
	echo $x
	cat $files/$x\_sub.txt |\
	tr ',' '\n' |\
	awk '{s=1}{print $1+s}' |\
	tr '\n' ',' |\
	sed 's/,/p;/g' |\
	xargs -i sed -n '{}' $main |\
	sed 's/\t/\_/' |\
	awk '{OFS=""}{print $0,"\.bam"}' |\
	sed -e 's/^/\/data\/oziolore\/fhet\/data\/align2\//' > $files/$x\_subangsd\.txt
done
