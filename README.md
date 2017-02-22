# linkit

linkit makes it easy to create hyperlinks to various online databases/resources for inclusion in dynamic reports written in Markdown, HTML or LaTeX.

It currently supports generating links for:

- PubMed articles*
- Gene Ontologies
- Kegg Pathways
- Entrez genes*
- R packages on CRAN or Bioconductor
- Stocks via Yahoo Finance*



## Example

```
Note that `r pubmed_link("22952919", "this paper")` found that the ErbB
signaling pathway (`r kegg_link("hsa04012")`) and response to organic
substance process (`r go_link("GO:0010033")`) are enriched for a network
of oncogenes, including `r entrez_link("4609", "<symbol>")`.
```

:arrow_down: generates :arrow_down:

Note that [this paper][1] found that the ErbB signaling pathway ([hsa04012][2]) and response to organic substance process ([GO:001003][3]) are enriched for a network of oncogenes, including [MYC][4].


## Installation

You can install linkit from github with:

```R
# install.packages("devtools")
devtools::install_github("aaronwolen/linkit")
```


<!-- links -->
[1]: https://www.ncbi.nlm.nih.gov/pubmed/22952919
[2]: http://www.genome.jp/dbget-bin/www_bget?pathway:hsa04012
[3]: http://amigo.geneontology.org/amigo/term/GO:0010033
[4]: https://www.ncbi.nlm.nih.gov/gene/4609