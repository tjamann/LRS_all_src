# LRS_all_src

Scripts use to call and filter variants for all landrace dataset

callvariantsplate_20Apr2016.sh was used to call variants on the linux machine and finished on Nov 28 2016. the files are backed up on personal/tjamann/LRS_all28Nov2016

call variants with callvariantsplate_20Apr2016.sh 

rename samples based on barcodes:accession/samples with rename.py
renamefiles_py.py remane files in a directory based on a dictionary file


hwe filter only needs to be run if chr 2, 3, and 8 are included, not necessary for ZmCCT.
hwe.rmd is a dependent file for the hwe filter

downstream analysis has code for figures in plos one 2017 paper


**Converting sample names**
Before you run the script, make a copy of the target vcf file and call it file_rename.vcf. 
This script will overwrite the vcf!
In order to change the sample names from DNA id to accession id use the following code:
python src/rename.py -VCF data/GBS/vcf_files/combined_rename.vcf -DICT data/GBS_dict.txt 



