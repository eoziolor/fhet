#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=02:00:00

#files
outdir=/data/oziolore/fhet/data/structure/top50
outfile=top1k

#more programs and files
my_plink=/data/oziolore/program/plink/plink
my_bed=/data/oziolore/fhet/data/structure/top50/top1k
my_tabix=/data/oziolore/program/htslib/tabix

$my_plink \
--bfile $my_bed \
--allow-extra-chr \
--recode structure \
-out $outdir/$outfile
