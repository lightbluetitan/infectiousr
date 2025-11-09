# infectiousR - Access Infectious and Epidemiological Data via 'disease.sh API'
# Version 0.1.2
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# get_us_states_covid_stats

library(testthat)

library(infectiousR)


# Test suite for get_us_states_covid_stats()

# Helper function to check if API is reachable
can_reach_api <- function() {
  tryCatch({
    response <- httr::GET("https://disease.sh/", httr::timeout(5))
    return(response$status_code == 200)
  }, error = function(e) {
    return(FALSE)
  })
}

# ============================================================================
# Tests that run on CRAN (no internet required)
# ============================================================================

test_that("get_us_states_covid_stats function exists", {
  expect_true(is.function(get_us_states_covid_stats))
})

test_that("get_us_states_covid_stats has no required parameters", {
  args <- formals(get_us_states_covid_stats)
  expect_equal(length(args), 0)
})

# ============================================================================
# Tests that require internet (skipped on CRAN)
# ============================================================================

test_that("get_us_states_covid_stats returns correct structure", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_us_states_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)

  expected_cols <- c("state", "cases", "todayCases", "deaths",
                     "todayDeaths", "active", "population")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("get_us_states_covid_stats returns multiple states", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_us_states_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_true(nrow(result) >= 50)
})

test_that("get_us_states_covid_stats basic columns have correct types", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_us_states_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_type(result$state, "character")
  expect_true(is.numeric(result$cases))
  expect_true(is.numeric(result$deaths))
})

test_that("get_us_states_covid_stats numeric values are valid", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_us_states_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_true(all(result$cases >= 0 | is.na(result$cases)))
  expect_true(all(result$deaths >= 0 | is.na(result$deaths)))
  expect_true(all(result$population >= 0 | is.na(result$population)))
})

test_that("get_us_states_covid_stats no duplicate state names", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_us_states_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_false(any(duplicated(result$state)))
})

test_that("get_us_states_covid_stats does not throw errors", {
  skip_on_cran()

  result <- expect_no_error(
    get_us_states_covid_stats()
  )

  expect_true(is.null(result) || is.data.frame(result))
})



