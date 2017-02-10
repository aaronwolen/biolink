context("NCBI Entrez links")

id  <- "101954267"
url <- "https://www.ncbi.nlm.nih.gov/gene/101954267"

test_that("Reference Entrez URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("Entrez ID validation", {
  expect_silent(check_id(id, "entrez"))
  expect_error(check_id("d101954267",  "entrez"))  # no characters
  expect_error(check_id("10195426700", "entrez"))  # too long
})

test_that("Entrez URL", {
  expect_match(entrez_url(id), url, fixed = TRUE)
})

test_that("Entrez md link", {
  ref  <- sprintf(ml, id, url)
  link <- entrez_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Entrez md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- entrez_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Entrez md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- entrez_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Entrez html link", {
  ref  <- sprintf(hl, url, id)
  link <- entrez_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Entrez html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- entrez_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Entrez html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- entrez_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})


context("NCBI Entrez tag substitution")

ids         <- c(id, "105369219")
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
  text <- symbols[1]
  title <- description[1]
  ref  <- sprintf(hlt, url, title, text)
  link <- entrez_link(id, "<symbol>", "<description>", format = "html")
  expect_match(link, ref)
})
