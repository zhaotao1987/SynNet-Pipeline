<p><strong>Plant Synteny Network Construction and Analysis Pipeline</strong></p>
<p><strong>&nbsp;</strong></p>
<p>Synteny network construction consists of three primary steps: (1) Genome data preparation, (2) pairwise whole-genome comparison, (3) syntenic blocks detection and data merge, and (4) network manipulation.</p>
<p><strong>Genome data preparation</strong></p>
<p>Genomes from any kingdoms (i.e. plants, animals, bacterial, et al.) can be used for synteny network construction. Plant genomes can be downloaded from <a href="http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11">Phytozome</a>, <a href="https://www.ncbi.nlm.nih.gov/genome/browse/">NCBI</a>, <a href="http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index">Plaza</a>, <a href="https://genomevolution.org/coge/OrganismView.pl">CoGe</a>, etc.</p>
<p>Tips:</p>
<ol>
<li>A Fasta file contained all peptides and a GFF/BED file indicating all gene positions are required for each genome.</li>
<li>For each gene, gene names should be identical in the Fasta file and GFF/BED files.</li>
<li>If necessary, modify the gene names to simple and concise strings. Use unique three-letter codes to indicate species, for example for <em>Arabidopsis thaliana</em>, use &ldquo;ath_&rdquo; as the prefix of any <em>Arabidopsis thaliana</em> genes in the genome, such as &ldquo;ath_AT4G25470&rdquo;. Avoid long function annotations in gene names.</li>
<li>Depends on the question on hand, you can use any set of genomes for synteny network construction. For example, use all available Brassicaceae species for a lineage-wide comparison, or more species in eudicots and monocots for a larger evolutionary</li>
<li></li>
</ol>
<p>Pre-processed plant genomes are available here:</p>
<table>
<tbody>
<tr>
<td width="129">
<p>Species</p>
</td>
<td width="110">
<p>Version</p>
</td>
<td width="133">
<p>Genome peptides</p>
</td>
<td width="123">
<p>Genome cds</p>
</td>
<td width="157">
<p>Gene position/GFF</p>
</td>
<td width="128">
<p>Reference</p>
</td>
</tr>
<tr>
<td width="129">
<p>&nbsp;</p>
</td>
<td width="110">
<p>&nbsp;</p>
</td>
<td width="133">
<p>&nbsp;</p>
</td>
<td width="123">
<p>&nbsp;</p>
</td>
<td width="157">
<p>&nbsp;</p>
</td>
<td width="128">
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>
