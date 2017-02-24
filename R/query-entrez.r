#' @importFrom rentrez entrez_fetch
#' @importFrom xml2 read_xml xml_name xml_find_all xml_text

# returns xml_document
query_ncbi <- function(id, db) {
  xml2::read_xml(rentrez::entrez_fetch(db, id, rettype = "xml"))
}


# pubmed ------------------------------------------------------------------
query_pubmed <- function(id, field) {
  xpath <- switch(field,
    title   = "//ArticleTitle",
    year    = "//PubDate/Year",
    journal = "//Journal/Title"
  )

  doc <- query_ncbi(check_id(id, "pubmed"), "pubmed")
  stopifnot(xml2::xml_name(doc) == "PubmedArticleSet")

  nodes <- xml2::xml_find_all(doc, xpath)
  xml2::xml_text(nodes)
}


# entrez ------------------------------------------------------------------
query_entrez <- function(id, field) {
  xpath <- switch(field,
    symbol      = "//Entrezgene_gene/Gene-ref/Gene-ref_locus",
    description = "//Entrezgene_gene/Gene-ref/Gene-ref_desc",
    location    = "//Entrezgene_gene/Gene-ref/Gene-ref_maploc"
  )

  doc <- query_ncbi(check_id(id, "entrez"), "gene")
  stopifnot(xml2::xml_name(doc) == "Entrezgene-Set")

  nodes <- xml2::xml_find_all(doc, xpath)
  xml2::xml_text(nodes)
}
