#' Construct hyperlinks to online resources
#'
#' These resource-specific functions return a hyperlink to the relevant online
#' database/resource based on the provided identifier (`id`).
#'
#' @section Link Customization:
#' By default the hyperlinked text is just the `id`, so
#' `pubmed_link("22066989")` becomes
#' [22066989](https://www.ncbi.nlm.nih.gov/pubmed/22066989). The `text` argument
#' allows you to customize the hyperlinked text. To display a hyperlinked URL
#' (e.g., <https://www.r-project.org>), set `text = NULL`.
#'
#' @section Data Tags:
#' For a few supported online resources, specially formatted tags can be passed
#' to the `text` and `title` arguments to display live data obtained from the
#' corresponding resource. For example, `entrez_link("4609", text =
#' "<symbol>")`, produces [MYC](https://www.ncbi.nlm.nih.gov/gene/4609),
#' displaying the gene symbol rather than the Entrez ID. We could also set
#' `title = "<description>"` to produce a link that reveals the gene's
#' description when a user hovers over the link (using a supported browser).
#'
#' Currently supported data tags:
#'
#' NCBI Entrez:
#'   - `symbol`: Gene symbol
#'   - `description`: Gene description
#'   - `location`: Cytogenetic location
#'
#' NCBI PubMed:
#'   - `title`: Article title
#'   - `year`: Publication year
#'   - `journal`: Journal title
#'
#' Yahoo Finance:
#'   - `name`: Company name
#'   - `price`: Current stock price
#'   - `open`: Stock opening price
#'
#' @inheritParams urls
#' @inheritParams build_link
#'
#' @examples
#' go_link("GO:0005539", format = "html")
#' kegg_link("hsa04915", format = "html")
#' pubmed_link("22066989", format = "html")
#' entrez_link("4609", format = "html")
#'
#' @references
#' - [Gene Ontology Consortium](http://amigo.geneontology.org)
#' - [KEGG Pathway Database](http://www.kegg.jp/kegg/pathway.html)
#' - [NCBI PubMed](https://www.ncbi.nlm.nih.gov/pubmed/)
#' - [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene)
#'
#' @name links
NULL

#' @export
#' @describeIn links to Gene Ontology Consortium
go_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(go_url(id), text, title, format)
}

#' @export
#' @describeIn links to KEGG Pathway Database
kegg_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(kegg_url(id), text, title, format)
}

#' @export
#' @describeIn links to PubMed based on PMID (PubMed identifier)
pubmed_link <- function(id, text = id, title = NULL, format = "html") {
  url   <- pubmed_url(id)
  text  <- sub_var(text,  id, "pubmed")
  title <- sub_var(title, id, "pubmed")
  build_link(url, text, title, format)
}

#' @export
#' @describeIn links to NCBI's database for gene-specific information based
#'   on Entrez ID
entrez_link <- function(id, text = id, title = NULL, format = "html") {
  url   <- entrez_url(id)
  text  <- sub_var(text,  id, "entrez")
  title <- sub_var(title, id, "entrez")
  build_link(url, text, title, format)
}

#' @export
#' @describeIn links to Yahoo Finance based on ticker symbol
stock_link <- function(id, text = id, title = NULL, format = "html") {
  url   <- stock_url(id)
  text  <- sub_var(text,  id, "stock")
  title <- sub_var(title, id, "stock")
  build_link(url, text, title, format)
}

#' @export
#' @describeIn links for R packages available from CRAN
cran_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(cran_url(id), text, title, format)
}

#' @export
#' @describeIn links for R packages available from Bioconductor
bioc_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(bioc_url(id), text, title, format)
}
