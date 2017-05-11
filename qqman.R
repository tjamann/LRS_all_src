install.packages("qqman")
library(qqman)
a <- read.csv("GAPIT..inter.mean.GWAS.Results.csv",header=T)
manhattan(a,chr = "Chromosome",bp = "Position",p = "P.value", snp = "SNP",col=c("aquamarine","darkorchid","cyan1","brown2","darkgoldenrod2","aquamarine","darkorchid","cyan1","brown2","darkgoldenrod2"),
chrlabs=NULL,highlight = c("S4_3504092","S5_1914454","S6_54903952","S7_61284589","S7_62541070"),suggestiveline = -log10(1.5e-5), genomewideline = -log10(0.00661))

symbols()
#chr = "CHR", bp = "BP", p = "P", snp = "SNP",
#col = c("gray10", "gray60"), chrlabs = NULL,
#suggestiveline = -log10(1e-05), genomewideline = -log10(5e-08),
#highlight = NULL, logp = TRUE, ...