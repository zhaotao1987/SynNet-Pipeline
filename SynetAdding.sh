# !/bin/bash
display_usage() {
       
		echo -e "\nThis Script is for Adding New Genomes into the Synteny Network Database"
        echo -e "\nUsage:bash SynetAdd-X.sh k s m p Existing_Path(containing *.dmnd)\n"
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

Existingdmnd='/path/to/diamond/databases/'

Existingpepbed='/path/to/genome/files/pep/bed/files'

# We define a function here called "scale", to parrallel MCSCanX

function scale {
    while [ $(jobs -p | wc -l) -ge "$CPU" ]; do
        sleep 1
    done
}





	
	#########################
	#	Step_1: species list
	#########################

	# Change the items in this list, prepare .pep and .bed for each genome. 
	
	# rm  Mimp Chaf 
	# array=(vra van pvu gma cca tpr mtr adu Anan Mimp Chaf lja Lang car pmu Rchi Dryd ppe \
	# pbr Mald Tori roc fve Mnot Zjuj Pand mes rco lus Potr ptr Cuma csa cme cla jre Bpen cgr cru Alyr ath Csat bol bra bnp thh tsa Lmey aar spa Bost Alp cgy tha \

	#array=(vra van pvu gma cca tpr mtr adu Anan lja Lang car pmu Rchi Dryd ppe \
	#pbr Mald Tori roc fve Mnot Zjuj Pand mes rco lus ptr Cuma csa cme cla jre Bpen cgr cru Alyr ath Csat bol bra bnp thh tsa Lmey aar spa Bost Alp cgy tha \
	#cpa gra Goba Ghir Dzib tca egr Cmax csi vvi spe sly stu can Caba Cach pax Inil Cuca Oeur sin mgu coc Lsat HanX Toff dca \
	#ach Cqui bvu Ahyp Psom Mcor Aqco nnu Trdc Horv bdi ogl Opun osa oru lpe Zmay sbi sit Sevi Sacc oth Ecru \
	#aco egu Pdac mac Dcat peq Doff Ashe Aoff Xvis spo zom Lchi atr Such Peam Ckan \
	#Xsor  Sbir  Qrob  Pgra  Prim  Nymp  Mole  Kalf  Fsyl  Datg  Cfol  Cgla  Cill  Ccat  Cnen  Begf  Aeri  Acya)

array=(ppe pmu pbr Mald fve Rchi roc)

before=(ppe pmu pbr Mald fve)

new=(Rchi roc)


foldername=$(date +"SynNetAdd6Now129"%Y%m%d_%H%M)
	
mkdir "$foldername-SynNet-k$1s$2m$3"
cd "$foldername-SynNet-k$1s$2m$3"

	#############################################################
	#	Step_2: Lets's first generate database for new genomes
	#############################################################

	#mkdir ../DiamondGenomesDB

for i in "${new[@]}";do
		echo make database for species_$i
		diamond makedb --algo 0 --in $Existingpepbed/$i.pep -d $Existingdmnd/$i -p $CPU
done

	####################################################################
	#	Step_3: Now lets run Diamond and Generate BLASTP-like results
	####################################################################

for i in "${array[@]}";do
	for j in "${new[@]}";do
	 
	# option: --sensitive 
	# Sensitive mode is suggested by Diamomd.
	# Example:   diamond blastp --sensitive -q ../$i.pep -d ../DiamondGenomesDB/$j -o "$i"_"$j" -p $4 --max-hsps 1 -k $1
	# Here we use fast mode without --sensitive
		echo   blast all to new @@ "$i" against "$j"
		
		diamond blastp  --algo 0 -q $Existingpepbed/$i.pep -d $Existingdmnd/$j -o "$i"_"$j" -p $CPU --max-hsps 1 -k $hits
		
		echo   blast new to all @@ "$j" against "$i" 
		
		diamond blastp  --algo 0 -q $Existingpepbed/$j.pep -d $Existingdmnd/$i -o "$j"_"$i" -p $CPU --max-hsps 1 -k $hits
		
			done
done

	###################################################################
	#	Step_4.1: Now we combine corresponding files to prepare .blast 
	#	 This step is for intraspecies synteny detection!
	##################################################################

echo Now we do inter old-new MCScanX, prepare inputs..


for i in "${before[@]}";do
	for j in "${new[@]}";do

#	if [ "$i" = "$j" ]; then

scale;(	

		echo merge "$i"_"$j" "$j"_"$i" into  "$i"_"$j".blast;\
		cat "$i"_"$j" "$j"_"$i" > "$i"_"$j".blast;\
		echo merge "$i".bed "$j".bed into "$i"_"$j".gff;\
		cat $Existingpepbed/"$i".bed $Existingpepbed/"$j".bed > "$i"_"$j".gff;\

		echo Inter-species MCScanX here for species $i
		
		MCScanX	-a -b 2 "$i"_"$j" -s $anchors -m $gaps;\
		
		# echo Now we check missed tandem pairs around anchors;\
		# cat "$i"_"$j".blast "$i".blast "$j".blast > "$i"_"$j".all.blast;\
        # detect_collinear_tandem_arrays -g "$i"_"$j".gff -b "$i"_"$j".all.blast -c "$i"_"$j".collinearity -o "$i"_"$j".tandem.collinear;\
        # grep -o -E ","  "$i"_"$j".tandem.collinear|wc -l > "$i"_"$j".tandem.collinear.added ;\
	
				)&
#			fi
		done
	done
	
wait

	#######################################################################
	# 	Step_4.2  Another loop	
	# 	This step is for inter-species synteny detection 
	# 	How to avoid duplicates! A-B is the same as B-A, so keep only one
	# 	use my small program
	#######################################################################

m=0
n=0

echo Now we do inter within-news [inter, intra] MCScanX, prepare inputs..

for i in "${new[@]:m}";do
	
	for j in "${new[@]:n}";do
		
		if [ "$i" != "$j" ]; then	

		echo new genomes: inter

# Do the following in parrallel

scale;(
		echo merge "$i"_"$j" "$j"_"$i" into  "$i"_"$j".blast;\
		cat "$i"_"$j" "$j"_"$i" > "$i"_"$j".blast;\
		echo merge "$i".bed "$j".bed into "$i"_"$j".gff;\
		cat $Existingpepbed/"$i".bed $Existingpepbed/"$j".bed > "$i"_"$j".gff;\
		echo  Inter-species mcscan for "$i"_"$j";\

		MCScanX	-a -b 2 "$i"_"$j" -s $anchors -m $gaps ;\
		
		# echo Now we check missed tandem pairs around anchors;\
		# cat "$i"_"$j".blast "$i".blast "$j".blast > "$i"_"$j".all.blast;\
        # detect_collinear_tandem_arrays -g "$i"_"$j".gff -b "$i"_"$j".all.blast -c "$i"_"$j".collinearity -o "$i"_"$j".tandem.collinear;\
        # grep -o -E ","  "$i"_"$j".tandem.collinear|wc -l > "$i"_"$j".tandem.collinear.added ;\
		
		)&
	
		
		elif [ "$i" = "$j" ]; then
		
		echo new genomes: intra 

scale;(

		echo "$i"_"$i"is $i.blast
		mv "$i"_"$i" $i.blast
		echo $i.bed is $i.gff
		cat $Existingpepbed/$i.bed > $i.gff

		echo  Intra-species mcscan for "$i"_"$j";\
		MCScanX $i -s $anchors -m $gaps;\
		
		echo duplication modes!
		
		# Optional
		#duplicate_gene_classifier $i;\
		
		# Optional
		
		#echo Now we detect collinear tandem arrays.
        #detect_collinear_tandem_arrays -g $i.gff -b $i.blast -c $i.collinearity -o $i.tandem.collinear;\
        #echo sum the number of added genes!
        #grep -o -E  ","  $i.tandem.collinear|wc -l > $i.tandemAdded
		
		)&
		
		fi
	
		done
		
	let n++
	
done

wait

	#################################
	#	Step_5: Now sort .collinearity files!
	#	We are almost there!
	#	Keep up!
	##################################

mkdir AddedBlocks/
mv *.collinearity AddedBlocks/

	################################
	#	step_6: now we have a SynNet	
	################################

