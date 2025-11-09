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

# get_influenza_cdc_ili

library(testthat)

library(infectiousR)

# Test suite for get_influenza_cdc_ili()

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

test_that("get_influenza_cdc_ili function exists", {
  expect_true(is.function(get_influenza_cdc_ili))
})

test_that("get_influenza_cdc_ili has no required parameters", {
  args <- formals(get_influenza_cdc_ili)
  expect_equal(length(args), 0)
})

# ============================================================================
# Tests that require internet (skipped on CRAN)
# ============================================================================

test_that("get_influenza_cdc_ili returns correct structure", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  expect_type(result, "list")
  expect_named(result, c("updated", "source", "data"))
})

test_that("get_influenza_cdc_ili updated field has correct type", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  expect_true(inherits(result$updated, "POSIXct") || is.na(result$updated))
})

test_that("get_influenza_cdc_ili source field is character", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  expect_type(result$source, "character")
})

test_that("get_influenza_cdc_ili data field is data frame", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  expect_s3_class(result$data, "data.frame")
})

test_that("get_influenza_cdc_ili data has correct columns", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  expected_cols <- c("week", "age 5-24", "age 25-49", "age 50-64",
                     "age 64+", "totalILI", "totalPatients")
  expect_true(all(expected_cols %in% names(result$data)))
})

test_that("get_influenza_cdc_ili data has multiple rows", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  expect_true(nrow(result$data) > 0)
})

test_that("get_influenza_cdc_ili numeric values are valid", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not(can_reach_api(), "disease.sh API is not reachable")

  result <- get_influenza_cdc_ili()
  skip_if(is.null(result), "API returned NULL")

  data <- result$data

  expect_true(all(data$`age 5-24` >= 0 | is.na(data$`age 5-24`)))
  expect_true(all(data$`age 25-49` >= 0 | is.na(data$`age 25-49`)))
  expect_true(all(data$`age 50-64` >= 0 | is.na(data$`age 50-64`)))
  expect_true(all(data$`age 64+` >= 0 | is.na(data$`age 64+`)))
  expect_true(all(data$totalILI >= 0 | is.na(data$totalILI)))
  expect_true(all(data$totalPatients >= 0 | is.na(data$totalPatients)))
})

test_that("get_influenza_cdc_ili does not throw errors", {
  skip_on_cran()

  result <- expect_no_error(
    get_influenza_cdc_ili()
  )

  expect_true(is.null(result) || is.list(result))
})
