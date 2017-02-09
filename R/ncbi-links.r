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
  build_link(kegg_url(id), text = id, format = format)
}

#' @export
#' @rdname pubmed
pubmed_url <- function(id) {
  paste0("https://www.ncbi.nlm.nih.gov/pubmed/", check_id(id, "pmid"))
}