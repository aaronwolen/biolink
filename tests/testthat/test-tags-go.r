context("Gene Ontology tag substitution")

# nolint start
ids <- c("GO:0042417", "GO:0044444")
names <- c("dopamine metabolic process", "cytoplasmic part")
definitions <- c("The chemical reactions and pathways involving dopamine, a catecholamine neurotransmitter and a metabolic precursor of noradrenaline and adrenaline.", 
    "Any constituent part of the cytoplasm, all of the contents of a cell excluding the plasma membrane and nucleus, but including other subcellular structures.")
# nolint end
test_that("Gene Ontology tag retrieval", {
  expect_equal(query_go(ids, "name"), names)
  expect_equal(query_go(ids, "definition"), definitions)
;})

test_that("Gene Ontology tag substitution", {
  url <- "http://amigo.geneontology.org/amigo/term/GO:0042417"
  id <- ids[1]

  ref  <- sprintf(hl, url, names[1])
  link <- link_go(id, "<name>", format = "html")
  expect_equal(link, ref)

  ref  <- sprintf(hl, url, definitions[1])
  link <- link_go(id, "<definition>", format = "html")
  expect_equal(link, ref)
;})
