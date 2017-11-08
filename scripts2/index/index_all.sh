#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=02:00:00

parallel samtools index ::: /data/oziolore/fhet/data/align2/BU*.bam
