library(tidyverse)

file <- fs::path(tempdir(), "results24.xlsx")

downloader::download(
  "https://www.fec.gov/documents/4228/federalelections2020.xlsx",
  destfile = file
)

results_house <- readxl::read_excel(file, sheet = 13) %>%
   janitor::clean_names() %>%
   # delete unneccesary variables
   select(-x1, -state, -total_votes, -candidate_name, -contains("combined"),
          -ends_with("_la"), -candidate_name_last, -candidate_name_first,
          -pe_winner_indicator) %>%
   rename(
     state = state_abbreviation,
     cand_id = fec_id,
     district_id = district,
     incumbent = i_incumbent_indicator,
     won = ge_winner_indicator,
   ) %>%
  filter(cand_id != 'n/a', !str_detect(cand_id, "FULL TERM")) %>%
  mutate(
    primary_votes = parse_number(primary_votes),
    general_votes = parse_number(general_votes),
    won = won == "W",
    incumbent = incumbent == "(I)",
    party = if_else((str_trim(party) == "R"), "REP", party),
    party = if_else((str_trim(party) == "D"), "DEM", party)
  ) %>%
  replace_na(list(won = FALSE, incumbent = FALSE))

usethis::use_data(results_house, overwrite = TRUE)

# Senate

results_senate <- readxl::read_excel(file, sheet = 12
  ) %>%
  janitor::clean_names() %>%
  # delete unneccesary variables
  select(-x1, -state, -district, -total_votes, -candidate_name, -contains("combined"),
         -ends_with("_la"), -candidate_name_last, -candidate_name_first, -runoff_votes, -runoff_percent, -pe_winner_indicator) %>%
  rename(
    state = state_abbreviation,
    cand_id = fec_id,
    incumbent = i_incumbent_indicator,
    won = ge_winner_indicator
  ) %>%
  mutate(party = str_trim(party)) %>%
  filter(cand_id != 'n/a') %>%
  mutate(
    primary_votes = parse_number(primary_votes),
    won = won == "W",
    incumbent = incumbent == "(I)",
    party = if_else((str_trim(party) == "R"), "REP", party),
    party = if_else((str_trim(party) == "D"), "DEM", party)
  ) %>%
  replace_na(list(won = FALSE, incumbent = FALSE))

usethis::use_data(results_senate, overwrite = TRUE)

# President

results_president <- readxl::read_excel(file, sheet = 9) %>%
  janitor::clean_names() %>%
  # delete unneccesary variables
  select(-x1, -state, -general_election_date, -total_votes, -total_votes_number,
         -last_name_first, -last_name, -first_name, -combined_ge_party_totals_ny,
         -combined_percent_ny, -electoral_votes)%>%
  rename(
    state = state_abbreviation,
    cand_id = fec_id,
    won = winner_indicator,
    general_votes = general_results
  ) %>%
  filter(cand_id != 'n/a') %>%
  mutate(
    won = won == "W",
  ) %>%
  replace_na(list(won = FALSE))

usethis::use_data(results_president, overwrite = TRUE)
