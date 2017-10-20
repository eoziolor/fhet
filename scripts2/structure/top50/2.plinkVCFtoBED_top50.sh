#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=02:00:00

#files
outdir=/data/oziolore/fhet/data/structure/top50
outfile=top1k

#more programs and files
my_plink=/data/oziolore/program/plink/plink
my_vcf=/data/oziolore/fhet/data/structure/top50/structure_top1k.vcf.bgz
my_tabix=/data/oziolore/program/htslib/tabix

$my_plink \
-vcf $my_vcf \
--allow-extra-chr \
--make-bed \
-out $outdir/$outfile
