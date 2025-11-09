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

# get_covid_stats_by_country


library(testthat)

library(infectiousR)


# Test suite for get_covid_stats_by_country()

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

test_that("get_covid_stats_by_country function exists", {
  expect_true(is.function(get_covid_stats_by_country))
})

test_that("get_covid_stats_by_country has correct default parameters", {
  args <- formals(get_covid_stats_by_country)
  expect_false(args$yesterday)
  expect_false(args$twoDaysAgo)
  expect_null(args$sort)
  expect_false(args$allowNull)
})

# ============================================================================
# Tests that require internet (skipped on CRAN)
# ============================================================================

test_that("get_covid_stats_by_country returns correct structure", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country()
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)

  expected_cols <- c("country", "updated", "cases", "todayCases",
                     "deaths", "todayDeaths", "population")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("get_covid_stats_by_country columns have correct types", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country()
  skip_if(is.null(result), "API returned NULL")

  expect_type(result$country, "character")
  expect_s3_class(result$updated, "POSIXct")
  expect_true(is.numeric(result$cases))
  expect_true(is.numeric(result$todayCases))
  expect_true(is.numeric(result$deaths))
  expect_true(is.numeric(result$todayDeaths))
  expect_true(is.numeric(result$population))
})

test_that("get_covid_stats_by_country returns multiple countries", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country()
  skip_if(is.null(result), "API returned NULL")

  # Should return data for many countries (at least 100)
  expect_true(nrow(result) >= 100)
})

test_that("get_covid_stats_by_country numeric values are valid", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country()
  skip_if(is.null(result), "API returned NULL")

  expect_true(all(result$cases >= 0 | is.na(result$cases)))
  expect_true(all(result$todayCases >= 0 | is.na(result$todayCases)))
  expect_true(all(result$deaths >= 0 | is.na(result$deaths)))
  expect_true(all(result$todayDeaths >= 0 | is.na(result$todayDeaths)))
  expect_true(all(result$population >= 0 | is.na(result$population)))
})

test_that("get_covid_stats_by_country yesterday parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country(yesterday = TRUE)
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)
})

test_that("get_covid_stats_by_country sort parameter works", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country(sort = "cases")
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)
})

test_that("get_covid_stats_by_country no duplicate country names", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_covid_stats_by_country()
  skip_if(is.null(result), "API returned NULL")

  expect_false(any(duplicated(result$country)))
})

test_that("get_covid_stats_by_country does not throw errors", {
  skip_on_cran()

  result <- expect_no_error(
    get_covid_stats_by_country()
  )

  expect_true(is.null(result) || is.data.frame(result))
})
