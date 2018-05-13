#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')

#files
list=/data/oziolore/fhet/data/list2/$one\2_new.txt
genome=/data/oziolore/fhet/data/genome2/unsplit_merge.fasta
keep=/data/oziolore/fhet/data/angsd2/keepsites2.file
outfile=/data/oziolore/fhet/data/angsd2/$one\_full
my_angsd=/data/oziolore/program/angsd/angsd

$my_angsd \
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

