context("NCBI PubMed tag substitution")

# nolint start
ids      <- c("22066989", "20600793")
years    <- c("2012", "2010")
journals <- c("FEMS immunology and medical microbiology",
              "Microbial pathogenesis")
titles   <- c("Monoubiquitinated proteins decorate the Anaplasma phagocytophilum-occupied vacuolar membrane.",
              "Anaplasma phagocytophilum APH_0032 is expressed late during infection and localizes to the pathogen-occupied vacuolar membrane.")
# nolint end

test_that("PubMed tag retrieval", {
  expect_equal(pubmed_query(ids, "year"),    years)
  expect_equal(pubmed_query(ids, "journal"), journals)
  expect_equal(pubmed_query(ids, "title"),   titles)
})

test_that("PubMed tag substitution", {
  id <- ids[1]
  text  <- years[1]
  title <- titles[1]
  ref   <- sprintf(hlt, pubmed_url(id), title, text)
  link  <- pubmed_link(id, "<year>", "<title>", format = "html")
  expect_match(link, ref)
})
