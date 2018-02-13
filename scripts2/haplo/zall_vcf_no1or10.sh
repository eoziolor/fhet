#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

#programs & files
my_tabix=/data/oziolore/program/htslib/tabix
my_bgz=/data/oziolore/program/htslib/bgzip

my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_list=/data/oziolore/fhet/data/outliers/zshared_10perregion_no1or10_formatted.bed
my_out=/data/oziolore/fhet/data/outliers/zshared_10_no1or10.vcf.bgz

$my_tabix -fh $my_vcf chr1:0-1 | $my_bgz > $my_out
xargs -a $my_list -I {} $my_tabix -f $my_vcf {} | $my_bgz >> $my_out
