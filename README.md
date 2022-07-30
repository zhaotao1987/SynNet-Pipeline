<h3 style="text-align: center;"><span style="color: #0000ff;"><span style="color: #000000;"><strong>Microsynteny Network Construction and Analysis Pipeline</strong></span></span></h3>
<p>&nbsp;</p>
<h4><span style="color: #0000ff;"><span style="color: #000000;"><strong>Please refer to <span style="color: #3366ff;"><a style="color: #3366ff;" href="https://github.com/zhaotao1987/SynNet-Pipeline/wiki">Wiki</a>&nbsp;</span>for the up-to-date information.</strong></span></span></h4>
<h3 style="text-align: left;">&nbsp;</h3>
<p><strong>NEWS</strong> July 30, 2022</p>
<p>For an easy use of the main functions of this synteny network construction and analysis pipeline, you are welcome to try the R package &lsquo;syntenet&rsquo; which has been recently implemented, thanks to Fabr&iacute;cio Almeida-Silva et al.</p>
<p>With it, users can perform synteny detection (MCScanX algorithm implemented in R), network inference, infomap clustering, phylogenomic profiling, and synteny based phylogeny reconstruction as well (<a href="https://www.nature.com/articles/s41467-021-23665-0">Zhao et al., 2021</a>&nbsp;Nat Commun). Everything in R.</p>
<p><a href="https://bioconductor.org/packages/devel/bioc/html/syntenet.html">Bioconductor - syntenet (development version)</a></p>
<p><a href="https://github.com/almeidasilvaf/syntenet">almeidasilvaf/syntenet: An R package to infer and analyze synteny networks from protein sequences (github.com)</a></p>
<p>&nbsp;</p>


<p><strong>Update </strong>Feb 19, 2021</p>

