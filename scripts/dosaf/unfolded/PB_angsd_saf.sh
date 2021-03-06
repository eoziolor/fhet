#!/bin/bash

#files
list=/home/oziolore/restoreFromData/fhet/data/list/PB.txt
genome=/home/oziolore/restoreFromData/fhet/data/genome/reference_funhe.fna
keep=/home/oziolore/restoreFromData/fhet/data/angsd/keep50Mb.file
outfile=/home/oziolore/restoreFromData/fhet/data/angsd/PB

/home/oziolore/restoreFromData/program/angsd/angsd \
-bam $list \
-doSaf 1 \
-anc $genome \
-GL 2 \
-minMapQ 30 \
-minQ 20 \
-minind 10 \
-sites $keep \
-out $outfile
