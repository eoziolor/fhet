#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=24:00:00
#PBS -J 1-288

list=/data/oziolore/fhet/data/list2/pop_files.txt
f=$(echo $PBS_ARRAY_INDEX)
ind=$(cat $list | sed "${f}q;d")
name=$(cat $list | sed "${f}q;d" | grep -o "BU.*")
sites=/data/oziolore/fhet/data/fastngs/refPanel_BBGB.sites
my_angsd=/data/oziolore/program/angsd/angsd
my_out=/data/oziolore/fhet/data/fastngs/beagle_all/$name\

$my_angsd \
-i $ind \
-GL 2 \
-sites $sites \
-doGlf 2 \
-doMajorMinor 3 \
-minMapQ 30 \
-minQ 20 \
-doDepth 1 \
-doCounts 1 \
-out $my_out
