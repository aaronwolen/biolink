context("CRAN Package links")

id  <- "ggplot2"
url <- "https://cran.r-project.org/package=ggplot2"

test_that("Reference CRAN Package URL is valid", {
  expect_equal(check_url_status(url), 200)
})

test_that("CRAN Package name validation", {
  # must start with a letter
  expect_error(check_id("2ggplot", "cran"))
  # can't end with a period
  expect_error(check_id("ggplot2.", "cran"))
  # only letters, numbers and periods
  expect_error(check_id("ggplot$2", "cran"))
  expect_silent(check_id(id, "cran"))
})

test_that("CRAN Package URL", {
  expect_match(url_cran(id), url, fixed = TRUE)
})

test_that("CRAN Package md url", {
  ref  <- sprintf(mu, url)
  link <- link_cran(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package md link", {
  ref  <- sprintf(ml, id, url)
  link <- link_cran(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- link_cran(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- link_cran(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package html link", {
  ref  <- sprintf(hl, url, id)
  link <- link_cran(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- link_cran(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- link_cran(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package latex url", {
  ref  <- sprintf(lu, url)
  link <- link_cran(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package latex link", {
  ref  <- sprintf(ll, url, id)
  link <- link_cran(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Package latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- link_cran(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
