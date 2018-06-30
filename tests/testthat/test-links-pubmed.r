context("PubMed links")

id  <- "20345488"
url <- "https://www.ncbi.nlm.nih.gov/pubmed/20345488"

test_that("Reference PubMed URL is valid", {
  skip_on_cran()
  expect_equal(check_url_status(url), 200)
})

test_that("PubMed PMID validation", {
  # contains letters
  expect_error(check_id("pmc20345488", "pubmed"))
  # too short
  expect_error(check_id("22", "pubmed"))
  # too long
  expect_error(check_id("203454880", "pubmed"))
  expect_silent(check_id(id, "pubmed"))
})

test_that("PubMed URL", {
  expect_match(url_pubmed(id), url, fixed = TRUE)
})

test_that("PubMed md url", {
  ref  <- sprintf(mu, url)
  link <- link_pubmed(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link", {
  ref  <- sprintf(ml, id, url)
  link <- link_pubmed(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- link_pubmed(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- link_pubmed(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link", {
  ref  <- sprintf(hl, url, id)
  link <- link_pubmed(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- link_pubmed(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- link_pubmed(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed latex url", {
  ref  <- sprintf(lu, url)
  link <- link_pubmed(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed latex link", {
  ref  <- sprintf(ll, url, id)
  link <- link_pubmed(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- link_pubmed(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
