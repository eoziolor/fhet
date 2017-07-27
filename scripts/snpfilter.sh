#!/bin/bash

#files and programs
my_vcftools=/home/oziolore/restoreFromData/program/vcftools/bin/vcftools


my_varcall=/home/oziolore/restoreFromData/fhet/data/varcall/fgtofhcalls.vcf.bgz
outdir=/home/oziolore/restoreFromData/fhet/data/varcall
outfile=filtered_fgfh.vcf.gz

$my_vcftools --gzvcf $my_varcall \
--minQ 30 \
--min-meanDP 0.17 \
--max-meanDP 0.73 \
--min-alleles 2 \
--max-alleles 2 \
--maf 0.01 \
--remove-filtered-all \
--recode \
--stdout |\
gzip > $outdir/$outfile
