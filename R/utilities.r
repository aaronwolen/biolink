# wrap vector in double quotes
dquote <- function(x) {
  shQuote(x, type = "cmd")
}

# validate supplied IDs
check_id <- function(id, type) {
  pattern <- switch(type,
    GO = "GO:[0-9]{7}"
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
      stop(n, " of the supplied ", type, " idenfitiers are invalid including:\n",
           paste0(" -", invalid, "\n")[seq_len(min(10, n))], call. = FALSE)
    }
  }
}
