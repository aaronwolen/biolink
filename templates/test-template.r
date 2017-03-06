context("{{title}} links")

id  <- "{{ref_id}}"
url <- "{{ref_url}}"

test_that("Reference {{title}} URL is valid", {
  expect_equal(check_url_status(url), 200)
})

test_that("{{title}} {{id}} validation", {
  {{#bad_ids}}
  # {{reason}}
  expect_error(check_id("{{id}}", "{{db}}"))
  {{/bad_ids}}
  expect_silent(check_id(id, "{{db}}"))
})

test_that("{{title}} URL", {
  expect_match(url_{{db}}(id), url, fixed = TRUE)
})

test_that("{{title}} md url", {
  ref  <- sprintf(mu, url)
  link <- link_{{db}}(id, text = NULL, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} md link", {
  ref  <- sprintf(ml, id, url)
  link <- link_{{db}}(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- link_{{db}}(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- link_{{db}}(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} html link", {
  ref  <- sprintf(hl, url, id)
  link <- link_{{db}}(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- link_{{db}}(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- link_{{db}}(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} latex url", {
  ref  <- sprintf(lu, url)
  link <- link_{{db}}(id, text = NULL, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} latex link", {
  ref  <- sprintf(ll, url, id)
  link <- link_{{db}}(id, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} latex link + text", {
  ref  <- sprintf(ll, url, text)
  link <- link_{{db}}(id, text, format = "latex")
  expect_match(link, ref, fixed = TRUE)
})
