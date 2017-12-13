#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

#programs and files
my_tabix=/data/oziolore/program/htslib/tabix
my_bgzip=/data/oziolore/program/htslib/bgzip
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_list=/data/oziolore/fhet/data/phylo/keep25Mb.txt
my_out=/data/oziolore/fhet/data/phylo/25Mb.vcf.bgz

$my_tabix -fh $my_vcf chr1:0-1 | $my_bgzip > $my_out

xargs -a $my_list -I {} $my_tabix -f $my_vcf {} | $my_bgzip >> $my_out

zcat $my_out | $my_bgzip >> $my_out\2

$my_tabix -p vcf $my_out\2
