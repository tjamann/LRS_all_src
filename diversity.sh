vcftools --vcf landrace_geno_chr1to10.recode.vcf --remove teos.txt --recode --out landraces

vcftools --vcf landrace_geno_chr1to10.recode.vcf --keep teos.txt --recode --out teos

vcftools --vcf teos.recode.vcf --site-pi --out teos

vcftools --vcf landraces.recode.vcf --site-pi --out landraces

paste landraces.sites.pi teos.sites.pi > combined.sites.pi

vcftools --vcf landrace_geno_chr1to10.recode.vcf --weir-fst-pop teos.txt --weir-fst-pop landraces.txt 