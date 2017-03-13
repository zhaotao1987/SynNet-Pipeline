<p><strong>Plant Synteny Network Construction and Analysis Pipeline</strong></p>
<p>Synteny network construction consists of three primary steps: (1) Annotated genome data preparation, (2) pairwise whole-genome comparison, (3) syntenic blocks detection and data merge, and (4) network manipulation.</p>
<p>At Step 1, plant genomes can be downloaded from <a href="http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11">Phytozome</a>, <a href="https://www.ncbi.nlm.nih.gov/genome/browse/">NCBI</a>, <a href="http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index">Plaza</a>, <a href="https://genomevolution.org/coge/OrganismView.pl">CoGe</a>, etc. For each genome, two files are needed: peptide sequences for all annotated/predicted genes (primary transcript only) and a bed/GFF file indicating the genomic location of each gene. Users can prepare any number of genomes for the synteny network construction.</p>
<ul>
<li><u>Fifty-one plant genomes used in the study of Tao Zhao et al., 2017 are listed and available for download below (Table 1). </u></li>
</ul>
<p>For Step 2 and 3, we provide a bash script here (SynNet.sh) that can automatically perform pairwise inter- and intra- species comparisons, trimming the outputs for synteny detection, and treating outputs containing all synteny blocks to a final network file. This network database contains four columns: Block_ID, Block_Score, Gene1, and Gene2 (Gene 1 and Gene 2 are a syntenic gene pair).</p>
<ul>
<li>Users have to pre-install <a href="http://rapsearch2.sourceforge.net/">RAPSearch2</a> (for fast whole genome comparisons, much faster that BLAST) and <a href="http://chibba.pgml.uga.edu/mcscan2/">MCScanX</a> (for synteny detection), and make change to the working path according to your installation in the bash script.</li>
<li>Put all required genome files and the bash script in the same directory. Then just alter the first line of the program, which is a bracket containing species abbreviations (which are consistent to the names used in the genome files)</li>
<li><u>Synteny network of the fifty-one plant genomes used in the study of Tao et al., 2017 are available for download </u>(&ldquo;<a href="http://10.85.9.0/51_Genomes_Blocks">51_Genomes_Blocks</a>&rdquo;).</li>
</ul>
<p>At Step 4, for specific gene family studies, we may need to extract sub-networks from the database. To do this, we need to characterize all gene family members from the genomes first and then query this gene candidates list against the synteny block database.</p>
<p>Part I:</p>
<ul>
<li>We use <a href="http://hmmer.org/">HMMER</a> for gene family identification. HMMs (Hidden Markov Models) for specific gene families can be obtained from Pfam. Users can use <a href="http://pfam.xfam.org/search#tabview=tab0">Pfam Search</a> or NCBI <a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&amp;PAGE_TYPE=BlastSearch&amp;LINK_LOC=blasthome">BLAST</a> to help decide the featured domain of your protein sequence. For example, a plant MADS-box protein is characterized by a core DNA binding domain (<a href="http://pfam.xfam.org/family/PF00319#tabview=tab4">PF00319</a>).</li>
</ul>
<p><strong>Brief guidelines:</strong></p>
<ol>
<li>Install HMMER followed the instructions on <a href="http://hmmer.org/documentation.html">http://hmmer.org/documentation.html</a></li>
<li>Download the protein sequence alignment for PF00319 in Stockholm format (default name : &ldquo;PF00319_seed.txt&rdquo;): <a href="http://pfam.xfam.org/family/PF00319#tabview=tab3">http://pfam.xfam.org/family/PF00319#tabview=tab3</a></li>
<li>Hmmbuild: to make a model from the alignment</li>
</ol>
<p>Usage: <strong>hmmbuild</strong> [-options] &lt;hmmfile output&gt; &lt;alignment file input&gt;</p>
<p>Example: hmmbuild MADS.hmm PF00319_seed.txt</p>
<p>MADS.hmm is the output model for characterizing MADS-box genes.</p>
<ol>
<li>Hmmsearch: to identify all candidate members from the peptide database.</li>
</ol>
<p>&nbsp;</p>
<p>Usage: <strong>hmmsearch</strong> [options] &lt;query hmmfile&gt; &lt;target seqfile&gt;</p>
<p>Example: hmmsearch MADS.hmm 51_Genomes_Peps &gt; MADS_Results</p>
<ul>
<li><u>Peptides for 51 plant genomes are merged and available for download </u>(&ldquo;<a href="http://10.85.9.0/51_Genomes_Peps">51_Genomes_Peps</a>&rdquo;).</li>
<li><u>The gene list of candidate MADS-box genes from the 51 Genomes (&ldquo;</u><a href="http://10.85.9.0/MADS_list">MADS_list</a><u>&rdquo;)</u></li>
<li>Extract subnetwork from the synteny network database as needed.</li>
</ul>
<p>Command: &nbsp;grep -f MADS_list 51_Genomes_Blocks &gt; MADS.SynNet</p>
<ul>
<li>Now we obtain all syntenic relationships for all MADS-box genes.</li>
<li><a href="http://10.85.9.0/MADS.SynNet">SynNet</a></li>
</ul>
<p>Part II:</p>
<ul>
<li>The subnetwork file (MADS.SynNet) can be trimmed into several formats for clustering and visualization depending on the tools used. This can be done in multiple ways, we list several tools here.</li>
</ul>
<p>For programatic analyzing and clustering networks:</p>
<p>R package: <a href="http://igraph.org/">igraph</a></p>
<p>C++ or python packages: <a href="https://networkx.github.io/">NetworkX</a>, <a href="http://snap.stanford.edu/">SNAP</a>, <a href="http://igraph.org/python/">python-igraph</a></p>
<p>For GUI style operations:</p>
<p>&nbsp;<a href="http://www.cfinder.org/">CFinder</a></p>
<p><a href="http://www.cytoscape.org/">Cytoscape</a></p>
<p><a href="https://gephi.org/">Gephi</a></p>
<ul>
<li><u>Example networks from Tao Zhao et al., 2017 are available for download and visualization in Cytoscape </u>(<a href="http://10.85.9.0/MADS.cytoscape">cytoscape</a>)</li>
</ul>
<p><u>&nbsp;</u></p>
<p>Table 1: Genomes Used in the study of Tao Zhao et al., 2017</p>
<table>
<tbody>
<tr>
<td width="53">
<p>No</p>
</td>
<td width="144">
<p>Species</p>
</td>
<td width="119">
<p>Order</p>
</td>
<td width="108">
<p>Peptides</p>
</td>
<td width="107">
<p>BED/GFF</p>
</td>
<td width="113">
<p>Version</p>
</td>
<td width="114">
<p>#Genes</p>
</td>
<td width="162">
<p>Reference</p>
</td>
</tr>
<tr>
<td width="53">
<p><em>1</em></p>
</td>
<td width="144">
<p><em>Phaseolus vulgaris</em> (Common bean)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>pv.pep</u></p>
</td>
<td width="107">
<p><u>pv.bed</u></p>
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
<p><em>2</em></p>
</td>
<td width="144">
<p><em>Glycine max</em> (Soybean)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>gm.pep</u></p>
</td>
<td width="107">
<p><u>gm.bed</u></p>
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
<p><em>3</em></p>
</td>
<td width="144">
<p><em>Cajanus cajan</em> (Pigeonpea)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>cc.pep</u></p>
</td>
<td width="107">
<p><u>cc.bed</u></p>
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
<p><em>4</em></p>
</td>
<td width="144">
<p><em>Medicago truncatula</em> (Barrel medic)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>mt.pep</u></p>
</td>
<td width="107">
<p><u>mt.bed</u></p>
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
<p><em>5</em></p>
</td>
<td width="144">
<p><em>Cicer arietinum</em> (Chickpea)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>ca.pep</u></p>
</td>
<td width="107">
<p><u>ca.bed</u></p>
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
<p><em>6</em></p>
</td>
<td width="144">
<p><em>Lotus japonicus</em> (Lotus)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>lj.pep</u></p>
</td>
<td width="107">
<p><u>lj.bed</u></p>
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
<p><em>7</em></p>
</td>
<td width="144">
<p><em>Citrullus lanatus</em> (Watermelon)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>cl.pep</u></p>
</td>
<td width="107">
<p><u>cl.bed</u></p>
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
<p><em>8</em></p>
</td>
<td width="144">
<p><em>Cucumis sativus</em> (Cucumber)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>cs.pep</u></p>
</td>
<td width="107">
<p><u>cs.bed</u></p>
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
<p><em>9</em></p>
</td>
<td width="144">
<p><em>Populus trichocarpa</em> (Western poplar)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>pt.pep</u></p>
</td>
<td width="107">
<p><u>pt.bed</u></p>
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
<p><em>10</em></p>
</td>
<td width="144">
<p><em>Ricinus communis </em>(Castor bean)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>rc.pep</u></p>
</td>
<td width="107">
<p><u>rc.bed</u></p>
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
<p><em>11</em></p>
</td>
<td width="144">
<p><em>Malus x domestica</em> (Apple)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>md.pep</u></p>
</td>
<td width="107">
<p><u>md.bed</u></p>
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
<p><em>12</em></p>
</td>
<td width="144">
<p><em>Pyrus x bretschneider</em>i (Pear)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>pb.pep</u></p>
</td>
<td width="107">
<p><u>pb.bed</u></p>
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
<p><em>13</em></p>
</td>
<td width="144">
<p><em>Prunus persica</em> (Peach)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>pp.pep</u></p>
</td>
<td width="107">
<p><u>pp.bed</u></p>
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
<p><em>14</em></p>
</td>
<td width="144">
<p><em>Prunus mum</em>e (Mei)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>pm.pep</u></p>
</td>
<td width="107">
<p><u>pm.bed</u></p>
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
<p><em>15</em></p>
</td>
<td width="144">
<p>Fragaria vesca (Strawberry)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>fv.pep</u></p>
</td>
<td width="107">
<p><u>fv.bed</u></p>
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
<p><em>16</em></p>
</td>
<td width="144">
<p><em>Arabidopsis thaliana</em> (Arabidopsis)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>at.pep</u></p>
</td>
<td width="107">
<p><u>at.bed</u></p>
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
<p><em>17</em></p>
</td>
<td width="144">
<p><em>Arabidopsis lyrata</em> (Lyrate rockcress)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>al.pep</u></p>
</td>
<td width="107">
<p><u>al.bed</u></p>
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
<p><em>18</em></p>
</td>
<td width="144">
<p><em>Capsella rubella </em>(Capsella)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>cb.pep</u></p>
</td>
<td width="107">
<p><u>cb.bed</u></p>
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
<p><em>19</em></p>
</td>
<td width="144">
<p><em>Brassica oleracea</em> (Kale)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>bo.pep</u></p>
</td>
<td width="107">
<p><u>bo.bed</u></p>
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
<p><em>20</em></p>
</td>
<td width="144">
<p><em>Brassica rapa</em> (Chinese cabbage)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>br.pep</u></p>
</td>
<td width="107">
<p><u>br.bed</u></p>
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
<p><em>21</em></p>
</td>
<td width="144">
<p>Aethionema</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>Aeth.pep</u></p>
</td>
<td width="107">
<p><u>Aeth.bed</u></p>
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
<p><em>22</em></p>
</td>
<td width="144">
<p>Tarenaya</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>tare.pep</u></p>
</td>
<td width="107">
<p><u>tare.bed</u></p>
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
<p><em>23</em></p>
</td>
<td width="144">
<p><em>Carica papaya</em> (Papaya)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>cp.pep</u></p>
</td>
<td width="107">
<p><u>cp.bed</u></p>
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
<p><em>24</em></p>
</td>
<td width="144">
<p><em>Gossypium raimondii</em> (Cotton)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>gr.pep</u></p>
</td>
<td width="107">
<p><u>gr.bed</u></p>
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
<p><em>25</em></p>
</td>
<td width="144">
<p><em>Theobroma cacao</em> (Cacao)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>ta.pep</u></p>
</td>
<td width="107">
<p><u>ta.bed</u></p>
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
<p><em>26</em></p>
</td>
<td width="144">
<p><em>Citrus sinensis </em>(Sweet orange)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>ci.pep</u></p>
</td>
<td width="107">
<p><u>ci.bed</u></p>
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
<p><em>27</em></p>
</td>
<td width="144">
<p><em>Eucalyptus grandis</em> (Eucalyptus)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>eg.pep</u></p>
</td>
<td width="107">
<p><u>eg.bed</u></p>
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
<p><em>28</em></p>
</td>
<td width="144">
<p><em>Vitis vinifera </em>(Grape vine)</p>
</td>
<td width="119">
<p>Rosids</p>
</td>
<td width="108">
<p><u>vv.pep</u></p>
</td>
<td width="107">
<p><u>vv.bed</u></p>
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
<p><em>29</em></p>
</td>
<td width="144">
<p><em>Solanum tuberosum</em> (Potato)</p>
</td>
<td width="119">
<p>Solanace</p>
</td>
<td width="108">
<p><u>st.pep</u></p>
</td>
<td width="107">
<p><u>st.bed</u></p>
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
<p><em>30</em></p>
</td>
<td width="144">
<p><em>Solanum lycopersicum</em> (Tomato)</p>
</td>
<td width="119">
<p>Solanace</p>
</td>
<td width="108">
<p><u>sl.pep</u></p>
</td>
<td width="107">
<p><u>sl.bed</u></p>
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
<p><em>31</em></p>
</td>
<td width="144">
<p><em>Capsicum annuum</em> (Hot pepper)</p>
</td>
<td width="119">
<p>Solanace</p>
</td>
<td width="108">
<p><u>cu.pep</u></p>
</td>
<td width="107">
<p><u>cu.bed</u></p>
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
<p><em>32</em></p>
</td>
<td width="144">
<p><em>Utricularia gibba</em> (Humped bladderwort)</p>
</td>
<td width="119">
<p>Solanace</p>
</td>
<td width="108">
<p><u>ug.pep</u></p>
</td>
<td width="107">
<p><u>ug.bed</u></p>
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
<p><em>33</em></p>
</td>
<td width="144">
<p><em>Actinidia chinensis</em> (Kiwifruit)</p>
</td>
<td width="119">
<p>Solanace</p>
</td>
<td width="108">
<p><u>ah.pep</u></p>
</td>
<td width="107">
<p><u>ah.bed</u></p>
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
<p><em>34</em></p>
</td>
<td width="144">
<p><em>Beta vulgaris</em> (Sugar beet)</p>
</td>
<td width="119">
<p>Eudicots</p>
</td>
<td width="108">
<p><u>bv.pep</u></p>
</td>
<td width="107">
<p><u>bv.bed</u></p>
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
<p><em>35</em></p>
</td>
<td width="144">
<p><em>Nelumbo nucifera</em> (Sacred lotus)</p>
</td>
<td width="119">
<p>Eudicots</p>
</td>
<td width="108">
<p><u>nn.pep</u></p>
</td>
<td width="107">
<p><u>nn.bed</u></p>
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
<p><em>36</em></p>
</td>
<td width="144">
<p><em>Triticum urartu</em> (Wheat A-genome)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>tu.pep</u></p>
</td>
<td width="107">
<p><u>tu.bed</u></p>
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
<p><em>37</em></p>
</td>
<td width="144">
<p><em>Hordeum vulgare</em> (Barley)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>hv.pep</u></p>
</td>
<td width="107">
<p><u>hv.bed</u></p>
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
<p><em>38</em></p>
</td>
<td width="144">
<p><em>Brachypodium distachyon</em> (Purple false brome)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>bd.pep</u></p>
</td>
<td width="107">
<p><u>bd.bed</u></p>
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
<p><em>39</em></p>
</td>
<td width="144">
<p><em>Oryza sativa</em> (Rice)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>os.pep</u></p>
</td>
<td width="107">
<p><u>os.bed</u></p>
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
<p><em>40</em></p>
</td>
<td width="144">
<p><em>Zea mays</em> (Maize)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>zm.pep</u></p>
</td>
<td width="107">
<p><u>zm.bed</u></p>
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
<p><em>41</em></p>
</td>
<td width="144">
<p><em>Sorghum bicolor</em> (Sorghum)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>sb.pep</u></p>
</td>
<td width="107">
<p><u>sb.bed</u></p>
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
<p><em>42</em></p>
</td>
<td width="144">
<p><em>Setaria italica</em></p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>Si.pep</u></p>
</td>
<td width="107">
<p><u>Si.bed</u></p>
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
<p><em>43</em></p>
</td>
<td width="144">
<p><em>Elaeis guineensis </em>(Oil palm)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>el.pep</u></p>
</td>
<td width="107">
<p><u>el.bed</u></p>
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
<p><em>44</em></p>
</td>
<td width="144">
<p><em>Musa acuminata </em>(Banana)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>ma.pep</u></p>
</td>
<td width="107">
<p><u>ma.bed</u></p>
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
<p><em>45</em></p>
</td>
<td width="144">
<p><em>Phalaenopsis equestris</em> (Orchid)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>pe.pep</u></p>
</td>
<td width="107">
<p><u>pe.bed</u></p>
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
<p><em>46</em></p>
</td>
<td width="144">
<p><em>Zostera muelleri</em> (Seagrass)</p>
</td>
<td width="119">
<p>Monocots</p>
</td>
<td width="108">
<p><u>zo.pep</u></p>
</td>
<td width="107">
<p><u>zo.bed</u></p>
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
<p><em>47</em></p>
</td>
<td width="144">
<p><em>Amborella trichopoda</em> (Amborella)</p>
</td>
<td width="119">
<p>Basal Angiosperm</p>
</td>
<td width="108">
<p><u>ar.pep</u></p>
</td>
<td width="107">
<p><u>ar.bed</u></p>
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
<p><em>48</em></p>
</td>
<td width="144">
<p><em>Picea abies</em> (Norway spruce)</p>
</td>
<td width="119">
<p>Gymnosperm</p>
</td>
<td width="108">
<p><u>pa.pep</u></p>
</td>
<td width="107">
<p><u>pa.bed</u></p>
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
<p><em>49</em></p>
</td>
<td width="144">
<p><em>Selaginella moellendorffii </em>(Selaginella)</p>
</td>
<td width="119">
<p>Moss</p>
</td>
<td width="108">
<p><u>sm.pep</u></p>
</td>
<td width="107">
<p><u>sm.bed</u></p>
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
<p><em>50</em></p>
</td>
<td width="144">
<p><em>Physcomitrella patens</em> (Moss)</p>
</td>
<td width="119">
<p>Moss</p>
</td>
<td width="108">
<p><u>ph.pep</u></p>
</td>
<td width="107">
<p><u>ph.bed</u></p>
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
<p><em>51</em></p>
</td>
<td width="144">
<p><em>Chlamydomonas reinhardtii</em> (Green algae)</p>
</td>
<td width="119">
<p>Green algae</p>
</td>
<td width="108">
<p><u>cr.pep</u></p>
</td>
<td width="107">
<p><u>cr.bed</u></p>
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
<p>Citations</p>
<p>&nbsp;</p>
