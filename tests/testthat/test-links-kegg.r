context("KEGG Pathway links")

id  <- "hsa04915"
url <- "https://www.genome.jp/dbget-bin/www_bget?pathway+hsa04915"

test_that("Reference KEGG Pathway URL is valid", {
  skip_on_cran()
  expect_equal(check_url_status(url), 200)
})

test_that("KEGG Pathway KEGG ID validation", {
  expect_silent(check_id(id, "kegg"))
})

test_that("KEGG Pathway URL", {
  expect_match(url_kegg(id), url, fixed = TRUE)
})

test_that("KEGG Pathway md url", {
  ref  <- sprintf(mu, url)
  link <- link_kegg(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway md link", {
  ref  <- sprintf(ml, id, url)
  link <- link_kegg(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- link_kegg(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- link_kegg(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway html link", {
  ref  <- sprintf(hl, url, id)
  link <- link_kegg(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- link_kegg(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- link_kegg(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway latex url", {
  ref  <- sprintf(lu, url)
  link <- link_kegg(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway latex link", {
  ref  <- sprintf(ll, url, id)
  link <- link_kegg(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("KEGG Pathway latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- link_kegg(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
