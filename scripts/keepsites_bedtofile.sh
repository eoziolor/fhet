cat /home/oziolore/restoreFromData/fhet/data/angsd/keepsites.bed | \
awk '{OFS="\t"}{s=$2+1}{print $1,s,$3}' > /home/oziolore/restoreFromData/fhet/data/angsd/keepsites.file
