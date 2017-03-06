# check url several times before giving up
check_url_status <- function(url, n = 3) {
  while (n > 0) {
    response <- httr::GET(url)
    code <- httr::status_code(response)
    if (code == 200) break
    Sys.sleep(3)
    n <- n - 1
  }
  code
}
