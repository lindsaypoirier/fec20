candidates <- function(n_max = Inf) {

  cand_dir <- usethis::use_zip(
    "https://www.fec.gov/files/bulk-downloads/2016/cn16.zip",
    destdir = tempdir(), cleanup = TRUE
  )

  cand_path <- fs::path(cand_dir, "cn.txt")

  cand_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/cn_header_file.csv") %>%
    names() %>%
    tolower()

  candidates_all <- read_delim(
    cand_path,
    col_names = cand_names,
    delim = "|", n_max = n_max
  )
  return(candidates_all)
}

