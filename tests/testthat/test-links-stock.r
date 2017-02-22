context("Yahoo Finance links")

id  <- "AAPL"
url <- "https://finance.yahoo.com/quote/AAPL"

test_that("Reference Yahoo Finance URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("Yahoo Finance ticker validation", {
  # too long
  expect_error(check_id("AAPLL", "stock"))
  expect_silent(check_id(id, "stock"))
})

test_that("Yahoo Finance URL", {
  expect_match(stock_url(id), url, fixed = TRUE)
})

test_that("Yahoo Finance md url", {
  ref  <- sprintf(mu, url)
  link <- stock_link(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance md link", {
  ref  <- sprintf(ml, id, url)
  link <- stock_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- stock_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- stock_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance html link", {
  ref  <- sprintf(hl, url, id)
  link <- stock_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- stock_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- stock_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance latex url", {
  ref  <- sprintf(lu, url)
  link <- stock_link(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance latex link", {
  ref  <- sprintf(ll, url, id)
  link <- stock_link(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- stock_link(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
