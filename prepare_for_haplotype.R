geno<-read.delim("Insertion_reseq_chr10_intersect_phenotypedata_9May.hmp.txt",header = F,sep="")
geno1<-t(geno)
geno2<-geno1[c(1,12:nrow(geno1)),]
#pheno<-read.delim("Inter_join_1089_pheno.txt",header = F,sep="")
#pheno1<-pheno[4:nrow(pheno),]

#write.csv(geno2,"haplotype_geno.csv")
#write.csv(pheno1,"haplotype_pheno.csv")

geno3<-geno1[c(1,4,12:nrow(geno1)),]
geno4<-cbind(haplotype=1,geno3)
geno4[1,1]<-"haplotype"
geno4[2,1]<-"other"

chr7_par<-geno4
chr7_par[chr7_par=="A"]<-"AA"
chr7_par[chr7_par=="C"]<-"CC"
chr7_par[chr7_par=="T"]<-"TT"
chr7_par[chr7_par=="G"]<-"GG"
chr7_par[chr7_par=="R"]<-"AG"
chr7_par[chr7_par=="Y"]<-"CT"
chr7_par[chr7_par=="S"]<-"CG"
chr7_par[chr7_par=="W"]<-"AT"
chr7_par[chr7_par=="K"]<-"GT"
chr7_par[chr7_par=="M"]<-"AC"
chr7_par[chr7_par=="N"]<-""
chr7_par[chr7_par=="+"]<-"++"
chr7_par[chr7_par=="-"]<-"--"
chr7_par[chr7_par=="0"]<-"+-"


write.csv(chr7_par,"haplotype_format.csv")

