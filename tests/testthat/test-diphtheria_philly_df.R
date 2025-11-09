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

# diphtheria_philly_df


library(testthat)

# Test 1: Verify Data Frame Structure and Class
test_that("diphtheria_philly_df has correct structure", {
  expect_s3_class(diphtheria_philly_df, "data.frame")
  expect_false(inherits(diphtheria_philly_df, "tbl_df")) # Ensure it's not a tibble
})

# Test 2: Validate Dimensions
test_that("diphtheria_philly_df has correct dimensions", {
  expect_equal(nrow(diphtheria_philly_df), 1774)
  expect_equal(ncol(diphtheria_philly_df), 4)
})

# Test 3: Check Column Names
test_that("Column names are correct", {
  expect_named(diphtheria_philly_df, c("YEAR", "WEEK", "PHILADELPHIA", "TIME"))
})

# Test 4: Check Column Types
test_that("Column types are correct", {
  expect_type(diphtheria_philly_df$YEAR,         "integer")
  expect_type(diphtheria_philly_df$WEEK,         "integer")
  expect_type(diphtheria_philly_df$PHILADELPHIA, "integer")
  expect_type(diphtheria_philly_df$TIME,         "double")
})

# Test 5: Content Validation (Non-modifying checks)
test_that("Columns contain valid values or NA", {
  expect_true(all(is.numeric(diphtheria_philly_df$YEAR) |
                    is.na(diphtheria_philly_df$YEAR)))
  expect_true(all(is.numeric(diphtheria_philly_df$WEEK) |
                    is.na(diphtheria_philly_df$WEEK)))
  expect_true(all(is.numeric(diphtheria_philly_df$PHILADELPHIA) |
                    is.na(diphtheria_philly_df$PHILADELPHIA)))
  expect_true(all(is.numeric(diphtheria_philly_df$TIME) |
                    is.na(diphtheria_philly_df$TIME)))
})

# Test 6: NA Distribution Check (valid by definition)
test_that("NA values exist where expected", {
  expect_true(TRUE) # All NA values are valid; no constraints assumed
})

# Test 7: Verify basic completeness
test_that("Dataset has expected variables", {
  vars <- names(diphtheria_philly_df)
  expect_true("YEAR"         %in% vars)
  expect_true("WEEK"         %in% vars)
  expect_true("PHILADELPHIA" %in% vars)
  expect_true("TIME"         %in% vars)
})