<p>Please refer to <a href="https://github.com/zhaotao1987/SynNet-Pipeline/wiki">Wiki</a> for an updated manual</p>
<p>&nbsp;</p>
<p><strong>Update </strong>June 7, 2019</p>
<p><a href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/SynetBuild-X.sh">SynetBuild-X.sh</a></p>
<p>Improved the function enabling parallel running of MCScanX.</p>
<p>Codes are better organized and explained.</p>
<p>Four key parameters: &nbsp;k (# tophits), s (# anchors), m (# gaps), and p (# CPUs)</p>
<p>Setting for -p is used for both Diamond and MCScanX parralleling.&nbsp;</p>
<p>Notes:</p>
<p>Change <a href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/16505cb7d7b96ba7203ecbdcf432ecb1407f7310/SynetBuild-X.sh#L70">Line70 </a>according to your genome list</p>
<p>Options:</p>
<p><a href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/16505cb7d7b96ba7203ecbdcf432ecb1407f7310/SynetBuild-X.sh#L127">Line127</a>: duplicate_gene_classifier</p>
<p><a href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/16505cb7d7b96ba7203ecbdcf432ecb1407f7310/SynetBuild-X.sh#L132">Line132</a>: detect_collinear_tandem_arrays [intra-species]</p>
<p><a href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/16505cb7d7b96ba7203ecbdcf432ecb1407f7310/SynetBuild-X.sh#L180-L183">Line180-183</a>: detect_collinear_tandem_arrays [inter-species]</p>
<p>&nbsp;</p>

<p><strong>Update</strong> June 3, 2019</p>

<p>Phylogenomic Profiling</p>
<p>When you have constructed a synteny network database of your interested genomes, you could then perform clustering to the entire network (using infomap algorithm for example), or you could filter out subnetworks first (for certain gene family) and then perform clustering (using infomap, CFinder etc.).</p>
<p>Next, we would like to summarize clusters according to its node compositions. Then we could infer what are the conserved clusters, and what are the specific ones (shared by certain species group for example). A rough description of this process is like this:&nbsp; we first generate a matrix, rows stand for clusters, and columns stand for species, the value stands for the number of nodes of that species in that cluster. Then we calculate a distance matrix between pair-wise clusters, and finally perform hierarchical clustering to cluster similar-patterned clusters.</p>
<table>
<tbody>
<tr>
<td width="95">
<p>&nbsp;</p>
</td>
<td width="95">
<p>Species 1</p>
</td>
<td width="95">
<p>Species 2</p>
</td>
<td width="95">
<p>Species 3</p>
</td>
<td width="89">
<p>&hellip;</p>
</td>
<td width="95">
<p>Species n</p>
</td>
</tr>
<tr>
<td width="95">
<p>Cluster 1</p>
</td>
<td width="95">
<p>1</p>
</td>
<td width="95">
<p>2</p>
</td>
<td width="95">
<p>1</p>
</td>
<td width="89">
<p>&hellip;</p>
</td>
<td width="95">
<p>1</p>
</td>
</tr>
<tr>
<td width="95">
<p>&hellip;..</p>
</td>
<td width="95">
<p>0</p>
</td>
<td width="95">
<p>0</p>
</td>
<td width="95">
<p>1</p>
</td>
<td width="89">
<p>&hellip;</p>
</td>
<td width="95">
<p>1</p>
</td>
</tr>
<tr>
<td width="95">
<p>Cluster n</p>
</td>
<td width="95">
<p>0</p>
</td>
<td width="95">
<p>1</p>
</td>
<td width="95">
<p>1</p>
</td>
<td width="89">
<p>&hellip;</p>
</td>
<td width="95">
<p>0</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>Now let&rsquo;s start. Suppose you are using the infomap script <a id="6330f71994f9e114efef99d577a86bfd-303a3677451bc5c0f00e31a5098f9bec1fda932d" class="js-navigation-open" title="infomap.r" href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/infomap.r">infomap.r</a>, the result looks like this:</p>
<p>names&nbsp;&nbsp; mem</p>
<p>aar_AA31G00673&nbsp; 1</p>
<p>aar_AA32G00725&nbsp; 2</p>
<p>aar_AA39G00041&nbsp; 1</p>
<p>aar_AA29G00273&nbsp; 3</p>
<p>ach_Achn050361&nbsp; 1</p>
<p>ach_Achn168171&nbsp; 1</p>
<p>ach_Achn330591&nbsp; 1</p>
<p>ach_Achn198651&nbsp; 1</p>
<p>ach_Achn060901&nbsp; 1</p>
<p>&hellip;&hellip;.</p>
<p>Result in such format can be directly feed into <a id="18ad1ad841f16e47cece99a661b87b8a-a000fa033b7468aff83e27590abc398a024d35cf" class="js-navigation-open" title="Phylogenomic_Profiling.r" href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/Phylogenomic_Profiling.r">Phylogenomic_Profiling.r</a>&nbsp;This R script can analyze cluster composition, calculate distance, and perform hierarchical clustering. Please read the notes within the codes. Also remember to change the content of Line 22 according to the genomes you are using. </p>
<p>Usage: <strong>Rscript Phylogenomic_Profiling.r infomap_clustering_result cluster_profiled cluster_profiled_clustered</strong></p>
<p>&nbsp;</p>

<p><strong>Update </strong>July 5, 2018</p>

<p>Here I attach two scripts, using DIAMOND (Buchfink et al., 2015) for faster genome comparisons at the first step.</p>
<p><a id="3c8ff96e93b59bc039e67f00b8a013cb-a14314394b2d8a850fb73bd4be094b8072f0acce" class="js-navigation-open" title="SynetBuilding-Diamond.sh" href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/SynetBuilding-Diamond.sh">SynetBuilding-Diamond.sh</a>: Used for the first time, when you would like to construct synteny network of your interested genomes</p>
<p><a id="4ed55da12c03cc56cf797e8043c3fc61-7a0cebf3bdec62eb02084eeae8d8faaefabeea41" class="js-navigation-open" title="SynetAdding-Diamond.sh" href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/SynetAdding-Diamond.sh">SynetAdding-Diamond.sh</a>: Used when you would like to add new genomes into the existing results.</p>
<p>-Prepeations</p>
<p>&nbsp; &nbsp;- Whole genome protein files in fasta format.</p>
<p>&nbsp; &nbsp;- GFF/BED file for each genome (Example:&nbsp;<a href="http://chibba.pgml.uga.edu/mcscan2/examples/at.gff">http://chibba.pgml.uga.edu/mcscan2/examples/at.gff</a>)</p>
<p>&nbsp; &nbsp;-Install DIAMOND and MCScanX (Wang et al., 2012)&nbsp;</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp;-DIAMOND:&nbsp;<a href="https://github.com/bbuchfink/diamond">https://github.com/bbuchfink/diamond</a></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp;-MCScanX:&nbsp;&nbsp;<a href="http://chibba.pgml.uga.edu/mcscan2/">http://chibba.pgml.uga.edu/mcscan2/</a></p>
<p>-Notes / Tips</p>
<p>&nbsp; &nbsp;- Index your genome files, using 3-5 letters, for example for "<em>Arabidopis thaliana</em>", rename genome file and gff file as "Ath.pep" and "Ath.bed", and for "<em>Oryza sativa</em>" ("Osa.pep" and "Osa.bed")</p>
<p>-To run</p>
<p>&nbsp; - Put all pairs of "*.pep" and "*.bed" of your genomes under one folder,&nbsp;copy the script (<a id="3c8ff96e93b59bc039e67f00b8a013cb-a14314394b2d8a850fb73bd4be094b8072f0acce" class="js-navigation-open" title="SynetBuilding-Diamond.sh" href="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/SynetBuilding-Diamond.sh">SynetBuilding-&nbsp; Diamond.sh</a>) to the same folder.&nbsp;</p>
<p>&nbsp; - Change the line 41 in the script (content in array): enter the genome indexes of your own selection.&nbsp;</p>
<p>&nbsp; &nbsp; &nbsp;- for example:&nbsp; &nbsp; &nbsp; array=(ath osa oth Alyr)&nbsp;</p>
<p>&nbsp; - The array can be of any length, depending the genomes you want to compare.&nbsp;</p>
<p>&nbsp;</p>
==========================================================================
<p>&nbsp;</p>
<h3 style="text-align: center;"><strong>Plant Phylogenomic Synteny Network Construction and Analysis Pipeline</strong></h3>
<p style="text-align: center;"><strong><img src="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/Fig-1.jpg" alt="p" width="800" height="700" /><br /></strong></p>

<p>Synteny network construction consists of five primary steps: (1) Annotated genome data preparation, (2) pairwise whole-genome comparisons, (3) syntenic block detection and data merging, (4) sub-network extraction (optional), and (5) network data analysis and visualization.</p>
<p>For <strong>Step 1</strong>, plant genomes can be downloaded from <a href="http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11">Phytozome</a>, <a href="https://www.ncbi.nlm.nih.gov/genome/browse/">NCBI</a>, <a href="http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index">Plaza</a>, <a href="https://genomevolution.org/coge/OrganismView.pl">CoGe</a>, etc. For each genome two files are needed: peptide sequences for all annotated/predicted genes (primary transcripts only) and a bed/GFF file indicating the genomic location of each gene. Users can prepare any number of genomes for synteny network construction. More genomes, longer computation time required.</p>
<p>&gt;&gt;&gt; Fifty-one plant genomes used in the study of Tao Zhao et al., 2017b are listed and available for download below (Table 1).</p>
<p>For <strong>Steps 2 and 3</strong>, we provide a bash script (<a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">SynNet.sh</a>) that can automatically perform pairwise inter- and intra- species comparisons, trimming the outputs for synteny detection, and treating outputs containing all synteny blocks to a final network file. This network database contains four columns: Block_ID, Block_Score, Gene1, and Gene2 (Gene 1 and Gene 2 are a syntenic gene pair).</p>
<ul>
<li>Users have to pre-install <a href="http://rapsearch2.sourceforge.net/">RAPSearch2</a> (BLAST-like program, but much faster) and <a href="http://chibba.pgml.uga.edu/mcscan2/">MCScanX</a> (for pairwise synteny block detection).</li>
<li>Put all required genome files and the bash script in the same directory. Then, alter the first line of the program, which is a bracket containing species abbreviations (which are consistent to the names used in the genome files, tab separated).</li>
<li>Run the program and get the result file called &ldquo;Final_Network&rdquo;, which contains all pairwise synteny blocks of your input species.</li>
</ul>
<p>&gt;&gt;&gt; Synteny network of the fifty-one plant genomes used in the study of Tao et al., 2017b are available for download (&ldquo;<a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">51_Genomes_Blocks</a>&rdquo;).</p>
<p>At <strong>Step 4</strong>, for specific gene family studies you may need to extract sub-networks from the database. To do this, you need to first identify all gene family members from the genomes and then query this gene candidate list against the synteny block database.</p>
<ul>
<li>We use <a href="http://hmmer.org/">HMMER</a> for gene family identification. HMMs (Hidden Markov Models) for specific gene families can be obtained from Pfam. Users can use <a href="http://pfam.xfam.org/search#tabview=tab0">Pfam Search</a> or NCBI <a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&amp;PAGE_TYPE=BlastSearch&amp;LINK_LOC=blasthome">BLAST</a> to help identify the feature domain(s) in the protein sequence. For example, a plant MADS-box protein is characterized by a core DNA binding domain (<a href="http://pfam.xfam.org/family/PF00319#tabview=tab4">PF00319</a>).</li>
</ul>
<blockquote>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>Brief Guidelines of HMMER Usage:</p>
</blockquote>
<ul>
<li>
<blockquote>Install HMMER followed the instructions at: <a href="http://hmmer.org/documentation.html">http://hmmer.org/documentation.html</a></blockquote>
</li>
<li>
<blockquote>Download the protein sequence alignment for PF00319 in Stockholm format (default name : &ldquo;PF00319_seed.txt&rdquo;): <a href="http://pfam.xfam.org/family/PF00319#tabview=tab3">http://pfam.xfam.org/family/PF00319#tabview=tab3</a></blockquote>
</li>
<li>
<blockquote>Hmmbuild: to make a model from the alignment
<ul>
<li>Usage: hmmbuild [-options] &lt;hmmfile output&gt; &lt;alignment file input&gt;</li>
<li>Example: hmmbuild MADS.hmm PF00319_seed.txt</li>
<li>hmm is the output model for characterizing MADS-box genes.</li>
</ul>
</blockquote>
</li>
<li>
<blockquote>Hmmsearch: to identify all candidate members from the peptide database.</blockquote>
<ul>
<li>
<blockquote>Usage: hmmsearch [options] &lt;query hmmfile&gt; &lt;target seqfile&gt;</blockquote>
</li>
<li>
<blockquote>Example: hmmsearch MADS.hmm 51_Genomes_Peps &gt; MADS_Results</blockquote>
</li>
</ul>
</li>
</ul>
<p>&gt;&gt;&gt; Peptides for 51 plant genomes are merged and available for download, which can be used for an easier identification of gene family members of all 51 genomes. &nbsp;(&ldquo;<a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">51_Genomes_Peps</a>&rdquo;).</p>
<p>&gt;&gt;&gt; The gene list of candidate MADS-box genes from the 51 Genomes (&ldquo;<a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">MADS_list</a>&rdquo;)</p>
<ul>
<li>Extract subnetwork from the synteny network database as needed, using a list containing all HMMER-identified family members.</li>
<li>Command: grep -f MADS_list 51_Genomes_Blocks &gt; MADS.SynNet</li>
<li>Now we obtain all syntenic relationships for all MADS-box genes.</li>
</ul>
<p>&gt;&gt;&gt; Synteny network of MADS-box genes across 51genomes (<a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">MADS.SynNet</a>)</p>
<p><strong>Step 5</strong>:</p>
<p>The subnetwork file (MADS.SynNet) can be trimmed into several formats for clustering and visualization, which can be performed in different ways.</p>
<p>Clustering algorithms: K-clique percolation (e.g., <a href="http://www.cfinder.org/">CFinder</a>, <a href="http://snap.stanford.edu/">SNAP</a>), Infomap, CNM, k-core decomposition, etc.</p>
<p>Visualization tools:&nbsp; <a href="http://www.cytoscape.org/">Cytoscape</a>, <a href="https://gephi.org/">Gephi</a> et al.</p>
<p>&gt;&gt;&gt; Example networks from Tao Zhao et al., 2017b are available for download and visualization in Cytoscape (<a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">MADS.cys</a>), Cytoscape version 3.4.0.</p>
<p>&nbsp;</p>
<p>Table 1: Genomes Used in the study of Tao Zhao et al., 2017</p>
<table width="915">
<tbody>
<tr>
<td width="53">
<p><strong>No</strong></p>
</td>
<td width="144">
<p><strong>Species</strong></p>
</td>
<td width="103">
<p><strong>Order</strong></p>
</td>
<td width="120">
<p><strong>Peptides</strong></p>
</td>
<td width="107">
<p><strong>BED/GFF</strong></p>
</td>
<td width="113">
<p><strong>Version</strong></p>
</td>
<td width="114">
<p><strong>#Genes</strong></p>
</td>
<td width="162">
<p><strong>Reference</strong></p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>1</strong></p>
</td>
<td width="144">
<p><em>Phaseolus vulgaris</em> (Common bean)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pv.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pv.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>27082</p>
</td>
<td width="162">
<p>Schmutz et al., 2014</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>2</strong></p>
</td>
<td width="144">
<p><em>Glycine max</em> (Soybean)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">gm.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">gm.bed</a></p>
</td>
<td width="113">
<p>Wm82.a2.v1</p>
</td>
<td width="114">
<p>56044</p>
</td>
<td width="162">
<p>Schmutz et al., 2010</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>3</strong></p>
</td>
<td width="144">
<p><em>Cajanus cajan</em> (Pigeonpea)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cc.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cc.bed</a></p>
</td>
<td width="113">
<p>Nov_2011</p>
</td>
<td width="114">
<p>48680</p>
</td>
<td width="162">
<p>Varshney et al., 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>4</strong></p>
</td>
<td width="144">
<p><em>Medicago truncatula</em> (Barrel medic)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">mt.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">mt.bed</a></p>
</td>
<td width="113">
<p>Mt4.0v1</p>
</td>
<td width="114">
<p>50894</p>
</td>
<td width="162">
<p>Young et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>5</strong></p>
</td>
<td width="144">
<p><em>Cicer arietinum</em> (Chickpea)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ca.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ca.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>28269</p>
</td>
<td width="162">
<p>Varshney et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>6</strong></p>
</td>
<td width="144">
<p><em>Lotus japonicus</em> (Lotus)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">lj.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">lj.bed</a></p>
</td>
<td width="113">
<p>Version 2.5</p>
</td>
<td width="114">
<p>42399</p>
</td>
<td width="162">
<p>Sato et al., 2008</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>7</strong></p>
</td>
<td width="144">
<p><em>Citrullus lanatus</em> (Watermelon)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cl.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cl.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>23440</p>
</td>
<td width="162">
<p>Guo et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>8</strong></p>
</td>
<td width="144">
<p><em>Cucumis sativus</em> (Cucumber)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cs.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cs.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>21491</p>
</td>
<td width="162">
<p>Huang et al., 2009</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>9</strong></p>
</td>
<td width="144">
<p><em>Populus trichocarpa</em> (Western poplar)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pt.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pt.bed</a></p>
</td>
<td width="113">
<p>Version 3.0</p>
</td>
<td width="114">
<p>41335</p>
</td>
<td width="162">
<p>Tuskan et al., 2006</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>10</strong></p>
</td>
<td width="144">
<p><em>Ricinus communis </em>(Castor bean)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">rc.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">rc.bed</a></p>
</td>
<td width="113">
<p>Version 0.1</p>
</td>
<td width="114">
<p>38613</p>
</td>
<td width="162">
<p>Chan et al., 2010</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>11</strong></p>
</td>
<td width="144">
<p><em>Malus x domestica</em> (Apple)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">md.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">md.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>63514</p>
</td>
<td width="162">
<p>Velasco et al., 2010</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>12</strong></p>
</td>
<td width="144">
<p><em>Pyrus x bretschneider</em>i (Pear)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pb.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pb.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>42812</p>
</td>
<td width="162">
<p>Wu et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>13</strong></p>
</td>
<td width="144">
<p><em>Prunus persica</em> (Peach)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pp.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pp.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>28689</p>
</td>
<td width="162">
<p>International Peach Genome et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>14</strong></p>
</td>
<td width="144">
<p><em>Prunus mum</em>e (Mei)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pm.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pm.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>31390</p>
</td>
<td width="162">
<p>Zhang et al., 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>15</strong></p>
</td>
<td width="144">
<p>Fragaria vesca (Strawberry)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">fv.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">fv.bed</a></p>
</td>
<td width="113">
<p>Version 1.1</p>
</td>
<td width="114">
<p>32831</p>
</td>
<td width="162">
<p>Shulaev et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>16</strong></p>
</td>
<td width="144">
<p><em>Arabidopsis thaliana</em> (Arabidopsis)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">at.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">at.bed</a></p>
</td>
<td width="113">
<p>TAIR10</p>
</td>
<td width="114">
<p>27416</p>
</td>
<td width="162">
<p>Arabidopsis Genome, 2000</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>17</strong></p>
</td>
<td width="144">
<p><em>Arabidopsis lyrata</em> (Lyrate rockcress)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">al.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">al.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>32670</p>
</td>
<td width="162">
<p>Hu et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>18</strong></p>
</td>
<td width="144">
<p><em>Capsella rubella </em>(Capsella)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cb.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cb.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>26521</p>
</td>
<td width="162">
<p>Slotte et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>19</strong></p>
</td>
<td width="144">
<p><em>Brassica oleracea</em> (Kale)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">bo.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">bo.bed</a></p>
</td>
<td width="113">
<p>Version 2.1</p>
</td>
<td width="114">
<p>59225</p>
</td>
<td width="162">
<p>Liu et al., 2014</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>20</strong></p>
</td>
<td width="144">
<p><em>Brassica rapa</em> (Chinese cabbage)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">br.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">br.bed</a></p>
</td>
<td width="113">
<p>Version 1.3</p>
</td>
<td width="114">
<p>40492</p>
</td>
<td width="162">
<p>Wang et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>21</strong></p>
</td>
<td width="144">
<p>Aethionema</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">aeth.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">aeth.bed</a></p>
</td>
<td width="113">
<p>Version 2.5</p>
</td>
<td width="114">
<p>22230</p>
</td>
<td width="162">
<p>Haudry et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>22</strong></p>
</td>
<td width="144">
<p>Tarenaya</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">tare.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">tare.bed</a></p>
</td>
<td width="113">
<p>Version 5</p>
</td>
<td width="114">
<p>31580</p>
</td>
<td width="162">
<p>Cheng et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>23</strong></p>
</td>
<td width="144">
<p><em>Carica papaya</em> (Papaya)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cp.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cp.bed</a></p>
</td>
<td width="113">
<p>ASGPBv0.4</p>
</td>
<td width="114">
<p>24782</p>
</td>
<td width="162">
<p>Ming et al., 2008</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>24</strong></p>
</td>
<td width="144">
<p><em>Gossypium raimondii</em> (Cotton)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">gr.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">gr.bed</a></p>
</td>
<td width="113">
<p>Version 2.1</p>
</td>
<td width="114">
<p>37505</p>
</td>
<td width="162">
<p>Paterson et al., 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>25</strong></p>
</td>
<td width="144">
<p><em>Theobroma cacao</em> (Cacao)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ta.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ta.bed</a></p>
</td>
<td width="113">
<p>Version 1.1</p>
</td>
<td width="114">
<p>29452</p>
</td>
<td width="162">
<p>Argout et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>26</strong></p>
</td>
<td width="144">
<p><em>Citrus sinensis </em>(Sweet orange)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ci.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ci.bed</a></p>
</td>
<td width="113">
<p>Version 1.1</p>
</td>
<td width="114">
<p>25379</p>
</td>
<td width="162">
<p>Xu et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>27</strong></p>
</td>
<td width="144">
<p><em>Eucalyptus grandis</em> (Eucalyptus)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">eg.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">eg.bed</a></p>
</td>
<td width="113">
<p>Version 1.1</p>
</td>
<td width="114">
<p>36376</p>
</td>
<td width="162">
<p>Myburg et al., 2014</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>28</strong></p>
</td>
<td width="144">
<p><em>Vitis vinifera </em>(Grape vine)</p>
</td>
<td width="103">
<p>Rosids</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">vv.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">vv.bed</a></p>
</td>
<td width="113">
<p>Genoscope (Aug 2007)</p>
</td>
<td width="114">
<p>26346</p>
</td>
<td width="162">
<p>Jaillon et al., 2007</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>29</strong></p>
</td>
<td width="144">
<p><em>Solanum tuberosum</em> (Potato)</p>
</td>
<td width="103">
<p>Solanace</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">st.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">st.bed</a></p>
</td>
<td width="113">
<p>Version 3.4</p>
</td>
<td width="114">
<p>39031</p>
</td>
<td width="162">
<p>Potato Genome Sequencing et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>30</strong></p>
</td>
<td width="144">
<p><em>Solanum lycopersicum</em> (Tomato)</p>
</td>
<td width="103">
<p>Solanace</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">sl.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">sl.bed</a></p>
</td>
<td width="113">
<p>Version 2.4</p>
</td>
<td width="114">
<p>34727</p>
</td>
<td width="162">
<p>Tomato Genome, 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>31</strong></p>
</td>
<td width="144">
<p><em>Capsicum annuum</em> (Hot pepper)</p>
</td>
<td width="103">
<p>Solanace</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cu.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cu.bed</a></p>
</td>
<td width="113">
<p>Version 1.55</p>
</td>
<td width="114">
<p>34899</p>
</td>
<td width="162">
<p>Kim et al., 2014</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>32</strong></p>
</td>
<td width="144">
<p><em>Utricularia gibba</em> (Humped bladderwort)</p>
</td>
<td width="103">
<p>Solanace</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ug.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ug.bed</a></p>
</td>
<td width="113">
<p>CoGe (Jun 2013)</p>
</td>
<td width="114">
<p>28494</p>
</td>
<td width="162">
<p>Ibarra-Laclette et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>33</strong></p>
</td>
<td width="144">
<p><em>Actinidia chinensis</em> (Kiwifruit)</p>
</td>
<td width="103">
<p>Solanace</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ah.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ah.bed</a></p>
</td>
<td width="113">
<p>May_2013</p>
</td>
<td width="114">
<p>32670</p>
</td>
<td width="162">
<p>Huang et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>34</strong></p>
</td>
<td width="144">
<p><em>Beta vulgaris</em> (Sugar beet)</p>
</td>
<td width="103">
<p>Eudicots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">bv.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">bv.bed</a></p>
</td>
<td width="113">
<p>RefBeet-1.1</p>
</td>
<td width="114">
<p>27421</p>
</td>
<td width="162">
<p>Dohm et al., 2014</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>35</strong></p>
</td>
<td width="144">
<p><em>Nelumbo nucifera</em> (Sacred lotus)</p>
</td>
<td width="103">
<p>Eudicots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">nn.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">nn.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>26685</p>
</td>
<td width="162">
<p>Ming et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>36</strong></p>
</td>
<td width="144">
<p><em>Triticum urartu</em> (Wheat A-genome)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">tu.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">tu.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>34879</p>
</td>
<td width="162">
<p>Ling et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>37</strong></p>
</td>
<td width="144">
<p><em>Hordeum vulgare</em> (Barley)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">hv.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">hv.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>16598</p>
</td>
<td width="162">
<p>International Barley Genome Sequencing et al., 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>38</strong></p>
</td>
<td width="144">
<p><em>Brachypodium distachyon</em> (Purple false brome)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">bd.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">bd.bed</a></p>
</td>
<td width="113">
<p>Version 2.1</p>
</td>
<td width="114">
<p>31694</p>
</td>
<td width="162">
<p>International Brachypodium, 2010</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>39</strong></p>
</td>
<td width="144">
<p><em>Oryza sativa</em> (Rice)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">os.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">os.bed</a></p>
</td>
<td width="113">
<p>Version 7.0</p>
</td>
<td width="114">
<p>39049</p>
</td>
<td width="162">
<p>International Rice Genome Sequencing, 2005</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>40</strong></p>
</td>
<td width="144">
<p><em>Zea mays</em> (Maize)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">zm.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">zm.bed</a></p>
</td>
<td width="113">
<p>Version 6a</p>
</td>
<td width="114">
<p>63480</p>
</td>
<td width="162">
<p>Schnable et al., 2009</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>41</strong></p>
</td>
<td width="144">
<p><em>Sorghum bicolor</em> (Sorghum)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">sb.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">sb.bed</a></p>
</td>
<td width="113">
<p>Version 2.1</p>
</td>
<td width="114">
<p>33032</p>
</td>
<td width="162">
<p>Paterson et al., 2009</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>42</strong></p>
</td>
<td width="144">
<p><em>Setaria italica</em></p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">si.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">si.bed</a></p>
</td>
<td width="113">
<p>Version 2.1</p>
</td>
<td width="114">
<p>35471</p>
</td>
<td width="162">
<p>Bennetzen et al., 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>43</strong></p>
</td>
<td width="144">
<p><em>Elaeis guineensis </em>(Oil palm)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">el.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">el.bed</a></p>
</td>
<td width="113">
<p>Version 2.0</p>
</td>
<td width="114">
<p>30752</p>
</td>
<td width="162">
<p>Singh et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>44</strong></p>
</td>
<td width="144">
<p><em>Musa acuminata </em>(Banana)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ma.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ma.bed</a></p>
</td>
<td width="113">
<p>July_2012</p>
</td>
<td width="114">
<p>36542</p>
</td>
<td width="162">
<p>D'Hont et al., 2012</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>45</strong></p>
</td>
<td width="144">
<p><em>Phalaenopsis equestris</em> (Orchid)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pe.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pe.bed</a></p>
</td>
<td width="113">
<p>Version 5.0</p>
</td>
<td width="114">
<p>42293</p>
</td>
<td width="162">
<p>Cai et al., 2015</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>46</strong></p>
</td>
<td width="144">
<p><em>Zostera muelleri</em> (Seagrass)</p>
</td>
<td width="103">
<p>Monocots</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">zo.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">zo.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>33245</p>
</td>
<td width="162">
<p>Golicz et al., 2015</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>47</strong></p>
</td>
<td width="144">
<p><em>Amborella trichopoda</em> (Amborella)</p>
</td>
<td width="103">
<p>Basal Angiosperm</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ar.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ar.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>26846</p>
</td>
<td width="162">
<p>Chamala et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>48</strong></p>
</td>
<td width="144">
<p><em>Picea abies</em> (Norway spruce)</p>
</td>
<td width="103">
<p>Gymnosperm</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pa.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">pa.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>66632</p>
</td>
<td width="162">
<p>Nystedt et al., 2013</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>49</strong></p>
</td>
<td width="144">
<p><em>Selaginella moellendorffii </em>(Selaginella)</p>
</td>
<td width="103">
<p>Moss</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">sm.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">sm.bed</a></p>
</td>
<td width="113">
<p>Version 1.0</p>
</td>
<td width="114">
<p>22273</p>
</td>
<td width="162">
<p>Banks et al., 2011</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>50</strong></p>
</td>
<td width="144">
<p><em>Physcomitrella patens</em> (Moss)</p>
</td>
<td width="103">
<p>Moss</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ph.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">ph.bed</a></p>
</td>
<td width="113">
<p>Version 3.0</p>
</td>
<td width="114">
<p>26610</p>
</td>
<td width="162">
<p>Rensing et al., 2008</p>
</td>
</tr>
<tr>
<td width="53">
<p><strong>51</strong></p>
</td>
<td width="144">
<p><em>Chlamydomonas reinhardtii</em> (Green algae)</p>
</td>
<td width="103">
<p>Green algae</p>
</td>
<td width="120">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cr.pep</a></p>
</td>
<td width="107">
<p><a href="https://www.dropbox.com/sh/faq97k63j2hzo8g/AACgVMW1Rb_E76Zu1xgMUAyZa?dl=0">cr.bed</a></p>
</td>
<td width="113">
<p>Version 5.5</p>
</td>
<td width="114">
<p>17741</p>
</td>
<td width="162">
<p>Merchant et al., 2007</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>

<p><strong>Citations</strong>:</p>
<p><em>Zhao, T. and Schranz, E., (2019). Network-based microsynteny analysis identifies major differences and genomic outliers in mammalian and angiosperm genomes. Proceedings of the National Academy of Sciences. 116(6), 2165-2174.</em></p>
<p><em>Zhao, T., Holmer, R., de Bruijn, S., Angenent, G.C., van den Burg, H.A., and Schranz, M.E. (2017b). Phylogenomic synteny network</em> analysis<em> of MADS-box transcription factor genes reveals lineage-specific transpositions, ancient tandem duplications, and deep positional conservation. The Plant Cell 29, 1278-1292.</em></p>
<p><em>Zhao, T., and Schranz, E. (2017a). Network Approaches for Plant Phylogenomic Synteny Analysis. Current Opinion in Plant Biology 36, 129-134.</em></p>
<p>&nbsp;</p>
