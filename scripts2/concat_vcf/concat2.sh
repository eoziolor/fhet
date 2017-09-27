#!/bin/bash

#PBS -l nodes=1:ppn=8

#progr and files

my_vcftools=/home/oziolore/restoreFromData/program/vcftools/bin/vcf-concat
files=/home/oziolore/restoreFromData/fhet/data/varcall/chr_new_destinations.txt
outfile=/home/oziolore/restoreFromData/fhet/data/varcall/merged_chr.vcf.bgz
my_bgzip=/home/oziolore/restoreFromData/program/htslib/bgzip


$my_vcftools -f $files | $my_bgzip > $outfile
