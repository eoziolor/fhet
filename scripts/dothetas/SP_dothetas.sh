
#!/bin/bash

#files and program

my_angsd=/home/oziolore/restoreFromData/program/angsd/angsd
list=/home/oziolore/restoreFromData/fhet/data/list/SP.txt
my_sfs=/home/oziolore/restoreFromData/fhet/data/angsd/SP.sfs
genome=/home/oziolore/restoreFromData/fhet/data/genome/reference_funhe.fna
my_keep=/home/oziolore/restoreFromData/fhet/data/angsd/keepsites_sorted.file
my_chrs=/home/oziolore/restoreFromData/fhet/data/angsd/chrs.txt
outdir=/home/oziolore/restoreFromData/fhet/data/angsd/thetas
outfile=SP.theta

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
-sites $my_keep \
-rf $my_chrs
