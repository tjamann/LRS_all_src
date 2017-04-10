data <- read.csv("Accessions and passport_8Jul2014.csv")

datalg<-data[,c(5,12)]
datalg[,1] <- sub("$", "-1", datalg[,1])

datalg2<-data[,c(5,12)]
datalg2[,1] <- sub("$", "-2", datalg2[,1])

datalg3<-data[,c(5,12)]
datalg3[,1] <- sub("$", "-3", datalg3[,1])

datalg4<-data[,c(5,12)]
datalg4[,1] <- sub("$", "-4", datalg4[,1])

datalg5<-data[,c(5,12)]
datalg5[,1] <- sub("$", "-5", datalg5[,1])

data_lg<-rbind(datalg,datalg2,datalg3,datalg4,datalg5)

write.csv(data_lg,"pheno_data.csv")
