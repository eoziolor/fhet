#!/bin/bash

#PBS -l nodes=1:ppn=16
#PBS -l walltime=05:00:00

cd /data/oziolore/fhet/data/fastngs/

my_admix=/data/oziolore/program/admixture/admixture
my_ref=/data/oziolore/fhet/data/fastngs/reference_panel_all.bed
my_out=/data/oziolore/fhet/data/fastngs

$my_admix --cv -j16 $my_ref 2 | tee $my_out/all_log2
