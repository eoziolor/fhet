#!/bin/bash

#programs
my_samtools=/home/oziolore/restoreFromData/program/samtools-1.5/samtools
my_ref=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta

$my_samtools faidx $my_ref
