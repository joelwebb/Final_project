# Extract names of SNPS in both your target set and reference set from your target set so you have a new clean bed file with the snps
./plink --file clean-GWA-data.hg19 --extract range ADNI_Dupe_me_again  --threads 7 --memory 16384 --make-bed --out ADNI_extracted_rdy4_impute2.plink

say -v zarvox "Joe can you hear me? I am all done, dude"


