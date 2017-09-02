#!/bin/bash

#programs
my_vcftools=/home/oziolore/restoreFromData/program/vcftools/bin/vcftools

#files
my_vcf=/home/oziolore/restoreFromData/fhet/data/varcall/filtered_fgfh.vcf.gz
BB_list=/home/oziolore/restoreFromData/fhet/data/list/BB_ind.txt
GB_list=/home/oziolore/restoreFromData/fhet/data/list/GB_ind.txt
outdir=/home/oziolore/restoreFromData/fhet/data/fst


$my_vcftools \
--gzvcf $my_vcf \
--weir-fst-pop $BB_list \
--weir-fst-pop $GB_list \
--out $outdir/BBGB
