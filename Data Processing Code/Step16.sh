#Create a file with all of the SNP names in the reference set - Impute2 protocol step 11

##This takes 2 minutes to carry out and the file that is created will be used later on to create input files for imputation


for chr in {1..22}; do gunzip -c Reference_Genome/ALL_1000G_phase1integrated_v3_chr${chr}_impute.legend.gz | gawk -v chr=$chr '$5=="SNP" && S1!="id" {print chr"_"$2}' >> ADNI2_Impute_reference_SNPS.txt; done