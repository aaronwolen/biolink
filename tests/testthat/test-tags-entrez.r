context("NCBI Entrez tag substitution")

# nolint start
ids <- c("101954267", "105369219")
symbols <- c("RNVU1-15", "LOC105369219")
locations <- c("1q21.1", "20p13")
descriptions <- c("RNA, variant U1 small nuclear 15", "uncharacterized LOC105369219")
# nolint end
test_that("NCBI Entrez tag retrieval", {
  expect_equal(entrez_query(ids, "symbol"), symbols)
  expect_equal(entrez_query(ids, "location"), locations)
  expect_equal(entrez_query(ids, "description"), descriptions)
;})

test_that("NCBI Entrez tag substitution", {
  url <- "https://www.ncbi.nlm.nih.gov/gene/101954267"
  id <- ids[1]

  ref  <- sprintf(hl, url, symbols[1])
  link <- entrez_link(id, "<symbol>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, locations[1])
  link <- entrez_link(id, "<location>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, descriptions[1])
  link <- entrez_link(id, "<description>", format = "html")
  expect_equal(link, ref)
;})
