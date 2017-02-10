context("NCBI PubMed links")

id  <- "22066989"
url <- "https://www.ncbi.nlm.nih.gov/pubmed/22066989"

test_that("Reference PubMed URL is valid", {
  expect_equal(httr::status_code(httr::GET(url)), 200)
})

test_that("PMID validation", {
  expect_silent(check_id(id, "pmid"))
  expect_error(check_id("pmc22066989", "pmid")) # no characters
  expect_error(check_id("22", "pmid"))          # too short
  expect_error(check_id("220669890", "pmid"))   # too long
})

test_that("PubMed URL", {
  expect_match(pubmed_url(id), url, fixed = TRUE)
})

test_that("PubMed md link", {
  ref  <- sprintf(ml, id, url)
  link <- pubmed_link(id, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link + text", {
  ref  <- sprintf(ml, text, url)
  link <- pubmed_link(id, text, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed md link + text + title", {
  ref  <- sprintf(mlt, text, url, title)
  link <- pubmed_link(id, text, title, format = "markdown")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link", {
  ref  <- sprintf(hl, url, id)
  link <- pubmed_link(id, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link + text", {
  ref  <- sprintf(hl, url, text)
  link <- pubmed_link(id, text, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

test_that("PubMed html link + text + title", {
  ref  <- sprintf(hlt, url, title, text)
  link <- pubmed_link(id, text, title, format = "html")
  expect_match(link, ref, fixed = TRUE)
})

context("NCBI PubMed tag substitution")

# nolint start
ids      <- c(id, "20600793")
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
  text  <- years[1]
  title <- titles[1]
  ref   <- sprintf(hlt, url, title, text)
  link  <- pubmed_link(id, "<year>", "<title>", format = "html")
  expect_match(link, ref)
})
