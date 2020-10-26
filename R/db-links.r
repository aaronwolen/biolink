#' Construct hyperlinks to online resources
#'
#' These resource-specific functions return a hyperlink to the relevant online
#' database/resource based on the provided identifier (`id`).
#'
#' @section Link Customization:
#' By default the hyperlinked text is just the `id`, so
#' `link_pubmed("22066989")` becomes
#' [22066989](https://pubmed.ncbi.nlm.nih.gov/22066989). The `text` argument
#' allows you to customize the hyperlinked text. To display a hyperlinked URL
#' (e.g., <https://www.r-project.org>), set `text = NULL`.
#'
#' @section Data Tags:
#' For a few supported online resources, specially formatted tags can be passed
#' to the `text` and `title` arguments to display live data obtained from the
#' corresponding resource. For example, `link_entrez("4609", text =
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
#' Gene Ontology:
#'   - `name`: GO term name
#'   - `definition`: GO term definition
#'
#' @inheritParams urls
#' @inheritParams build_link
#'
#' @examples
#' link_go("GO:0005539", format = "html")
#' link_kegg("hsa04915", format = "html")
#' link_pubmed("22066989", format = "html")
#' link_entrez("4609", format = "html")
#'
#' @references
#' - [Gene Ontology Consortium](http://amigo.geneontology.org)
#' - [KEGG Pathway Database](https://www.kegg.jp/kegg/pathway.html)
#' - [NCBI PubMed](https://pubmed.ncbi.nlm.nih.gov)
#' - [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene)
#'
#' @name links
NULL

#' @export
#' @describeIn links to Gene Ontology Consortium
link_go <- function(id, text = id, title = NULL, format = "html") {
  text  <- sub_var(text,  id, "go")
  title <- sub_var(title, id, "go")
  build_link(url_go(id), text, title, format)
}

#' @export
#' @describeIn links to KEGG Pathway Database
link_kegg <- function(id, text = id, title = NULL, format = "html") {
  build_link(url_kegg(id), text, title, format)
}

#' @export
#' @describeIn links to PubMed based on PMID (PubMed identifier)
link_pubmed <- function(id, text = id, title = NULL, format = "html") {
  url   <- url_pubmed(id)
  text  <- sub_var(text,  id, "pubmed")
  title <- sub_var(title, id, "pubmed")
  build_link(url, text, title, format)
}

#' @export
#' @describeIn links to NCBI's database for gene-specific information based
#'   on Entrez ID
link_entrez <- function(id, text = id, title = NULL, format = "html") {
  url   <- url_entrez(id)
  text  <- sub_var(text,  id, "entrez")
  title <- sub_var(title, id, "entrez")
  build_link(url, text, title, format)
}

#' @export
#' @describeIn links for R packages available from CRAN
link_cran <- function(id, text = id, title = NULL, format = "html") {
  build_link(url_cran(id), text, title, format)
}

#' @export
#' @describeIn links for R packages available from Bioconductor
link_bioc <- function(id, text = id, title = NULL, format = "html") {
  build_link(url_bioc(id), text, title, format)
}
