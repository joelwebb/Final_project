##/bin/Bash

##Look up print_txt_Chrome_Length.sh7


for chr in 7; do
file="num_chrom_chunks_7.txt" 


chunk=$(cat "$file")
		
y="5000000"
start="0"

for i in {1..$chunk}; do
	startBP=$(expr $start + 1)
	endBP=$(expr $startBP + $y)


refdir="ALL_1000G_phase1integrated_v3_genome";
gen_maps="Genetic_Maps";

namefile="ADNI2_pre_Chr7.phased";

./impute2 -known_haps_g ${namefile}.haps -m ${gen_maps}/genetic_map_chr7_combined_b37.txt -h ${refdir}/ALL_1000G_phase1integrated_v3_chr7_impute.hap.gz -l ${refdir}/ALL_1000G_phase1integrated_v3_chr7_impute.legend.gz -int $startBP $endBP -Ne 20000 -o ${namefile}.chunk${i}.impute2;

let start=$((start + y));

	done
done

###This takes 10 minutes per chunk