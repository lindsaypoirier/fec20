#' Candidates Master metadata function
#'
#' \code{all_candidates} returns a dataframe about the candidates master data
#'
#' @param n_max integer specifying the max amount of entries in the dataset, defaults to the possible maximum
#' @return The entire dataframe. More information about variables is at `?candidates`.
#' @examples
#' \dontrun{all_candidates()}
#' \dontrun{all_candidates(n_max = 250)}
#' @import dplyr
#' @import readr
#' @export

all_candidates <- function(n_max = Inf) {

  cand_dir <- usethis::use_zip(
    "https://www.fec.gov/files/bulk-downloads/2016/cn16.zip",
    destdir = tempdir(), cleanup = TRUE
  )

  cand_path <- fs::path(cand_dir, "cn.txt")

  cand_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/cn_header_file.csv") %>%
    names() %>%
    tolower()

  candidates_all <- vroom::vroom(
    cand_path,
    col_names = cand_names,
    delim = "|", n_max = n_max
  )
  return(candidates_all)
}
