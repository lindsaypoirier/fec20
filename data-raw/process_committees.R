library(tidyverse)
library(usethis)

usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2016/cm16.zip",
  destdir = tempdir(), cleanup = TRUE
)

committee_path <- fs::path(tempdir(), "cm16", "cm.txt")

committee_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/cm_header_file.csv") %>%
  names() %>%
  tolower()

committees <- read_delim(
  committee_path,
  col_names = committee_names,
  delim = "|"
)

usethis::use_data(committees, overwrite = TRUE)
