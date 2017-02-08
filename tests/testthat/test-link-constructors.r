context("HTML link construction")

url   <- "https://r-project.org"
text  <- "R"
title <- "The R Project"

test_that("standard HTML link is valid", {
  ref <- "<a href=\"https://r-project.org\">R</a>"
  expect_match(html_link(url,  text), ref)
  expect_match(build_link(url, text, format = "html"), ref)
})

test_that("URL stands in for missing text", {
  ref <- "<a href=\"https://r-project.org\">https://r-project.org</a>"
  expect_match(html_link(url,  text = NULL), ref)
  expect_match(build_link(url, text = NULL, format = "html"), ref)
})

test_that("title is inserted in anchor tag", {
  ref <- " title=\"The R Project\">"
  expect_match(html_link(url,  title = title), ref)
  expect_match(build_link(url, title = title,  format = "html"), ref)
})


context("Markdown link construction")

test_that("standard md link is valid", {
  ref <- "[R](https://r-project.org)"
  expect_match(md_link(url, text), ref, fixed = TRUE)
  expect_match(build_link(url, text, format = "markdown"), ref, fixed = TRUE)
})

test_that("automatic link is used when missing text", {
  ref <- "<https://r-project.org>"
  expect_match(md_link(url, text = NULL), ref)
  expect_match(build_link(url, text = NULL, format = "markdown"), ref)
})

test_that("title is inserted after URL", {
  ref <- "[R](https://r-project.org \"The R Project\")"
  expect_match(md_link(url, text, title), ref, fixed = TRUE)
  expect_match(build_link(url, text, title, format = "markdown"), ref, fixed = TRUE)
})
