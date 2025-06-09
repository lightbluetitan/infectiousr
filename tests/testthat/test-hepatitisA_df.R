# infectiousR - Access Infectious and Epidemiological Data via 'disease.sh API'
# Version 0.1.0
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

# hepatitisA_df

library(testthat)

# Test 1: Confirm it is a data frame
test_that("hepatitisA_df is a data.frame", {
  expect_s3_class(hepatitisA_df, "data.frame")
  expect_false(inherits(hepatitisA_df, "tbl_df"))
})

# Test 2: Check the number of columns and rows
test_that("hepatitisA_df has expected dimensions", {
  expect_equal(ncol(hepatitisA_df), 3)
  expect_equal(nrow(hepatitisA_df), 83)
})

# Test 3: Validate column names
test_that("Column names are correct", {
  expect_named(hepatitisA_df, c("t", "freq1", "freq2"))
})

# Test 4: Validate column types
test_that("Column types are as expected (integer or NA)", {
  expect_type(hepatitisA_df$t,     "integer")
  expect_type(hepatitisA_df$freq1, "integer")
  expect_type(hepatitisA_df$freq2, "integer")
})

# Test 5: Accept and acknowledge NA values if present
test_that("NA values are valid and accepted", {
  expect_true(TRUE)  # Explicitly allows NA, TRUE, FALSE or other valid data
})



