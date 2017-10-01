#!/bin/bash

#PBS -l nodes=1:ppn=16
#PBS -J 1-7
#PBS -l walltime=48:00:00

#programs
admix=/data/oziolore/program/admixture/admixture
allscaf=/data/oziolore/fhet/data/admixture/allscaf/allscaf.bed
out=/data/oziolore/fhet/data/admixture/allscaf

$admix --cv -j16 $allscaf $PBS_ARRAY_INDEX | tee $out/log${PBS_ARRAY_INDEX}.out
