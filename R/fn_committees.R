#' Committees metadata
#'
#' \code{all_committees} returns a dataframe about the committees master data
#'
#' @param n_max integer specifying the max amount of entries in the dataset, defaults to the possible maximum
#' @return The entire dataframe. More information about variables is at `?committees`.
#' @examples
#' \dontrun{all_committees()}
#' \dontrun{all_committees(n_max = 250)}
#' @export

all_committees <- function(n_max = Inf) {
  dir <- usethis::use_zip(
    "https://www.fec.gov/files/bulk-downloads/2016/cm16.zip",
    destdir = tempdir(), cleanup = TRUE
  )

  committee_path <- fs::path(dir, "cm.txt")

  committee_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/cm_header_file.csv") %>%
    names() %>%
    tolower()

  committees <- vroom::vroom(
    committee_path,
    col_names = committee_names,
    delim = "|",
    n_max = n_max
  )
  return(committees)
}
