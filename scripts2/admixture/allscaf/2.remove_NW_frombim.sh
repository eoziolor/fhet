#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

#files
start_bim=/data/oziolore/fhet/data/admixture/allscaf/allscaf.bim
end_bim=/data/oziolore/fhet/data/admixture/allscaf/allscaf2.bim

cat $start_bim | awk '{gsub("NW_","");print}' > $end_bim
