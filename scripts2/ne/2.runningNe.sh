#!/bin/bash

#PBS -l nodes=1:ppn=16
#PBS -l walltime=48:00:00
#PBS -J 1-7

#files
snep=/data/oziolore/program/SNeP1.1
indir=/data/oziolore/fhet/data/ne

k=$(echo $PBS_ARRAY_INDEX)
pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

thepop=$(echo $pops | cut -f $k -d ' ')

inped=$indir/$thepop/$thepop\_chr1\.ped
inmap=$indir/$thepop/$thepop\_chr1\_2\.map
inld=$indir/$thepop/$thepop\_chr1ldfromplink\.ld

$snep \
-ped $inped \
-map $inmap \
-ld \
-svedf \
-minr2 0.1 \
-maxr2 .95 \
-mindist 10000 \
-maf 0 \
-threads 16
