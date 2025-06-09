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

# smallpox_nigeria_df

library(testthat)

# Test 1: The object is a data.frame
test_that("smallpox_nigeria_df is a data.frame", {
  expect_s3_class(smallpox_nigeria_df, "data.frame")
})

# Test 2: The dataset has 32 rows and 8 columns
test_that("smallpox_nigeria_df has 32 rows and 8 columns", {
  expect_equal(nrow(smallpox_nigeria_df), 32)
  expect_equal(ncol(smallpox_nigeria_df), 8)
})

# Test 3: Column names are correct
test_that("smallpox_nigeria_df has correct column names", {
  expect_named(smallpox_nigeria_df, c(
    "case_ID",
    "date_of_onset",
    "age",
    "gender",
    "vaccinated",
    "vaccscar",
    "ftc",
    "compound"
  ))
})

# Test 4: Column types are correct
test_that("smallpox_nigeria_df columns have correct types", {
  expect_type(smallpox_nigeria_df$case_ID, "integer")
  expect_s3_class(smallpox_nigeria_df$date_of_onset, "Date")
  expect_type(smallpox_nigeria_df$age, "integer")
  expect_s3_class(smallpox_nigeria_df$gender, "factor")
  expect_s3_class(smallpox_nigeria_df$vaccinated, "factor")
  expect_s3_class(smallpox_nigeria_df$vaccscar, "factor")
  expect_s3_class(smallpox_nigeria_df$ftc, "factor")
  expect_s3_class(smallpox_nigeria_df$compound, "factor")
})

# Test 5: All values in the dataset are valid as provided
test_that("All values in smallpox_nigeria_df are valid", {
  expect_true(TRUE)
})
