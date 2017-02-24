context("Gene Ontology links")

id  <- "GO:0005539"
url <- "http://amigo.geneontology.org/amigo/term/GO:0005539"

test_that("Reference Gene Ontology URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("Gene Ontology GO validation", {
  # missing prefix
  expect_error(check_id("0005539", "go"))
  expect_silent(check_id(id, "go"))
})

test_that("Gene Ontology URL", {
  expect_match(url_go(id), url, fixed = TRUE)
})

test_that("Gene Ontology md url", {
  ref  <- sprintf(mu, url)
  link <- link_go(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology md link", {
  ref  <- sprintf(ml, id, url)
  link <- link_go(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- link_go(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- link_go(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology html link", {
  ref  <- sprintf(hl, url, id)
  link <- link_go(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- link_go(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- link_go(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology latex url", {
  ref  <- sprintf(lu, url)
  link <- link_go(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology latex link", {
  ref  <- sprintf(ll, url, id)
  link <- link_go(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Gene Ontology latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- link_go(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
