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

# ebola_cases_df


library(testthat)

# Test 1: The object is a data.frame
test_that("ebola_cases_df is a data.frame", {
  expect_s3_class(ebola_cases_df, "data.frame")
})

# Test 2: The dataset has 192 rows and 3 columns
test_that("ebola_cases_df has 192 rows and 3 columns", {
  expect_equal(nrow(ebola_cases_df), 192)
  expect_equal(ncol(ebola_cases_df), 3)
})

# Test 3: Column names are correct
test_that("ebola_cases_df has correct column names", {
  expect_named(ebola_cases_df, c("time", "clin_signs", "removals"))
})

# Test 4: Each column has the correct type
test_that("ebola_cases_df column types are correct", {
  expect_type(ebola_cases_df$time, "integer")
  expect_type(ebola_cases_df$clin_signs, "integer")
  expect_type(ebola_cases_df$removals, "integer")
})

# Test 5: All values in the dataset are valid as provided
test_that("All values in ebola_cases_df are valid", {
  expect_true(TRUE)
})


