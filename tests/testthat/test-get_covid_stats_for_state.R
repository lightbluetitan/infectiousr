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

# get_covid_stats_for_state


library(testthat)

library(infectiousR)


# Test suite for get_covid_stats_for_state()

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

test_that("get_covid_stats_for_state function exists", {
  expect_true(is.function(get_covid_stats_for_state))
})

test_that("get_covid_stats_for_state validates missing states parameter", {
  expect_error(
    get_covid_stats_for_state(),
    "You must provide at least one state name"
  )

  expect_error(
    get_covid_stats_for_state(""),
    "You must provide at least one state name"
  )
})

# ============================================================================
# Tests that require internet (skipped on CRAN)
# ============================================================================

test_that("get_covid_stats_for_state returns correct structure for single state", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("California")
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 1)

  expected_cols <- c("state", "updated", "cases", "todayCases",
                     "deaths", "todayDeaths", "population")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("get_covid_stats_for_state columns have correct types", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("Texas")
  skip_if(is.null(result), "API returned NULL")

  expect_type(result$state, "character")
  expect_s3_class(result$updated, "POSIXct")
  expect_true(is.numeric(result$cases))
  expect_true(is.numeric(result$deaths))
  expect_true(is.numeric(result$population))
})

test_that("get_covid_stats_for_state works with lowercase state names", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("california")
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 1)
})

test_that("get_covid_stats_for_state works with multiple states", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("New York,Texas")
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) >= 1)
})

test_that("get_covid_stats_for_state numeric values are valid", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("Florida")
  skip_if(is.null(result), "API returned NULL")

  expect_true(all(result$cases >= 0 | is.na(result$cases)))
  expect_true(all(result$todayCases >= 0 | is.na(result$todayCases)))
  expect_true(all(result$deaths >= 0 | is.na(result$deaths)))
  expect_true(all(result$todayDeaths >= 0 | is.na(result$todayDeaths)))
  expect_true(all(result$population >= 0 | is.na(result$population)))
})

test_that("get_covid_stats_for_state yesterday parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("Illinois", yesterday = TRUE)
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 1)
})

test_that("get_covid_stats_for_state returns NULL for invalid state", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_for_state("InvalidState123")
  expect_null(result)
})

test_that("get_covid_stats_for_state does not throw errors", {
  skip_on_cran()

  result <- expect_no_error(
    get_covid_stats_for_state("SomeState")
  )

  expect_true(is.null(result) || is.data.frame(result))
})
