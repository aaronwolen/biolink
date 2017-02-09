context("NCBI PubMed links")

id  <- "28166537"
url <- "https://www.ncbi.nlm.nih.gov/pubmed/28166537"

test_that("PMID validation", {
  expect_silent(check_id(id, "pmid"))
  expect_error(check_id("pmc28166537", "pmid")) # no characters
  expect_error(check_id("28", "pmid"))          # too short
  expect_error(check_id("281665370", "pmid"))   # too long
})

test_that("PubMed URL", {
  expect_match(pubmed_url(id), url, fixed = TRUE)
})

test_that("PubMed md link", {
  ref  <- sprintf(ml, id, url)
  link <- pubmed_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- pubmed_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- pubmed_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link", {
  ref  <- sprintf(hl, url, id)
  link <- pubmed_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- pubmed_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- pubmed_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})
