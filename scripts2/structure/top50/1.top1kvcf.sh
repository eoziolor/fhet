#!/bin/bash

#PBS -l nodes=1:ppn=4

#programs and files

my_tabix=/data/oziolore/program/htslib/tabix
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_list=/data/oziolore/fhet/data/structure/top50/top1k.regions
my_bgz=/data/oziolore/program/htslib/bgzip
outdir=/data/oziolore/fhet/data/structure/top50
outfile=structure_top1k.vcf.bgz

$my_tabix -fh $my_vcf chr1:0-1 | $my_bgz > $outdir/$outfile
xargs -a $my_list -I {} $my_tabix -f $my_vcf {} | $my_bgz >> $outdir/$outfile
