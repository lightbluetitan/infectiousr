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

# get_global_covid_stats

library(testthat)

library(infectiousR)

# Test suite for get_global_covid_stats()

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

test_that("get_global_covid_stats function exists", {
  expect_true(is.function(get_global_covid_stats))
})

test_that("get_global_covid_stats has no required parameters", {
  args <- formals(get_global_covid_stats)
  expect_equal(length(args), 0)
})

# ============================================================================
# Tests that require internet (skipped on CRAN)
# ============================================================================

test_that("get_global_covid_stats returns correct structure", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_global_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 1)

  expected_cols <- c("updated", "cases", "newCases", "deaths", "recovered",
                     "newRecov", "active", "critical", "tests", "pop", "countries")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("get_global_covid_stats columns have correct basic types", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_global_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result$updated, "Date")
  expect_true(is.numeric(result$cases))
  expect_true(is.numeric(result$deaths))
  expect_true(is.numeric(result$pop))
  expect_true(is.numeric(result$countries))
})

test_that("get_global_covid_stats numeric values are valid", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_global_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_true(all(result$cases >= 0 | is.na(result$cases)))
  expect_true(all(result$newCases >= 0 | is.na(result$newCases)))
  expect_true(all(result$deaths >= 0 | is.na(result$deaths)))
  expect_true(all(result$recovered >= 0 | is.na(result$recovered)))
  expect_true(all(result$newRecov >= 0 | is.na(result$newRecov)))
  expect_true(all(result$active >= 0 | is.na(result$active)))
  expect_true(all(result$critical >= 0 | is.na(result$critical)))
  expect_true(all(result$tests >= 0 | is.na(result$tests)))
  expect_true(all(result$pop >= 0 | is.na(result$pop)))
  expect_true(all(result$countries >= 0 | is.na(result$countries)))
})

test_that("get_global_covid_stats returns single row", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_global_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  expect_equal(nrow(result), 1)
})

test_that("get_global_covid_stats updated date is reasonable", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_global_covid_stats()
  skip_if(is.null(result), "API returned NULL")

  # Date should be after COVID-19 started
  covid_start <- as.Date("2019-01-01")
  expect_true(result$updated >= covid_start | is.na(result$updated))
})

test_that("get_global_covid_stats does not throw errors", {
  skip_on_cran()

  result <- expect_no_error(
    get_global_covid_stats()
  )

  expect_true(is.null(result) || is.data.frame(result))
})
