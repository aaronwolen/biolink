context("{{title}} tag substitution")

{{#data_tags}}
# nolint start
ids <- {{{ids}}}
{{#tags}}
{{name}}s <- {{{values}}}
{{/tags}}
# nolint end
{{/data_tags}}

{{#data_tags}}test_that("{{title}} tag retrieval", {
  skip_on_cran()
{{#tags}}
  expect_equal(query_{{db}}(ids, "{{name}}"), {{name}}s)
{{/tags}}
;})
{{/data_tags}}


{{#data_tags}}
test_that("{{title}} tag substitution", {
  skip_on_cran()
  url <- "{{ref_url}}"
  id <- ids[1]
  {{#tags}}


  ref  <- sprintf(hl, url, {{name}}s[1])
  link <- link_{{db}}(id, "<{{name}}>", format = "html")
  expect_equal(link, ref)
  {{/tags}}
;}){{/data_tags}}
