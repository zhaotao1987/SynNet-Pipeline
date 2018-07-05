# !/bin/bash
# declare an array called array and define 3 vales
# Input files: *.bed/gff & *.pep of each species
# Example: at.bed, at.pep
# This is advanced version of SynNet, written by Tao
# Starts from Rapsearch, data pretreatment, synteny detection, sort output 
# Note the program path before use. ie, RAPsearch2 sara server: ../RAPsearch2/RAPSearch2.23_64bits/bin
#	mary server: ./RAPSearch2.23_64bits/bin
# You can change the filename in the Line129, to name your own network.

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
        if [[ ( $# == "--help") ||  $# == "-h" ]]
        then
                display_usage
                exit 0
        fi

#########################
#	Step_1: species list
#########################

#array=(xm tr pf on ol lo gm ga dr am tn pm)
# Actually 36 species in total,  3 of them is not ok. Tni Sfo and Cca
#array=(Tru Oni Ola Loc Cse Pre Dre Elu Ssa Nfu Ipu Lch Hbu Nbr Pny Xma Pfo Ame Cmi Spa Cva Nco Fhe Cha Lcr Ali Mze Pme Pla Sgr San Srh Kma ga gm pm)
# Usage : bash synet-Diamond.sh $1(OUTPUT-NAME)
#array=(ath tof osa lac hel)

array=(ath osa oth)
addnew=(oth)

ExistingPath=$1

foldername=$(date +"AddGenomes"%Y%m%d_%H%M)
mkdir "$foldername-$2"
cd "$foldername-$2"

#array=(tar)

#############################################################
#	Step_2: Lets's first generate database of each genome!
#############################################################

for i in "${addnew[@]}";do
echo make database for species_$i

#../../Programs/RAPSearch2.23_64bits/bin/prerapsearch -d $i.pep -n $i.pep.db	
diamond makedb --in ../$i.pep -d ../$ExistingPath/$i

done

####################################################################
#	Step_3: Now lets run Rapsearch and Generate BLASTP-like results
####################################################################

for i in "${array[@]}";do
	for j in "${addnew[@]}";do
	
	echo   blast "$i" against "$j" 
#../../Programs/RAPSearch2.23_64bits/bin/rapsearch -q $i.pep -d $j.pep.db -o "$i"_"$j" -z 10 -b 0 -v 50 -t a -p f -a t

# All against addnew ! Read the manual of Diamond! --max-target-seqs/-k 
diamond blastp -q ../$i.pep -d ../$ExistingPath/$j -o "$i"_"$j" -p 10 --max-hsps 1 -k 6
# addnew against All !
diamond blastp -q ../$j.pep -d ../$ExistingPath/$i -o "$j"_"$i" -p 10 --max-hsps 1 -k 6


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

	# for inter species starts here!
	# but you have to be careful
	# to avoid duplications 

#######################################################################
# 	Step_5.2  Another loop	
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

awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 >  $2
# delete middle files 

rm 1 2 3 4

################################
#	step_7: now we have a SynNet	
################################

