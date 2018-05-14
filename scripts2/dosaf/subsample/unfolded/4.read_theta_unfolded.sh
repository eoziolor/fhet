#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
#PBS -J 1-7

pops=BB\ VB\ PB\ SJ\ BNP\ SP\ GB

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')


#program/file
my_stat=/data/oziolore/program/angsd_norm/misc/thetaStat
file=/data/oziolore/fhet/data/angsd2/theta/subsample/$one\_unfolded.theta.thetas.idx
out=/data/oziolore/fhet/data/angsd2/theta/subsample/$one\_readable_theta_unfolded.gz

$my_stat print $file | gzip > $out

