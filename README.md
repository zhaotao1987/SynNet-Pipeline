<h1 style="text-align: center;"><strong>Plant Phylogenomic Synteny Network Construction and Analysis Pipeline</strong></h1>
<h1 style="text-align: justify;"><strong><img src="https://github.com/zhaotao1987/SynNet-Pipeline/blob/master/Fig-1.jpg" alt="p" width="800" height="800" /><br /></strong></h1>
<p>Synteny network construction consists of five primary steps: (1) Annotated genome data preparation, (2) pairwise whole-genome comparisons, (3) syntenic block detection and data merging, (4) sub-network extraction (optional), and (5) network data analysis and visualization.</p>
<p>For <strong>Step 1</strong>, plant genomes can be downloaded from <a href="http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11">Phytozome</a>, <a href="https://www.ncbi.nlm.nih.gov/genome/browse/">NCBI</a>, <a href="http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index">Plaza</a>, <a href="https://genomevolution.org/coge/OrganismView.pl">CoGe</a>, etc. For each genome two files are needed: peptide sequences for all annotated/predicted genes (primary transcripts only) and a bed/GFF file indicating the genomic location of each gene. Users can prepare any number of genomes for synteny network construction. More genomes, longer computation time required.</p>
<p>&gt;&gt;&gt; Fifty-one plant genomes used in the study of Tao Zhao et al., 2017 are listed and available for download below (Table 1).</p>
<p>For <strong>Steps 2 and 3</strong>, we provide a bash script (<a href="http://10.85.9.0/SynNet.sh">SynNet.sh</a>) that can automatically perform pairwise inter- and intra- species comparisons, trimming the outputs for synteny detection, and treating outputs containing all synteny blocks to a final network file. This network database contains four columns: Block_ID, Block_Score, Gene1, and Gene2 (Gene 1 and Gene 2 are a syntenic gene pair).</p>
<ul>
<li>Users have to pre-install <a href="http://rapsearch2.sourceforge.net/">RAPSearch2</a> (BLAST-like program, but much faster) and <a href="http://chibba.pgml.uga.edu/mcscan2/">MCScanX</a> (for pairwise synteny block detection).</li>
<li>Put all required genome files and the bash script in the same directory. Then, alter the first line of the program, which is a bracket containing species abbreviations (which are consistent to the names used in the genome files, tab separated).</li>
<li>Run the program and get the result file called &ldquo;Final_Network&rdquo;, which contains all pairwise synteny blocks of your input species.</li>
</ul>
<p>&gt;&gt;&gt; Synteny network of the fifty-one plant genomes used in the study of Tao et al., 2017 are available for download (&ldquo;<a href="http://10.85.9.0/51_genomes_blocks.gz">51_Genomes_Blocks</a>&rdquo;).</p>
<p>At <strong>Step 4</strong>, for specific gene family studies you may need to extract sub-networks from the database. To do this, you need to first identify all gene family members from the genomes and then query this gene candidate list against the synteny block database.</p>
<ul>
<li>We use <a href="http://hmmer.org/">HMMER</a> for gene family identification. HMMs (Hidden Markov Models) for specific gene families can be obtained from Pfam. Users can use <a href="http://pfam.xfam.org/search#tabview=tab0">Pfam Search</a> or NCBI <a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&amp;PAGE_TYPE=BlastSearch&amp;LINK_LOC=blasthome">BLAST</a> to help identify the feature domain(s) in the protein sequence. For example, a plant MADS-box protein is characterized by a core DNA binding domain (<a href="http://pfam.xfam.org/family/PF00319#tabview=tab4">PF00319</a>).</li>
</ul>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;Brief Guidelines of HMMER Usage:</strong></p>
<ul>
<li>Install HMMER followed the instructions at: <a href="http://hmmer.org/documentation.html">http://hmmer.org/documentation.html</a></li>
<li>Download the protein sequence alignment for PF00319 in Stockholm format (default name : &ldquo;PF00319_seed.txt&rdquo;): <a href="http://pfam.xfam.org/family/PF00319#tabview=tab3">http://pfam.xfam.org/family/PF00319#tabview=tab3</a></li>
<li>Hmmbuild: to make a model from the alignment
<ul>
<li>Usage: <strong>hmmbuild</strong> [-options] &lt;hmmfile output&gt; &lt;alignment file input&gt;</li>
<li>Example: hmmbuild MADS.hmm PF00319_seed.txt</li>
<li>hmm is the output model for characterizing MADS-box genes.</li>
</ul>
</li>
<li>Hmmsearch: to identify all candidate members from the peptide database.
<ul>
<li>Usage: <strong>hmmsearch</strong> [options] &lt;query hmmfile&gt; &lt;target seqfile&gt;</li>
<li>Example: hmmsearch MADS.hmm 51_Genomes_Peps &gt; MADS_Results</li>
</ul>
</li>
</ul>
<p>&gt;&gt;&gt; Peptides for 51 plant genomes are merged and available for download, which can be used for an easier identification of gene family members of all 51 genomes. &nbsp;(&ldquo;<a href="http://10.85.9.0/51_GENOMES_PEP.gz">51_Genomes_Peps</a>&rdquo;).</p>
<p>&gt;&gt;&gt; The gene list of candidate MADS-box genes from the 51 Genomes (&ldquo;<a href="http://10.85.9.0/mads_list">MADS_list</a>&rdquo;)</p>
<ul>
<li>Extract subnetwork from the synteny network database as needed, using a list containing all HMMER-identified family members.</li>
<li>Command: grep -f MADS_list 51_Genomes_Blocks &gt; MADS.SynNet</li>
<li>Now we obtain all syntenic relationships for all MADS-box genes.</li>
</ul>
<p>&gt;&gt;&gt; Synteny network of MADS-box genes across 51genomes (<a href="http://10.85.9.0/mads.synnet">MADS.SynNet</a>)</p>
<p><strong>Step 5</strong>:</p>
<p>The subnetwork file (MADS.SynNet) can be trimmed into several formats for clustering and visualization, which can be performed in different ways.</p>
<p>Clustering algorithms: K-clique percolation (e.g., <a href="http://www.cfinder.org/">CFinder</a>, <a href="http://snap.stanford.edu/">SNAP</a>), Infomap, CNM, k-core decomposition, etc.</p>
<p>Visualization tools:&nbsp; <a href="http://www.cytoscape.org/">Cytoscape</a>, <a href="https://gephi.org/">Gephi</a> et al.</p>
<p>&gt;&gt;&gt; Example networks from Tao Zhao et al., 2017 are available for download and visualization in Cytoscape (<a href="http://10.85.9.0/mads.cys">MADS.cys</a>), Cytoscape version 3.4.0.</p>
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
<p><a href="http://10.85.9.0/pv.pep">pv.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pv.bed">pv.bed</a></p>
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
<p><a href="http://10.85.9.0/gm.pep">gm.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/gm.bed">gm.bed</a></p>
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
<p><a href="http://10.85.9.0/cc.pep">cc.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cc.bed">cc.bed</a></p>
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
<p><a href="http://10.85.9.0/mt.pep">mt.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/mt.bed">mt.bed</a></p>
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
<p><a href="http://10.85.9.0/ca.pep">ca.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ca.bed">ca.bed</a></p>
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
<p><a href="http://10.85.9.0/lj.pep">lj.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/lj.bed">lj.bed</a></p>
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
<p><a href="http://10.85.9.0/cl.pep">cl.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cl.bed">cl.bed</a></p>
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
<p><a href="http://10.85.9.0/cs.pep">cs.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cs.bed">cs.bed</a></p>
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
<p><a href="http://10.85.9.0/pt.pep">pt.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pt.bed">pt.bed</a></p>
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
<p><a href="http://10.85.9.0/rc.pep">rc.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/rc.bed">rc.bed</a></p>
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
<p><a href="http://10.85.9.0/md.pep">md.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/md.bed">md.bed</a></p>
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
<p><a href="http://10.85.9.0/pb.pep">pb.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pb.bed">pb.bed</a></p>
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
<p><a href="http://10.85.9.0/pp.pep">pp.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pp.bed">pp.bed</a></p>
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
<p><a href="http://10.85.9.0/pm.pep">pm.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pm.bed">pm.bed</a></p>
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
<p><a href="http://10.85.9.0/fv.pep">fv.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/fv.bed">fv.bed</a></p>
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
<p><a href="http://10.85.9.0/at.pep">at.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/at.bed">at.bed</a></p>
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
<p><a href="http://10.85.9.0/al.pep">al.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/al.bed">al.bed</a></p>
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
<p><a href="http://10.85.9.0/cb.pep">cb.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cb.bed">cb.bed</a></p>
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
<p><a href="http://10.85.9.0/bo.pep">bo.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/bo.bed">bo.bed</a></p>
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
<p><a href="http://10.85.9.0/br.pep">br.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/br.bed">br.bed</a></p>
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
<p><a href="http://10.85.9.0/aeth.pep">aeth.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/aeth.bed">aeth.bed</a></p>
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
<p><a href="http://10.85.9.0/tare.pep">tare.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/tare.bed">tare.bed</a></p>
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
<p><a href="http://10.85.9.0/cp.pep">cp.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cp.bed">cp.bed</a></p>
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
<p><a href="http://10.85.9.0/gr.pep">gr.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/gr.bed">gr.bed</a></p>
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
<p><a href="http://10.85.9.0/ta.pep">ta.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ta.bed">ta.bed</a></p>
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
<p><a href="http://10.85.9.0/ci.pep">ci.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ci.bed">ci.bed</a></p>
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
<p><a href="http://10.85.9.0/eg.pep">eg.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/eg.bed">eg.bed</a></p>
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
<p><a href="http://10.85.9.0/vv.pep">vv.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/vv.bed">vv.bed</a></p>
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
<p><a href="http://10.85.9.0/st.pep">st.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/st.bed">st.bed</a></p>
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
<p><a href="http://10.85.9.0/sl.pep">sl.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/sl.bed">sl.bed</a></p>
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
<p><a href="http://10.85.9.0/cu.pep">cu.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cu.bed">cu.bed</a></p>
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
<p><a href="http://10.85.9.0/ug.pep">ug.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ug.bed">ug.bed</a></p>
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
<p><a href="http://10.85.9.0/ah.pep">ah.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ah.bed">ah.bed</a></p>
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
<p><a href="http://10.85.9.0/bv.pep">bv.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/bv.bed">bv.bed</a></p>
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
<p><a href="http://10.85.9.0/nn.pep">nn.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/nn.bed">nn.bed</a></p>
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
<p><a href="http://10.85.9.0/tu.pep">tu.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/tu.bed">tu.bed</a></p>
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
<p><a href="http://10.85.9.0/hv.pep">hv.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/hv.bed">hv.bed</a></p>
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
<p><a href="http://10.85.9.0/bd.pep">bd.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/bd.bed">bd.bed</a></p>
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
<p><a href="http://10.85.9.0/os.pep">os.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/os.bed">os.bed</a></p>
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
<p><a href="http://10.85.9.0/zm.pep">zm.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/zm.bed">zm.bed</a></p>
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
<p><a href="http://10.85.9.0/sb.pep">sb.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/sb.bed">sb.bed</a></p>
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
<p><a href="http://10.85.9.0/si.pep">si.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/si.bed">si.bed</a></p>
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
<p><a href="http://10.85.9.0/el.pep">el.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/el.bed">el.bed</a></p>
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
<p><a href="http://10.85.9.0/ma.pep">ma.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ma.bed">ma.bed</a></p>
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
<p><a href="http://10.85.9.0/pe.pep">pe.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pe.bed">pe.bed</a></p>
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
<p><a href="http://10.85.9.0/zo.pep">zo.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/zo.bed">zo.bed</a></p>
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
<p><a href="http://10.85.9.0/ar.pep">ar.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ar.bed">ar.bed</a></p>
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
<p><a href="http://10.85.9.0/pa.pep">pa.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/pa.bed">pa.bed</a></p>
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
<p><a href="http://10.85.9.0/sm.pep">sm.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/sm.bed">sm.bed</a></p>
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
<p><a href="http://10.85.9.0/ph.pep">ph.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/ph.bed">ph.bed</a></p>
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
<p><a href="http://10.85.9.0/cr.pep">cr.pep</a></p>
</td>
<td width="107">
<p><a href="http://10.85.9.0/cr.bed">cr.bed</a></p>
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
