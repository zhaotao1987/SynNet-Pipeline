# !/bin/bash


#	Example:bash SynetAdding-Diamond.sh DiamondGenomesDB OUTPUT-name"

display_usage() {
#        echo -e "This Script is for Constructing Synteny Network Database"
	echo -e "\n\tAdding More Genomes into your Exsiting Network"
	echo -e "\tCheck [array] and [addnew],genomes in [addnew] should be included in [array]"
        echo -e "Usage:\n\tbash SynetAdding-Diamond.sh FolderName OUTPUT-network-name"
	echo -e "\tFolderName: DBs for Exsiting Genomes"
	echo -e "Example:\n\tbash SynetAdding-Diamond.sh DiamondGenomesDB OUTPUT-name\n"
        }

# if less than one arguments supplied, display usage
        if [  $# -le 0 ]
        then
                display_usage
                exit 1
        fi

# check whether user had supplied -h or --help . If yes display usage
        if [[ ( $* == "--help") ||  $* == "-h" ]]
        then
                display_usage
                exit 0
        fi

#########################
#	Step_1: species list
#########################

# The first array should includes old + new genomes
# Do remember to include the new genomes in array

array=(ath osa oth)
addnew=(oth)

ExistingPath=$1

foldername=$(date +"AddGenomes"%Y%m%d_%H%M)
mkdir "$foldername-$2"
cd "$foldername-$2"


#############################################################
#	Step_2: Lets's first generate database of each genome!
#############################################################

for i in "${addnew[@]}";do
echo make database for species_$i


diamond makedb --in ../$i.pep -d ../$ExistingPath/$i

done

####################################################################
#	Step_3: Now lets run Rapsearch and Generate BLASTP-like results
####################################################################

for i in "${array[@]}";do
	for j in "${addnew[@]}";do
	
	echo   blast "$i" against "$j" 

# All against addnew ! Read the manual of Diamond! --max-target-seqs/-k 
diamond blastp -q ../$i.pep -d ../$ExistingPath/$j -o "$i"_"$j" -p 10 --max-hsps 1 -k 6
# addnew against All !
diamond blastp -q ../$j.pep -d ../$ExistingPath/$i -o "$j"_"$i" -p 10 --max-hsps 1 -k 6

	
	done
done


###################################################################
#	Step_4: Now we combine corresponding files to prepare .blast 
#   This step is for intraspecies synteny detection!
##################################################################

echo Now we do intraspecies MCScanX, prepare inputs..

for i in "${array[@]}";do
	for j in "${addnew[@]}";do
	# if at=at and so on, prepare file especially
	
	if [ "$i" = "$j" ]; then
		echo "$i"_"$i"is $i.blast
		mv "$i"_"$i" $i.blast
		echo $i.bed is $i.gff
		cat ../$i.bed > $i.gff
		echo Intra-species MCScanX here for species $i
		MCScanX $i
		echo duplication modes!
		duplicate_gene_classifier $i
			
		fi
	done
done

	

#######################################################################
# 	Step_4.2  Another loop	
# 	This step is for interspecies synteny detection 
# 	How to avoid duplicates! A-B is the same as B-A, so keep only one
# 	use my small program
#######################################################################

#m=0
#n=1


function pwait() {
    while [ $(jobs -p | wc -l) -ge $1 ]; do
        sleep 1
    done
}


for i in "${array[@]}";do
	for j in "${addnew[@]}";do
	if [ "$i" != "$j" ]; then
	# before, the following commands have some typo ;   .m8.homo should be .m8.fix 
	echo merge "$i"_"$j" "$j"_"$i" into  "$i"_"$j".blast
	cat "$i"_"$j" "$j"_"$i" > "$i"_"$j".blast
	echo merge "$i".bed "$j".bed into "$i"_"$j".gff
	cat ../"$i".bed ../"$j".bed > "$i"_"$j".gff
	echo  Inter-species mcscan for "$i"_"$j"
	# commands below
	MCScanX	-a -b 2 "$i"_"$j" &
		fi
		pwait 10
	
	done
#	let n++
wait
done

#################################
#	Step_5: Now sort .collinearity files!
#	We are almost there!
#	Keep up!
##################################

for f in *.collinearity; do sed 's/^/'$f'/' $f >> 1; done

# split columns and kept the block score
# pay attention to ! \"\t\"

awk '{if($0~/.*score/){split($0,a,"=");print a[1]}else{print $0"\t"a[2]}}' 1 > 2 
# delete lines containing #

sed '/#/d' 2 > 3
# replace unwanted letters

sed 's/.collinearity//g; s/e_value//g; s/ //g; s/:/b/g' 3 > 4

awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 >  $2
# delete middle files 

rm 1 2 3 4

################################
#	step_6: now we have a SynNet	
################################

