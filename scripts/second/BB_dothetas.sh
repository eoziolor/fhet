
#!/bin/bash

#files and program

my_angsd=/home/oziolore/restoreFromData/program/angsd/angsd
list=/home/oziolore/restoreFromData/fhet/data/list/BB2.txt
my_sfs=/home/oziolore/restoreFromData/fhet/data/angsd/BB.sfs
genome=/home/oziolore/restoreFromData/fhet/data/genome2/reference_funhe2.fna
my_keep=/home/oziolore/restoreFromData/fhet/data/angsd/keepsites.file
outdir=/home/oziolore/restoreFromData/fhet/data/angsd/thetas
outfile=BB2.theta

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
-sites $my_keep
