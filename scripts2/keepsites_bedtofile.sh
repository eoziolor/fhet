cat /home/oziolore/restoreFromData/fhet/data/angsd2/keepsites2.bed | \
awk '{OFS="\t"}{s=$2+1}{print $1,s,$3}' > /home/oziolore/restoreFromData/fhet/data/angsd2/keepsites2.file
