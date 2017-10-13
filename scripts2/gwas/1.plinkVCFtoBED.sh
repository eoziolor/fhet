#!/bin/bash

#PBS -l nodes=1:ppn=16
#PBS -l walltime=02:00:00

#programs and files
my_plink=/data/oziolore/program/plink/plink
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_tabix=/data/oziolore/program/htslib/tabix
my_out=/data/oziolore/fhet/data/gwas

$my_plink \
-vcf $my_vcf \
--allow-extra-chr \
--make-bed \
-out $my_out
