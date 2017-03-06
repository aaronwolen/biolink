#' Construct urls to online resources
#'
#' These resource-specific functions return a bare url (i.e., not a hyperlink)
#' to the relevant online database/resource based on the provided identifier.
#'
#' @param id valid identifier for the relevant online database
#'
#' @examples
#' # gene ontology url
#' url_go("GO:0005539")
#'
#' # KEGG pathway url
#' url_kegg("hsa04915")
#'
#' # PubMed article url
#' url_pubmed("23193287")
#' @name urls
NULL

#' @export
#' @describeIn urls for Gene Ontology Consortium
url_go <- function(id) {
  paste0("http://amigo.geneontology.org/amigo/term/",
         check_id(id, "go"))
}

#' @export
#' @describeIn urls for KEGG Pathway Database
url_kegg <- function(id) {
  paste0("http://www.genome.jp/dbget-bin/www_bget?pathway:",
         check_id(id, "kegg"))
}

#' @export
#' @describeIn urls for PubMed based on PMID (PubMed identifier)
url_pubmed <- function(id) {
  paste0("https://www.ncbi.nlm.nih.gov/pubmed/", check_id(id, "pubmed"))
}

#' @export
#' @describeIn urls for NCBI's database for gene-specific information based
#'   on Entrez ID
url_entrez <- function(id) {
  paste0("https://www.ncbi.nlm.nih.gov/gene/", check_id(id, "entrez"))
}

#' @export
#' @describeIn urls for R packages available from CRAN
url_cran <- function(id) {
  if (is_base_pkg(id)) return("https://www.R-project.org")
  paste0("https://cran.r-project.org/package=", check_id(id, "cran"))
}

#' @export
#' @describeIn urls for R packages available from Bioconductor
url_bioc <- function(id) {
  paste0("https://bioconductor.org/packages/", check_id(id, "bioc"))
}
