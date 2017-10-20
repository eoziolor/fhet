#!/bin/bash

#PBS -l nodes=1:ppn=16
#PBS -l walltime=10:00:00

#programs and files
my_plink=/data/oziolore/program/plink/plink
my_bed=/data/oziolore/fhet/data/gwas/gwas
my_out=/data/oziolore/fhet/data/gwas/gwas_lin

$my_plink \
-bfile $my_bed \
--allow-extra-chr \
--assoc lin perm \
--seed 1 \
-out $my_out
