#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=2:00:00


/data/oziolore/program/plink/plink \
-vcf /data/oziolore/fhet/data/varcall/filtered_chr.vcf.bgz \
--allow-extra-chr \
--cluster \
--mds-plot 5 \
--out /data/oziolore/fhet/data/plink/full.genome
