#!/bin/bash

#programs

my_bwa=/home/oziolore/restoreFromData/program/bwa-0.7.15/bwa
reference=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta

$my_bwa index $reference
