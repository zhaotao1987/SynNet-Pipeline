<p><strong>Plant Synteny Network Construction and Analysis Pipeline</strong></p>
<p><strong>&nbsp;</strong></p>
<p>Synteny network construction consists of three primary steps: (1) Genome data preparation, (2) pairwise whole-genome comparison, (3) syntenic blocks detection and data merge, and (4) network manipulation.</p>
<ol>
<li><strong>Genome data preparation</strong></li>
</ol>
<p>Genomes from any kingdoms (i.e. plants, animals, bacterial, et al.) can be used for synteny network construction. Plant genomes can be downloaded from <a href="http://genome.jgi.doe.gov/pages/dynamicOrganismDownload.jsf?organism=PhytozomeV11">Phytozome</a>, <a href="https://www.ncbi.nlm.nih.gov/genome/browse/">NCBI</a>, <a href="http://bioinformatics.psb.ugent.be/plaza/versions/plaza_v3_dicots/download/index">Plaza</a>, <a href="https://genomevolution.org/coge/OrganismView.pl">CoGe</a>, etc.</p>
<p>Tips:</p>
<ol>
<li>A Fasta file contained all peptides and a GFF/BED file indicating all gene positions are required for each genome.</li>
<li>For each gene, gene names should be identical in the Fasta file and GFF/BED files.</li>
<li>If necessary, modify the gene names to simple and concise strings. Use unique three-letter codes to indicate species, for example for <em>Arabidopsis thaliana</em>, use &ldquo;ath_&rdquo; as the prefix of any <em>Arabidopsis thaliana</em> genes in the genome, such as &ldquo;ath_AT4G25470&rdquo;. Avoid long function annotations in gene names.</li>
<li>Depends on the question on hand, you can use any set of genomes for synteny network construction. For example, use all available Brassicaceae species for a lineage-wide comparison, or across many species in eudicots and monocots.</li>
<li>Pre-processed plant genomes are available below:</li>
</ol>
<table width="813">
<tbody>
<tr>
<td width="60">
<p>Index</p>
</td>
<td width="160">
<p>species</p>
</td>
<td width="135">
<p>Lineage</p>
</td>
<td width="118">
<p>Abbreviation</p>
</td>
<td width="80">
<p>Peptides</p>
</td>
<td width="87">
<p>BED/GFF</p>
</td>
<td width="173">
<p>Reference</p>
</td>
</tr>
<tr>
<td width="60">
<p>1</p>
</td>
<td width="160">
<p><em>Vigna radiata</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>vra</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/vra.pep">vra.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/vra.bed">vra.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2014/141111/ncomms6443/full/ncomms6443.html">2014 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>2</p>
</td>
<td width="160">
<p><em>Vigna angularis</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>van</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/van.pep">van.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/van.bed">van.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.pnas.org/content/112/43/13213">2015 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>3</p>
</td>
<td width="160">
<p><em>Phaseolus vulgaris</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>pvu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pvu.pep">pvu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pvu.bed">pvu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v46/n7/full/ng.3008.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>4</p>
</td>
<td width="160">
<p><em>Glycine max</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>gma</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/gma.pep">gma.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/gma.bed">gma.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v463/n7278/full/nature08670.html">2010 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>5</p>
</td>
<td width="160">
<p><em>Cajanus cajan</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>cca</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cca.pep">cca.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cca.bed">cca.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nbt/journal/v30/n1/full/nbt.2022.html">2012 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>6</p>
</td>
<td width="160">
<p><em>Trifolium pratense</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>tpr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/tpr.pep">tpr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/tpr.bed">tpr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/articles/srep17394">2015 SR</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>7</p>
</td>
<td width="160">
<p><em>Medicago truncatula</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>mtr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/mtr.pep">mtr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/mtr.bed">mtr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v480/n7378/full/nature10625.html">2011 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>8</p>
</td>
<td width="160">
<p><em>Arachis duranensis</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>adu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/adu.pep">adu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/adu.bed">adu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v48/n4/full/ng.3517.html">2016 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>9</p>
</td>
<td width="160">
<p><em>Lotus japonicus</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>lja</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/lja.pep">lja.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/lja.bed">lja.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://dnaresearch.oxfordjournals.org/content/8/6/311.long">2001 DR</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>10</p>
</td>
<td width="160">
<p><em>Cicer arietinum</em></p>
</td>
<td width="135">
<p>Fabaceae</p>
</td>
<td width="118">
<p>car</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/car.pep">car.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/car.bed">car.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nbt/journal/v31/n3/full/nbt.2491.html">2013 NB</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>11</p>
</td>
<td width="160">
<p><em>Prunus mume</em></p>
</td>
<td width="135">
<p>Rosaceae</p>
</td>
<td width="118">
<p>pmu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pmu.pep">pmu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pmu.bed">pmu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/journal/v3/n12/full/ncomms2290.html">2012 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>12</p>
</td>
<td width="160">
<p><em>Prunus persica</em></p>
</td>
<td width="135">
<p>Rosaceae</p>
</td>
<td width="118">
<p>ppe</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ppe.pep">ppe.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ppe.bed">ppe.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n5/full/ng.2586.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>13</p>
</td>
<td width="160">
<p><em>Pyrus x bretschneideri</em></p>
</td>
<td width="135">
<p>Rosaceae</p>
</td>
<td width="118">
<p>pbr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pbr.pep">pbr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pbr.bed">pbr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3561880/">2013 GR</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>14</p>
</td>
<td width="160">
<p><em>Malus domestica</em></p>
</td>
<td width="135">
<p>Rosaceae</p>
</td>
<td width="118">
<p>mdo</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/mdo.pep">mdo.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/mdo.bed">mdo.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v42/n10/full/ng.654.html">2010 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>15</p>
</td>
<td width="160">
<p><em>Rubus occidentalis</em></p>
</td>
<td width="135">
<p>Rosaceae</p>
</td>
<td width="118">
<p>roc</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/roc.pep">roc.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/roc.bed">roc.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/tpj.13215/abstract;jsessionid=79FAD29315B4551E413C87F848630DB3.f01t02">2016 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>16</p>
</td>
<td width="160">
<p><em>Fragaria vesca</em></p>
</td>
<td width="135">
<p>Rosaceae</p>
</td>
<td width="118">
<p>fve</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/fve.pep">fve.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/fve.bed">fve.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v43/n2/full/ng.740.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>17</p>
</td>
<td width="160">
<p><em>Humulus lupulus</em></p>
</td>
<td width="135">
<p>Cannabaceae</p>
</td>
<td width="118">
<p>hlu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/hlu.pep">hlu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/hlu.bed">hlu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://pcp.oxfordjournals.org/content/56/3/428.long">2015 PCP</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>18</p>
</td>
<td width="160">
<p><em>Jatropha curcas</em></p>
</td>
<td width="135">
<p>Euphorbiaceae</p>
</td>
<td width="118">
<p>jcu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/jcu.pep">jcu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/jcu.bed">jcu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/tpj.12761/abstract">2015 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>19</p>
</td>
<td width="160">
<p><em>Manihot esculenta</em></p>
</td>
<td width="135">
<p>Euphorbiaceae</p>
</td>
<td width="118">
<p>mes</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/mes.pep">mes.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/mes.bed">mes.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2014/141010/ncomms6110/full/ncomms6110.html">2014 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>20</p>
</td>
<td width="160">
<p><em>Ricinus communis</em></p>
</td>
<td width="135">
<p>Euphorbiaceae</p>
</td>
<td width="118">
<p>rco</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/rco.pep">rco.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/rco.bed">rco.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nbt/journal/v28/n9/full/nbt.1674.html">2010 NB</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>21</p>
</td>
<td width="160">
<p><em>Linum usitatissimum</em></p>
</td>
<td width="135">
<p>Linaceae</p>
</td>
<td width="118">
<p>lus</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/lus.pep">lus.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/lus.bed">lus.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/j.1365-313X.2012.05093.x/abstract;jsessionid=854E05CCF4FDC10CDE545CD5B53D1DCE.f03t02">2012 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>22</p>
</td>
<td width="160">
<p><em>Populus trichocarpa</em></p>
</td>
<td width="135">
<p>Salicaceae</p>
</td>
<td width="118">
<p>ptr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ptr.pep">ptr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ptr.bed">ptr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/313/5793/1596.long">2006 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>23</p>
</td>
<td width="160">
<p><em>Cucumis sativus</em></p>
</td>
<td width="135">
<p>Cucurbitaceae</p>
</td>
<td width="118">
<p>csa</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/csa.pep">csa.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/csa.bed">csa.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v41/n12/abs/ng.475.html">2009 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>24</p>
</td>
<td width="160">
<p><em>Cucumis melo</em></p>
</td>
<td width="135">
<p>Cucurbitaceae</p>
</td>
<td width="118">
<p>cme</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cme.pep">cme.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cme.bed">cme.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.pnas.org/content/109/29/11872">2012 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>25</p>
</td>
<td width="160">
<p><em>Citrullus lanatus</em></p>
</td>
<td width="135">
<p>Cucurbitaceae</p>
</td>
<td width="118">
<p>cla</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cla.pep">cla.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cla.bed">cla.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n1/full/ng.2470.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>26</p>
</td>
<td width="160">
<p><em>Castanea mollissima</em></p>
</td>
<td width="135">
<p>Fagaceae</p>
</td>
<td width="118">
<p>cmo</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cmo.pep">cmo.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cmo.bed">cmo.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://link.springer.com/article/10.1007%2Fs11295-012-0576-6">2012 TGG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>27</p>
</td>
<td width="160">
<p><em>Juglans regia</em></p>
</td>
<td width="135">
<p>Juglandaceae</p>
</td>
<td width="118">
<p>jre</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/jre.pep">jre.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/jre.bed">jre.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/tpj.13207/abstract">2016 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>28</p>
</td>
<td width="160">
<p><em>Brassica oleracea</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>bol</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/bol.pep">bol.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/bol.bed">bol.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2014/140523/ncomms4930/full/ncomms4930.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>29</p>
</td>
<td width="160">
<p><em>Brassica rapa</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>bra</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/bra.pep">bra.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/bra.bed">bra.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v43/n10/full/ng.919.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>30</p>
</td>
<td width="160">
<p><em>Brassica napus</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>bnp</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/bnp.pep">bnp.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/bnp.bed">bnp.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/345/6199/950">2014 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>31</p>
</td>
<td width="160">
<p><em>Raphanus raphanistrum</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>rra</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/rra.pep">rra.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/rra.bed">rra.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.plantcell.org/content/26/5/1925.long">2014 PC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>32</p>
</td>
<td width="160">
<p><em>Capsella grandiflora</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>cgr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cgr.pep">cgr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cgr.bed">cgr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n7/full/ng.2669.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>33</p>
</td>
<td width="160">
<p><em>Capsella rubella</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>cru</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cru.pep">cru.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cru.bed">cru.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n7/full/ng.2669.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>34</p>
</td>
<td width="160">
<p><em>Arabidopsis lyrata</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>aly</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/aly.pep">aly.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/aly.bed">aly.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v43/n5/full/ng.807.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>35</p>
</td>
<td width="160">
<p><em>Arabidopsis thaliana</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>ath</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ath.pep">ath.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ath.bed">ath.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v408/n6814/full/408796a0.html">2000 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>36</p>
</td>
<td width="160">
<p><em>Thellungiella halophila</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>thh</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/thh.pep">thh.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/thh.bed">thh.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v43/n9/full/ng.889.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>37</p>
</td>
<td width="160">
<p><em>Thellungiella salsuginea</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>tsa</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/tsa.pep">tsa.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/tsa.bed">tsa.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.pnas.org/content/109/30/12219.long">2012 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>38</p>
</td>
<td width="160">
<p><em>Leavenworthia alabamica</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>lal</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/lal.pep">lal.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/lal.bed">lal.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n8/full/ng.2684.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>39</p>
</td>
<td width="160">
<p><em>Aethionema arabicum</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>aar</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/aar.pep">aar.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/aar.bed">aar.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n8/full/ng.2684.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>40</p>
</td>
<td width="160">
<p><em>Schrenkiella parvula</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>spa</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/spa.pep">spa.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/spa.bed">spa.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pubmed/24563282">2014 PP</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>41</p>
</td>
<td width="160">
<p><em>Sisymbrium irio</em></p>
</td>
<td width="135">
<p>Brassicaceae</p>
</td>
<td width="118">
<p>sir</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sir.pep">sir.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sir.bed">sir.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n8/full/ng.2684.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>42</p>
</td>
<td width="160">
<p><em>Cleome gynandra</em></p>
</td>
<td width="135">
<p>Cleomaceae</p>
</td>
<td width="118">
<p>cgy</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cgy.pep">cgy.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cgy.bed">cgy.bed</a></u></p>
</td>
<td width="173">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="60">
<p>43</p>
</td>
<td width="160">
<p><em>Tarenaya hassleriana</em></p>
</td>
<td width="135">
<p>Cleomaceae</p>
</td>
<td width="118">
<p>tha</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/tha.pep">tha.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/tha.bed">tha.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.plantcell.org/cgi/pmidlookup?view=long&amp;pmid=23983221">2013 PC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>44</p>
</td>
<td width="160">
<p><em>Carica papaya</em></p>
</td>
<td width="135">
<p>Caricaceae</p>
</td>
<td width="118">
<p>cpa</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cpa.pep">cpa.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cpa.bed">cpa.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v452/n7190/full/nature06856.html">2008 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>45</p>
</td>
<td width="160">
<p><em>Gossypium raimondii</em></p>
</td>
<td width="135">
<p>Malvaceae</p>
</td>
<td width="118">
<p>gra</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/gra.pep">gra.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/gra.bed">gra.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v44/n10/full/ng.2371.html">2012 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>46</p>
</td>
<td width="160">
<p><em>Theobroma cacao</em></p>
</td>
<td width="135">
<p>Malvaceae</p>
</td>
<td width="118">
<p>tca</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/tca.pep">tca.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/tca.bed">tca.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v43/n2/full/ng.736.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>47</p>
</td>
<td width="160">
<p><em>Eucalyptus grandis</em></p>
</td>
<td width="135">
<p>Myrtaceae</p>
</td>
<td width="118">
<p>egr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/egr.pep">egr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/egr.bed">egr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v510/n7505/full/nature13308.html">2014 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>48</p>
</td>
<td width="160">
<p><em>Citrus sinensis</em></p>
</td>
<td width="135">
<p>Rutaceae</p>
</td>
<td width="118">
<p>csi</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/csi.pep">csi.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/csi.bed">csi.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n1/full/ng.2472.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>49</p>
</td>
<td width="160">
<p><em>Vitis vinifera</em></p>
</td>
<td width="135">
<p>Vitaceae</p>
</td>
<td width="118">
<p>vvi</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/vvi.pep">vvi.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/vvi.bed">vvi.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v449/n7161/full/nature06148.html">2007 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>50</p>
</td>
<td width="160">
<p><em>Solanum pennellii</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>spe</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/spe.pep">spe.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/spe.bed">spe.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v46/n9/full/ng.3046.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>51</p>
</td>
<td width="160">
<p><em>Solanum lycopersicum</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>sly</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sly.pep">sly.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sly.bed">sly.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v485/n7400/full/nature11119.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>52</p>
</td>
<td width="160">
<p><em>Solanum tuberosum</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>stu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/stu.pep">stu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/stu.bed">stu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v475/n7355/full/nature10158.html">2011 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>53</p>
</td>
<td width="160">
<p><em>Solanum melongena</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>sme</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sme.pep">sme.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sme.bed">sme.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://dnaresearch.oxfordjournals.org/content/early/2014/09/16/dnares.dsu027.long">2014 DR</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>54</p>
</td>
<td width="160">
<p><em>Capsicum annuum</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>can</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/can.pep">can.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/can.bed">can.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v46/n3/full/ng.2877.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>55</p>
</td>
<td width="160">
<p><em>Nicotiana benthamiana</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>nbe</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/nbe.pep">nbe.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/nbe.bed">nbe.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pubmed/22876960">2012 Mol Plant Microbe Interact</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>56</p>
</td>
<td width="160">
<p><em>Nicotiana tabacum</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>nta</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/nta.pep">nta.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/nta.bed">nta.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2014/140508/ncomms4833/full/ncomms4833.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>57</p>
</td>
<td width="160">
<p><em>Petunia axillaris</em></p>
</td>
<td width="135">
<p>Solanaceae</p>
</td>
<td width="118">
<p>pax</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pax.pep">pax.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pax.bed">pax.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/articles/nplants201674">2016 NP</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>58</p>
</td>
<td width="160">
<p><em>Utricularia gibba</em></p>
</td>
<td width="135">
<p>Lentibulariaceae</p>
</td>
<td width="118">
<p>ugi</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ugi.pep">ugi.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ugi.bed">ugi.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v498/n7452/full/nature12132.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>59</p>
</td>
<td width="160">
<p><em>Sesamum indicum</em></p>
</td>
<td width="135">
<p>Pedaliaceae</p>
</td>
<td width="118">
<p>sin</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sin.pep">sin.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sin.bed">sin.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3663098/?report=reader">2013/2014 GB</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>60</p>
</td>
<td width="160">
<p><em>Mimulus guttatus</em></p>
</td>
<td width="135">
<p>Phrymaceae</p>
</td>
<td width="118">
<p>mgu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/mgu.pep">mgu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/mgu.bed">mgu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.pnas.org/content/110/48/19478.long">2013 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>61</p>
</td>
<td width="160">
<p><em>Coffea canephora</em></p>
</td>
<td width="135">
<p>Rubiaceae</p>
</td>
<td width="118">
<p>coc</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/coc.pep">coc.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/coc.bed">coc.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/345/6201/1181">2014 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>62</p>
</td>
<td width="160">
<p><em>Daucus carota</em></p>
</td>
<td width="135">
<p>Apiaceae</p>
</td>
<td width="118">
<p>dca</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/dca.pep">dca.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/dca.bed">dca.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v48/n6/full/ng.3565.html">2016 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>63</p>
</td>
<td width="160">
<p><em>Actinidia chinensis</em></p>
</td>
<td width="135">
<p>Actinidiaceae</p>
</td>
<td width="118">
<p>ach</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ach.pep">ach.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ach.bed">ach.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2013/131018/ncomms3640/full/ncomms3640.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>64</p>
</td>
<td width="160">
<p><em>Beta vulgaris</em></p>
</td>
<td width="135">
<p>Caryophyllales</p>
</td>
<td width="118">
<p>bvu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/bvu.pep">bvu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/bvu.bed">bvu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v505/n7484/full/nature12817.html">2014 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>65</p>
</td>
<td width="160">
<p><em>Spinacia oleracea</em></p>
</td>
<td width="135">
<p>Caryophyllales</p>
</td>
<td width="118">
<p>sol</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sol.pep">sol.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sol.bed">sol.bed</a></u></p>
</td>
<td width="173">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="60">
<p>66</p>
</td>
<td width="160">
<p><em>Amaranthus hypochondriacus</em></p>
</td>
<td width="135">
<p>Caryophyllales</p>
</td>
<td width="118">
<p>ahy</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ahy.pep">ahy.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ahy.bed">ahy.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="https://dl.sciencesocieties.org/publications/tpg/pdfs/0/0/plantgenome2015.07.0062">2016 The Plant Genome </a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>67</p>
</td>
<td width="160">
<p><em>Nelumbo nucifera</em></p>
</td>
<td width="135">
<p>Nelumbonaceae</p>
</td>
<td width="118">
<p>nnu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/nnu.pep">nnu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/nnu.bed">nnu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2013-14-5-r41">2013 GB</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>68</p>
</td>
<td width="160">
<p><em>Triticum urartu</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>tur</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/tur.pep">tur.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/tur.bed">tur.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v496/n7443/full/nature11997.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>69</p>
</td>
<td width="160">
<p><em>Triticum aestivum</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>tae</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/tae.pep">tae.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/tae.bed">tae.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/345/6194/1251788.long">2014 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>70</p>
</td>
<td width="160">
<p><em>Aegilops tauschii</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>ata</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ata.pep">ata.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ata.bed">ata.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v496/n7443/full/nature12028.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>71</p>
</td>
<td width="160">
<p><em>Hordeum vulgare</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>hvu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/hvu.pep">hvu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/hvu.bed">hvu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v491/n7426/full/nature11543.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>72</p>
</td>
<td width="160">
<p><em>Brachypodium distachyon</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>bdi</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/bdi.pep">bdi.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/bdi.bed">bdi.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v463/n7282/full/nature08747.html">2010 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>73</p>
</td>
<td width="160">
<p><em>Oryza glaberrima</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>ogl</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ogl.pep">ogl.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ogl.bed">ogl.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v46/n9/full/ng.3044.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>74</p>
</td>
<td width="160">
<p><em>Oryza sativa</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>osa</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/osa.pep">osa.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/osa.bed">osa.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/296/5565/92.long">2002 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>75</p>
</td>
<td width="160">
<p><em>Oryza rufipogon</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>oru</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/oru.pep">oru.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/oru.bed">oru.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v490/n7421/full/nature11532.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>76</p>
</td>
<td width="160">
<p><em>leersia perrieri</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>lpe</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/lpe.pep">lpe.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/lpe.bed">lpe.bed</a></u></p>
</td>
<td width="173">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="60">
<p>77</p>
</td>
<td width="160">
<p><em>Phyllostachys heterocycla</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>phe</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/phe.pep">phe.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/phe.bed">phe.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v45/n4/full/ng.2569.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>78</p>
</td>
<td width="160">
<p><em>Zea mays</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>zma</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/zma.pep">zma.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/zma.bed">zma.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/326/5956/1112.long">2009 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>79</p>
</td>
<td width="160">
<p><em>Sorghum bicolor</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>sbi</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sbi.pep">sbi.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sbi.bed">sbi.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v457/n7229/full/nature07723.html">2009 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>80</p>
</td>
<td width="160">
<p><em>Setaria italica</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>sit</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/sit.pep">sit.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/sit.bed">sit.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nbt/journal/v30/n6/full/nbt.2195.html">2011 NB</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>81</p>
</td>
<td width="160">
<p><em>Oropetium thomaeum</em></p>
</td>
<td width="135">
<p>Poaceae</p>
</td>
<td width="118">
<p>oth</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/oth.pep">oth.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/oth.bed">oth.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/vaop/ncurrent/full/nature15714.html">2016 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>82</p>
</td>
<td width="160">
<p><em>Ananas comosus</em></p>
</td>
<td width="135">
<p>Bromeliaceae</p>
</td>
<td width="118">
<p>aco</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/aco.pep">aco.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/aco.bed">aco.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v47/n12/full/ng.3435.html">2015 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>83</p>
</td>
<td width="160">
<p><em>Elaeis guineensis</em></p>
</td>
<td width="135">
<p>Arecaceae</p>
</td>
<td width="118">
<p>egu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/egu.pep">egu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/egu.bed">egu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v500/n7462/full/nature12309.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>84</p>
</td>
<td width="160">
<p><em>Phoenix dactylifera</em></p>
</td>
<td width="135">
<p>Arecaceae</p>
</td>
<td width="118">
<p>pda</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pda.pep">pda.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pda.bed">pda.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2013/130806/ncomms3274/full/ncomms3274.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>85</p>
</td>
<td width="160">
<p><em>Musa acuminata</em></p>
</td>
<td width="135">
<p>Musaceae</p>
</td>
<td width="118">
<p>mac</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/mac.pep">mac.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/mac.bed">mac.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v488/n7410/full/nature11241.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>86</p>
</td>
<td width="160">
<p><em>Phalaenopsis equestris</em></p>
</td>
<td width="135">
<p>Orchidaceae</p>
</td>
<td width="118">
<p>peq</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/peq.pep">peq.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/peq.bed">peq.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ng/journal/v47/n1/full/ng.3149.html">2015 NG</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>87</p>
</td>
<td width="160">
<p><em>Spirodela polyrhiza</em></p>
</td>
<td width="135">
<p>Araceae</p>
</td>
<td width="118">
<p>spo</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/spo.pep">spo.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/spo.bed">spo.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/ncomms/2014/140219/ncomms4311/full/ncomms4311.html">2014 NC</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>88</p>
</td>
<td width="160">
<p><em>Lemna minor</em></p>
</td>
<td width="135">
<p>Araceae</p>
</td>
<td width="118">
<p>lmi</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/lmi.pep">lmi.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/lmi.bed">lmi.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4659200/">2015 Biotechnology for Biofuels</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>89</p>
</td>
<td width="160">
<p><em>Zostera marina</em></p>
</td>
<td width="135">
<p>Zosteraceae</p>
</td>
<td width="118">
<p>zom</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/zom.pep">zom.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/zom.bed">zom.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v530/n7590/full/nature16548.html">2016 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>90</p>
</td>
<td width="160">
<p><em>Amborella trichopoda</em></p>
</td>
<td width="135">
<p>Amborellales</p>
</td>
<td width="118">
<p>atr</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/atr.pep">atr.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/atr.bed">atr.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/342/6165/1241089">2013 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>91</p>
</td>
<td width="160">
<p><em>Pinus taeda</em></p>
</td>
<td width="135">
<p>Pinaceae</p>
</td>
<td width="118">
<p>pta</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pta.pep">pta.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pta.bed">pta.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-3-r59">2014 GB</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>92</p>
</td>
<td width="160">
<p><em>Pinus lambertiana</em></p>
</td>
<td width="135">
<p>Pinaceae</p>
</td>
<td width="118">
<p>pla</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pla.pep">pla.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pla.bed">pla.bed</a></u></p>
</td>
<td width="173">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="60">
<p>93</p>
</td>
<td width="160">
<p><em>Pseudotsuga menziesii</em></p>
</td>
<td width="135">
<p>Pinaceae</p>
</td>
<td width="118">
<p>pme</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pme.pep">pme.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pme.bed">pme.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://pinegenome.org/pinerefseq/">&nbsp;</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>94</p>
</td>
<td width="160">
<p><em>Picea abies</em></p>
</td>
<td width="135">
<p>Pinaceae</p>
</td>
<td width="118">
<p>pab</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/pab.pep">pab.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/pab.bed">pab.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.nature.com/nature/journal/v497/n7451/full/nature12211.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>95</p>
</td>
<td width="160">
<p><em>Selaginella moellendorffii</em></p>
</td>
<td width="135">
<p>Selaginellaceae</p>
</td>
<td width="118">
<p>smo</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/smo.pep">smo.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/smo.bed">smo.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/332/6032/960.long">2011 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>96</p>
</td>
<td width="160">
<p><em>Physcomitrella patens</em></p>
</td>
<td width="135">
<p>Funariaceae</p>
</td>
<td width="118">
<p>ppa</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ppa.pep">ppa.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ppa.bed">ppa.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/319/5859/64.long">2008 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>97</p>
</td>
<td width="160">
<p><em>Ostreococcus lucimarinus</em></p>
</td>
<td width="135">
<p>Chlorophyta</p>
</td>
<td width="118">
<p>olu</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/olu.pep">olu.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/olu.bed">olu.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://www.pnas.org/cgi/pmidlookup?view=long&amp;pmid=17460045">2007 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>98</p>
</td>
<td width="160">
<p><em>Ostreococcus tauri</em></p>
</td>
<td width="135">
<p>Chlorophyta</p>
</td>
<td width="118">
<p>ota</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/ota.pep">ota.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/ota.bed">ota.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1544224/">2006 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>99</p>
</td>
<td width="160">
<p><em>Volvox carteri</em></p>
</td>
<td width="135">
<p>Chlorophyta</p>
</td>
<td width="118">
<p>vca</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/vca.pep">vca.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/vca.bed">vca.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/329/5988/223.long">2010 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>100</p>
</td>
<td width="160">
<p><em>Chlamydomonas reinhardtii</em></p>
</td>
<td width="135">
<p>Chlorophyta</p>
</td>
<td width="118">
<p>cre</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cre.pep">cre.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cre.bed">cre.bed</a></u></p>
</td>
<td width="173">
<p><u><a href="http://science.sciencemag.org/content/318/5848/245.long">2007 Science</a></u></p>
</td>
</tr>
<tr>
<td width="60">
<p>101</p>
</td>
<td width="160">
<p><em>Cyanidioschyzon merolae</em></p>
</td>
<td width="135">
<p>Rhodophyta</p>
</td>
<td width="118">
<p>cym</p>
</td>
<td width="80">
<p><u><a href="http://10.85.9.0/cym.pep">cym.pep</a></u></p>
</td>
<td width="87">
<p><u><a href="http://10.85.9.0/cym.bed">cym.bed</a></u></p>
</td>
<td width="173">
<p><u>2004</u></p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<ol start="2">
<li><strong>Pairwise whole-genome comparison</strong></li>
</ol>
<p>For example, for a comparison of five plant genomes you would need to perform P (5, 2) + 5 = 25x whole genome all-against-all comparisons, because for each pair of syntenic block reciprocal comparisons are needed and also intra-species comparisons are needed to identify paralogs or &ldquo;syntenic ohnologs pairs&rdquo;. For all 101 species in the above list, we need to perform P(101, 2)+101= 10, 201x whole genome comparisons.</p>
<p>Recommended tools: <a href="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/">BLAST</a>+, <a href="http://www.bx.psu.edu/miller_lab/dist/README.lastz-1.02.00/README.lastz-1.02.00a.html">LASTZ</a>, <a href="http://rapsearch2.sourceforge.net/">RAPSearch2</a>, et al.</p>
<p>&nbsp;</p>
<ol start="3">
<li><strong>Syntenic blocks detection and data integration</strong></li>
</ol>
<p>A number of existing computational programs or online tools have been developed to assess synteny for comparative genomic study of two or more genomes, e.g. MCScanX, DAGchainer, i-ADHoRe, DRIMM, SynFind, and PGDD among many others.</p>
<p>Here we use <a href="http://chibba.pgml.uga.edu/mcscan2/">MCScanX</a>, please refer to the software manual for detail information.</p>
<p>In this pipeline, for each comparison, MCScanX output file named &ldquo;*.collinearity&rdquo; containing computational syntenic blocks are merged and saved in the final synteny network database.</p>
<p>Tips:</p>
<ol>
<li>A script is provided to do Step 2 and Step 3 automatically. RAPSearch2 was used for whole genome comparisons, and MCScanX for synteny detection. You need to install this two programs beforehand and customize the corresponding path.</li>
<li>Pre-calculated synteny network database for the above 101 plants can be <a href="http://10.85.9.0/101TotalPlant4cols">downloaded</a> here (~ 1.6 GB). The file contains four columns: &ldquo;Synteny_Block_ID&rdquo;, &ldquo;Gene1&rdquo;, &ldquo;Gene2&rdquo;, and &ldquo;Block_Score&rdquo;. Among them, &ldquo;Gene1&rdquo; and &ldquo;Gene2&rdquo; are syntenic gene pairs across all species, which are the data source for the edge table for networks.</li>
</ol>
<p>&nbsp;</p>
<ol start="4">
<li><strong>Network manipulation</strong></li>
</ol>
<p>The pre-calculated synteny network contains ~ 1.8 million nodes and ~ 3.1 million edges, which contains syntenic information of all genes and gene families.</p>
<p>For specific gene family studies, we need to extract sub-networks from the database. To do this, we need to characterize all gene family members from the genomes first and then query this gene candidates list against the database.</p>
<p>We use <a href="http://hmmer.org/">HMMER</a> for gene family identification. Profile HMMs for specific gene family can be obtained from Pfam, i.e., a plant MADS-box gene is characterized by a core DNA binding domain (<a href="http://pfam.xfam.org/family/PF00319#tabview=tab4">PF00319</a>). You can use <a href="http://pfam.xfam.org/search#tabview=tab0">Pfam Search</a> or NCBI online <a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&amp;PAGE_TYPE=BlastSearch&amp;LINK_LOC=blasthome">BLAST</a> to help you decide the featured domain of your protein sequence.</p>
<p>Tips:</p>
<ol>
<li>A script is attached</li>
</ol>
<p><strong>&nbsp;</strong></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>&nbsp;</strong></p>
<p><strong>&nbsp;</strong></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
