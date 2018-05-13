
#!/bin/bash
#PBS -l nodes=1:ppn=8

#files and program

my_angsd=/data/oziolore/program/angsd/angsd
list=/data/oziolore/fhet/data/list2/GB2.txt
my_sfs=/data/oziolore/fhet/data/angsd2/GB.sfs
genome=/data/oziolore/fhet/data/genome2/unsplit_merge.fasta
my_keep=/data/oziolore/fhet/data/angsd2/keepsites2.file
outdir=/data/oziolore/fhet/data/angsd2/theta
outfile=GB.theta

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
