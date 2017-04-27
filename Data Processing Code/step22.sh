##And the pre-phasing begins!!! This takes ~ 1 hour and 20 minutes per chromosome because it runs 7 iterations per chromosome which take 10 minutes per run and 10 minutes to estimape the number of sampling haplotypes while building graphs for the 756 subjects
##The graphs constituted 3391190 segments / ~8 SNPs per segment / 114393007 which may differ based on your sequencer setting. 

for chr in {2..22}; do
namefile="ADNI_pre_Chr${chr}";

./shapeit --input-ped ${namefile}.ped ${namefile}.map --input-map genetic_map_chr${chr}_combined_b37.txt --exclude-snp remove.txt --output-max ${namefile}.phased --thread 8 --output-log ${namefile}.phased.log;
done


say -v Zarvox "Imputation Finished"