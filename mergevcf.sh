
# generated vcf files for insertion data using the R script vcf insert data_teo.Rmd
## needed to manually edit the output file by deleting first line, sorting the file by chr and position.
# need to combine teosinte samples with landrace samples


bgzip vcffile_landraces.vcf 
bgzip vcffile_teos.vcf 
tabix -p vcf vcffile_landraces.vcf.gz 
tabix -p vcf vcffile_teos.vcf.gz 
bcftools merge -o vcf_insertion_all.vcf vcffile_landraces.vcf.gz vcffile_teos.vcf.gz
bgzip -d vcffile_teos.vcf.gz
bgzip -d vcffile_landraces.vcf.gz

# convert files (insertion and ampliseq) to hapmap format with tassel
# combine union with tassel
# export hapmap file
# sort hapmap file
# reload after sorted
# if don't convert to hapmap file it doesn't combine the files properly!
