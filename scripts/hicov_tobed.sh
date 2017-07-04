zcat /home/oziolore/restoreFromData/fhet/data/coverage/coverage_allbases.txt.gz | \
awk '{OFS="\t"}{s=$2-1}{print $1,s,$2,$3}' | \
awk '{OFS="\t"}{if($4>300){print}}' | \
bedtools merge -i - -d 10 -c 4 -o count > /home/oziolore/restoreFromData/fhet/data/coverage/hicov.bed
