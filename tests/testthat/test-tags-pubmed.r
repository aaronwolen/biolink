context("PubMed tag substitution")

ids <- c("22066989", "20600793")
years <- c("2012", "2010")
journals <- c("FEMS immunology and medical microbiology", 
    "Microbial pathogenesis")
titles <- c("Monoubiquitinated proteins decorate the Anaplasma phagocytophilum-occupied vacuolar membrane.", 
    "Anaplasma phagocytophilum APH_0032 is expressed late during infection and localizes to the pathogen-occupied vacuolar membrane.")


test_that("PubMed tag retrieval", {
  expect_equal(pubmed_query(ids, "year"), years)
  expect_equal(pubmed_query(ids, "journal"), journals)
  expect_equal(pubmed_query(ids, "title"), titles)
;})

test_that("PubMed tag substitution", {
  url <- "https://www.ncbi.nlm.nih.gov/pubmed/22066989"
  id <- ids[1]
  
  ref  <- sprintf(hl, url, years[1])
  link <- pubmed_link(id, "<year>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, journals[1])
  link <- pubmed_link(id, "<journal>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, titles[1])
  link <- pubmed_link(id, "<title>", format = "html")
  expect_equal(link, ref)

;})
