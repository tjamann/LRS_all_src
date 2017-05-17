setwd("C:/Users/xzhng128/Box Sync/Landrace/results/Haplotype_16May")
hap<-read.csv("imputed_selected_haplotype_17May.csv",header = F)
hap[,11]<-as.numeric(as.character(hap[,11]))
hap[,12]<-as.numeric(as.character(hap[,12]))
data<-hap[1:403,10:11]
library(ggplot2)

for (i in unique(data[,1])){
  d<-subset(data,data[,1]== i)
    myplot<-ggplot(d, aes(V11)) + geom_density()+xlim(-50, 50)+xlab(as.character(i))+
      theme_bw() +
      theme(axis.line = element_line(colour = "black"),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            panel.border = element_blank(),
            panel.background = element_blank())
    ggsave(myplot,filename = paste(i,".png",sep=""),width = 6.95,height = 4.61)
}


for (i in unique(data[,1])){
  d<-subset(data,data[,1]== i)
  print(length(d[,1]))
}
