#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -J 4001-6000

#files
set=/home/oziolore/restoreFromData/fhet/data/varcall/chr_list_destinations.txt
#crap=$(echo $PBS_ARRAY_INDEX)
infile=$(sed -n "$(echo $PBS_ARRAY_INDEX)p" $set)
outfile=$(echo $infile | sed 's/scaffold/unzipped\_scaffold/' | sed 's/\.bgz//')

echo $infile
echo $outfile

zcat $infile > $outfile
