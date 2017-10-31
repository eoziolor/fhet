#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=24:00:00
#PBS -J 1-288

list=/data/oziolore/fhet/data/list2/pop_files.txt
f=$(echo $PBS_ARRAY_INDEX)
name=$(cat $list | sed "${f}q;d" | grep -o "BU.*")
my_fastngs=/data/oziolore/program/fastNGSadmix/fastNGSadmix
my_GL=/data/oziolore/fhet/data/fastngs/beagle_all/$name\.beagle\.gz
my_out=/data/oziolore/fhet/data/fastngs/probs_all/$name
ref=/data/oziolore/fhet/data/fastngs/refPanel_all_new.2.P.txt
numb=/data/oziolore/fhet/data/fastngs/nInd_all.2.Q.txt

$my_fastngs \
-likes $my_GL \
-fname $ref \
-Nname $numb \
-whichPops all \
-seed 1 \
-boot 100 \
-out $my_out
