#!/bin/bash

#files
genome=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta
mergebam=/home/oziolore/restoreFromData/fhet/data/align2/all_merged2.bam
popsfile=/home/oziolore/restoreFromData/fhet/data/list/populations.txt
hicov=/home/oziolore/restoreFromData/fhet/data/coverage2/hicov.bed

#programs
my_freebayes=/home/oziolore/restoreFromData/program/freebayes/bin/freebayes
my_bamtools=/home/oziolore/restoreFromData/program/bamtools/bin/bamtools
my_bgz=/home/oziolore/restoreFromData/program/htslib/bgzip
my_bedtools=/home/oziolore/restoreFromData/program/bedtools2/bin/bedtools

#directories and files

outdir=/home/oziolore/restoreFromData/fhet/data/varcall/
outfile=fgtofhcalls_chr.vcf.bgz

$my_bamtools filter -in $mergebam -mapQuality ">30" -isProperPair true | \
$my_bedtools intersect -v -a stdin -b $hicov | \
$my_freebayes -f $genome --populations $popsfile --stdin | \
$my_bgz > $outdir/$outfile