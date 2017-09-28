#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

#program
my_bgzip=/data/oziolore/program/htslib/bgzip
orig=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.gz
out=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz

zcat $orig | $my_bgzip > $out
