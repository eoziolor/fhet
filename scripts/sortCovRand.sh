#!/bin/bash
dir=/home/oziolore/restoreFromData/fhet/data/coverage

zcat $dir/coverage_allbases.txt.gz | \
sort -R | \
head -n 10000000 | \
gzip > $dir/cov_10Mbrand.txt.gz
