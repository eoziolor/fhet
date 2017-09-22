#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -J 2001-4000
cd /home/oziolore/restoreFromData/fhet/data/varcall/scaffold/


#files
genome=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta
my_fai=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta.fai
mergebam=/home/oziolore/restoreFromData/fhet/data/align2/all_merged2.bam
popsfile=/home/oziolore/restoreFromData/fhet/data/list2/populations2.txt
hicov=/home/oziolore/restoreFromData/fhet/data/coverage2/hicov.bed
reg_file=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.genome

#programs
my_freebayes=/home/oziolore/restoreFromData/program/freebayes/bin/freebayes
my_samtools=/home/oziolore/restoreFromData/program/samtools-1.5/samtools
my_bgz=/home/oziolore/restoreFromData/program/htslib/bgzip
my_bedtools=/home/oziolore/restoreFromData/program/bedtools2/bin/bedtools

#region to investigate

crap=$(echo $PBS_ARRAY_INDEX)
scaf=$(sed "$crap q;d" $reg_file | cut -f1)
end=$(sed "$crap q;d" $reg_file | cut -f2)
region=$scaf:1-$end 

#directories and files

outdir=/home/oziolore/restoreFromData/fhet/data/varcall/scaffold/
outfile=$scaf.vcf.bgz

$my_samtools view -q 30 -f 2 -h -b  $mergebam $region | \
$my_bedtools intersect -v -a stdin -b $hicov | \
$my_freebayes $regions 36 -f $genome --populations $popsfile --stdin | \
$my_bgz > $outdir/$outfile

echo $outdir
echo $region
echo $outfile
echo $crap
