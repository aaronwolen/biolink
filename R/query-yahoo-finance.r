# based on:
# wern-ancheta.com/blog/2015/04/05/getting-started-with-the-yahoo-finance-api/
stock_query <- function(id, field) {
  yf.url <- "http://download.finance.yahoo.com/d/quotes.csv?s=%s&f=%s"

  queryf <- switch(field,
    name   = "n",
    price  = "l1",
    open   = "o",
    stop(field, " is not a valid tag for Yahoo Finance.")
  )

  id   <- paste0(id, collapse = ",")
  url  <- sprintf(yf.url, id, queryf)
  resp <- read.table(url, col.names = field, stringsAsFactors = FALSE)

  resp[[field]]
}
