context("Gene Ontology links")

id  <- "GO:0005539"
ref <- "http://amigo.geneontology.org/amigo/term/GO:0005539"

test_that("GO ID validation", {
  expect_silent(check_id(id, "GO"))
  expect_error(check_id("0005539", "GO"))
})

test_that("GO URL", {
  expect_match(go_url(id), ref)
})
