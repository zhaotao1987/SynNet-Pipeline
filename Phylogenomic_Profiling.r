library(pheatmap)
library(vegan)

args<-commandArgs(TRUE)

# pre-treatment
  
data <- read.table(args[1],header=T)  # Sometimes You have to use this one! For problems above ! I dont  know why
data$species <- substr(data$names,1,3) # extract first three letters of the gene name as species id
colnames(data) <-c("Gene","Cluster","Species")
data <- data[,c(1,3,2)]
	# Input
	# Gene	Species	Cluster
	# AlyrAL1G19310	Aly	13296
	# AlyrAL1G19350	Aly	75

# cluster by rows, Species by columns
out <- table(data$Cluster,data$Species) 

# Important: species order

	myorder <- c('vra','van','pvu','gma','cca','tpr','mtr','adu',
	'lja','Lan','car','pmu','ppe','pbr','mdo','roc','fve','Mno','Zju','hlu',
	'jcu','mes','rco','lus','ptr','csa','cme','cla','cmo','jre','Bpe','cgr',
	'cru','Aly','ath','Csa','bol','bra','bnp','rra','thh','tsa','lal','aar','spa','Bos','Alp',
	'sir','cgy','tha','cpa','gra','tca','egr','csi','vvi','spe','sly','stu','sme','can','nbe','Nto',
	'Nat','Nsy','pax','Ini','ugi','sin','mgu','coc','Lsa','hel','dca','ach','Cqu','sol','bvu',
	'Ahy','nnu','tur','tae','ata','HOR','bdi','ogl','osa','oru','lpe','phe','zma','Zma','sbi','sit','oth',
	'aco','egu','Pda','mac','Dca','peq','Aof','Xvi','spo','lmi','zom','atr')

# In case, you miss species
order <- match(colnames(out),myorder)
new <- rbind(order, out)
new2 <- new[,order(new[1,])]
new3 <-new2[-1,]

#out <- out[,myorder]

write.table(new3,args[2],col.names =NA,quote=F) # export output
	
# Output sample

	# Aly ath atr can csi dca Ebr hel Lsa osa oth sly Tar TKS vvi
	# 1 28 28 0 65 53 43 0 59 67 25 17 59 112 9 84
	# 2 7 3 11 175 17 9 0 5 19 44 1 28 100 6 13
	# 3 36 62 15 16 18 12 0 39 22 36 5 14 48 3 32

matrixp <-data.matrix(new3)
breaksList <- c(0,0.9,1.58,1.9,10) # Set range # 
#mycolor <- c("white","#E8E8E8","#909090","#303030") # Grey Scale
mycolor <- c("white","#8FB0D7","#FDC87A","#F70C0E") # Red- Orange- Blue Scale #

d <- vegdist(log2(matrixp+1),method="jaccard") 
	# method	
	# Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", "bray", "kulczynski", "jaccard", 
	# "gower", "altGower", "morisita", "horn", "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
f2_m.res <- hclust(d,method="ward.D")
	# "ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty" (= WPGMA),
	# "median" (= WPGMC) or "centroid" (= UPGMC).

# Re-order clusters by clustering result
out2 <- new3[f2_m.res$order,]

# Done 
write.table(out2,args[3],col.names =NA,quote=F) # export output

# Plot Clusters

#pdf('args[3].pdf',width=8,height=8,onefile=FALSE) 
 pheatmap( log2(matrixp+1), # Better 
          breaks = breaksList,
			 color = mycolor,
          cluster_rows = f2_m.res,   # THIS IS GREAT! IMPORT 
          cluster_cols=F,
          main="jaccard+ward.D",
          border_color=NA,
		  filename = args[3].pdf, 
		  width = 8, height = 8
          )
 #dev.off()
