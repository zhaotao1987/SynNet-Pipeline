# !/bin/bash

 
display_usage() {
        echo -e "\nThis Script is for Constructing Synteny Network Database"
        echo -e "\nUsage:bash SynetBuilding-Diamond.sh k s m \n"
        echo "k: parameter for Diamond: # of top hits"
        echo -e "\n\t-k 0: All hits\n\t-k 25: Diamond Default\n\t-k 6: MCScanX suggested\n"
        echo -e "s: parameter for MCSCanX: Minimum # of Anchors for a synteny block \n   Higher, stricter"
        echo -e "\n\t-s 5: MCSCanX Default\n"
        echo -e "m: parameter for MCSCanX: Maximum # of Genes allowed as the GAP between Anchors\n    Fewer, stricter"
        echo -e "\n\t-m 25: MCScanX Default gaps\n"

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


# Change the elements of the following array according to your own genome selections
# Note that, take the following as an example, you should have 8 files prepared under the same folder
# *.pep and *.bed files for each genome

array=(ath osa oth Alyr)
# files required: ath.pep, ath.bed, osa.pep, osa.bed, oth.pep, oth.bed, Alyr.pep, Alyr.bed


foldername=$(date +"Genomes"%Y%m%d_%H%M)
mkdir "$foldername-SynNet-k$1w$2m$3"
cd "$foldername-SynNet-k$1w$2m$3"


#############################################################
#	Step_2: Lets's first generate database of each genome!
#############################################################
mkdir ../DiamondGenomesDB

for i in "${array[@]}";do

echo make database for species_$i

diamond makedb --in ../$i.pep -d ../DiamondGenomesDB/$i

done

####################################################################
#	Step_3: Now lets run Diamond and Generate BLASTP-like results
####################################################################

for i in "${array[@]}";do
	for j in "${array[@]}";do
	
	echo   blast "$i" against "$j" 

# -p : number of CPU -k: number of tophits

diamond blastp  -q ../$i.pep -d ../DiamondGenomesDB/$j -o "$i"_"$j" -p 15 --max-hsps 1 -k $1

	done
done


###################################################################
#	Step_4: Now we combine corresponding files to prepare .blast 
#   This step is for intraspecies synteny detection!
##################################################################

echo Now we do intraspecies MCScanX, prepare inputs..

# Define a function to use more threads to run MCScanX 

function pwait() {
    while [ $(jobs -p | wc -l) -ge $1 ]; do
        sleep 1
    done
}

#############

for i in "${array[@]}";do
	for j in "${array[@]}";do
	
	# if at=at and so on, prepare file especially
	
	if [ "$i" = "$j" ]; then
		echo "$i"_"$i"is $i.blast
		mv "$i"_"$i" $i.blast
		echo $i.bed is $i.gff
		cat ../$i.bed > $i.gff
		echo Intra-species MCScanX here for species $i

		MCScanX $i -s $2 -m $3 &
		# MCScanX $i & Default run, -s: 5 -m:25 
		
		echo duplication modes! # Optional
		duplicate_gene_classifier $i
		fi
	# pwait 10 : parrallel MCSCanX , you could even make it 20, or 30, depends on your computer/server.
	pwait 10
	
	done

wait

done


#######################################################################
# 	Step_4.2  Another loop	
# 	This step is for interspecies synteny detection 
# 	How to avoid duplicates! A-B is the same as B-A, so keep only one
# 	use my small program
#######################################################################

m=0
n=1

for i in "${array[@]:m}";do
	for j in "${array[@]:n}";do
	
	echo merge "$i"_"$j" "$j"_"$i" into  "$i"_"$j".blast
	cat "$i"_"$j" "$j"_"$i" > "$i"_"$j".blast
	echo merge "$i".bed "$j".bed into "$i"_"$j".gff
	cat ../"$i".bed ../"$j".bed > "$i"_"$j".gff
	echo  Inter-species mcscan for "$i"_"$j"
# commands below
#	[Usage] MCScanX prefix_fn [options]
#	-k  MATCH_SCORE, final score=MATCH_SCORE+NUM_GAPS*GAP_PENALTY
#     (default: 50)
#	-g  GAP_PENALTY, gap penalty (default: -1)
#	-s  MATCH_SIZE, number of genes required to call a collinear block
#     (default: 5)
# 	-e  E_VALUE, alignment significance (default: 1e-05)
# 	-m  MAX_GAPS, maximum gaps allowed (default: 25)
#	-w  OVERLAP_WINDOW, maximum distance (# of genes) to collapse BLAST matches (default: 5)
#	-a  only builds the pairwise blocks (.collinearity file)

	MCScanX	-a -b 2 "$i"_"$j" -s $2 -m $3 &
#	MCScanX -a -b 2 "$i"_"$j" & # Default Setting

	done
	let n++
pwait 10
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

awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 >  SynNet-k$1s$2m$3

# delete middle-step files 

rm 1 2 3 4

################################
#	step_6: Now we have a SynNet	
################################

