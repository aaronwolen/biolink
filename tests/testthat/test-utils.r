context("ID validation")

test_that("identifies invalid IDs", {
  ids <- c("100270902", "106480026", "107985807", "677762", "100422418")
  expect_silent(check_id(ids, "entrez"))

  ids[2] <- "10648X0026"
  expect_error(
    check_id(ids, "entrez"),
    regexp = paste(ids[2], "is not a valid entrez identifier")
  )

  ids[4] <- "677X762"
  expect_error(
    check_id(ids, "entrez"),
    regexp = paste0(
      "2 of the supplied entrez idenfitiers are invalid including:",
      paste0("\n -", ids[2], "\n -", ids[4]))
  )
})

test_that("R base packages point to R website", {
  expect_match(cran_url("stats"),    "https://www.R-project.org")
  expect_match(cran_url("graphics"), "https://www.R-project.org")
})
