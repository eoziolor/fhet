#!/bin/bash

#Here I will calculate pi values for a 5kb win 1kb slide on each popualtion using vcftools --window-pi and --window-pi-step

#program
my_vcftools=/home/oziolore/restoreFromData/program/vcftools/bin/vcftools

#files and variables
filt_varcall=/home/oziolore/restoreFromData/fhet/data/varcall/filtered_fgfh.vcf.gz
my_sites=/home/oziolore/restoreFromData/fhet/data/pi_vcft/keepsites.bed
indir=/home/oziolore/restoreFromData/fhet/data/pi_vcft


populations=(BB VB PB SJ BNP SP GB)

for i in {0..6}
	do
		pop=${populations[i]}
		$my_vcftools --gzvcf $filt_varcall \
		--window-pi 5000 \
		--window-pi-step 1000 \
		--bed $my_sites \
		--keep $indir/$pop\.txt \
		--out $indir/$pop\.diversity
done
