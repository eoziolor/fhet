#!/bin/bash

#files
outdir=/home/oziolore/restoreFromData/fhet/data/angsd/thetas
pops=(BB VB PB SJ BNP GB SP)

for i in {0..6}
	do
	cat $outdir/${pops[$i]}\_theta\.txt | egrep "^#" > $outdir/${pops[$i]}\_new\_theta\.txt
	cat $outdir/${pops[$i]}\_theta\.txt | egrep "^NW" >> $outdir/${pops[$i]}\_new\_theta\.txt
	cat $outdir/${pops[$i]}\_theta\.txt | egrep "^NC" >> $outdir/${pops[$i]}\_new\_theta\.txt
done
