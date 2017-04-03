Plant Phylogenomic Synteny Network Construction and Analysis Pipeline

Synteny network construction consists of five primary steps: (1) Annotated genome data preparation, (2) pairwise whole-genome comparisons, (3) syntenic block detection and data merging, (4) sub-network extraction (optional), and (5) network data analysis and visualization.
For Step 1, plant genomes can be downloaded from Phytozome, NCBI, Plaza, CoGe, etc. For each genome two files are needed: peptide sequences for all annotated/predicted genes (primary transcripts only) and a bed/GFF file indicating the genomic location of each gene. Users can prepare any number of genomes for synteny network construction. More genomes, longer computation time required.
>>> Fifty-one plant genomes used in the study of Tao Zhao et al., 2017 are listed and available for download below (Table 1). 
For Steps 2 and 3, we provide a bash script (SynNet.sh) that can automatically perform pairwise inter- and intra- species comparisons, trimming the outputs for synteny detection, and treating outputs containing all synteny blocks to a final network file. This network database contains four columns: Block_ID, Block_Score, Gene1, and Gene2 (Gene 1 and Gene 2 are a syntenic gene pair).
o	Users have to pre-install RAPSearch2 (BLAST-like program, but much faster) and MCScanX (for pairwise synteny block detection).
o	Put all required genome files and the bash script in the same directory. Then, alter the first line of the program, which is a bracket containing species abbreviations (which are consistent to the names used in the genome files, tab separated).
o	Run the program and get the result file called “Final_Network”, which contains all pairwise synteny blocks of your input species.
>>> Synteny network of the fifty-one plant genomes used in the study of Tao et al., 2017 are available for download (“51_Genomes_Blocks”).
At Step 4, for specific gene family studies you may need to extract sub-networks from the database. To do this, you need to first identify all gene family members from the genomes and then query this gene candidate list against the synteny block database. 
o	We use HMMER for gene family identification. HMMs (Hidden Markov Models) for specific gene families can be obtained from Pfam. Users can use Pfam Search or NCBI BLAST to help identify the feature domain(s) in the protein sequence. For example, a plant MADS-box protein is characterized by a core DNA binding domain (PF00319).
Brief Guidelines of HMMER Usage:
-	Install HMMER followed the instructions at: http://hmmer.org/documentation.html
-	Download the protein sequence alignment for PF00319 in Stockholm format (default name : “PF00319_seed.txt”):  http://pfam.xfam.org/family/PF00319#tabview=tab3
-	Hmmbuild: to make a model from the alignment
	Usage: hmmbuild [-options] <hmmfile output> <alignment file input>	
	Example: hmmbuild MADS.hmm PF00319_seed.txt
	MADS.hmm is the output model for characterizing MADS-box genes.
-	Hmmsearch: to identify all candidate members from the peptide database.
	Usage: hmmsearch [options] <query hmmfile> <target seqfile>
	Example: hmmsearch MADS.hmm 51_Genomes_Peps > MADS_Results
>>> Peptides for 51 plant genomes are merged and available for download, which can be used for an easier identification of gene family members of all 51 genomes.  (“51_Genomes_Peps”).
>>> The gene list of candidate MADS-box genes from the 51 Genomes (“MADS_list”)
o	Extract subnetwork from the synteny network database as needed, using a list containing all HMMER-identified family members.
-	Command:  grep -f MADS_list 51_Genomes_Blocks > MADS.SynNet
-	Now we obtain all syntenic relationships for all MADS-box genes.
>>> Synteny network of MADS-box genes across 51genomes (MADS.SynNet)
Step 5:
The subnetwork file (MADS.SynNet) can be trimmed into several formats for clustering and visualization, which can be performed in different ways. 
Clustering algorithms: K-clique percolation (e.g., CFinder, SNAP), Infomap, CNM, k-core decomposition, etc.
Visualization tools:  Cytoscape, Gephi et al.
>>> Example networks from Tao Zhao et al., 2017 are available for download and visualization in Cytoscape (MADS.cys), Cytoscape version 3.4.0.

