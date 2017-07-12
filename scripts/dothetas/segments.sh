#!/bin/bash

file=/home/oziolore/restoreFromData/fhet/data/angsd/segment/keepsites.file
outdir=/home/oziolore/restoreFromData/fhet/data/angsd/segment
outfile=keepsites_seg
blah=0

for ii in {1..550000..50000}
	do
		blah=$(awk "BEGIN {print $blah + 1; exit}")
		j=$(awk "BEGIN {print $ii + 49999; exit}")
		sed -n ''$ii','$j'p' $file > $outdir/$outfile.$blah.file
done
