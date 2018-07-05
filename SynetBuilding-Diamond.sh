# !/bin/bash

#!/bin/bash 
 
display_usage() { 
	echo -e "\nThis Script is for Constructing Synteny Network Database" 
 	echo -e "\nUsage:bash SynetBuilding-Diamond.sh k OUTPUT-name\n"
	echo -e "\n-k 0: All hits\n-k 25: By default\n-k 6: MCScanX suggested\n"
	echo -e "\n-w 0: No collapse\n-w 5: default\n"
	echo -e "\n-m 25: Default Gaps\n"
	 
	} 

# if less than one arguments supplied, display usage 
	if [  $# -le 0 ] 
	then 
		display_usage
		exit 1
	fi 
 
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 


# declare an array called array and define 3 vales
# Input files: *.bed/gff & *.pep of each species
# Example: at.bed, at.pep
# This is advanced version of SynNet, written by Tao
# Starts from Rapsearch, data pretreatment, synteny detection, sort output 
# Note the program path before use. ie, RAPsearch2 sara server: ../RAPsearch2/RAPSearch2.23_64bits/bin
#													mary server: ./RAPSearch2.23_64bits/bin
# You can change the filename in the Line129, to name your own network.


#########################
#	Step_1: species list
#########################

#array=(xm tr pf on ol lo gm ga dr am tn pm)
# Actually 36 species in total,  3 of them is not ok. Tni Sfo and Cca
#array=(Tru Oni Ola Loc Cse Pre Dre Elu Ssa Nfu Ipu Lch Hbu Nbr Pny Xma Pfo Ame Cmi Spa Cva Nco Fhe Cha Lcr Ali Mze Pme Pla Sgr San Srh Kma ga gm pm)

# Usage : bash synet-Diamond.sh $1(OUTPUT-NAME)

#array=(ath tof osa lac hel)

#array=(ath osa oth Alyr)

array=(tof lac hel Ebr TKS sly ath atr vvi osa csi dca can oth Alyr)

foldername=$(date +"Genomes"%Y%m%d_%H%M)
mkdir "$foldername-SynNet-k$1w$2m$3"
cd "$foldername-SynNet-k$1w$2m$3"

#array=(tar)

#############################################################
#	Step_2: Lets's first generate database of each genome!
#############################################################
mkdir ../DiamondGenomesDB

for i in "${array[@]}";do

echo make database for species_$i

#../../Programs/RAPSearch2.23_64bits/bin/prerapsearch -d $i.pep -n $i.pep.db	
diamond makedb --in ../$i.pep -d ../DiamondGenomesDB/$i

done

####################################################################
#	Step_3: Now lets run Rapsearch and Generate BLASTP-like results
####################################################################

for i in "${array[@]}";do
	for j in "${array[@]}";do
	
	echo   blast "$i" against "$j" 
#../../Programs/RAPSearch2.23_64bits/bin/rapsearch -q $i.pep -d $j.pep.db -o "$i"_"$j" -z 10 -b 0 -v 50 -t a -p f -a t

# -k by default 25, -k 0  contains all blast, -k 6 is sugggested by mscanx
# --sensitive is suggested

# diamond blastp --sensitive -q ../$i.pep -d ../DiamondGenomesDB/$j -o "$i"_"$j" -p 15 --max-hsps 1 -k $1

# Fast mode not sensitive

diamond blastp  -q ../$i.pep -d ../DiamondGenomesDB/$j -o "$i"_"$j" -p 15 --max-hsps 1 -k $1

# ../programs/RAPSearch2.23_64bits/bin/rapsearch


	
	done
done

####################################################################
#	Step_4: Now we need a module to alter the output and make it neat.
####################################################################
#	for f in *.m8; do sed '/#/d;s/\r//g' $f > $f.homo
#.rd means remove duplicates
#	awk '!a[$1$2]++' $f.homo > $f.rd
# keep the top 6 or another number of hits!
#	awk 'a[$1]++<6' $f.rd > $f.fix
#	done

#	rm *.rd *.homo *.m8

###################################################################
#	Step_5.1: Now we combine corresponding files to prepare .blast 
#   This step is for intraspecies synteny detection!
##################################################################

echo Now we do intraspecies MCScanX, prepare inputs..


function pwait() {
    while [ $(jobs -p | wc -l) -ge $1 ]; do
        sleep 1
    done
}



for i in "${array[@]}";do
	for j in "${array[@]}";do
	# if at=at and so on, prepare file especially
	
	if [ "$i" = "$j" ]; then
		echo "$i"_"$i"is $i.blast
		mv "$i"_"$i" $i.blast
		echo $i.bed is $i.gff
		cat ../$i.bed > $i.gff
		echo Intra-species MCScanX here for species $i
# By default -w=5, max 5 genes to be collapsed.Within 5 genes considered to be tandem genes.
# This means if more than 5 genes, then won't collapse.
# I changed this to -w = 0

		MCScanX $i -w $2 -m $3 &
		#MCScanX $i &
		echo duplication modes!
		duplicate_gene_classifier $i
			
		fi
pwait 10
	done
wait
done

	# for inter species starts here!
	# but you have to be careful
	# to avoid duplications 

#######################################################################
# 	Step_5.2  Another loop	
# 	This step is for interspecies synteny detection 
# 	How to avoid duplicates! A-B is the same as B-A, so keep only one
# 	use my small program
#######################################################################

m=0
n=1

for i in "${array[@]:m}";do
	for j in "${array[@]:n}";do
	# before, the following commands have some typo ;   .m8.homo should be .m8.fix 
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

	MCScanX	-a -b 2 "$i"_"$j" -w $2 -m $3&
#	 MCScanX -a -b 2 "$i"_"$j" &

	done
	let n++
pwait 10
wait
done

#################################
#	Step_6: Now sort .collinearity files!
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

awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 >  SynNet-k$1w$2m$3
# delete middle files 

rm 1 2 3 4

################################
#	step_7: now we have a SynNet	
################################

