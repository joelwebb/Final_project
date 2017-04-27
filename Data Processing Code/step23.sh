##And the imputation begins and is performed for every chromosome in chunks of 5MB

refdir="ALL_1000G_phase1integrated_v3_genome";
gen_maps="Genetic_Maps";

for chr in {01..22}; do gawk '$1!="position"{print$1}' Genetic_Maps/genetic_map_chr${chr}_combined_b37.txt | sort -n | tail -n 1 >> macpositionss${chr}.txt ; num=0; for i in $(cat macpositionss$chr.txt); do let length$chr=$(($num + $i)); joe=$((length$chr / 5000000)); joe2=$(($joe + 1)); printf "%.0f\n" $joe2 > num_chrom_chunks_$chr.txt; done; done

for chr in {1..22}; do
namefile="ADNI2_pre_Chr${chr}.phased";
maxPos="num_chrom_chunks${chr}.txt";


start="0";
for chunk in 'seq 1 $maxPos'; do
endchr=$(($start + 5000000));
startchr=$(($start + 1));

./impute2 -known_haps_g ${namefile}.haps -m ${gen_maps}/genetic_map_chr${chr}_combined_b37.txt -h ${refdir}/ALL_1000G_phase1integrated_v3_chr${chr}_impute.hap.gz -l ${refdir}/ALL_1000G_phase1integrated_v3_chr${chr}_impute.legend.gz -int $startchr $endchr -Ne 20000 -o ${namefile}.chunk${chunk}.impute2;

start=$endchr;
done
done


say -v Zarvox "Imputation Finished, I've paid my dues, Time after time, I've done my sentence, But committed no crime, And bad mistakes, I've made a few,I've had my share of sand kicked in my face,But I've come through,We are the champions, my friends,And we'll keep on fighting 'til the end ,We are the champions,We are the champions,No time for losers,'Cause we are the champions of the world, I've taken my bows, And my curtain calls, You brought me fame and fortune and everything that goes with it, I thank you all, But it's been no bed of roses, No pleasure cruise, I consider it a challenge before the whole human race, And I ain't gonna lose, We are the champions, my friends, And we'll keep on fighting 'til the end, We are the champions, We are the champions, No time for losers, 'Cause we are the champions of the world, We are the champions, my friends, And we'll keep on fighting 'til the end, We are the champions, We are the champions, No time for losers, 'Cause we are the champions"


## if this process does not work because shapeit produced a 0 byte sized file, then go back to the original shapeit command in step 22 and run step 22 again

#THis should indicate a duplicate value in your file

#run the command "touch exclude_me_dude_${chr}.txt" so that way you can make a new text file 
#then copy the the duplicated value such as 31008267 from the line "ERROR: Duplicate site pos=31008267 ref= alt="
# then run the command "nano exclude_me_dude_${chr}.txt" so that way you can edit the text file
#paste in the duplicated value and use control+x to save the file
#Then re run the shape it command from step 22 adding in the new flag "--exclude-snp exclude_me_dude_Chr6.txt " so that you exclude that position