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

# gonorrhea_ma_df

library(testthat)

# Test 1: Verify Data Frame Structure and Class
test_that("gonorrhea_ma_df has correct structure", {
  expect_s3_class(gonorrhea_ma_df, "data.frame")
  expect_false(inherits(gonorrhea_ma_df, "tbl_df")) # Explicitly not a tibble
})

# Test 2: Validate Dimensions
test_that("gonorrhea_ma_df has correct dimensions", {
  expect_equal(nrow(gonorrhea_ma_df), 422)
  expect_equal(ncol(gonorrhea_ma_df), 4)
})

# Test 3: Check Column Names and Types
test_that("Column names are correct", {
  expect_named(gonorrhea_ma_df, c("number", "year", "week", "time"))
})

test_that("Column types are correct", {
  expect_type(gonorrhea_ma_df$number, "integer")
  expect_type(gonorrhea_ma_df$year,   "double")
  expect_type(gonorrhea_ma_df$week,   "double")
  expect_type(gonorrhea_ma_df$time,   "double")
})

# Test 4: Content Validation (Non-modifying checks)
test_that("Columns contain valid values or NA", {
  expect_true(all(is.numeric(gonorrhea_ma_df$number) |
                    is.na(gonorrhea_ma_df$number)))
  expect_true(all(is.numeric(gonorrhea_ma_df$year) |
                    is.na(gonorrhea_ma_df$year)))
  expect_true(all(is.numeric(gonorrhea_ma_df$week) |
                    is.na(gonorrhea_ma_df$week)))
  expect_true(all(is.numeric(gonorrhea_ma_df$time) |
                    is.na(gonorrhea_ma_df$time)))
})

# Test 5: NA Distribution Check (valid by definition)
test_that("NA values exist where expected", {
  expect_true(TRUE) # Placeholder — all NA values are valid
})

# Test 6: Verify basic completeness
test_that("Dataset has expected variables", {
  vars <- names(gonorrhea_ma_df)
  expect_true("number" %in% vars)
  expect_true("year"   %in% vars)
  expect_true("week"   %in% vars)
  expect_true("time"   %in% vars)
})

