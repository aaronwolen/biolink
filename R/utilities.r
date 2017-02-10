# wrap vector in double quotes
dquote <- function(x) {
  shQuote(x, type = "cmd")
}

# validate supplied IDs
# PMID format:
#   - see PMC-ids.csv.gz from https://www.ncbi.nlm.nih.gov/pmc/pmctopmid
check_id <- function(id, type) {
  pattern <- switch(type,
    go   = "^GO:[0-9]{7}$",
    kegg = "^[a-z]{3,4}[0-9]{5}$",
    pmid = "^[0-9]{3,8}$",
  entrez = "^[0-9]{1,9}$"
  )
  valid <- grepl(pattern, id)
  if (all(valid)) {
    return(id)
  } else {
    invalid <- id[!valid]
    n <- length(invalid)
    if (n == 1) {
      stop(invalid, " is not a valid ", type, " identifier", call. = FALSE)
    } else {
      stop(n, " of the supplied ", type,
           " idenfitiers are invalid including:\n",
           paste0(" -", invalid, "\n")[seq_len(min(10, n))], call. = FALSE)
    }
  }
}
