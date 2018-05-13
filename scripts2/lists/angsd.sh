#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -J 1-7

dir=/data/oziolore/fhet/data/list2

pops=BB2\ VB2\ PB2\ SJ2\ BNP2\ SP2\ GB2

one=$(echo $pops | cut -f $PBS_ARRAY_INDEX -d ' ')

echo $one
echo $PBS_ARRAY_INDEX

#script

cat $dir/$one\.txt | sed 's/home/data/' | sed 's/restoreFromData\///' | uniq > $dir/$one\_new\.txt
