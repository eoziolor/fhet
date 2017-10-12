#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=02:00:00
#PBS -J 1-7

#files
pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB
k=$(echo $PBS_ARRAY_INDEX)
outdir=/data/oziolore/fhet/data/structure
theone=$(echo $pops | cut -f $k -d ' ')
my_out=$outdir/$theone/$theone\_chr1
my_keep=$outdir/$theone\_keep\.txt

#more programs and files
my_plink=/data/oziolore/program/plink/plink
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_tabix=/data/oziolore/program/htslib/tabix

$my_plink \
-vcf $my_vcf \
--allow-extra-chr \
--recode structure \
--chr 1 \
--keep $my_keep \
-out $my_out
