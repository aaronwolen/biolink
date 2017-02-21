context("{{title}} tag substitution")

{{#magic_tags}}
# nolint start
ids <- {{{ids}}}
{{#tags}}
{{name}}s <- {{{values}}}
{{/tags}}
# nolint end
{{/magic_tags}}

{{#magic_tags}}test_that("{{title}} tag retrieval", {
{{#tags}}
  expect_equal({{db}}_query(ids, "{{name}}"), {{name}}s)
{{/tags}}
;})
{{/magic_tags}}


{{#magic_tags}}
test_that("{{title}} tag substitution", {
  url <- "{{ref_url}}"
  id <- ids[1]
  {{#tags}}


  ref  <- sprintf(hl, url, {{name}}s[1])
  link <- {{db}}_link(id, "<{{name}}>", format = "html")
  expect_equal(link, ref)
  {{/tags}}
;}){{/magic_tags}}
