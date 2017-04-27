##Convert oxford formated Impute2 output into plink Binary format using a hard call function


./plink --gen Chrom2.impute2.gen --sample ADNI_pre_Chr2.phased.sample --oxford-single-chr 2 --hard-call-threshold 0.45 --make-bed --out ADNI_post_imputation_chr2


