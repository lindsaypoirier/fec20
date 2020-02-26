library(tidyverse)
library(stringr)
library(usethis)

#reading files
# candidates <- read.delim("~/Downloads/cn.txt", header = FALSE, sep = "|", quote="") %>%
#   write_csv(path = "data-raw/candidates.csv")

#data tidying
candidates <- read_csv("data-raw/candidates.csv") %>%
  rename(cand_id          = V1,
         cand_name        = V2,
         cand_pty_aff     = V3,
         cand_election_yr = V4,
         cand_office_st   = V5,
         cand_office      = V6,
         cand_office_dis  = V7,
         cand_ici         = V8,
         cand_status      = V9,
         cand_pcc         = V10,
         cand_sti         = V11,
         cand_st2         = V12,
         cand_city        = V13,
         cand_st          = V14,
         cand_zip         = V15
  ) %>%
  mutate(cand_pty_aff     = as.character(cand_pty_aff),
         cand_election_yr = as.integer(cand_election_yr),
         cand_office_st   = as.character(cand_office_st),
         cand_office      = as.character(cand_office),
         cand_office_dis  = as.integer(cand_office_dis),
         cand_ici         = as.character(cand_ici),
         cand_status      = as.character(cand_status),
         cand_st          = as.character(cand_st))

usethis::use_data(candidates, overwrite = TRUE)
