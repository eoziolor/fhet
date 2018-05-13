#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')

#files and program

my_angsd=/data/oziolore/program/angsd_norm/angsd
list=/data/oziolore/fhet/data/list2/$one\_subangsd.txt
my_sfs=/data/oziolore/fhet/data/angsd2/subsample/$one\_unfolded.sfs
genome=/data/oziolore/fhet/data/genome2/unsplit_merge.fasta
my_keep=/data/oziolore/fhet/data/angsd2/keepsites2.file
outdir=/data/oziolore/fhet/data/angsd2/theta/subsample
outfile=$one\_unfolded\.theta

#script

$my_angsd \
-bam $list \
-out $outdir/$outfile \
-doThetas 1 \
-doSaf 1 \
-pest $my_sfs \
-anc $genome \
-fold 0 \
-GL 2 \
-minMapQ 30 \
-minQ 20 \
-minind 10 \
-P 8 \
-sites $my_keep

