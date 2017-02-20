context("NCBI Entrez tag substitution")

ids         <- c("101954267", "105369219")
symbols     <- c("RNVU1-15", "LOC105369219")
location    <- c("1q21.1", "20p13")
description <- c("RNA, variant U1 small nuclear 15",
                 "uncharacterized LOC105369219")

test_that("Entrez tag retrieval", {
  expect_equal(entrez_query(ids, "symbol"),      symbols)
  expect_equal(entrez_query(ids, "location"),    location)
  expect_equal(entrez_query(ids, "description"), description)
})

test_that("Entrez tag substitution", {
  id <- ids[1]
  text <- symbols[1]
  title <- description[1]
  ref  <- sprintf(hlt, entrez_url(id), title, text)
  link <- entrez_link(id, "<symbol>", "<description>", format = "html")
  expect_match(link, ref)
})
