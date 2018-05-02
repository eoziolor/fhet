#!/bin/bash

#files
list=/data/oziolore/fhet/data/list2/SJ_subangsd.txt
genome=/data/oziolore/fhet/data/genome2/unsplit_merge.fasta
keep=/data/oziolore/fhet/data/angsd2/keep50Mb2.file
outfile=/data/oziolore/fhet/data/angsd2/subsample/SJ

/data/oziolore/program/angsd/angsd \
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
