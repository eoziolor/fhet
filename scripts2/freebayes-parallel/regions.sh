#!/bin/bash

#programs
my_free=/home/oziolore/restoreFromData/program/freebayes/scripts/fasta_generate_regions.py
my_fai=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.fasta.fai
regions=/home/oziolore/restoreFromData/fhet/data/genome2/unsplit_merge.regions

$my_free $my_fai 100000 > $regions
