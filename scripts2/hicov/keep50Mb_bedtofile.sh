cat /data/oziolore/fhet/data/angsd2/keep50Mb.bed | \
awk '{OFS="\t"}{s=$2+1}{print $1,s,$3}' > /data/oziolore//fhet/data/angsd2/keep50Mb.file
