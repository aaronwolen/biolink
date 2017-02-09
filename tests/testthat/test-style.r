if (requireNamespace("lintr", quietly = TRUE)) {
  context("Lint")
  test_that("Package Style", {
    lintr::expect_lint_free()
  })
}
