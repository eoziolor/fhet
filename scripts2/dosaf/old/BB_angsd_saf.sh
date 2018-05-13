#!/bin/bash

#files
list=/home/oziolore/restoreFromData/fhet/data/list2/BB2.txt
genome=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta
keep=/home/oziolore/restoreFromData/fhet/data/angsd2/keep50Mb2.file
outfile=/home/oziolore/restoreFromData/fhet/data/angsd2/BB

/home/oziolore/restoreFromData/program/angsd/angsd \
-bam $list \
-doSaf 1 \
-fold 1 \
-anc $genome \
-GL 2 \
-minMapQ 30 \
-minQ 20 \
-minind 10 \
-sites $keep \
-out $outfile
