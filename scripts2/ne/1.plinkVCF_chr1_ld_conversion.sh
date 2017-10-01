#!/bin/bash


#PBS -l nodes=1:ppn=1
#PBS -l walltime=00:10:00
#PBS -J 1-7

#files
pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB
k=$(echo $PBS_ARRAY_INDEX)
outdir=/data/oziolore/fhet/data/ne
theone=$(echo $pops | cut -f $k -d ' ')
my_file=$outdir/$theone/$theone\_chr1ld\.ld
my_out=$outdir/$theone/$theone\_chr1ldfromplink.ld

echo -e "CHR\tdist(bp)\tr2" > $my_out
cat $my_file | awk '{OFS="\t"}{s=$5-$2}{print $1,s,$7}' | tail -n +2 >> $my_out
