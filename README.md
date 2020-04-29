
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fec16 <img src="data-raw/Sticker/hex_fec16.png" align="right" height=140/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN
status](https://r-pkg.org/badges/version/fec16)](https://CRAN.R-project.org/package=fec16)
[![Travis-CI Build
Status](https://travis-ci.org/baumer-lab/fec16.svg?branch=master)](https://travis-ci.org/baumer-lab/fec16)
<!-- badges: end -->

**fec16** contains sample data from the Federal Election Commission
(FEC) website pertaining to candidates, committees, results,
contributions from committees and individuals, and other financial data
for the United States 2015-2016 election cycle. Additionally, for the
datasets that are included as samples, the package includes functions
that import the full versions.

## Installation

`fec16` is hosted on GitHub and call be installed by running the
following:

``` r
devtools::install_github("baumer-lab/fec16")
```

``` r
library(fec16)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: readr
```

## Datasets Included

### Full Datasets

  - `campaigns`: the house/senate current campaigns
  - `results_house`: the house results of the 2016 general presidential
    election
  - `results_senate`: the senate results of the 2016 general
    presidential election
  - `results_president`: the final results of the 2016 general
    presidential election

### Sample Datasets (with 1000 rows each)

  - `candidates`: candidates registered with the FEC during the
    2015-2016 election cycle
  - `committees`: committees registered with the FEC during the
    2015-2016 election cycle
  - `individuals`: individual contributions to candidates/committees
    during the 2016 general presidential election
  - `contributions`: candidates and their contibutions from committees
    during the 2016 general election
  - `expenditures`: the operating expenditures
  - `transactions`: transactions between committees
  - `pac`: Political Action Committee (PAC) and party summary financial
    information

## Functions Included

  - `all_candidates`
  - `all_committees`
  - `all_individuals`
  - `all_contributions`
  - `all_expenditures`
  - `all_transactions`
  - `all_pac`

## Examples

### Data Wrangling

`fec16` can be used to summarize data in order see how many candidates
are running for elections (in all offices) for the two major parties:

``` r
library(fec16)
library(dplyr)

all_candidates() %>%
  filter(cand_pty_affiliation %in% c("REP", "DEM")) %>%
  group_by(cand_pty_affiliation) %>%
  summarise(size = n())
#> ✔ Downloading from 'https://www.fec.gov/files/bulk-downloads/2016/cn16.zip'
#> Downloaded: 0.02 MB  (6%)Downloaded: 0.02 MB  (6%)Downloaded: 0.02 MB  (6%)Downloaded: 0.02 MB  (6%)Downloaded: 0.03 MB  (12%)Downloaded: 0.03 MB  (12%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.03 MB  (13%)Downloaded: 0.05 MB  (19%)Downloaded: 0.05 MB  (19%)Downloaded: 0.05 MB  (19%)Downloaded: 0.05 MB  (19%)Downloaded: 0.05 MB  (19%)Downloaded: 0.05 MB  (19%)Downloaded: 0.06 MB  (25%)Downloaded: 0.06 MB  (25%)Downloaded: 0.07 MB  (25%)Downloaded: 0.07 MB  (25%)Downloaded: 0.07 MB  (25%)Downloaded: 0.07 MB  (25%)Downloaded: 0.08 MB  (31%)Downloaded: 0.08 MB  (31%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.08 MB  (32%)Downloaded: 0.10 MB  (38%)Downloaded: 0.10 MB  (38%)Downloaded: 0.10 MB  (38%)Downloaded: 0.10 MB  (38%)Downloaded: 0.11 MB  (44%)Downloaded: 0.11 MB  (44%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.12 MB  (45%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.13 MB  (51%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.15 MB  (57%)Downloaded: 0.16 MB  (63%)Downloaded: 0.16 MB  (63%)Downloaded: 0.17 MB  (64%)Downloaded: 0.17 MB  (64%)Downloaded: 0.17 MB  (64%)Downloaded: 0.17 MB  (64%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.18 MB  (70%)Downloaded: 0.20 MB  (76%)Downloaded: 0.20 MB  (76%)Downloaded: 0.20 MB  (77%)Downloaded: 0.20 MB  (77%)Downloaded: 0.20 MB  (77%)Downloaded: 0.20 MB  (77%)Downloaded: 0.21 MB  (83%)Downloaded: 0.21 MB  (83%)Downloaded: 0.22 MB  (83%)Downloaded: 0.22 MB  (83%)Downloaded: 0.22 MB  (83%)Downloaded: 0.22 MB  (83%)Downloaded: 0.22 MB  (83%)Downloaded: 0.22 MB  (83%)Downloaded: 0.23 MB  (89%)Downloaded: 0.23 MB  (89%)Downloaded: 0.23 MB  (89%)Downloaded: 0.23 MB  (89%)Downloaded: 0.25 MB  (95%)Downloaded: 0.25 MB  (95%)Downloaded: 0.25 MB  (96%)Downloaded: 0.25 MB  (96%)Downloaded: 0.25 MB  (96%)Downloaded: 0.25 MB  (96%)Downloaded: 0.25 MB  (96%)Downloaded: 0.25 MB  (96%)Downloaded: 0.26 MB  (100%)Downloaded: 0.26 MB  (100%)Downloaded: 0.26 MB  (100%)Downloaded: 0.26 MB  (100%)
#> ✔ Download stored in '/var/folders/g3/26yd9p2j2fj8yzr1lnqhnwmc0000gn/T/RtmpjpcmBD/cn16.zip'
#> ✔ Unpacking ZIP file into 'cn16/' (1 files extracted)
#> ✔ Deleting 'cn16.zip'
#> # A tibble: 2 x 2
#>   cand_pty_affiliation  size
#>   <chr>                <int>
#> 1 DEM                   2242
#> 2 REP                   2677
```

#### Joining Data

We can join any of the datasets using `cand_id`. Each dataset with the
exception of the `individuals` dataset contains a possible joining key:
`cand_id`.

Here is an example of calculating how many candidates are in each of the
two major parties: Democratic (DEM) and Republican (REP), based on their
committee type:

``` r
# cand_cmte <- candidates %>%
#   full_join(committees, by = "cand_id") %>%
#   filter(cand_pty_affiliation %in% c("REP", "DEM")) %>%
#   group_by(cand_pty_affiliation, cmte_tp) %>%
#   summarise(n = n()) %>%
#   tidyr::drop_na(cmte_tp)
# head(cand_cmte)
```

### Data Visualization

And extending that to create a visualization to see the results easily.

``` r
library(ggplot2)
# ggplot(cand_cmte, aes(x = cmte_tp, y = n, fill = cand_pty_affiliation)) +
#   geom_col(position = "dodge") +
#   labs(
#     title = "Bar Chart of Total Committees by Type and Party",
#     x = "Committee Type", y = "Count", fill = "Candidate Party Affiliation"
#   )
```

## Contributors

  - [Marium Tapal](https://github.com/mariumtapal)
  - [Irene Ryan](https://github.com/ireneryan)
  - [Rana Gahwagy](https://github.com/ranawg)
  - [Benjamin S. Baumer](https://github.com/beanumber)
