#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')

#files
list=/data/oziolore/fhet/data/list2/$one\_subangsd.txt
genome=/data/oziolore/fhet/data/genome2/unsplit_merge.fasta
keep=/data/oziolore/fhet/data/angsd2/keep50Mb.file
outfile=/data/oziolore/fhet/data/angsd2/subsample/$one\_small\_sub_unfolded
my_angsd=/data/oziolore/program/angsd_norm/angsd

$my_angsd \
-bam $list \
-doSaf 1 \
-fold 0 \
-anc $genome \
-GL 2 \
-minMapQ 30 \
-minQ 20 \
-minind 10 \
-sites $keep \
-out $outfile

