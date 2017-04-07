
# adding coloumns in passport. FID1 and Lgabs
mds<- read.table("chr1to10plink.mds", header=TRUE, quote="\"")
mds1<- read.table("landrace_chr10plink.mds", header=TRUE, quote="\"")
mds2<- read.table("chr10with82site.mds", header=TRUE, quote="\"")
passport <- read.csv("Accessions and passport_8Jul2014.csv")


mds$FID1<-gsub ('\\-[0-9]{1}','',mds[,1])
mds1$FID1<-gsub ('\\-[0-9]{1}','',mds1[,1])
mds2$FID1<-gsub ('\\-[0-9]{1}','',mds2[,1])
colnames(passport)[5]<-"FID1"
passport$FID1<-gsub ('\\-[0-9]{1}','',passport$FID1)
mds.passport <- merge(passport, mds, by="FID1")
mds1.passport <- merge(passport, mds1, by="FID1")
mds2.passport <- merge(passport, mds2, by="FID1")
library(ggplot2)

mds.passport$COUNTRY <- factor(mds.passport$COUNTRY)
mds1.passport$COUNTRY <- factor(mds1.passport$COUNTRY)
mds2.passport$COUNTRY <- factor(mds2.passport$COUNTRY)
### plot
pmdscountry <- ggplot(mds.passport, aes(C1, C2)) + geom_point(aes(colour = COUNTRY, shape = COUNTRY)) + 
  scale_shape_manual(values=1:nlevels(mds.passport$COUNTRY)) + 
  ggtitle("mds by country whole genome")
pmdscountry

lg <- ggplot(mds.passport, aes(C1, C2)) + geom_point(aes(colour = LG)) + scale_colour_gradient2(mid=("green"), low="black", high="purple")
lg  + ggtitle("mds by LG whole genome")
lgabs <- ggplot(mds.passport, aes(C1, C2)) + geom_point(aes(colour = Lgabs)) + scale_colour_gradient2(low="black",mid="green",high="purple")
lgabs  + ggtitle("mds by LGabs whole genome")


pmdscountry1 <- ggplot(mds1.passport, aes(C1, C2)) + geom_point(aes(colour = COUNTRY, shape = COUNTRY)) + 
  scale_shape_manual(values=1:nlevels(mds.passport$COUNTRY)) + 
  ggtitle("mds by country with chr10")
pmdscountry1

lg1 <- ggplot(mds1.passport, aes(C1, C2)) + geom_point(aes(colour = LG)) + scale_colour_gradient2(mid=("green"), low="black", high="purple")
lg1  + ggtitle("mds by LG with chr10")
lgabs1 <- ggplot(mds1.passport, aes(C1, C2)) + geom_point(aes(colour = Lgabs)) + scale_colour_gradient2(low="black",mid="green",high="purple")
lgabs1  + ggtitle("mds by LGabs with chr10")


pmdscountry2 <- ggplot(mds2.passport, aes(C1, C2)) + geom_point(aes(colour = COUNTRY, shape = COUNTRY)) + 
  scale_shape_manual(values=1:nlevels(mds.passport$COUNTRY)) + 
  ggtitle("mds by country with chr10 (81 sites)")
pmdscountry2

lg2 <- ggplot(mds2.passport, aes(C1, C2)) + geom_point(aes(colour = LG)) + scale_colour_gradient2(mid=("green"), low="black", high="purple")
lg2  + ggtitle("mds by LG with chr10 (81 sites)")
lgabs2 <- ggplot(mds2.passport, aes(C1, C2)) + geom_point(aes(colour = Lgabs)) + scale_colour_gradient2(low="black",mid="green",high="purple")
lgabs2  + ggtitle("mds by LGabs with chr10 (81 sites)")
