# biolink

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/biolink)](https://cran.r-project.org/package=biolink)
[![cran checks](https://cranchecks.info/badges/summary/biolink)](https://cran.r-project.org/web/checks/check_results_biolink.html)
[![R-CMD-check](https://github.com/aaronwolen/biolink/workflows/R-CMD-check/badge.svg)](https://github.com/aaronwolen/biolink/actions)
[![Coverage Status](https://img.shields.io/codecov/c/github/aaronwolen/biolink/master.svg)](https://codecov.io/github/aaronwolen/biolink?branch=master)

[![Downloads](http://cranlogs.r-pkg.org/badges/biolink?color=brightgreen)](http://www.r-pkg.org/pkg/biolink)

biolink makes it easy to create hyperlinks to various online databases/resources for inclusion in dynamic reports written in Markdown, HTML or LaTeX.

It currently supports generating links for:

- **PubMed articles**
- **Gene Ontologies**
- Kegg Pathways
- **Entrez genes**
- R packages on CRAN or Bioconductor
- create an [issue](https://github.com/aaronwolen/biolink/issues) to request support for additional resources

**Bold** indicates support for *data tags* (see below).

## Usage

### Basic idea

```r
link_entrez("4609")
## "<a href=\"https://www.ncbi.nlm.nih.gov/gene/4609\">4609</a>"

link_entrez("4609", text = "this gene")
## "<a href=\"https://www.ncbi.nlm.nih.gov/gene/4609\">this gene</a>"

link_entrez("4609", text = "this gene", format = "markdown")
## "[this gene](https://www.ncbi.nlm.nih.gov/gene/4609)"
```

### Extended example

```
Note that `r link_pubmed("22952919", "this paper")` found that the ErbB
signaling pathway (`r link_kegg("hsa04012")`) and response to organic
substance process (`r link_go("GO:0010033")`) are enriched for a network
of oncogenes, including `r link_entrez("4609", "<symbol>")`.
```

&#8675; generates &#8675;

> Note that [this paper][1] found that the ErbB signaling pathway ([hsa04012][2]) and response to organic substance process ([GO:001003][3]) are enriched for a network of oncogenes, including [MYC][4].

### Data tags

For a few supported resources, specially formatted tags can be used to retrieve data from the corresponding resource. In the example above, `link_entrez("4609", "<symbol>")` produces [MYC][4] because the gene symbol was retrieved from NCBI.

See the package documentation for a complete list of supported data tags.

## Installation

Install the released version of biolink from CRAN

```R
install.packages("biolink")
```

or the development version from GitHub with

```R
# install.packages("devtools")
devtools::install_github("aaronwolen/biolink")
```


<!-- links -->
[1]: https://www.ncbi.nlm.nih.gov/pubmed/22952919
[2]: http://www.genome.jp/dbget-bin/www_bget?pathway:hsa04012
[3]: http://amigo.geneontology.org/amigo/term/GO:0010033
[4]: https://www.ncbi.nlm.nih.gov/gene/4609
