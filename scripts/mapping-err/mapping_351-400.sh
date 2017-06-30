#!/bin/bash

BWA=/data/oziolore/programs/bwa/bwa
SBL=/data/oziolore/programs/samblaster/samblaster
outdir=/data/oziolore/fhet/data/align/
genome=/data/oziolore/fhet/data/genome/reference_funhe.fna
stools=/data/oziolore/upload/samtools-1.3/samtools

for i in {351..400}
	do
	fq1=/data/oziolore/fhet/data/unmapped/combined1P_BU000$i.fastq.gz
	fq2=/data/oziolore/fhet/data/unmapped/combined2P_BU000$i.fastq.gz
	sam=$(echo $fq1 | grep -oP "BU[0-9]+")
	pop=$(cat /data/oziolore/fhet/data/pop_samples | grep $sam | cut -f 2)
	rg=$(echo \@RG\\tID:$sam.combined\\tPL:Illumina\\tPU:x\\tLB:combined\\tSM:$sam.$pop)
	outdir=/data/oziolore/fhet/data/align
	outroot=$sam\_$pop
	cmdline=$BWA\ mem\ $genome\ -t\ 2\ -R\ $rg\ $fq1\ $fq2
	$cmdline | $SBL -e -d $outdir/$outroot.disc.sam -s $outdir/$outroot.split.sam | \
	$stools view -S -h -u - | \
	$stools sort -T $outdir/$outroot - > $outdir/$outroot.bam
done
