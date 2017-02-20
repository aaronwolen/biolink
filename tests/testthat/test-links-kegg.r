context("KEGG Pathway links")

id  <- "hsa04915"
url <- "http://www.genome.jp/dbget-bin/www_bget?pathway:hsa04915"

test_that("Reference KEGG Pathway URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("KEGG Pathway KEGG ID validation", {
  expect_silent(check_id(id, "kegg"))
})

test_that("KEGG Pathway URL", {
  expect_match(kegg_url(id), url, fixed = TRUE)
})

test_that("KEGG Pathway md link", {
  ref  <- sprintf(ml, id, url)
  link <- kegg_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- kegg_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- kegg_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway html link", {
  ref  <- sprintf(hl, url, id)
  link <- kegg_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- kegg_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- kegg_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})
