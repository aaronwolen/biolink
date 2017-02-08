#' Gene Ontology Link
#'
#' Construct a URL or hypertext link to the Gene Ontology (GO) database.
#'
#' @inheritParams build_link
#' @param id gene ontology ID (e.g., `"GO:0005539"`)
#' @param text displayed text, defaults to the supplied `id`
#'
#' @references [Gene Ontology Consortium](http://amigo.geneontology.org)
#'
#' @examples
#' go_link("GO:0005539", format = "html")
#' @name go
NULL

#' @export
#' @rdname go
go_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(go_url(id), text = id, format = format)
}

#' @export
#' @rdname go
go_url <- function(id) {
  paste0("http://amigo.geneontology.org/amigo/term/", check_id(id, "GO"))
}
