#Create a new unique list by gawking and printing columns to use in plink signalling ranges

sort ADNI_Both_Snps.txt | uniq -d |gawk -F "_" '{$3=$2+1; print $1, $2, $3, "R"NR}' > ADNI_Dupe_me_again


