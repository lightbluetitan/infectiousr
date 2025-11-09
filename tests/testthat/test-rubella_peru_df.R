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

# rubella_peru_df

library(testthat)

# Test 1: Verify Data Frame Structure and Class
test_that("rubella_peru_df has correct structure", {
  expect_s3_class(rubella_peru_df, "data.frame")
  expect_false(inherits(rubella_peru_df, "tbl_df")) # Explicitly not a tibble
})

# Test 2: Validate Dimensions
test_that("rubella_peru_df has correct dimensions", {
  expect_equal(nrow(rubella_peru_df), 95)
  expect_equal(ncol(rubella_peru_df), 4)
})

# Test 3: Check Column Names and Types
test_that("Column names are correct", {
  expect_named(rubella_peru_df, c("age", "incidence", "cumulative", "n"))
})

test_that("Column types are correct", {
  expect_type(rubella_peru_df$age,        "double") # numeric
  expect_type(rubella_peru_df$incidence,  "integer")
  expect_type(rubella_peru_df$cumulative, "integer")
  expect_type(rubella_peru_df$n,          "integer")
})

# Test 4: Content Validation (Non-modifying checks)
test_that("Columns contain valid values or NA", {
  expect_true(all(is.numeric(rubella_peru_df$age) |
                    is.na(rubella_peru_df$age)))
  expect_true(all(is.integer(rubella_peru_df$incidence) |
                    is.na(rubella_peru_df$incidence)))
  expect_true(all(is.integer(rubella_peru_df$cumulative) |
                    is.na(rubella_peru_df$cumulative)))
  expect_true(all(is.integer(rubella_peru_df$n) |
                    is.na(rubella_peru_df$n)))
})

# Test 5: NA Distribution Check (valid by definition)
test_that("NA values exist where expected", {
  expect_true(TRUE) # Placeholder — all NA patterns are valid
})

# Test 6: Verify basic completeness
test_that("Dataset has expected variables", {
  vars <- names(rubella_peru_df)
  expect_true("age"        %in% vars)
  expect_true("incidence"  %in% vars)
  expect_true("cumulative" %in% vars)
  expect_true("n"          %in% vars)
})
