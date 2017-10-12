#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -J 1-7

infile=/data/oziolore/fhet/data/admixture/allscaf/allscaf.bed
outfile=/data/oziolore/fhet/data/admixture/allscaf/allscaf_fs
structure=/data/oziolore/program/fastStructure/structure.py

j=echo $PBS_ARRAY_INDEX
module load python

python $structure \
-k $j \
--input=$infile \
--output=$outfile \
--full \
--seed=100
