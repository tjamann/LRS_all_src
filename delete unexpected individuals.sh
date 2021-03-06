###### commend line in unix  #####

# filter with vcftools --chr
vcftools sortedtassel_renamed.vcf --chr 10 --recode --out landrace_10.vcf

# extract the line including all individual names (It also includes the first 9 items, such as chr, pos,..)
awk 'NR~/^(11)$/{print}' landrace_10.vcf.recode.vcf >line_name.txt

# transpose columnw and rows
tr -s '\t' '\n' <line_name.txt> new_line_name.txt

#delete the first nine lines, which are not the name of individuals
sed -i 1,9d new_line_name.txt

# select lines needed to be deleted
grep -e 'Xpress_*' > Xpress.txt

# remove unwanted individuals from vcf file, ended up with landrace_10_nopre.recode.vcf
vcftools --vcf landrace_10.vcf.recode.vcf --remove Xpress.txt --recode --out landrace_10_nopre

####change to R to further delete unexpected sites and individuals with high missing data####

# open files with site name and individuals only, change N to NA
all10<-read.delim("all10.hmp.txt",sep='',header = T)
all10<-all10[,c(1,12:ncol(all10))]
all10[all10 == "N"]<-NA

# calculating missing data ratio for each sites and delete sites with missing data higher than 60%
missing_row_ratio <-apply(is.na(all10),1,sum)
new_data<-all10[missing_row_ratio<1509*0.6,]

# check the chr information of site
all10[all10[,1]%in%d,3]

# make the list of unwated sites.
d<-setdiff(all10[,1],new_data[,1])
write.csv(d,"site_delete.csv")

# list unwated individuals
c<-apply(is.na(new_data),2,sum)
idx <-which(c>nrow(new_data/2))
write.csv(names(idx),"indv_delete.csv")
