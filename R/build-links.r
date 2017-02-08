#' Construct hypertext links
#' @param url URL where you want the link to point
#' @param text displayed text
#' @param title link title, often used in tooltips
#' @param format generate links using \code{"html"} or \code{"markdown"} syntax
#'
#' @export
#' @examples
#' html_link("https://r-project.org", "R", "The R Project")
build_link <- function(url, text = NULL, title = NULL, format = "markdown") {
  format <- match.arg(tolower(format), c("markdown", "html"))
  switch(format,
         html = html_link(url, text, title),
         markdown = md_link(url, text, title))
}

#' @export
#' @describeIn build_link construct HTML hypertext links
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

#' @export
#' @describeIn build_link construct markdown hypertext links
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