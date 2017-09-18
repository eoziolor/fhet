#!/bin/bash
 
BWA=/home/oziolore/restoreFromData/program/bwa-0.7.15/bwa
SBL=/home/oziolore/restoreFromData/program/samblaster/samblaster
outdir=/home/oziolore/restoreFromData/fhet/data/align2/
genome=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta
stools=/home/oziolore/restoreFromData/program/samtools-1.5/samtools

for i in {251..300}
	do
	fq1=/home/oziolore/restoreFromData/fhet/data/unmapped/combined1P_BU000$i.fastq.gz
	fq2=/home/oziolore/restoreFromData/fhet/data/unmapped/combined2P_BU000$i.fastq.gz
	sam=$(echo $fq1 | grep -oP "BU[0-9]+")
	pop=$(cat /home/oziolore/restoreFromData/fhet/data/list/pop_samples | grep $sam | cut -f 2)
	rg=$(echo \@RG\\tID:$sam.combined\\tPL:Illumina\\tPU:x\\tLB:combined\\tSM:$sam.$pop)
	outdir=/home/oziolore/restoreFromData/fhet/data/align2
	outroot=$sam\_$pop
	cmdline=$BWA\ mem\ $genome\ -t\ 2\ -R\ $rg\ $fq1\ $fq2
	$cmdline | $SBL -e -d $outdir/$outroot.disc.sam -s $outdir/$outroot.split.sam | \
	$stools view -S -h -u - | \
	$stools sort -T $outdir/$outroot - > $outdir/$outroot.bam
done
