# !/bin/bash
# Input files: A pep fasta file and bed file of each genome.
# Example: at.bed, at.pep, al.bed, al.pep...
# The program will first do intra- and inter- genome comparisons using RAPsearch, then trimming the outputs for pairwise synteny 
# detection by MCscanX, and finally trimming the synteny blocks(.collinearity files) into a final synteny network (database).

#########################
#	Step_1: Species list
#########################
# separated by space
array=(pv	gm	cc	mt	ca	lj	cl	cs	pt	rc	md	pb	pp	pm	fv	at	al	cb	bo	br	aeth	tare	cp	gr	ta	ci	eg	vv	st	sl	cu	ug	ah	bv	nn	tu	hv	bd	os	zm	sb	si	el	ma	pe	zo	ar	pa	sm	ph	cr)


#############################################################
#	Step_2: Lets's first make database of each genome
#############################################################

for i in "${array[@]}";do
echo make database for species_$i
../RAPsearch2/RAPSearch2.23_64bits/bin/prerapsearch -d $i.pep -n $i.pep.db	

done

####################################################################
#	Step_3: Now lets run RAPSearch and Generate BLASTP-like results
####################################################################

for i in "${array[@]}";do
	for j in "${array[@]}";do
	
	echo ####  blast "$i" against "$j" ########
../RAPsearch2/RAPSearch2.23_64bits/bin/rapsearch -q $i.pep -d $j.pep.db -o "$i"_"$j" -z 10 -b 0 -v 20 -t a -p f -a t
	
	done
done

####################################################################
#	Step_4: Now we need a module to alter the output and make it neat.
####################################################################
for f in *.m8; do sed '/#/d;s/\r//g' $f > $f.homo
#.rd means remove duplicates
awk '!a[$1$2]++' $f.homo > $f.rd
# keep the top 6 or another number of hits!
awk 'a[$1]++<6' $f.rd > $f.fix
	done

rm *.rd 

###################################################################
#	Step_5.1: Now we combine corresponding files to prepare .blast 
#   This step is for intraspecies synteny detection!
##################################################################

echo ##########Now we do intraspecies MCScanX, prepare inputs..##########

for i in "${array[@]}";do
	for j in "${array[@]}";do
	
	# if at=at and so on, prepare file especially
	
	if [ "$i" = "$j" ]; then
		echo "$i"_"$i".homo is $i.blast
		mv "$i"_"$i".m8.fix $i.blast
		echo $i.bed is $i.gff
		cat $i.bed > $i.gff
		echo Intra-species MCScanX here for species $i
		../MCScanX/MCScanX $i
		echo duplication modes!
		../MCScanX/duplicate_gene_classifier $i
			
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

m=0
n=1

for i in "${array[@]:m}";do
	for j in "${array[@]:n}";do
	# before, the following commands have some typo ;   .m8.homo should be .m8.fix 
	echo "$i"_"$j".m8.fix "$j"_"$i".m8.fix "$i"_"$j".blast
	cat "$i"_"$j".m8.fix "$j"_"$i".m8.fix > "$i"_"$j".blast
	echo "$i".bed "$j".bed "$i"_"$j".gff
	cat "$i".bed "$j".bed > "$i"_"$j".gff
	echo  Inter-species mcscan for "$i"_"$j"
	# commands below
	../MCScanX/MCScanX	-a	-b 2 "$i"_"$j"
	done
	let n++
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
# replace unwanted strings/letters

sed 's/.collinearity//g; s/e_value//g; s/ //g; s/:/b/g' 3 > 4
# Pay attention to the following command, replace with the corrected gene names 

#sed 's/ca__\([0-9]\+\)/ca\1ca/g;s/[a-z][a-z]__//g;s/\(p5_sc[0-9]\+.V1.gene[0-9]\+\)/el\1el/g;s/\(evm.TU.supercontig_[0-9]\+.[0-9]\+\)/cp\1cp/g;s/\(scaffold[0-9]\+\.[0-9]\+\)/ar\1ar/g;s/\(Scf[0-9]\+.g[0-9]\+\)/ug\1ug/g' 4| 

awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 > Final_Network
# delete middle files 

rm 1 2 3 4

################################
#	step_7: now we have a SynNet	
################################