Table 1: Genomes Used in the study of Tao Zhao et al., 2017
NO	SPECIES	ORDER	PEPTIDES	BED/GFF	VERSION	#GENES	REFERENCE
1	Phaseolus vulgaris (Common bean)	Rosids	pv.pep
pv.bed
Version 1.0	27082	Schmutz et al., 2014
2	Glycine max (Soybean)	Rosids	gm.pep
gm.bed
Wm82.a2.v1	56044	Schmutz et al., 2010
3	Cajanus cajan (Pigeonpea)	Rosids	cc.pep
cc.bed
Nov_2011	48680	Varshney et al., 2012
4	Medicago truncatula (Barrel medic)	Rosids	mt.pep
mt.bed
Mt4.0v1	50894	Young et al., 2011
5	Cicer arietinum (Chickpea)	Rosids	ca.pep
ca.bed
Version 1.0	28269	Varshney et al., 2013
6	Lotus japonicus (Lotus)	Rosids	lj.pep
lj.bed
Version 2.5	42399	Sato et al., 2008
7	Citrullus lanatus (Watermelon)	Rosids	cl.pep
cl.bed
Version 1.0	23440	Guo et al., 2013
8	Cucumis sativus (Cucumber)	Rosids	cs.pep
cs.bed
Version 1.0	21491	Huang et al., 2009
9	Populus trichocarpa (Western poplar)	Rosids	pt.pep
pt.bed
Version 3.0	41335	Tuskan et al., 2006
10	Ricinus communis (Castor bean)	Rosids	rc.pep
rc.bed
Version 0.1	38613	Chan et al., 2010
11	Malus x domestica (Apple)	Rosids	md.pep
md.bed
Version 1.0	63514	Velasco et al., 2010
12	Pyrus x bretschneideri (Pear)	Rosids	pb.pep
pb.bed
Version 1.0	42812	Wu et al., 2013
13	Prunus persica (Peach)	Rosids	pp.pep
pp.bed
Version 1.0	28689	International Peach Genome et al., 2013
14	Prunus mume (Mei)	Rosids	pm.pep
pm.bed
Version 1.0	31390	Zhang et al., 2012
15	Fragaria vesca (Strawberry)	Rosids	fv.pep
fv.bed
Version 1.1	32831	Shulaev et al., 2011
16	Arabidopsis thaliana (Arabidopsis)	Rosids	at.pep
at.bed
TAIR10	27416	Arabidopsis Genome, 2000
17	Arabidopsis lyrata (Lyrate rockcress)	Rosids	al.pep
al.bed
Version 1.0	32670	Hu et al., 2011
18	Capsella rubella (Capsella)	Rosids	cb.pep
cb.bed
Version 1.0	26521	Slotte et al., 2013
19	Brassica oleracea (Kale)	Rosids	bo.pep
bo.bed
Version 2.1	59225	Liu et al., 2014
20	Brassica rapa (Chinese cabbage)	Rosids	br.pep
br.bed
Version 1.3	40492	Wang et al., 2011
21	Aethionema	Rosids	Aeth.pep
Aeth.bed
Version 2.5	22230	Haudry et al., 2013
22	Tarenaya	Rosids	tare.pep
tare.bed
Version 5	31580	Cheng et al., 2013
23	Carica papaya (Papaya)	Rosids	cp.pep
cp.bed
ASGPBv0.4	24782	Ming et al., 2008
24	Gossypium raimondii (Cotton)	Rosids	gr.pep
gr.bed
Version 2.1	37505	Paterson et al., 2012
25	Theobroma cacao (Cacao)	Rosids	ta.pep
ta.bed
Version 1.1	29452	Argout et al., 2011
26	Citrus sinensis (Sweet orange)	Rosids	ci.pep
ci.bed
Version 1.1	25379	Xu et al., 2013
27	Eucalyptus grandis (Eucalyptus)	Rosids	eg.pep
eg.bed
Version 1.1	36376	Myburg et al., 2014
28	Vitis vinifera (Grape vine)	Rosids	vv.pep
vv.bed
Genoscope (Aug 2007)	26346	Jaillon et al., 2007
29	Solanum tuberosum (Potato)	Solanace	st.pep
st.bed
Version 3.4	39031	Potato Genome Sequencing et al., 2011
30	Solanum lycopersicum (Tomato)	Solanace	sl.pep
sl.bed
Version 2.4	34727	Tomato Genome, 2012
31	Capsicum annuum (Hot pepper)	Solanace	cu.pep
cu.bed
Version 1.55	34899	Kim et al., 2014
32	Utricularia gibba (Humped bladderwort)	Solanace	ug.pep
ug.bed
CoGe (Jun 2013)	28494	Ibarra-Laclette et al., 2013
33	Actinidia chinensis (Kiwifruit)	Solanace	ah.pep
ah.bed
May_2013	32670	Huang et al., 2013
34	Beta vulgaris (Sugar beet)	Eudicots	bv.pep
bv.bed
RefBeet-1.1	27421	Dohm et al., 2014
35	Nelumbo nucifera (Sacred lotus)	Eudicots	nn.pep
nn.bed
Version 1.0	26685	Ming et al., 2013
36	Triticum urartu (Wheat A-genome)	Monocots	tu.pep
tu.bed
Version 1.0	34879	Ling et al., 2013
37	Hordeum vulgare (Barley)	Monocots	hv.pep
hv.bed
Version 1.0	16598	International Barley Genome Sequencing et al., 2012
38	Brachypodium distachyon (Purple false brome)	Monocots	bd.pep
bd.bed
Version 2.1	31694	International Brachypodium, 2010
39	Oryza sativa (Rice)	Monocots	os.pep
os.bed
Version 7.0	39049	International Rice Genome Sequencing, 2005
40	Zea mays (Maize)	Monocots	zm.pep
zm.bed
Version 6a	63480	Schnable et al., 2009
41	Sorghum bicolor (Sorghum)	Monocots	sb.pep
sb.bed
Version 2.1	33032	Paterson et al., 2009
42	Setaria italica	Monocots	Si.pep
Si.bed
Version 2.1	35471	Bennetzen et al., 2012
43	Elaeis guineensis (Oil palm)	Monocots	el.pep
el.bed
Version 2.0	30752	Singh et al., 2013
44	Musa acuminata (Banana)	Monocots	ma.pep
ma.bed
July_2012	36542	D'Hont et al., 2012
45	Phalaenopsis equestris (Orchid)	Monocots	pe.pep
pe.bed
Version 5.0	42293	Cai et al., 2015
46	Zostera muelleri (Seagrass)	Monocots	zo.pep
zo.bed
Version 1.0	33245	Golicz et al., 2015
47	Amborella trichopoda (Amborella)	Basal Angiosperm	ar.pep
ar.bed
Version 1.0	26846	Chamala et al., 2013
48	Picea abies (Norway spruce)	Gymnosperm	pa.pep
pa.bed
Version 1.0	66632	Nystedt et al., 2013
49	Selaginella moellendorffii (Selaginella)	Moss	sm.pep
sm.bed
Version 1.0	22273	Banks et al., 2011
50	Physcomitrella patens (Moss)	Moss	ph.pep
ph.bed
Version 3.0	26610	Rensing et al., 2008
51	Chlamydomonas reinhardtii (Green algae)	Green algae	cr.pep
cr.bed
Version 5.5	17741	Merchant et al., 2007

Citations

