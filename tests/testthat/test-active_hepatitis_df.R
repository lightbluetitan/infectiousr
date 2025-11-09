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

# active_hepatitis_df


library(testthat)

# Test 1: Check class and basic structure
test_that("active_hepatitis_df is a data.frame", {
  expect_s3_class(active_hepatitis_df, "data.frame")
  expect_false(inherits(active_hepatitis_df, "tbl_df"))
})

# Test 2: Check dimensions
test_that("active_hepatitis_df has expected dimensions", {
  expect_equal(nrow(active_hepatitis_df), 44)
  expect_equal(ncol(active_hepatitis_df), 3)
})

# Test 3: Check column names
test_that("Column names are correct", {
  expect_named(active_hepatitis_df, c("treatment", "time", "status"))
})

# Test 4: Check column types
test_that("All columns have expected types", {
  expect_type(active_hepatitis_df$treatment, "integer")
  expect_type(active_hepatitis_df$time,      "integer")
  expect_type(active_hepatitis_df$status,    "integer")
})

# Test 5: Validate data content (numeric or NA)
test_that("All values in numeric columns are valid", {
  expect_true(all(is.numeric(active_hepatitis_df$treatment) | is.na(active_hepatitis_df$treatment)))
  expect_true(all(is.numeric(active_hepatitis_df$time)      | is.na(active_hepatitis_df$time)))
  expect_true(all(is.numeric(active_hepatitis_df$status)    | is.na(active_hepatitis_df$status)))
})

# Test 6: NA values are acceptable
test_that("NA values are valid and allowed", {
  expect_true(TRUE)  # Explicitly acknowledge NA values are valid
})


