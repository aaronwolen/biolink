#' Create hyperlinks to online databases based on standard identifiers
#'
#' @inheritParams urls
#' @inheritParams build_link
#'
#' @examples
#' go_link("GO:0005539", format = "html")
#' kegg_link("hsa04915", format = "html")
#' pubmed_link("23193287", format = "html")
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
