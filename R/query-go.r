#' @importFrom DBI dbConnect dbGetQuery dbDisconnect
#' @importFrom RMySQL MySQL
#' @importFrom glue glue_sql
query_go <- function(id, field) {
  fields <- c(name = "name", definition = "term_definition")
  field <- match.arg(field, names(fields))

  gohost <- "ensembldb.ensembl.org"
  gocon <- try(DBI::dbConnect(
    RMySQL::MySQL(),
    host = gohost,
    user = "anonymous",
    password = "",
    dbname = "ensembl_go_54"
  ), silent = TRUE)

  query <- switch(field,
    name            = "
      SELECT name FROM term WHERE acc IN ({id*});",
    definition = "
      SELECT term_definition FROM term
      INNER JOIN term_definition ON (term.id=term_definition.term_id)
      WHERE term.acc IN ({id*});"
  )

  query <- glue::glue_sql(query, id = id, .con = gocon)
  out <- DBI::dbGetQuery(gocon, query)
  DBI::dbDisconnect(gocon)
  out[[fields[field]]]
}
