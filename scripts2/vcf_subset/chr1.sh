#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.gz
my_out=/data/oziolore/fhet/data/varcall/chr1.vcf
my_real_out=/data/oziolore/fhet/data/varcall/chr1.vcf.gz

zcat $my_vcf | grep "#" > $my_out
zcat $my_vcf | grep -w "chr1" >> $my_out
cat $my_out | gzip > $my_real_out
