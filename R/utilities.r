# wrap vector in double quotes
dquote <- function(x) {
  shQuote(x, type = "cmd")
}

# validate supplied IDs
check_id <- function(id, type) {
  pattern <- switch(type,
    GO = "GO:[0-9]{7}"
  )
  if (grepl(pattern, id)) {
    return(id)
  } else {
    stop(id, " is not a valid ", type, " identifier", call. = FALSE)
  }
}