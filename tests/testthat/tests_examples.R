library(testthat)
context("Dimensions of data")

# candidates

test_that("number of columns in candidates df is correct", {
  expect_equal(ncol(candidates), 15)
})


# committees
#
test_that("number of rows in committees df is correct", {
  expect_equal(nrow(committees), 17654)
})

# #results
test_that("house results are accurate", {
  expect_equal(
    house_results %>%
      pull(cand_id) %>%
      unique() %>%
      length(),
    1972
  )
  expect_gt(
     house_results %>%
        group_by(state, district_id) %>%
        count() %>%
        nrow(),
     438
  )
  # territories
  expect_equal(
     house_results %>%
        filter(!state %in% state.abb) %>%
        pull(state) %>%
        unique() %>%
        length(),
     6
  )
})
#
#
# #committee_contributions
test_that("Minumum number of contributions from a committee is 1", {
  expect_equal(min(committee_contributions$number_of_contributions), 1)
})
#
test_that("Maximum number of contributions from a committee is 63047", {
  expect_equal(max(committee_contributions$number_of_contributions), 63047)
})
#
# #individuals

test_that("number of rows in individuals df is correct", {
  expect_gt(nrow(individuals), 0)
})
#
#
# #Tests from Vignettes
#
#
#
# #Join tests
# #candidates and committees
# #individuals and committees
# #results and committee contributions
