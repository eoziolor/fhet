#!/bin/bash

#PBS -l nodes=1:ppn=8

#program and file
my_sfs=/data/oziolore/program/angsd/misc/realSFS
in_saf=/data/oziolore/fhet/data/angsd2/subsample/SJ.saf.idx
outdir=/data/oziolore/fhet/data/angsd2/subsample
out_sfs=SJ.sfs

#code

$my_sfs $in_saf -maxIter 100 -P 8 -nSites 50000000 > $outdir/$out_sfs
