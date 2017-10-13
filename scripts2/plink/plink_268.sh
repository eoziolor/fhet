/data/oziolore/upload/plink \
-vcf <(/data/oziolore/upload/htslib/tabix -h /data/oziolore/upload/realvcf/filteredNew.vcf.bgz Scaffold268:0-969478) \
--allow-extra-chr \
--cluster \
--mds-plot 5 \
--remove /data/oziolore/upload/realvcf/plink/plink_remove.txt \
--out /data/oziolore/upload/realvcf/plink/Scaf268

