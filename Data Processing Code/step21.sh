say -v Kathy "Lets Rock"

for chr in {1..22}; do
./plink --bfile ADNI_extract --chr $chr --recode --out ADNI_pre_Chr${chr};
done
say -v Kathy "Chromosomes are now chunked, Joe"