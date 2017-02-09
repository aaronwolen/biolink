context("Gene Ontology links")

id  <- "GO:0005539"
ref <- "http://amigo.geneontology.org/amigo/term/GO:0005539"

test_that("GO ID validation", {
  expect_silent(check_id(id, "go"))
  expect_error(check_id("0005539", "go"))
})

test_that("GO URL", {
  expect_match(go_url(id), ref)
})


context("KEGG Pathway links")

id  <- "hsa04915"
ref <- "http://www.genome.jp/dbget-bin/www_bget?pathway:hsa04915"

test_that("KEGG ID validation", {
  expect_silent(check_id(id, "kegg"))
  expect_error(check_id("04915", "kegg"))
})

test_that("KEGG URL", {
  expect_match(kegg_url(id), ref, fixed = TRUE)
})


context("NCBI PubMed links")

id  <- "28166537"
ref <- "https://www.ncbi.nlm.nih.gov/pubmed/28166537"

test_that("PMID validation", {
  expect_silent(check_id(id, "pmid"))
  expect_error(check_id("pmc28166537", "pmid")) # no characters
  expect_error(check_id("28", "pmid"))          # too short
  expect_error(check_id("281665370", "pmid"))   # too long
})

test_that("PubMed URL", {
  expect_match(pubmed_url(id), ref, fixed = TRUE)
})
