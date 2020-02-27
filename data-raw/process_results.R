library(tidyverse)

downloader::download(
  "https://transition.fec.gov/pubrec/fe2016/federalelections2016_000.xlsx",
  destfile = fs::path(tempdir(), "results16.xlsx")
)

house_results <- readxl::read_excel(fs::path(tempdir(), "results16.xlsx"), sheet = 13) %>%
   janitor::clean_names() %>%
   # delete unneccesary variables
   select(-x1, -state, -total_votes, -contains("combined")) %>%
   rename(
     state = state_abbreviation,
     cand_id = fec_id_number,
     district_id = d,
     incumbent = i,
     won = ge_winner_indicator
   ) %>%
  filter(cand_id != 'n/a', !str_detect(cand_id, "FULL TERM")) %>%
  mutate(
    primary_votes = parse_number(primary_votes),
    general_votes = parse_number(general_votes),
    won = won == "W",
    incumbent = incumbent == "(I)"
  ) %>%
  replace_na(list(won = FALSE, incumbent = FALSE))

usethis::use_data(house_results, overwrite = TRUE)
