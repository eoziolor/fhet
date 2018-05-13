#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')


#program and file
my_sfs=/data/oziolore/program/angsd_norm/misc/realSFS
in_saf=/data/oziolore/fhet/data/angsd2/subsample/$one\_small\_sub\_unfolded.saf.idx
outdir=/data/oziolore/fhet/data/angsd2/subsample
out_sfs=$one\_unfolded.sfs

#code

$my_sfs $in_saf -maxIter 100 -P 8 -nSites 50000000 > $outdir/$out_sfs

