#!/usr/bin/Rscript
# Usage: Rscript myscript.R networkfile(in 2 columns) outputname 
#
# The network file should be separated by tab


# Try if args work.
#head(args[1])

require(igraph)
args<-commandArgs(TRUE)
#data <-read.table(args[1],sep='\t',header=F,skip=4)

# Your network should in a two-column edgelist format.
data <-read.table(args[1],sep=' ',header=F)

# convert edgelist into a undirected graph object

network <- graph.data.frame(data,directed=F)

# simplify command to remove duplicated edges, if exist, error would occur when clustering.
net_simple <- simplify(network)
# Write_graph(net_simple,file="simple_network",format=c("ncol"))
# write_graph(net_simple,file=args[2],format=c("ncol"))

# Kcore Table
# kc <- coreness(net_simple,mode="all")
# write.table(kc,args[4],quote=F,sep='\t',row.names=T,col.names=F)
# You could set a filter here for kcore higher than 3

# Now we do clustering for the network
# clusters1 <- cluster_louvain(network)
# clusters2 <- cluster_walktrap(network)
clusters3 <- cluster_infomap(net_simple)
out3 <- as.data.frame(list(names=clusters3$names, mem=clusters3$membership))
write.table(out3,args[2],quote=F,sep='\t',row.names=F)

# out1 <- as.data.frame(list(names=clusters1$names, mem=clusters1$membership))
# write.table(out1,args[2],quote=F,sep='\t',row.names=F)

# out2 <- as.data.frame(list(names=clusters2$names, mem=clusters2$membership))
# write.table(out2,args[3],quote=F,sep='\t',row.names=F)






