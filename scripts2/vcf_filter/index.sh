#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

#program/file
my_tabix=/data/oziolore/program/htslib/tabix
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz

$my_tabix -p vcf $my_vcf
