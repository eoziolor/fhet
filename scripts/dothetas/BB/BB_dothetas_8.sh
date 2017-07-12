#!/bin/bash

#files and program

my_angsd=/home/oziolore/restoreFromData/program/angsd/angsd
list=/home/oziolore/restoreFromData/fhet/data/list/BB.txt
my_sfs=/home/oziolore/restoreFromData/fhet/data/angsd/BB.sfs
genome=/home/oziolore/restoreFromData/fhet/data/genome/reference_funhe.fna
my_keep=/home/oziolore/restoreFromData/fhet/data/angsd/segment/keepsites_seg.8.file
outdir=/home/oziolore/restoreFromData/fhet/data/angsd/thetas
outfile=BB8.theta

#script

$my_angsd \
-bam $list \
-out $outdir/$outfile \
-doThetas 1 \
-doSaf 1 \
-pest $my_sfs \
-anc $genome \
-fold 1 \
-GL 2 \
-minMapQ 30 \
-minQ 20 \
-minind 10 \
-P 8 \
-sites $my_keep
