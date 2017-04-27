#step 18 - Get only the snps that are present in both a target set and reference set

file1<- readLines("ADNI_Impute_reference_SNPS.txt")  ###This reads the lines in the file
file2<- readLines("ADNI_snps_Raw_data.txt")

uniqueData<-unique(c(file1,file2)) ## Merge and get the unique values

write(uniqueData,file="ADNI_Both_Snps.txt") ## Write to a new file

tk_messageBox(type = "ok", message = "Your new text file with both snp panels is ready", caption = "Both SNPS Done",)



###This step of this takes a while ~10 minutes. For some reason even working out of the PWD, the file from the previous script is saved in the directory with the legend files from the reference genome so the txt file needs moved to the pwd. 