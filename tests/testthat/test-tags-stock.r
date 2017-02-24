context("Yahoo Finance tag substitution")

# nolint start
ids <- c("AAPL", "MSFT")
names <- c("Apple Inc.", "Microsoft Corporation")
# nolint end
test_that("Yahoo Finance tag retrieval", {
  expect_equal(query_stock(ids, "name"), names)
;})

test_that("Yahoo Finance tag substitution", {
  url <- "https://finance.yahoo.com/quote/AAPL"
  id <- ids[1]

  ref  <- sprintf(hl, url, names[1])
  link <- link_stock(id, "<name>", format = "html")
  expect_equal(link, ref)
;})