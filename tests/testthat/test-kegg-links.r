context("KEGG Pathway links")

id  <- "hsa04915"
url <- "http://www.genome.jp/dbget-bin/www_bget?pathway:hsa04915"

test_that("KEGG ID validation", {
  expect_silent(check_id(id, "kegg"))
  expect_error(check_id("04915", "kegg"))
})

test_that("KEGG URL", {
  expect_match(kegg_url(id), url, fixed = TRUE)
})

test_that("KEGG md link", {
  ref  <- sprintf(ml, id, url)
  link <- kegg_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- kegg_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- kegg_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG html link", {
  ref  <- sprintf(hl, url, id)
  link <- kegg_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- kegg_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- kegg_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})
