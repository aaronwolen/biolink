context("Gene Ontology links")

id  <- "GO:0005539"
url <- "http://amigo.geneontology.org/amigo/term/GO:0005539"

test_that("Reference GO URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("GO ID validation", {
  badid <- "0005539"
  expect_silent(check_id(id, "go"))
  expect_error(check_id(badid, "go"))
})

test_that("GO URL", {
  expect_match(go_url(id), url)
})

test_that("GO md link", {
  ref  <- sprintf(ml, id, url)
  link <- go_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("GO md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- go_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("GO md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- go_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("GO html link", {
  ref  <- sprintf(hl, url, id)
  link <- go_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("GO html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- go_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("GO html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- go_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})
