zcat /data/oziolore/fhet/data/coverage2/coverage_allbases2.txt.gz | \
awk '{OFS="\t"}{s=$2-1}{print $1,s,$2,$3}' | \
awk '{OFS="\t"}{if($4>200){print}}' | \
/data/oziolore/program/bedtools2/bin/bedtools merge -i - -d 10 -c 4 -o count > /data/oziolore/fhet/data/coverage2/hicov.bed
