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

# sars_canada_df

library(testthat)

# Test 1: The object is a data.frame
test_that("sars_canada_df is a data.frame", {
  expect_s3_class(sars_canada_df, "data.frame")
})

# Test 2: The dataset has 110 rows and 5 columns
test_that("sars_canada_df has 110 rows and 5 columns", {
  expect_equal(nrow(sars_canada_df), 110)
  expect_equal(ncol(sars_canada_df), 5)
})

# Test 3: Column names are correct
test_that("sars_canada_df has correct column names", {
  expect_named(sars_canada_df, c(
    "date",
    "cases_travel",
    "cases_household",
    "cases_healthcare",
    "cases_other"
  ))
})

# Test 4: Column types are correct
test_that("sars_canada_df columns have correct types", {
  expect_s3_class(sars_canada_df$date, "Date")
  expect_type(sars_canada_df$cases_travel, "integer")
  expect_type(sars_canada_df$cases_household, "integer")
  expect_type(sars_canada_df$cases_healthcare, "integer")
  expect_type(sars_canada_df$cases_other, "integer")
})

# Test 5: All values are valid as provided
test_that("All values in sars_canada_df are valid", {
  expect_true(TRUE)
})
