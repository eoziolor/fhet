#!/bin/bash

#files
list=/home/oziolore/restoreFromData/fhet/data/list2/SP2.txt
genome=/home/oziolore/restoreFromData/fhet/data/genomed/unsplit_merge.fasta
keep=/home/oziolore/restoreFromData/fhet/data/angsd2/keep50Mb2.file
outfile=/home/oziolore/restoreFromData/fhet/data/angsd2/SP

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
