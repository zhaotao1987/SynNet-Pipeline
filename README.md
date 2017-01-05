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
<table width="895">
<tbody>
<tr>
<td width="67">
<p>Index</p>
</td>
<td width="203">
<p>Species</p>
</td>
<td width="147">
<p>Lineage</p>
</td>
<td width="115">
<p>Abbreviation</p>
</td>
<td width="86">
<p>Peptides</p>
</td>
<td width="94">
<p>BED/GFF</p>
</td>
<td width="183">
<p>Reference</p>
</td>
</tr>
<tr>
<td width="67">
<p>1</p>
</td>
<td width="203">
<p><em>Vigna radiata</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>vra</p>
</td>
<td width="86">
<p><u>vra.pep</u></p>
</td>
<td width="94">
<p><u>vra.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2014/141111/ncomms6443/full/ncomms6443.html">2014 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>2</p>
</td>
<td width="203">
<p><em>Vigna angularis</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>van</p>
</td>
<td width="86">
<p><u>van.pep</u></p>
</td>
<td width="94">
<p><u>van.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.pnas.org/content/112/43/13213">2015 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>3</p>
</td>
<td width="203">
<p><em>Phaseolus vulgaris</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>pvu</p>
</td>
<td width="86">
<p><u>pvu.pep</u></p>
</td>
<td width="94">
<p><u>pvu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v46/n7/full/ng.3008.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>4</p>
</td>
<td width="203">
<p><em>Glycine max</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>gma</p>
</td>
<td width="86">
<p><u>gma.pep</u></p>
</td>
<td width="94">
<p><u>gma.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v463/n7278/full/nature08670.html">2010 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>5</p>
</td>
<td width="203">
<p><em>Cajanus cajan</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>cca</p>
</td>
<td width="86">
<p><u>cca.pep</u></p>
</td>
<td width="94">
<p><u>cca.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nbt/journal/v30/n1/full/nbt.2022.html">2012 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>6</p>
</td>
<td width="203">
<p><em>Trifolium pratense</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>tpr</p>
</td>
<td width="86">
<p><u>tpr.pep</u></p>
</td>
<td width="94">
<p><u>tpr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/articles/srep17394">2015 SR</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>7</p>
</td>
<td width="203">
<p><em>Medicago truncatula</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>mtr</p>
</td>
<td width="86">
<p><u>mtr.pep</u></p>
</td>
<td width="94">
<p><u>mtr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v480/n7378/full/nature10625.html">2011 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>8</p>
</td>
<td width="203">
<p><em>Arachis duranensis</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>adu</p>
</td>
<td width="86">
<p><u>adu.pep</u></p>
</td>
<td width="94">
<p><u>adu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v48/n4/full/ng.3517.html">2016 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>9</p>
</td>
<td width="203">
<p><em>Lotus japonicus</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>lja</p>
</td>
<td width="86">
<p><u>lja.pep</u></p>
</td>
<td width="94">
<p><u>lja.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://dnaresearch.oxfordjournals.org/content/8/6/311.long">2001 DR</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>10</p>
</td>
<td width="203">
<p><em>Cicer arietinum</em></p>
</td>
<td width="147">
<p>Fabaceae</p>
</td>
<td width="115">
<p>car</p>
</td>
<td width="86">
<p><u>car.pep</u></p>
</td>
<td width="94">
<p><u>car.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nbt/journal/v31/n3/full/nbt.2491.html">2013 NB</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>11</p>
</td>
<td width="203">
<p><em>Prunus mume</em></p>
</td>
<td width="147">
<p>Rosaceae</p>
</td>
<td width="115">
<p>pmu</p>
</td>
<td width="86">
<p><u>pmu.pep</u></p>
</td>
<td width="94">
<p><u>pmu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/journal/v3/n12/full/ncomms2290.html">2012 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>12</p>
</td>
<td width="203">
<p><em>Prunus persica</em></p>
</td>
<td width="147">
<p>Rosaceae</p>
</td>
<td width="115">
<p>ppe</p>
</td>
<td width="86">
<p><u>ppe.pep</u></p>
</td>
<td width="94">
<p><u>ppe.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n5/full/ng.2586.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>13</p>
</td>
<td width="203">
<p><em>Pyrus x bretschneideri</em></p>
</td>
<td width="147">
<p>Rosaceae</p>
</td>
<td width="115">
<p>pbr</p>
</td>
<td width="86">
<p><u>pbr.pep</u></p>
</td>
<td width="94">
<p><u>pbr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3561880/">2013 GR</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>14</p>
</td>
<td width="203">
<p><em>Malus domestica</em></p>
</td>
<td width="147">
<p>Rosaceae</p>
</td>
<td width="115">
<p>mdo</p>
</td>
<td width="86">
<p><u>mdo.pep</u></p>
</td>
<td width="94">
<p><u>mdo.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v42/n10/full/ng.654.html">2010 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>15</p>
</td>
<td width="203">
<p><em>Rubus occidentalis</em></p>
</td>
<td width="147">
<p>Rosaceae</p>
</td>
<td width="115">
<p>roc</p>
</td>
<td width="86">
<p><u>roc.pep</u></p>
</td>
<td width="94">
<p><u>roc.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/tpj.13215/abstract;jsessionid=79FAD29315B4551E413C87F848630DB3.f01t02">2016 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>16</p>
</td>
<td width="203">
<p><em>Fragaria vesca</em></p>
</td>
<td width="147">
<p>Rosaceae</p>
</td>
<td width="115">
<p>fve</p>
</td>
<td width="86">
<p><u>fve.pep</u></p>
</td>
<td width="94">
<p><u>fve.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v43/n2/full/ng.740.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>17</p>
</td>
<td width="203">
<p><em>Humulus lupulus</em></p>
</td>
<td width="147">
<p>Cannabaceae</p>
</td>
<td width="115">
<p>hlu</p>
</td>
<td width="86">
<p><u>hlu.pep</u></p>
</td>
<td width="94">
<p><u>hlu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://pcp.oxfordjournals.org/content/56/3/428.long">2015 PCP</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>18</p>
</td>
<td width="203">
<p><em>Jatropha curcas</em></p>
</td>
<td width="147">
<p>Euphorbiaceae</p>
</td>
<td width="115">
<p>jcu</p>
</td>
<td width="86">
<p><u>jcu.pep</u></p>
</td>
<td width="94">
<p><u>jcu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/tpj.12761/abstract">2015 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>19</p>
</td>
<td width="203">
<p><em>Manihot esculenta</em></p>
</td>
<td width="147">
<p>Euphorbiaceae</p>
</td>
<td width="115">
<p>mes</p>
</td>
<td width="86">
<p><u>mes.pep</u></p>
</td>
<td width="94">
<p><u>mes.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2014/141010/ncomms6110/full/ncomms6110.html">2014 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>20</p>
</td>
<td width="203">
<p><em>Ricinus communis</em></p>
</td>
<td width="147">
<p>Euphorbiaceae</p>
</td>
<td width="115">
<p>rco</p>
</td>
<td width="86">
<p><u>rco.pep</u></p>
</td>
<td width="94">
<p><u>rco.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nbt/journal/v28/n9/full/nbt.1674.html">2010 NB</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>21</p>
</td>
<td width="203">
<p><em>Linum usitatissimum</em></p>
</td>
<td width="147">
<p>Linaceae</p>
</td>
<td width="115">
<p>lus</p>
</td>
<td width="86">
<p><u>lus.pep</u></p>
</td>
<td width="94">
<p><u>lus.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/j.1365-313X.2012.05093.x/abstract;jsessionid=854E05CCF4FDC10CDE545CD5B53D1DCE.f03t02">2012 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>22</p>
</td>
<td width="203">
<p><em>Populus trichocarpa</em></p>
</td>
<td width="147">
<p>Salicaceae</p>
</td>
<td width="115">
<p>ptr</p>
</td>
<td width="86">
<p><u>ptr.pep</u></p>
</td>
<td width="94">
<p><u>ptr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/313/5793/1596.long">2006 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>23</p>
</td>
<td width="203">
<p><em>Cucumis sativus</em></p>
</td>
<td width="147">
<p>Cucurbitaceae</p>
</td>
<td width="115">
<p>csa</p>
</td>
<td width="86">
<p><u>csa.pep</u></p>
</td>
<td width="94">
<p><u>csa.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v41/n12/abs/ng.475.html">2009 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>24</p>
</td>
<td width="203">
<p><em>Cucumis melo</em></p>
</td>
<td width="147">
<p>Cucurbitaceae</p>
</td>
<td width="115">
<p>cme</p>
</td>
<td width="86">
<p><u>cme.pep</u></p>
</td>
<td width="94">
<p><u>cme.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.pnas.org/content/109/29/11872">2012 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>25</p>
</td>
<td width="203">
<p><em>Citrullus lanatus</em></p>
</td>
<td width="147">
<p>Cucurbitaceae</p>
</td>
<td width="115">
<p>cla</p>
</td>
<td width="86">
<p><u>cla.pep</u></p>
</td>
<td width="94">
<p><u>cla.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n1/full/ng.2470.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>26</p>
</td>
<td width="203">
<p><em>Castanea mollissima</em></p>
</td>
<td width="147">
<p>Fagaceae</p>
</td>
<td width="115">
<p>cmo</p>
</td>
<td width="86">
<p><u>cmo.pep</u></p>
</td>
<td width="94">
<p><u>cmo.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://link.springer.com/article/10.1007%2Fs11295-012-0576-6">2012 TGG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>27</p>
</td>
<td width="203">
<p><em>Juglans regia</em></p>
</td>
<td width="147">
<p>Juglandaceae</p>
</td>
<td width="115">
<p>jre</p>
</td>
<td width="86">
<p><u>jre.pep</u></p>
</td>
<td width="94">
<p><u>jre.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://onlinelibrary.wiley.com/doi/10.1111/tpj.13207/abstract">2016 PJ</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>28</p>
</td>
<td width="203">
<p><em>Brassica oleracea</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>bol</p>
</td>
<td width="86">
<p><u>bol.pep</u></p>
</td>
<td width="94">
<p><u>bol.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2014/140523/ncomms4930/full/ncomms4930.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>29</p>
</td>
<td width="203">
<p><em>Brassica rapa</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>bra</p>
</td>
<td width="86">
<p><u>bra.pep</u></p>
</td>
<td width="94">
<p><u>bra.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v43/n10/full/ng.919.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>30</p>
</td>
<td width="203">
<p><em>Brassica napus</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>bnp</p>
</td>
<td width="86">
<p><u>bnp.pep</u></p>
</td>
<td width="94">
<p><u>bnp.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/345/6199/950">2014 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>31</p>
</td>
<td width="203">
<p><em>Raphanus raphanistrum</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>rra</p>
</td>
<td width="86">
<p><u>rra.pep</u></p>
</td>
<td width="94">
<p><u>rra.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.plantcell.org/content/26/5/1925.long">2014 PC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>32</p>
</td>
<td width="203">
<p><em>Capsella grandiflora</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>cgr</p>
</td>
<td width="86">
<p><u>cgr.pep</u></p>
</td>
<td width="94">
<p><u>cgr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n7/full/ng.2669.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>33</p>
</td>
<td width="203">
<p><em>Capsella rubella</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>cru</p>
</td>
<td width="86">
<p><u>cru.pep</u></p>
</td>
<td width="94">
<p><u>cru.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n7/full/ng.2669.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>34</p>
</td>
<td width="203">
<p><em>Arabidopsis lyrata</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>aly</p>
</td>
<td width="86">
<p><u>aly.pep</u></p>
</td>
<td width="94">
<p><u>aly.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v43/n5/full/ng.807.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>35</p>
</td>
<td width="203">
<p><em>Arabidopsis thaliana</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>ath</p>
</td>
<td width="86">
<p><u>ath.pep</u></p>
</td>
<td width="94">
<p><u>ath.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v408/n6814/full/408796a0.html">2000 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>36</p>
</td>
<td width="203">
<p><em>Thellungiella halophila</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>thh</p>
</td>
<td width="86">
<p><u>thh.pep</u></p>
</td>
<td width="94">
<p><u>thh.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v43/n9/full/ng.889.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>37</p>
</td>
<td width="203">
<p><em>Thellungiella salsuginea</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>tsa</p>
</td>
<td width="86">
<p><u>tsa.pep</u></p>
</td>
<td width="94">
<p><u>tsa.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.pnas.org/content/109/30/12219.long">2012 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>38</p>
</td>
<td width="203">
<p><em>Leavenworthia alabamica</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>lal</p>
</td>
<td width="86">
<p><u>lal.pep</u></p>
</td>
<td width="94">
<p><u>lal.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n8/full/ng.2684.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>39</p>
</td>
<td width="203">
<p><em>Aethionema arabicum</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>aar</p>
</td>
<td width="86">
<p><u>aar.pep</u></p>
</td>
<td width="94">
<p><u>aar.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n8/full/ng.2684.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>40</p>
</td>
<td width="203">
<p><em>Schrenkiella parvula</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>spa</p>
</td>
<td width="86">
<p><u>spa.pep</u></p>
</td>
<td width="94">
<p><u>spa.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pubmed/24563282">2014 PP</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>41</p>
</td>
<td width="203">
<p><em>Sisymbrium irio</em></p>
</td>
<td width="147">
<p>Brassicaceae</p>
</td>
<td width="115">
<p>sir</p>
</td>
<td width="86">
<p><u>sir.pep</u></p>
</td>
<td width="94">
<p><u>sir.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n8/full/ng.2684.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>42</p>
</td>
<td width="203">
<p><em>Cleome gynandra</em></p>
</td>
<td width="147">
<p>Cleomaceae</p>
</td>
<td width="115">
<p>cgy</p>
</td>
<td width="86">
<p><u>cgy.pep</u></p>
</td>
<td width="94">
<p><u>cgy.bed</u></p>
</td>
<td width="183">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="67">
<p>43</p>
</td>
<td width="203">
<p><em>Tarenaya hassleriana</em></p>
</td>
<td width="147">
<p>Cleomaceae</p>
</td>
<td width="115">
<p>tha</p>
</td>
<td width="86">
<p><u>tha.pep</u></p>
</td>
<td width="94">
<p><u>tha.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.plantcell.org/cgi/pmidlookup?view=long&amp;pmid=23983221">2013 PC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>44</p>
</td>
<td width="203">
<p><em>Carica papaya</em></p>
</td>
<td width="147">
<p>Caricaceae</p>
</td>
<td width="115">
<p>cpa</p>
</td>
<td width="86">
<p><u>cpa.pep</u></p>
</td>
<td width="94">
<p><u>cpa.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v452/n7190/full/nature06856.html">2008 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>45</p>
</td>
<td width="203">
<p><em>Gossypium raimondii</em></p>
</td>
<td width="147">
<p>Malvaceae</p>
</td>
<td width="115">
<p>gra</p>
</td>
<td width="86">
<p><u>gra.pep</u></p>
</td>
<td width="94">
<p><u>gra.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v44/n10/full/ng.2371.html">2012 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>46</p>
</td>
<td width="203">
<p><em>Theobroma cacao</em></p>
</td>
<td width="147">
<p>Malvaceae</p>
</td>
<td width="115">
<p>tca</p>
</td>
<td width="86">
<p><u>tca.pep</u></p>
</td>
<td width="94">
<p><u>tca.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v43/n2/full/ng.736.html">2011 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>47</p>
</td>
<td width="203">
<p><em>Eucalyptus grandis</em></p>
</td>
<td width="147">
<p>Myrtaceae</p>
</td>
<td width="115">
<p>egr</p>
</td>
<td width="86">
<p><u>egr.pep</u></p>
</td>
<td width="94">
<p><u>egr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v510/n7505/full/nature13308.html">2014 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>48</p>
</td>
<td width="203">
<p><em>Citrus sinensis</em></p>
</td>
<td width="147">
<p>Rutaceae</p>
</td>
<td width="115">
<p>csi</p>
</td>
<td width="86">
<p><u>csi.pep</u></p>
</td>
<td width="94">
<p><u>csi.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n1/full/ng.2472.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>49</p>
</td>
<td width="203">
<p><em>Vitis vinifera</em></p>
</td>
<td width="147">
<p>Vitaceae</p>
</td>
<td width="115">
<p>vvi</p>
</td>
<td width="86">
<p><u>vvi.pep</u></p>
</td>
<td width="94">
<p><u>vvi.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v449/n7161/full/nature06148.html">2007 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>50</p>
</td>
<td width="203">
<p><em>Solanum pennellii</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>spe</p>
</td>
<td width="86">
<p><u>spe.pep</u></p>
</td>
<td width="94">
<p><u>spe.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v46/n9/full/ng.3046.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>51</p>
</td>
<td width="203">
<p><em>Solanum lycopersicum</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>sly</p>
</td>
<td width="86">
<p><u>sly.pep</u></p>
</td>
<td width="94">
<p><u>sly.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v485/n7400/full/nature11119.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>52</p>
</td>
<td width="203">
<p><em>Solanum tuberosum</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>stu</p>
</td>
<td width="86">
<p><u>stu.pep</u></p>
</td>
<td width="94">
<p><u>stu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v475/n7355/full/nature10158.html">2011 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>53</p>
</td>
<td width="203">
<p><em>Solanum melongena</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>sme</p>
</td>
<td width="86">
<p><u>sme.pep</u></p>
</td>
<td width="94">
<p><u>sme.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://dnaresearch.oxfordjournals.org/content/early/2014/09/16/dnares.dsu027.long">2014 DR</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>54</p>
</td>
<td width="203">
<p><em>Capsicum annuum</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>can</p>
</td>
<td width="86">
<p><u>can.pep</u></p>
</td>
<td width="94">
<p><u>can.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v46/n3/full/ng.2877.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>55</p>
</td>
<td width="203">
<p><em>Nicotiana benthamiana</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>nbe</p>
</td>
<td width="86">
<p><u>nbe.pep</u></p>
</td>
<td width="94">
<p><u>nbe.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pubmed/22876960">2012 Mol Plant Microbe Interact</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>56</p>
</td>
<td width="203">
<p><em>Nicotiana tabacum</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>nta</p>
</td>
<td width="86">
<p><u>nta.pep</u></p>
</td>
<td width="94">
<p><u>nta.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2014/140508/ncomms4833/full/ncomms4833.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>57</p>
</td>
<td width="203">
<p><em>Petunia axillaris</em></p>
</td>
<td width="147">
<p>Solanaceae</p>
</td>
<td width="115">
<p>pax</p>
</td>
<td width="86">
<p><u>pax.pep</u></p>
</td>
<td width="94">
<p><u>pax.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/articles/nplants201674">2016 NP</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>58</p>
</td>
<td width="203">
<p><em>Utricularia gibba</em></p>
</td>
<td width="147">
<p>Lentibulariaceae</p>
</td>
<td width="115">
<p>ugi</p>
</td>
<td width="86">
<p><u>ugi.pep</u></p>
</td>
<td width="94">
<p><u>ugi.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v498/n7452/full/nature12132.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>59</p>
</td>
<td width="203">
<p><em>Sesamum indicum</em></p>
</td>
<td width="147">
<p>Pedaliaceae</p>
</td>
<td width="115">
<p>sin</p>
</td>
<td width="86">
<p><u>sin.pep</u></p>
</td>
<td width="94">
<p><u>sin.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3663098/?report=reader">2013/2014 GB</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>60</p>
</td>
<td width="203">
<p><em>Mimulus guttatus</em></p>
</td>
<td width="147">
<p>Phrymaceae</p>
</td>
<td width="115">
<p>mgu</p>
</td>
<td width="86">
<p><u>mgu.pep</u></p>
</td>
<td width="94">
<p><u>mgu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.pnas.org/content/110/48/19478.long">2013 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>61</p>
</td>
<td width="203">
<p><em>Coffea canephora</em></p>
</td>
<td width="147">
<p>Rubiaceae</p>
</td>
<td width="115">
<p>coc</p>
</td>
<td width="86">
<p><u>coc.pep</u></p>
</td>
<td width="94">
<p><u>coc.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/345/6201/1181">2014 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>62</p>
</td>
<td width="203">
<p><em>Daucus carota</em></p>
</td>
<td width="147">
<p>Apiaceae</p>
</td>
<td width="115">
<p>dca</p>
</td>
<td width="86">
<p><u>dca.pep</u></p>
</td>
<td width="94">
<p><u>dca.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v48/n6/full/ng.3565.html">2016 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>63</p>
</td>
<td width="203">
<p><em>Actinidia chinensis</em></p>
</td>
<td width="147">
<p>Actinidiaceae</p>
</td>
<td width="115">
<p>ach</p>
</td>
<td width="86">
<p><u>ach.pep</u></p>
</td>
<td width="94">
<p><u>ach.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2013/131018/ncomms3640/full/ncomms3640.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>64</p>
</td>
<td width="203">
<p><em>Beta vulgaris</em></p>
</td>
<td width="147">
<p>Caryophyllales</p>
</td>
<td width="115">
<p>bvu</p>
</td>
<td width="86">
<p><u>bvu.pep</u></p>
</td>
<td width="94">
<p><u>bvu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v505/n7484/full/nature12817.html">2014 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>65</p>
</td>
<td width="203">
<p><em>Spinacia oleracea</em></p>
</td>
<td width="147">
<p>Caryophyllales</p>
</td>
<td width="115">
<p>sol</p>
</td>
<td width="86">
<p><u>sol.pep</u></p>
</td>
<td width="94">
<p><u>sol.bed</u></p>
</td>
<td width="183">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="67">
<p>66</p>
</td>
<td width="203">
<p><em>Amaranthus hypochondriacus</em></p>
</td>
<td width="147">
<p>Caryophyllales</p>
</td>
<td width="115">
<p>ahy</p>
</td>
<td width="86">
<p><u>ahy.pep</u></p>
</td>
<td width="94">
<p><u>ahy.bed</u></p>
</td>
<td width="183">
<p><u><a href="https://dl.sciencesocieties.org/publications/tpg/pdfs/0/0/plantgenome2015.07.0062">2016 The Plant Genome </a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>67</p>
</td>
<td width="203">
<p><em>Nelumbo nucifera</em></p>
</td>
<td width="147">
<p>Nelumbonaceae</p>
</td>
<td width="115">
<p>nnu</p>
</td>
<td width="86">
<p><u>nnu.pep</u></p>
</td>
<td width="94">
<p><u>nnu.bed</u></p>
</td>
<td width="183">
<p><u><a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2013-14-5-r41">2013 GB</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>68</p>
</td>
<td width="203">
<p><em>Triticum urartu</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>tur</p>
</td>
<td width="86">
<p><u>tur.pep</u></p>
</td>
<td width="94">
<p><u>tur.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v496/n7443/full/nature11997.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>69</p>
</td>
<td width="203">
<p><em>Triticum aestivum</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>tae</p>
</td>
<td width="86">
<p><u>tae.pep</u></p>
</td>
<td width="94">
<p><u>tae.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/345/6194/1251788.long">2014 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>70</p>
</td>
<td width="203">
<p><em>Aegilops tauschii</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>ata</p>
</td>
<td width="86">
<p><u>ata.pep</u></p>
</td>
<td width="94">
<p><u>ata.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v496/n7443/full/nature12028.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>71</p>
</td>
<td width="203">
<p><em>Hordeum vulgare</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>hvu</p>
</td>
<td width="86">
<p><u>hvu.pep</u></p>
</td>
<td width="94">
<p><u>hvu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v491/n7426/full/nature11543.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>72</p>
</td>
<td width="203">
<p><em>Brachypodium distachyon</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>bdi</p>
</td>
<td width="86">
<p><u>bdi.pep</u></p>
</td>
<td width="94">
<p><u>bdi.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v463/n7282/full/nature08747.html">2010 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>73</p>
</td>
<td width="203">
<p><em>Oryza glaberrima</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>ogl</p>
</td>
<td width="86">
<p><u>ogl.pep</u></p>
</td>
<td width="94">
<p><u>ogl.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v46/n9/full/ng.3044.html">2014 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>74</p>
</td>
<td width="203">
<p><em>Oryza sativa</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>osa</p>
</td>
<td width="86">
<p><u>osa.pep</u></p>
</td>
<td width="94">
<p><u>osa.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/296/5565/92.long">2002 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>75</p>
</td>
<td width="203">
<p><em>Oryza rufipogon</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>oru</p>
</td>
<td width="86">
<p><u>oru.pep</u></p>
</td>
<td width="94">
<p><u>oru.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v490/n7421/full/nature11532.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>76</p>
</td>
<td width="203">
<p><em>leersia perrieri</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>lpe</p>
</td>
<td width="86">
<p><u>lpe.pep</u></p>
</td>
<td width="94">
<p><u>lpe.bed</u></p>
</td>
<td width="183">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="67">
<p>77</p>
</td>
<td width="203">
<p><em>Phyllostachys heterocycla</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>phe</p>
</td>
<td width="86">
<p><u>phe.pep</u></p>
</td>
<td width="94">
<p><u>phe.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v45/n4/full/ng.2569.html">2013 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>78</p>
</td>
<td width="203">
<p><em>Zea mays</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>zma</p>
</td>
<td width="86">
<p><u>zma.pep</u></p>
</td>
<td width="94">
<p><u>zma.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/326/5956/1112.long">2009 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>79</p>
</td>
<td width="203">
<p><em>Sorghum bicolor</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>sbi</p>
</td>
<td width="86">
<p><u>sbi.pep</u></p>
</td>
<td width="94">
<p><u>sbi.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v457/n7229/full/nature07723.html">2009 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>80</p>
</td>
<td width="203">
<p><em>Setaria italica</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>sit</p>
</td>
<td width="86">
<p><u>sit.pep</u></p>
</td>
<td width="94">
<p><u>sit.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nbt/journal/v30/n6/full/nbt.2195.html">2011 NB</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>81</p>
</td>
<td width="203">
<p><em>Oropetium thomaeum</em></p>
</td>
<td width="147">
<p>Poaceae</p>
</td>
<td width="115">
<p>oth</p>
</td>
<td width="86">
<p><u>oth.pep</u></p>
</td>
<td width="94">
<p><u>oth.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/vaop/ncurrent/full/nature15714.html">2016 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>82</p>
</td>
<td width="203">
<p><em>Ananas comosus</em></p>
</td>
<td width="147">
<p>Bromeliaceae</p>
</td>
<td width="115">
<p>aco</p>
</td>
<td width="86">
<p><u>aco.pep</u></p>
</td>
<td width="94">
<p><u>aco.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v47/n12/full/ng.3435.html">2015 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>83</p>
</td>
<td width="203">
<p><em>Elaeis guineensis</em></p>
</td>
<td width="147">
<p>Arecaceae</p>
</td>
<td width="115">
<p>egu</p>
</td>
<td width="86">
<p><u>egu.pep</u></p>
</td>
<td width="94">
<p><u>egu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v500/n7462/full/nature12309.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>84</p>
</td>
<td width="203">
<p><em>Phoenix dactylifera</em></p>
</td>
<td width="147">
<p>Arecaceae</p>
</td>
<td width="115">
<p>pda</p>
</td>
<td width="86">
<p><u>pda.pep</u></p>
</td>
<td width="94">
<p><u>pda.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2013/130806/ncomms3274/full/ncomms3274.html">2013 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>85</p>
</td>
<td width="203">
<p><em>Musa acuminata</em></p>
</td>
<td width="147">
<p>Musaceae</p>
</td>
<td width="115">
<p>mac</p>
</td>
<td width="86">
<p><u>mac.pep</u></p>
</td>
<td width="94">
<p><u>mac.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v488/n7410/full/nature11241.html">2012 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>86</p>
</td>
<td width="203">
<p><em>Phalaenopsis equestris</em></p>
</td>
<td width="147">
<p>Orchidaceae</p>
</td>
<td width="115">
<p>peq</p>
</td>
<td width="86">
<p><u>peq.pep</u></p>
</td>
<td width="94">
<p><u>peq.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ng/journal/v47/n1/full/ng.3149.html">2015 NG</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>87</p>
</td>
<td width="203">
<p><em>Spirodela polyrhiza</em></p>
</td>
<td width="147">
<p>Araceae</p>
</td>
<td width="115">
<p>spo</p>
</td>
<td width="86">
<p><u>spo.pep</u></p>
</td>
<td width="94">
<p><u>spo.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/ncomms/2014/140219/ncomms4311/full/ncomms4311.html">2014 NC</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>88</p>
</td>
<td width="203">
<p><em>Lemna minor</em></p>
</td>
<td width="147">
<p>Araceae</p>
</td>
<td width="115">
<p>lmi</p>
</td>
<td width="86">
<p><u>lmi.pep</u></p>
</td>
<td width="94">
<p><u>lmi.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4659200/">2015 Biotechnology for Biofuels</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>89</p>
</td>
<td width="203">
<p><em>Zostera marina</em></p>
</td>
<td width="147">
<p>Zosteraceae</p>
</td>
<td width="115">
<p>zom</p>
</td>
<td width="86">
<p><u>zom.pep</u></p>
</td>
<td width="94">
<p><u>zom.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v530/n7590/full/nature16548.html">2016 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>90</p>
</td>
<td width="203">
<p><em>Amborella trichopoda</em></p>
</td>
<td width="147">
<p>Amborellales</p>
</td>
<td width="115">
<p>atr</p>
</td>
<td width="86">
<p><u>atr.pep</u></p>
</td>
<td width="94">
<p><u>atr.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/342/6165/1241089">2013 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>91</p>
</td>
<td width="203">
<p><em>Pinus taeda</em></p>
</td>
<td width="147">
<p>Pinaceae</p>
</td>
<td width="115">
<p>pta</p>
</td>
<td width="86">
<p><u>pta.pep</u></p>
</td>
<td width="94">
<p><u>pta.bed</u></p>
</td>
<td width="183">
<p><u><a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-3-r59">2014 GB</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>92</p>
</td>
<td width="203">
<p><em>Pinus lambertiana</em></p>
</td>
<td width="147">
<p>Pinaceae</p>
</td>
<td width="115">
<p>pla</p>
</td>
<td width="86">
<p><u>pla.pep</u></p>
</td>
<td width="94">
<p><u>pla.bed</u></p>
</td>
<td width="183">
<p><u>&nbsp;</u></p>
</td>
</tr>
<tr>
<td width="67">
<p>93</p>
</td>
<td width="203">
<p><em>Pseudotsuga menziesii</em></p>
</td>
<td width="147">
<p>Pinaceae</p>
</td>
<td width="115">
<p>pme</p>
</td>
<td width="86">
<p><u>pme.pep</u></p>
</td>
<td width="94">
<p><u>pme.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://pinegenome.org/pinerefseq/">&nbsp;</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>94</p>
</td>
<td width="203">
<p><em>Picea abies</em></p>
</td>
<td width="147">
<p>Pinaceae</p>
</td>
<td width="115">
<p>pab</p>
</td>
<td width="86">
<p><u>pab.pep</u></p>
</td>
<td width="94">
<p><u>pab.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.nature.com/nature/journal/v497/n7451/full/nature12211.html">2013 Nature</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>95</p>
</td>
<td width="203">
<p><em>Selaginella moellendorffii</em></p>
</td>
<td width="147">
<p>Selaginellaceae</p>
</td>
<td width="115">
<p>smo</p>
</td>
<td width="86">
<p><u>smo.pep</u></p>
</td>
<td width="94">
<p><u>smo.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/332/6032/960.long">2011 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>96</p>
</td>
<td width="203">
<p><em>Physcomitrella patens</em></p>
</td>
<td width="147">
<p>Funariaceae</p>
</td>
<td width="115">
<p>ppa</p>
</td>
<td width="86">
<p><u>ppa.pep</u></p>
</td>
<td width="94">
<p><u>ppa.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/319/5859/64.long">2008 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>97</p>
</td>
<td width="203">
<p><em>Ostreococcus lucimarinus</em></p>
</td>
<td width="147">
<p>Chlorophyta</p>
</td>
<td width="115">
<p>olu</p>
</td>
<td width="86">
<p><u>olu.pep</u></p>
</td>
<td width="94">
<p><u>olu.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://www.pnas.org/cgi/pmidlookup?view=long&amp;pmid=17460045">2007 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>98</p>
</td>
<td width="203">
<p><em>Ostreococcus tauri</em></p>
</td>
<td width="147">
<p>Chlorophyta</p>
</td>
<td width="115">
<p>ota</p>
</td>
<td width="86">
<p><u>ota.pep</u></p>
</td>
<td width="94">
<p><u>ota.bed</u></p>
</td>
<td width="183">
<p><u><a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1544224/">2006 PNAS</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>99</p>
</td>
<td width="203">
<p><em>Volvox carteri</em></p>
</td>
<td width="147">
<p>Chlorophyta</p>
</td>
<td width="115">
<p>vca</p>
</td>
<td width="86">
<p><u>vca.pep</u></p>
</td>
<td width="94">
<p><u>vca.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/329/5988/223.long">2010 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>100</p>
</td>
<td width="203">
<p><em>Chlamydomonas reinhardtii</em></p>
</td>
<td width="147">
<p>Chlorophyta</p>
</td>
<td width="115">
<p>cre</p>
</td>
<td width="86">
<p><u>cre.pep</u></p>
</td>
<td width="94">
<p><u>cre.bed</u></p>
</td>
<td width="183">
<p><u><a href="http://science.sciencemag.org/content/318/5848/245.long">2007 Science</a></u></p>
</td>
</tr>
<tr>
<td width="67">
<p>101</p>
</td>
<td width="203">
<p><em>Cyanidioschyzon merolae</em></p>
</td>
<td width="147">
<p>Rhodophyta</p>
</td>
<td width="115">
<p>cym</p>
</td>
<td width="86">
<p><u>cym.pep</u></p>
</td>
<td width="94">
<p><u>cym.bed</u></p>
</td>
<td width="183">
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
<li>Pre-calculated synteny network database for the above 101 plants can be <a href="10.85.9.0/101TotalPlant4cols">downloaded</a> here (~ 1.6 GB). The file contains four columns: &ldquo;Synteny_Block_ID&rdquo;, &ldquo;Gene1&rdquo;, &ldquo;Gene2&rdquo;, and &ldquo;Block_Score&rdquo;. Among them, &ldquo;Gene1&rdquo; and &ldquo;Gene2&rdquo; are syntenic gene pairs across all species, which are the data source for the edge table for networks.</li>
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
