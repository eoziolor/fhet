#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -J 1-21

cd /home/oziolore/restoreFromData/fhet/scripts/fst/

pops=BB\ VB\ PB\ SJ\ BNP\ GB\ SP
outdir=/data/oziolore/fhet/data/fst2/subsample
popfile=/data/oziolore/fhet/data/list2/pop_samples
popdir=/data/oziolore/fhet/data/list2
my_wcfst=/data/oziolore/program/vcflib/bin/wcFst
my_pfst=/data/oziolore/program/vcflib/bin/pFst
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_bgzip=/data/oziolore/program/htslib/bgzip


pair=$(for i in {1..6}
do
	ii=$(expr $i + 1)
	for j in $(seq $ii 7)
	do echo $pops | cut -f $i,$j -d ' '
done
done | \
sed -n "$(echo $PBS_ARRAY_INDEX)p")

echo $PBS_ARRAY_INDEX

pop1=$(echo $pair | cut -f 1 -d ' ')
pop2=$(echo $pair | cut -f 2 -d ' ')

echo $pop1 $pop2

target=$(cat $popdir/$pop1\_sub.txt)

background=$(cat $popdir/$pop2\_sub.txt)


outfile1=$pop1.$pop2.wcfst.bgz
outfile2=$pop1.$pop2.pfst.bgz

out1=$outdir/$outfile1
out2=$outdir/$outfile2

echo $out1
echo $out2
echo $target
echo $background
echo $outfile1
echo $outfile2

$my_wcfst \
--target $target \
--background $background \
--file $my_vcf \
--type GL | \
$my_bgzip>$out1

$my_pfst \
--target $target \
--background $background \
--file $my_vcf \
--type GL | \
$my_bgzip>$out2
