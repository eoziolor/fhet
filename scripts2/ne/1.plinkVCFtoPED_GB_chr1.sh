#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=02:00:00

#programs and files
my_plink=/data/oziolore/program/plink/plink
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_tabix=/data/oziolore/program/htslib/tabix
my_out=/data/oziolore/fhet/data/ne/GB/GB_chr1
my_keep=/data/oziolore/fhet/data/ne/GB_keep.txt

$my_plink \
-vcf $my_vcf \
--allow-extra-chr \
--recode \
--chr 1 \
--keep $my_keep \
-out $my_out
