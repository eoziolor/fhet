#!/bin/bash

#PBS -l nodes=1:ppn=16

outdir=/data/oziolore/fhet/data/fst2
popfile=/data/oziolore/fhet/data/list2/gender_fst
my_wcfst=/data/oziolore/program/vcflib/bin/wcFst
my_pfst=/data/oziolore/program/vcflib/bin/pFst
my_vcf=/data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz
my_bgzip=/data/oziolore/program/htslib/bgzip

pop1=M
pop2=F

echo $pop1 $pop2

target=$(grep -n $pop1 $popfile | cut -f 1 -d ":" | awk '{s=$1-1}{print s}' | tr '\n' ',' | \
sed 's/,$//')

background=$(grep -n $pop2 $popfile | cut -f 1 -d ":" | awk '{s=$1-1}{print s}' | tr '\n' ',' | \
sed 's/,$//')

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
