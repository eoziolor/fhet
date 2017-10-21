#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=00:30:00

#programs and files
my_plink=/data/oziolore/program/plink/plink
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_tabix=/data/oziolore/program/htslib/tabix
my_out=/data/oziolore/fhet/data/fastngs/reference_panel_all
my_keep=/data/oziolore/fhet/data/list2/fastngs_reference_all.txt

$my_plink \
-vcf $my_vcf \
--allow-extra-chr \
--keep $my_keep \
--make-bed \
--chr 1-24 \
-out $my_out
