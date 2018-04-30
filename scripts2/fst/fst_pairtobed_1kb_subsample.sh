#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00

#program/file
fst_files=/data/oziolore/fhet/data/fst2/subsample/
my_bedtools=/data/oziolore/program/bedtools2/bin/bedtools
my_genome=/data/oziolore/fhet/data/genome2/unsplit_merge.genome
my_window=/data/oziolore/fhet/data/windows2/new_noah.1kb.bed

for file in /data/oziolore/fhet/data/fst2/subsample/*wcfst.bgz
do
	outfile=$(echo $file | sed 's/wcfst.bgz/fst.1kb.bed/')

	zcat $file | \
	awk '{OFS="\t"}{s=$2-1}{print $1,s,$2,$5}' | \
	$my_bedtools map \
	-a $my_window \
	-b stdin \
	-g $my_genome \
	-c 4 \
	-o mean,count> $outfile
done
