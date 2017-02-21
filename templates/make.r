# Generate testthat tests for url/link validation
library(yaml)
library(whisker)
library(formatR)

test.dir <- "tests/testthat"
params   <- yaml.load_file("templates/params.yaml")

# link/url tests ----------------------------------------------------------
template <- readLines("templates/test-template.r")

for (p in params) {
  writeLines(
    whisker::whisker.render(template, data = p),
    file.path(test.dir, sprintf("test-links-%s.r", p$db))
  )
}

# tag substitution tests --------------------------------------------------
template <- readLines("templates/test-template-tags.r")

for (p in params) {
  if (is.null(p$magic_tags)) next

  # create text representations of values
  p$magic_tags$ids  <- deparse(dput(p$magic_tags$ids), width.cutoff = 500L)
  p$magic_tags$tags <- lapply(p$magic_tags$tags,
  function(x) {
    x$values <- deparse(dput(x$values), width.cutoff = 500L)
    x$values <- tidy_source(text = x$values, width.cutoff = 40)$text.tidy
    x
  })

  writeLines(
    whisker::whisker.render(template, data = p),
    file.path(test.dir, sprintf("test-tags-%s.r", p$db))
  )
}
