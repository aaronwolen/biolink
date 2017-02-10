#' PubMed links
#'
#' Construct a URL or hypertext link to a PubMed article
#'
#' @inheritParams go
#' @param id PubMed ID (e.g., `"23193287"`)
#'
#' @references [NCBI PubMed](https://www.ncbi.nlm.nih.gov/pubmed/)
#'
#' @examples
#' pubmed_link("23193287", format = "html")
#' @name pubmed
NULL

#' @export
#' @rdname pubmed
pubmed_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(pubmed_url(id), text, title, format)
}

#' @export
#' @rdname pubmed
pubmed_url <- function(id) {
  paste0("https://www.ncbi.nlm.nih.gov/pubmed/", check_id(id, "pmid"))
}



#' NCBI Entrez Gene links
#'
#' Construct a URL or hypertext link to an entry in NCBI's database for
#' gene-specific information.
#'
#' @inheritParams go
#' @param id Entrez Gene ID (e.g., `"4609"`)
#'
#' @references [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene)
#'
#' @examples
#' entrez_link("4609", format = "html")
#' @name entrez
NULL

#' @export
#' @rdname entrez
entrez_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(entrez_url(id), text, title, format)
}

#' @export
#' @rdname entrez
entrez_url <- function(id) {
  paste0("https://www.ncbi.nlm.nih.gov/gene/", check_id(id, "entrez"))
}
