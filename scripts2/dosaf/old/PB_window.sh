#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=02:00:00

#programs and files

my_bedtools=/data/oziolore/program/bedtools2/bin/bedtools
thetas=/data/oziolore/fhet/data/angsd2/theta/PB_readable_theta.gz
window=/data/oziolore/fhet/data/windows2/5kb1kb.bed
my_genome=/data/oziolore/fhet/data/genome2/unsplit_merge.fasta.fai
outdir=/data/oziolore/fhet/data/angsd2/theta/


zcat $thetas | \
egrep -v "^#" | \
awk '{OFS="\t"}{w=exp($3)}{pi=exp($4)}{s=$2-1}{print $1,s,$2,w,pi}' | \
$my_bedtools map \
-a $window \
-b stdin \
-g <(cut -f 1-2 $my_genome) \
-c 4,4,5,5 \
-o sum,count,sum,count > $outdir/PB_neut_5kb1kb.bed
