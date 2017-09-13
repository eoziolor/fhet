#!/bin/bash

#programs and files

my_bedtools=/home/oziolore/restoreFromData/program/bedtools2/bin/bedtools
thetas=/home/oziolore/restoreFromData/fhet/data/angsd/thetas/BNP_new_theta.txt
window=/home/oziolore/restoreFromData/fhet/data/windows/1kb.bed
my_genome=/home/oziolore/restoreFromData/fhet/data/genome/reference_funhe.fna.fai
outdir=/home/oziolore/restoreFromData/fhet/data/angsd/thetas


cat $thetas | \
egrep -v "^#" | \
awk '{OFS="\t"}{w=exp($3)}{pi=exp($4)}{s=$2-1}{print $1,s,$2,w,pi}' | \
$my_bedtools map \
-a $window \
-b stdin \
-g <(cut -f 1-2 $my_genome) \
-c 4,4,5,5 \
-o sum,count,sum,count > $outdir/BNP_1kb.bed
