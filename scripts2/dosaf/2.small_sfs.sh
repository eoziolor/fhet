#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')


#program and file
my_sfs=/data/oziolore/program/angsd/misc/realSFS
in_saf=/data/oziolore/fhet/data/angsd2/$one\_small.saf.idx
outdir=/data/oziolore/fhet/data/angsd2
out_sfs=$one\.sfs

#code

$my_sfs $in_saf -maxIter 100 -P 8 -nSites 50000000 > $outdir/$out_sfs

