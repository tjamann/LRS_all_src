#!bin/bash
set -e
set -u

## chr 1 to 10

# remove unwanted individuals from vcf file, ended up with landrace_10_nopre.recode.vcf
vcftools --vcf sortedtassel_renamed.vcf --remove XPress_list --recode --out landrace_nopre1

vcftools --vcf landrace_nopre1.recode.vcf --remove indv_delete.txt --recode --out landrace_nopre2

vcftools --vcf landrace_geno_chr1to10.recode.vcf --plink --out chr1to10plink

plink --file chr1to10plink --cluster --mds-plot 2 --noweb --allow-no-sex --out landrace_chr1to10plink

## chr 10

# filter with vcftools --chr
vcftools --vcf sortedtassel_renamed.vcf --chr 10 --recode --out landrace_10.vcf

# remove unwanted individuals from vcf file, ended up with landrace_10_nopre.recode.vcf

vcftools --vcf landrace_10.vcf.recode.vcf --remove XPress_list --recode --out landrace_10_nopre1

vcftools --vcf landrace_10_nopre1.recode.vcf --remove indv_delete.txt --recode --out landrace_nopre2

vcftools --vcf landrace_nopre2.recode.vcf --plink --out chr10plink

plink --file chr10plink --cluster --mind 0.8 --mds-plot 2 --noweb --allow-no-sex --out landrace_chr10plink
