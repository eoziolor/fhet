#!/bin/bash

#files and programs
my_vcftools=/data/oziolore/program/vcftools/bin/vcftools


my_varcall=/data/oziolore/fhet/data/varcall/merged_chr.vcf.bgz
outdir=/data/oziolore/fhet/data/varcall
outfile=filtered_chr.vcf.gz

$my_vcftools --gzvcf $my_varcall \
--minQ 100 \
--min-meanDP 0.17 \
--max-meanDP 0.73 \
--min-alleles 2 \
--max-alleles 2 \
--maf 0.01 \
--remove-filtered-all \
--recode \
--stdout |\
bgzip > $outdir/$outfile
