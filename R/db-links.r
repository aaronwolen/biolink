#' Gene Ontology Link
#'
#' Construct hypertext link to the Gene Ontology (GO) database.
#'
#' @inheritParams build_link
#' @param text displayed text, defaults to the supplied `id`
#'
#' @references [Gene Ontology Consortium](http://amigo.geneontology.org)
#' @export
#' @examples
#' go_link("GO:0005539", format = "html")
go_link <- function(id, text = id, title = NULL, format = "html") {
  id <- check_id(id, "GO")
  url <- paste0("http://amigo.geneontology.org/amigo/term/", id)
  build_link(url, text = id, format = format)
}
