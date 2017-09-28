#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00

#program/file
my_stat=/data/oziolore/program/angsd/misc/thetaStat
file=/data/oziolore/fhet/data/angsd2/theta/VB.theta.thetas.idx
out=/data/oziolore/fhet/data/angsd2/theta/VB_readable_theta.gz

$my_stat print $file | gzip > $out
