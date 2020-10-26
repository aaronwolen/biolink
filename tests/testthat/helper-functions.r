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

# avoid entrez's api rate limit of 3/sec by sleeping when no API key is found
sleep_if_keyless <- function() {
  if (!nzchar(Sys.getenv("ENTREZ_KEY"))) Sys.sleep(1)
}
