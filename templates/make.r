# Generate testthat tests for url/link validation
library(yaml)
library(whisker)

test.dir <- "tests/testthat"

params   <- yaml.load_file("templates/params.yaml")
template <- readLines("templates/test-template.r")

for (p in params) {
  writeLines(
    whisker::whisker.render(template, data = p),
    file.path(test.dir, sprintf("test-links-%s.r", p$db))
  )
}