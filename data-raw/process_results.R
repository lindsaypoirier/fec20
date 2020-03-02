library(tidyverse)



file <- fs::path(tempdir(), "results16.xlsx")

downloader::download(
  "https://transition.fec.gov/pubrec/fe2016/federalelections2016_000.xlsx",
  destfile = file
)

house_results <- readxl::read_excel(file, sheet = 13) %>%
   janitor::clean_names() %>%
   # delete unneccesary variables
   select(-x1, -state, -total_votes, -candidate_name, -contains("combined"), -ends_with("_la")) %>%
   rename(
     state = state_abbreviation,
     cand_id = fec_id_number,
     name_last = candidate_name_last,
     name_first = candidate_name_first,
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

# Senate

senate_results <- readxl::read_excel(file, sheet = 12
  ) %>%
  janitor::clean_names() %>%
  # delete unneccesary variables
  select(-x1, -state, -d, -total_votes, -candidate_name, -contains("combined"), -ends_with("_la")) %>%
  rename(
    state = state_abbreviation,
    cand_id = fec_id_number,
    name_last = candidate_name_last,
    name_first = candidate_name_first,
    general_votes = general_results,
    incumbent = i,
    won = ge_winner_indicator
  ) %>%
  filter(cand_id != 'n/a') %>%
  mutate(
    primary_votes = parse_number(primary_votes),
    won = won == "W",
    incumbent = incumbent == "(I)"
  ) %>%
  replace_na(list(won = FALSE, incumbent = FALSE))

usethis::use_data(senate_results, overwrite = TRUE)

# President

president_results <- readxl::read_excel(file, sheet = 9) %>%
  janitor::clean_names() %>%
  # delete unneccesary variables
  select(-x1, -state, -general_election_date, -total_votes, -total_votes_number, -last_name_first) %>%
  rename(
    state = state_abbreviation,
    cand_id = fec_id,
    name_last = last_name,
    name_first = first_name,
    general_votes = general_results,
    won = winner_indicator
  ) %>%
  filter(cand_id != 'n/a') %>%
  mutate(
    won = won == "W",
  ) %>%
  replace_na(list(won = FALSE))

usethis::use_data(president_results, overwrite = TRUE)
