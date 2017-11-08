#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=02:00:00

/data/oziolore/program/samtools-1.5/samtools depth \
-f /data/oziolore/fhet/data/list2/pop_files.txt \
-Q 40 \
-r chr1:700000-900000 | \
gzip > /data/oziolore/fhet/data/coverage2/coverage_ahr.txt.gz
