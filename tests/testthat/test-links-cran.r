context("CRAN Packages links")

id  <- "ggplot2"
url <- "https://cran.r-project.org/package=ggplot2"

test_that("Reference CRAN Packages URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("CRAN Packages name validation", {
  # must start with a letter
  expect_error(check_id("2ggplot", "cran"))
  # can't end with a period
  expect_error(check_id("ggplot2.", "cran"))
  # only letters, numbers and periods
  expect_error(check_id("ggplot$2", "cran"))
  expect_silent(check_id(id, "cran"))
})

test_that("CRAN Packages URL", {
  expect_match(cran_url(id), url, fixed = TRUE)
})

test_that("CRAN Packages md url", {
  ref  <- sprintf(mu, url)
  link <- cran_link(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages md link", {
  ref  <- sprintf(ml, id, url)
  link <- cran_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- cran_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- cran_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages html link", {
  ref  <- sprintf(hl, url, id)
  link <- cran_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- cran_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- cran_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages latex url", {
  ref  <- sprintf(lu, url)
  link <- cran_link(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages latex link", {
  ref  <- sprintf(ll, url, id)
  link <- cran_link(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("CRAN Packages latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- cran_link(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
