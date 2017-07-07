#!/bin/bash

#program and file
my_sfs=/home/oziolore/restoreFromData/program/angsd/misc/realSFS
in_saf=/home/oziolore/restoreFromData/fhet/data/angsd/PB.saf.idx
outdir=/home/oziolore/restoreFromData/fhet/data/angsd
out_sfs=PB.sfs

#code

$my_sfs $in_saf -maxIter 100 -P 8 -nSites 50000000 > $outdir/$out_sfs
