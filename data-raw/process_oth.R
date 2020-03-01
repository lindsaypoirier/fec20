library(tidyverse)

oth_dir <- usethis::use_zip(
  "https://www.fec.gov/files/bulk-downloads/2016/oth16.zip",
  destdir = tempdir(), cleanup = TRUE
)

oth_path <- fs::path(oth_dir, "itoth.txt")

oth_names <- read_csv("https://www.fec.gov/files/bulk-downloads/data_dictionaries/oth_header_file.csv") %>%
  names() %>%
  tolower()

oth_all <- read_delim(
  oth_path,
  col_names = oth_names,
  col_types = cols(
    zip_code = col_character(),
    other_id = col_character(),
    memo_cd = col_character(),
    memo_text = col_character(),
    sub_id = col_character()
  ),
  delim = "|"
)

oth <- oth_all %>%
  select(-image_num, -sub_id, -memo_text, -memo_cd, -file_num) %>%
  sample_n(1e5) %>%
  mutate(
    transaction_dt = lubridate::mdy(transaction_dt)
  )

usethis::use_data(oth, overwrite = TRUE)
