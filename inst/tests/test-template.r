context("{{title}} links")

id  <- "{{ref_id}}"
url <- "{{ref_url}}"

test_that("Reference {{title}} URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("{{title}} {{id}} validation", {
  {{#bad_ids}}
  # {{reason}}
  expect_error(check_id("{{id}}", "{{db}}"))
  {{/bad_ids}}
  expect_silent(check_id(id, "{{db}}"))
})

test_that("{{title}} URL", {
  expect_match({{db}}_url(id), url, fixed = TRUE)
})

test_that("{{title}} md link", {
  ref  <- sprintf(ml, id, url)
  link <- {{db}}_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- {{db}}_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- {{db}}_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} html link", {
  ref  <- sprintf(hl, url, id)
  link <- {{db}}_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- {{db}}_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("{{title}} html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- {{db}}_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})
