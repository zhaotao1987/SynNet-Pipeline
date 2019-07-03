# !/bin/bash
# Updated 2018-11-05 @ VIB Ghent by Tao

display_usage() {
       
		echo -e "\nThis Script is for Constructing Synteny Network Database"
        echo -e "\nUsage:bash SynetBuild-X.sh k s m p \n"
        echo "k: parameter for Diamond: # of top hits"
        echo -e "\n\t-k 0: All hits\n\t-k 25: Diamond Default\n\t-k 6: MCScanX suggested\n"
        echo -e "s: parameter for MCSCanX: Minimum # of Anchors for a synteny block \n   Higher, stricter"
        echo -e "\n\t-s 5: MCSCanX Default\n"
        echo -e "m: parameter for MCSCanX: Maximum # of Genes allowed as the GAP between Anchors\n    Fewer, stricter"
        echo -e "\n\t-m 25: MCScanX Default gaps\n"
		echo -e "p: Number of CPUs: Used for Diamond makedb|Diamond blastp|MCSCanX \n"
        echo -e "\n\t-p 25: Use 25 CPUs\n"

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
	


####################################
#
#	First, Pass the user-input variables 
#
####################################

hits=$1
anchors=$2
gaps=$3
CPU=$4

# We define a function here called "scale", to parrallel MCSCanX

function scale {
    while [ $(jobs -p | wc -l) -ge "$CPU" ]; do
        sleep 1
    done
}



	###########
	#
	# LOAD APPS
	# Make sure MCSCanX and Diamomd work globally. or export PATH
	# For example export PATH=/som/path/to/MCSCanX/bin:$PATH
	###########

	
	#########################
	#	Step_1: species list
	#########################

	# Change the items in this list, prepare .pep and .bed for each genome. 
	
	array=(Umar Vpac Mmus)

	foldername=$(date +"SynNetBuild"%Y%m%d_%H%M)
	
	mkdir "$foldername-SynNet-k$1s$2m$3"
	cd "$foldername-SynNet-k$1s$2m$3"

	#############################################################
	#	Step_2: Lets's first generate database of each genome!
	#############################################################

	mkdir ../DiamondGenomesDB

	for i in "${array[@]}";do
		echo make database for species_$i
		diamond makedb --in ../$i.pep -d ../DiamondGenomesDB/$i -p $CPU
	done

	####################################################################
	#	Step_3: Now lets run Diamond and Generate BLASTP-like results
	####################################################################

	for i in "${array[@]}";do
		for j in "${array[@]}";do
		echo   blast "$i" against "$j" 
	# option: --sensitive 
	# Sensitive mode is suggested by Diamomd.
	# Example:   diamond blastp --sensitive -q ../$i.pep -d ../DiamondGenomesDB/$j -o "$i"_"$j" -p $4 --max-hsps 1 -k $1
	# Here we use fast mode without --sensitive
		diamond blastp  -q ../$i.pep -d ../DiamondGenomesDB/$j -o "$i"_"$j" -p $CPU --max-hsps 1 -k $hits
			done
	done

	###################################################################
	#	Step_4.1: Now we combine corresponding files to prepare .blast 
	#	 This step is for intraspecies synteny detection!
	##################################################################

echo Now we do intraspecies MCScanX, prepare inputs..


for i in "${array[@]}";do
	for j in "${array[@]}";do

	if [ "$i" = "$j" ]; then

scale;(		echo "$i"_"$i"is $i.blast
		mv "$i"_"$i" $i.blast
		echo $i.bed is $i.gff
		cat ../$i.bed > $i.gff
		echo Intra-species MCScanX here for species $i

		MCScanX $i -s $anchors -m $gaps;\
		
		echo duplication modes!
		
		# Optional
		duplicate_gene_classifier $i;\
		
		# Optional
		
		echo Now we detect collinear tandem arrays.
        detect_collinear_tandem_arrays -g $i.gff -b $i.blast -c $i.collinearity -o $i.tandem.collinear;\
                #echo sum the number of added genes!
                #grep -o -E  ","  $i.tandem.collinear|wc -l > $i.tandemAdded
				)&
			fi
		done
	done
	
wait

	#######################################################################
	# 	Step_4.2  Another loop	
	# 	This step is for inter-species synteny detection 
	# 	How to avoid duplicates! A-B is the same as B-A, so keep only one
	# 	
	#######################################################################

m=0
n=1

for i in "${array[@]:m}";do

	for j in "${array[@]:n}";do
	
	# Do the following in parrallel
scale;(
		echo merge "$i"_"$j" "$j"_"$i" into  "$i"_"$j".blast;\
		cat "$i"_"$j" "$j"_"$i" > "$i"_"$j".blast;\
		echo merge "$i".bed "$j".bed into "$i"_"$j".gff;\
		cat ../"$i".bed ../"$j".bed > "$i"_"$j".gff;\
		echo  Inter-species mcscan for "$i"_"$j";\

	MCScanX	-a -b 2 "$i"_"$j" -s $anchors -m $gaps ;\
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

# Option: The following 4 lines is for Complement missed tandem genes around anchor genes!  
# Because MCScanX collapse tandem duplicates for synteny detection.
# But note that the following 4 lines double the work|runtime

        # echo Now we check missed tandem pairs around anchors;\
		# cat "$i"_"$j".blast "$i".blast "$j".blast > "$i"_"$j".all.blast;\
        # detect_collinear_tandem_arrays -g "$i"_"$j".gff -b "$i"_"$j".all.blast -c "$i"_"$j".collinearity -o "$i"_"$j".tandem.collinear;\
        # grep -o -E ","  "$i"_"$j".tandem.collinear|wc -l > "$i"_"$j".tandem.collinear.added ;\
		
		)& done
		
		let n++
	
	done

wait

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
# Pay attention to the following command, replace with the corrected gene names 

# The following sed command is for the previous Gene IDs, you should mute it.
# sed 's/ca__\([0-9]\+\)/ca\1ca/g;s/[a-z][a-z]__//g;s/\(p5_sc[0-9]\+.V1.gene[0-9]\+\)/el\1el/g;s/\(evm.TU.supercontig_[0-9]\+.[0-9]\+\)/cp\1cp/g;s/\(scaffold[0-9]\+\.[0-9]\+\)/ar\1ar/g;s/\(Scf[0-9]\+.g[0-9]\+\)/ug\1ug/g' 4| 

awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 >  SynNet-k$1s$2m$3
# delete middle files 

rm 1 2 3 4

	################################
	#	step_6: now we have a SynNet	
	################################

