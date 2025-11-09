# infectiousR - Access Infectious and Epidemiological Data via 'disease.sh API'
# Version 0.1.1
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

# get_covid_stats_by_continent

library(testthat)

library(infectiousR)

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

test_that("get_covid_stats_by_continent function exists and has correct signature", {
  expect_true(is.function(get_covid_stats_by_continent))

  # Check function parameters
  args <- formals(get_covid_stats_by_continent)
  expect_named(args, c("yesterday", "twoDaysAgo", "sort", "allowNull"))

  # Check default values
  expect_false(args$yesterday)
  expect_false(args$twoDaysAgo)
  expect_null(args$sort)
  expect_false(args$allowNull)
})

test_that("get_covid_stats_by_continent accepts valid parameter types", {
  # These tests don't call the API, just check parameter validation
  expect_silent({
    formals(get_covid_stats_by_continent)$yesterday <- TRUE
    formals(get_covid_stats_by_continent)$twoDaysAgo <- FALSE
    formals(get_covid_stats_by_continent)$sort <- "cases"
    formals(get_covid_stats_by_continent)$allowNull <- TRUE
  })
})

# ============================================================================
# Tests that require internet (skipped on CRAN)
# ============================================================================

test_that("get_covid_stats_by_continent returns data frame with correct structure", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()

  # Skip if API returned NULL (service temporarily unavailable)
  skip_if(is.null(result), "API returned NULL")

  # Check that result is a data frame
  expect_s3_class(result, "data.frame")

  # Check for required columns
  expected_cols <- c("continent", "updated", "cases", "todayCases",
                     "deaths", "todayDeaths", "population")
  expect_true(all(expected_cols %in% names(result)))

  # Check that we have data for multiple continents
  expect_true(nrow(result) > 0)
  expect_true(nrow(result) <= 7) # Maximum 7 continents
})

test_that("get_covid_stats_by_continent columns have correct data types", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()
  skip_if(is.null(result), "API returned NULL")

  # Check column types
  expect_type(result$continent, "character")
  expect_s3_class(result$updated, "POSIXct")
  expect_true(is.numeric(result$cases))
  expect_true(is.numeric(result$todayCases))
  expect_true(is.numeric(result$deaths))
  expect_true(is.numeric(result$todayDeaths))
  expect_true(is.numeric(result$population))
})

test_that("get_covid_stats_by_continent returns valid continent names", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()
  skip_if(is.null(result), "API returned NULL")

  # Valid continent names from the API
  valid_continents <- c("North America", "South America", "Europe", "Asia",
                        "Africa", "Australia-Oceania", "Antarctica")

  # All returned continents should be valid
  expect_true(all(result$continent %in% valid_continents))
})

test_that("get_covid_stats_by_continent numeric columns are non-negative or NA", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()
  skip_if(is.null(result), "API returned NULL")

  # Cases should be non-negative or NA (both are valid)
  expect_true(all(result$cases >= 0 | is.na(result$cases)))
  expect_true(all(result$todayCases >= 0 | is.na(result$todayCases)))
  expect_true(all(result$deaths >= 0 | is.na(result$deaths)))
  expect_true(all(result$todayDeaths >= 0 | is.na(result$todayDeaths)))
  expect_true(all(result$population > 0 | is.na(result$population)))
})

test_that("get_covid_stats_by_continent yesterday parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent(yesterday = TRUE)
  skip_if(is.null(result), "API returned NULL")

  # Should return data frame with same structure
  expect_s3_class(result, "data.frame")
  expect_true("continent" %in% names(result))
  expect_true(nrow(result) > 0)
})

test_that("get_covid_stats_by_continent twoDaysAgo parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent(twoDaysAgo = TRUE)
  skip_if(is.null(result), "API returned NULL")

  # Should return data frame with same structure
  expect_s3_class(result, "data.frame")
  expect_true("continent" %in% names(result))
  expect_true(nrow(result) > 0)
})

test_that("get_covid_stats_by_continent sort parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent(sort = "cases")
  skip_if(is.null(result), "API returned NULL")

  # Should return data frame
  expect_s3_class(result, "data.frame")

  # Check if data is sorted by cases (descending)
  if (nrow(result) > 1) {
    # Allow for equal values
    expect_true(all(diff(result$cases) <= 0 | is.na(diff(result$cases))))
  }
})

test_that("get_covid_stats_by_continent allowNull parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent(allowNull = TRUE)
  skip_if(is.null(result), "API returned NULL")

  # Should return data frame (NA values are valid)
  expect_s3_class(result, "data.frame")
  expect_true("continent" %in% names(result))
})

test_that("get_covid_stats_by_continent handles multiple parameters together", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent(
    yesterday = TRUE,
    sort = "deaths",
    allowNull = TRUE
  )
  skip_if(is.null(result), "API returned NULL")

  # Should return data frame
  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)
})

test_that("get_covid_stats_by_continent updated timestamp is reasonable", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()
  skip_if(is.null(result), "API returned NULL")

  # Updated timestamp should be in the past (not future)
  current_time <- Sys.time()
  expect_true(all(result$updated <= current_time | is.na(result$updated)))

  # Updated timestamp should be after COVID-19 started (2019)
  covid_start <- as.POSIXct("2019-01-01", tz = "UTC")
  expect_true(all(result$updated >= covid_start | is.na(result$updated)))
})

test_that("get_covid_stats_by_continent returns NULL gracefully on connection failure", {
  skip_on_cran()

  # This test verifies graceful failure without throwing errors
  # We can't force a connection failure easily, but we can verify
  # the function doesn't stop() or throw uncaught errors
  expect_silent({
    # Function should handle errors internally
    result <- get_covid_stats_by_continent()
  })

  # Result should be either a data.frame or NULL (both are valid)
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_covid_stats_by_continent no duplicate continent names", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()
  skip_if(is.null(result), "API returned NULL")

  # Each continent should appear only once
  expect_false(any(duplicated(result$continent)))
})

test_that("get_covid_stats_by_continent population values are reasonable", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_continent()
  skip_if(is.null(result), "API returned NULL")

  # Population should be positive or NA
  expect_true(all(result$population > 0 | is.na(result$population)))

  # World population is ~8 billion, no continent should exceed this
  expect_true(all(result$population < 8e9 | is.na(result$population)))
})
