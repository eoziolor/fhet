#!/bin/bash

#programs

my_theta=/home/oziolore/restoreFromData/program/angsd/misc/thetaStat

#files
indir=/home/oziolore/restoreFromData/fhet/data/angsd/thetas
pops=(BB VB PB SJ BNP SP GB)

for i in {0..6}
	do $my_theta do_stat $indir/${pops[i]}.theta.thetas.idx \
	-win 5000 \
	-step 1000 \
	-outnames $indir/${pops[i]}.5kb1kb.gz
done
