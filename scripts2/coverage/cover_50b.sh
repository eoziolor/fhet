BED=/data/oziolore/upload/bedtools2/bin/bedtools
BAM=/data/oziolore/upload/bamtools/bin/bamtools

WIN50B=/data/oziolore/fhet/data/windows/50b10b.bed

GEN=/data/oziolore/fhet/data/genome/reference_funhe_genome.txt

for pop in $(echo BB BNP GB PB SJ SP VB)
	do
	LIST=/data/oziolore/fhet/data/list/$pop.txt
	OUTDIR=/data/oziolore/fhet/data/coverage

	$BAM merge -list $LIST | \
	$BAM filter -in - -mapQuality ">30" -isDuplicate false -isProperPair true | \
	$BED bamtobed -i stdin | \
	$BED map \
	-a $WIN50B \
	-b stdin \
	-c 5 -o mean,median,count \
	-g $GEN \
	>$OUTDIR/$pop.50b10b.qf.cov
done
