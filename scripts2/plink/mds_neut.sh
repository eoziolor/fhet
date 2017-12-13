#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=72:00:00

my_vcf=/data/oziolore/fhet/data/varcall/filtered_neutral.vcf.bgz
my_plink=/data/oziolore/program/plink/plink
my_out=/data/oziolore/fhet/data/plink/

$my_plink \
-vcf $my_vcf  \
--allow-extra-chr \
--cluster \
--mds-plot 5 \
--out $my_out/neutral
