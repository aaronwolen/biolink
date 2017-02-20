#' Construct hypertext links
#'
#' Convert a bare url to a valid hyperlink formatted for a Markdown, HTML or
#' LaTeX document.
#'
#' @param url URL where you want the link to point
#' @param text displayed text
#' @param title link title, often used in tooltips
#' @param format generate links using `"html"`, `"markdown"` or `"latex"` syntax
#'
#' @export
#' @examples
#' build_link("https://r-project.org", "R", "The R Project")
build_link <- function(url, text = NULL, title = NULL, format = "markdown") {
  format <- match.arg(tolower(format), c("markdown", "html", "latex"))
  switch(format,
         html = html_link(url, text, title),
         markdown = md_link(url, text, title),
         latex = latex_link(url, text))
}

html_link <- function(url, text = NULL, title = NULL) {
  link <- paste0("<a href=", dquote(url))
  if (!is.null(title)) link <- paste0(link, " title=", dquote(title))
  link <- paste0(link, ">")
  if (is.null(text)) {
    link <- paste0(link, url, "</a>")
  } else {
    link <- paste0(link, text, "</a>")
  }
  link
}

md_link <- function(url, text = NULL, title = NULL) {
  if (is.null(text)) {
    return(paste0("<", url, ">"))
  } else {
    link <- paste0("[", text, "](", url)
  }
  if (is.null(title)) {
    link <- paste0(link, ")")
  } else {
    link <- paste0(link, " ", dquote(title), ")")
  }
  link
}

latex_link <- function(url, text = NULL) {
  link <- paste0("{", url, "}")
  if (is.null(text)) {
    link <- paste0("\\url", link)
  } else {
    link <- paste0("\\href", link, "{", text, "}")
  }
  link
}
