#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB
k=$(echo $PBS_ARRAY_INDEX)
theone=$(echo $pops | cut -f$k -d' ')

my_gt=/data/oziolore/fhet/data/ibdseq/$theone\.vcf\.vcf
my_out=/data/oziolore/fhet/data/ibdseq/$theone
my_ibd=/data/oziolore/program/ibdseq.jar

java -Xmx60m -jar $my_ibd gt=$my_gt out=$my_out nthreads=8 ibdlod=1.0
