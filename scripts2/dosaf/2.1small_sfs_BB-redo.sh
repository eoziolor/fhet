#!/bin/bash

#program and file
my_sfs=/data/oziolore/program/angsd_norm/misc/realSFS
in_saf=/data/oziolore/fhet/data/angsd2/BB_small.saf.idx
outdir=/data/oziolore/fhet/data/angsd2
out_sfs=BB.sfs

#code

$my_sfs $in_saf -maxIter 100 -P 8 -nSites 50000000 > $outdir/$out_sfs
