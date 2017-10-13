#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=1:00:00

#program/file
files=/data/oziolore/fhet/data/gwas
my_bedtools=/data/oziolore/program/bedtools2/bin/bedtools
my_genome=/data/oziolore/fhet/data/genome2/unsplit_merge.genome
my_window=/data/oziolore/fhet/data/windows2/5kb1kb.bed

for file in /data/oziolore/fhet/data/gwas/gwas.qassoc
do
	outfile=$(echo $file | sed 's/.assoc/.5kb1kb.bed/')

	cat $file | \
	awk '{OFS="\t"}{s=$3-1}{print $1,s,$3,$9}' | 
	awk '{if(NR>1)print}' |\
	$my_bedtools map \
	-a $my_window \
	-b stdin \
	-g $my_genome \
	-c 4 \
	-o mean,count> $outfile
done
