CollinearityFilesFolder=$1
cd $CollinearityFilesFolder

     for f in *.collinearity; do sed 's/^/'$f'/' $f >> 1; done

# split columns and kept the block score
# pay attention to ! \"\t\"

        awk '{if($0~/.*score/){split($0,a,"=");print a[1]}else{print $0"\t"a[2]}}' 1 > 2

# delete lines containing #

        sed '/#/d' 2 > 3

# replace unwanted letters

        sed 's/.collinearity//g; s/e_value//g; s/ //g; s/:/b/g' 3 > 4

        awk '{print $1"\t"$5"\t"$2"\t"$3}' 4 >  MergedBlocks

# delete middle files

        rm 1 2 3 4

