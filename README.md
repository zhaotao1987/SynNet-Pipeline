<h3 style="text-align: center;"><strong>Plant Synteny Network Construction and Analysis Pipeline</strong></h3>
<p>Microsynteny network construction consists of three primary steps: (1) Genome data preparation, (2) pairwise whole-genome comparison, (3) syntenic blocks detection, and (4) network manipulation.</p>
<p><strong>Genome data preparation</strong></p>
<p>Sequenced plant genomes can be downloaded from Phytozome, NCBI, Plaza, CoGe, etc.</p>
<p>Phytozome:</p>
<p><a href="http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11">http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11</a></p>
<p>NCBI:</p>
<p><a href="https://www.ncbi.nlm.nih.gov/genome/browse/">https://www.ncbi.nlm.nih.gov/genome/browse/</a></p>
<p>Plaza:</p>
<p><a href="http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index">http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index</a></p>
<p>CoGe:</p>
<p><a href="https://genomevolution.org/coge/OrganismView.pl">https://genomevolution.org/coge/OrganismView.pl</a></p>
<p>Tips:</p>
<ol>
<li>A Fasta file contained all peptides and a GFF file indicating all gene positions are needed for each genome.</li>
<li>Fd</li>
</ol>
<p>When all</p>
<p><strong>Pairwise whole-genome comparison</strong></p>
<p>For example, for a comparison of five plant genomes you would need to perform P (5, 2) + 5 = 25x whole genome all-against-all comparisons, because for each pair of syntenic block reciprocal comparisons are needed and also intra-species comparisons are needed to identify paralogs or &ldquo;syntenic ohnologs pairs&rdquo;.</p>
<p>Recommended tools:</p>
<p>BLAST+</p>
<p><a href="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/">ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/</a></p>
<p>LASTZ</p>
<p><a href="http://www.bx.psu.edu/miller_lab/dist/README.lastz-1.02.00/README.lastz-1.02.00a.html">http://www.bx.psu.edu/miller_lab/dist/README.lastz-1.02.00/README.lastz-1.02.00a.html</a></p>
<p>RAPSearch2</p>
<p><a href="http://rapsearch2.sourceforge.net/">http://rapsearch2.sourceforge.net/</a></p>
<p><strong>Syntenic blocks detection</strong></p>
<p>MCScanX</p>
<p><a href="http://chibba.pgml.uga.edu/mcscan2/">http://chibba.pgml.uga.edu/mcscan2/</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>&nbsp;</strong></p>
<p><strong>&nbsp;</strong></p>
<p>&nbsp;</p>
