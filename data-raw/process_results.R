library(tidyverse)
library(stringr)
library(usethis)
library(janitor)
library(purrr)

# read data and tame dat
# results <- read_csv("data-raw/results16.csv") %>%
#   clean_names() %>%
#   # delete unneccesary variables
#   select(-state, -total_votes, -total_votes_number) %>%
#   rename( state = state_abbreviation,
#           cand_id = fec_id ) %>%
#   mutate(state                 = as.character(state),
#          winner_indicator      = as.character(winner_indicator),
#          general_election_date = as.Date(general_election_date, "%m/%d/%y"),
#          party                 = as.character(party),
#          #remove percent sign
#          general_percent       = map(general_percent, ~gsub("%", "", .x)),
#          general_percent       = as.numeric(general_percent)
#          )

# change NA to FALSE
results <- results %>% replace_na(list(winner_indicator = FALSE))

# change W to TRUE
results$winner_indicator[results$winner_indicator == "W"] <- TRUE

# change from character to logical
results <- results %>% mutate(winner_indicator = as.logical(winner_indicator))

usethis::use_data(results, overwrite = TRUE)
