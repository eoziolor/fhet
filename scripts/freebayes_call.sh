#!/bin/bash

#files
genome=/home/oziolore/restoreFromData/fhet/data/genome/reference_funhe.fna
mergebam=/home/oziolore/restoreFromData/fhet/data/align/all_merged.bam
popsfile=/home/oziolore/restoreFromData/fhet/data/list/populations.txt
hicov=/home/oziolore/restoreFromData/fhet/data/coverage/hicov.bed

#programs
my_freebayes=/home/oziolore/restoreFromData/program/freebayes/bin/freebayes
my_bamtools=/home/oziolore/restoreFromData/program/bamtools/bin/bamtools
my_bgz=/home/oziolore/restoreFromData/program/htslib-1.5/bgzip
my_bedtools=/home/oziolore/restoreFromData/program/bedtools2/bin/bedtools

#directories and files

outdir=/home/oziolore/restoreFromData/fhet/data/varcall/
outfile=fgtofhcalls.vcf.bgz

$my_bamtools filter -in $mergebam -mapQuality ">30" -isProperPair true | \
$my_bedtools intersect -v -a stdin -b $hicov | \
$my_freebayes -f $genome --populations $popsfile --use-best-n-alleles 10 -p 1 --stdin | \
$my_bgz > $outdir/$outfile
