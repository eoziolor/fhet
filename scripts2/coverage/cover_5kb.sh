#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -J 1-7
#PBS -l walltime=48:00:00

#Files

BED=/data/oziolore/program/bedtools2/bin/bedtools
BAM=/data/oziolore/program/bamtools/bin/bamtools
WIN5KB=/data/oziolore/fhet/data/windows2/5kb1kb.bed
GEN=/data/oziolore/fhet/data/genome2/unsplit_merge.genome

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

numba=$(echo $PBS_ARRAY_INDEX)
pop=$(echo $pops | cut -f $numba -d ' ')

LIST=/data/oziolore/fhet/data/list2/$pop\2\.txt
OUTDIR=/data/oziolore/fhet/data/coverage2

$BAM merge -list $LIST | \
$BAM filter -in - -mapQuality ">30" -isDuplicate false -isProperPair true | \
$BED bamtobed -i stdin | \
$BED map \
-a $WIN5KB \
-b stdin \
-c 5 -o mean,median,count \
-g $GEN \
>$OUTDIR/$pop.5kb1kb.qf.cov
