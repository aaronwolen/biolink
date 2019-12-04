context("NCBI Entrez tag substitution")

ids <- c("101954267", "105369219")
symbols <- c("RNVU1-15", "SIRPB3P")
locations <- c("1q21.1", "20p13")
descriptions <- c(
  "RNA, variant U1 small nuclear 15",
  "signal regulatory protein beta 3, pseudogene"
)

test_that("NCBI Entrez tag retrieval", {
  skip_on_cran()
  expect_equal(query_entrez(ids, "symbol"), symbols)
  expect_equal(query_entrez(ids, "location"), locations)
  expect_equal(query_entrez(ids, "description"), descriptions)
;})

test_that("NCBI Entrez tag substitution", {
  skip_on_cran()
  url <- "https://www.ncbi.nlm.nih.gov/gene/101954267"
  id <- ids[1]

  ref  <- sprintf(hl, url, symbols[1])
  link <- link_entrez(id, "<symbol>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, locations[1])
  link <- link_entrez(id, "<location>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, descriptions[1])
  link <- link_entrez(id, "<description>", format = "html")
  expect_equal(link, ref)
;})
