library(tidyverse)
library(usethis)

usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2016/cn16.zip",
  destdir = tempdir(), cleanup = TRUE
)

cand_path <- fs::path(tempdir(), "cn16", "cn.txt")

cand_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/cn_header_file.csv") %>%
  names() %>%
  tolower()

candidates <- read_delim(
  cand_path,
  col_names = cand_names,
  delim = "|"
)

usethis::use_data(candidates, overwrite = TRUE)
