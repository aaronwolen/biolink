context("Bioconductor Package links")

id  <- "Biobase"
url <- "https://bioconductor.org/packages/Biobase"

test_that("Reference Bioconductor Package URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("Bioconductor Package name validation", {
  expect_silent(check_id(id, "bioc"))
})

test_that("Bioconductor Package URL", {
  expect_match(bioc_url(id), url, fixed = TRUE)
})

test_that("Bioconductor Package md url", {
  ref  <- sprintf(mu, url)
  link <- bioc_link(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package md link", {
  ref  <- sprintf(ml, id, url)
  link <- bioc_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- bioc_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- bioc_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package html link", {
  ref  <- sprintf(hl, url, id)
  link <- bioc_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- bioc_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- bioc_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package latex url", {
  ref  <- sprintf(lu, url)
  link <- bioc_link(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package latex link", {
  ref  <- sprintf(ll, url, id)
  link <- bioc_link(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Bioconductor Package latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- bioc_link(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
