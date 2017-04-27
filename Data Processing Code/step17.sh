#Get a list of the positions of SNPS that are in the target set and/or in the reference set

gawk '{print $1"_"$4}' ADNI_HG19_rdy4_prephase.map > ADNI_snps_Raw_data.txt



#And you need to run this next line using R studio

