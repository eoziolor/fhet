#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00
#PBS -J 1-7

pop=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

k=$(echo $PBS_ARRAY_INDEX)
theone=$(echo $pop | cut -f$k -d' ')

my_plink=/data/oziolore/program/plink/plink
my_keep=/data/oziolore/fhet/data/ibdseq/$theone\_keep\.txt
my_out=/data/oziolore/fhet/data/ibdseq/$theone.vcf
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz

$my_plink \
--vcf $my_vcf \
--allow-extra-chr \
--recode vcf \
--chr 1-24 \
--keep $my_keep \
--out $my_out
