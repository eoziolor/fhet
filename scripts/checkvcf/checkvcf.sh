#!/bin/bash

#files and programs
check=/home/oziolore/restoreFromData/program/checkVCF/checkVCF.py
ref=/home/oziolore/restoreFromData/fhet/data/genome/reference_funhe.fna
vcf=/home/oziolore/restoreFromData/fhet/data/varcall/filtered_fgfh.vcf.bgz

python $check -r $ref -o test $vcf
