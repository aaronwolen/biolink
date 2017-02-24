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
  expect_match(url_stock(id), url, fixed = TRUE)
})

test_that("Yahoo Finance md url", {
  ref  <- sprintf(mu, url)
  link <- link_stock(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance md link", {
  ref  <- sprintf(ml, id, url)
  link <- link_stock(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- link_stock(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- link_stock(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance html link", {
  ref  <- sprintf(hl, url, id)
  link <- link_stock(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- link_stock(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- link_stock(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance latex url", {
  ref  <- sprintf(lu, url)
  link <- link_stock(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance latex link", {
  ref  <- sprintf(ll, url, id)
  link <- link_stock(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("Yahoo Finance latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- link_stock(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
