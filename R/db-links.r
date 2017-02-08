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
  paste0("http://amigo.geneontology.org/amigo/term/", check_id(id, "go"))
}



#' KEGG Pathway Link
#'
#' Construct a URL or hypertext link to the KEGG Pathway Database
#'
#' @inheritParams go
#' @param id KEGG pathway ID (e.g., `"hsa04915"`)
#'
#' @references [KEGG Pathway Database](http://www.kegg.jp/kegg/pathway.html)
#'
#' @examples
#' kegg_link("hsa04915", format = "html")
#' @name kegg
NULL

#' @export
#' @rdname kegg
kegg_link <- function(id, text = id, title = NULL, format = "html") {
  build_link(kegg_url(id), text = id, format = format)
}

#' @export
#' @rdname kegg
kegg_url <- function(id) {
  paste0("http://www.genome.jp/dbget-bin/www_bget?pathway:", check_id(id, "kegg"))
}