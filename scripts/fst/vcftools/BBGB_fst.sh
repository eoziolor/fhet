#!/bin/bash

#files and programs

my_vcftools=/home/oziolore/restoreFromData/program/vcftools/bin/vcftools
my_vcf=/home/oziolore/restoreFromData/fhet/data/varcall/filtered_fgfh.vcf.bgz
BB=/home/oziolore/restoreFromData/fhet/data/list/BB_ind.txt
GB=/home/oziolore/restoreFromData/fhet/data/list/GB_ind.txt
out=/home/oziolore/restoreFromData/fhet/data/fst/BBGB.bgz

$my_vcftools \
--gzvcf $my_vcf \
--weir-fst-pop $BB \
--weir-fst-pop $GB \
--out $out
