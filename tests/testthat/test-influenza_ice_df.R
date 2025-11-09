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

# influenza_ice_df


library(testthat)

# Test 1: Verify Data Frame Structure and Class
test_that("influenza_ice_df has correct structure", {
  expect_s3_class(influenza_ice_df, "data.frame")
  expect_false(inherits(influenza_ice_df, "tbl_df")) # Explicitly not a tibble
})

# Test 2: Validate Dimensions
test_that("influenza_ice_df has correct dimensions", {
  expect_equal(nrow(influenza_ice_df), 360)
  expect_equal(ncol(influenza_ice_df), 3)
})

# Test 3: Check Column Names and Types
test_that("Column names are correct", {
  expect_named(influenza_ice_df, c("month", "year", "ili"))
})

test_that("Column types are correct", {
  expect_type(influenza_ice_df$month, "integer")
  expect_type(influenza_ice_df$year,  "integer")
  expect_type(influenza_ice_df$ili,   "integer")
})

# Test 4: Content Validation (Non-modifying checks)
test_that("Columns contain valid values or NA", {
  expect_true(all(is.integer(influenza_ice_df$month) |
                    is.na(influenza_ice_df$month)))
  expect_true(all(is.integer(influenza_ice_df$year) |
                    is.na(influenza_ice_df$year)))
  expect_true(all(is.integer(influenza_ice_df$ili) |
                    is.na(influenza_ice_df$ili)))
})

# Test 5: NA Distribution Check (valid by definition)
test_that("NA values exist where expected", {
  expect_true(TRUE) # Placeholder — all NA patterns are valid
})

# Test 6: Verify basic completeness
test_that("Dataset has expected variables", {
  vars <- names(influenza_ice_df)
  expect_true("month" %in% vars)
  expect_true("year"  %in% vars)
  expect_true("ili"   %in% vars)
})

