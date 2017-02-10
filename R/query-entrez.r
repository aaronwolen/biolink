#' @importFrom rentrez entrez_fetch
#' @importFrom xml2 read_xml xml_name xml_find_all xml_text

# returns xml_document
ncbi_query <- function(id, db) {
  xml2::read_xml(rentrez::entrez_fetch(db, id, rettype = "xml"))
}


# pubmed ------------------------------------------------------------------
pubmed_query <- function(id, field) {
  xpath <- switch(field,
    title   = "//ArticleTitle",
    year    = "//PubDate/Year",
    journal = "//Journal/Title"
  )

  doc <- ncbi_query(check_id(id, "pmid"), "pubmed")
  stopifnot(xml2::xml_name(doc) == "PubmedArticleSet")

  nodes <- xml2::xml_find_all(doc, xpath)
  xml2::xml_text(nodes)
}

# pubmed_title(c("23193287", "25633503"))
pubmed_title   <- function(id) pubmed_query(id, "title")
pubmed_year    <- function(id) pubmed_query(id, "year")
pubmed_journal <- function(id) pubmed_query(id, "journal")


# entrez ------------------------------------------------------------------
entrez_query <- function(id, field) {
  xpath <- switch(field,
    symbol      = "//Entrezgene_gene/Gene-ref/Gene-ref_locus",
    description = "//Entrezgene_gene/Gene-ref/Gene-ref_desc",
    location    = "//Entrezgene_gene/Gene-ref/Gene-ref_maploc"
  )

  doc <- ncbi_query(check_id(id, "entrez"), "gene")
  stopifnot(xml2::xml_name(doc) == "Entrezgene-Set")

  nodes <- xml2::xml_find_all(doc, xpath)
  xml2::xml_text(nodes)
}

# entrez_symbol("4609")
entrez_symbol      <- function(id) entrez_query(id, "symbol")
entrez_description <- function(id) entrez_query(id, "description")
entrez_location    <- function(id) entrez_query(id, "location")
