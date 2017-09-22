cat /home/oziolore/restoreFromData/fhet/data/angsd2/keep50Mb2.bed | \
awk '{OFS="\t"}{s=$2+1}{print $1,s,$3}' > /home/oziolore/restoreFromData/fhet/data/angsd2/keep50Mb2.file
