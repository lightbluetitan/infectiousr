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

# contagious_diseases_df

library(testthat)

# Test 1: Confirm class is data.frame
test_that("contagious_diseases_df is a data frame", {
  expect_s3_class(contagious_diseases_df, "data.frame")
})

# Test 2: Validate column names
test_that("contagious_diseases_df has correct column names", {
  expect_named(contagious_diseases_df, c(
    "disease", "state", "year", "weeks_reporting", "count", "population"
  ))
})

# Test 3: Verify number of columns
test_that("contagious_diseases_df has 6 columns", {
  expect_equal(length(contagious_diseases_df), 6)
})

# Test 4: Check number of rows
test_that("contagious_diseases_df has 16065 rows", {
  expect_equal(nrow(contagious_diseases_df), 16065)
})

# Test 5: Check data types of each column
test_that("contagious_diseases_df has correct column types", {
  expect_type(as.character(contagious_diseases_df$disease), "character")  # Factor
  expect_type(as.character(contagious_diseases_df$state), "character")    # Factor
  expect_type(contagious_diseases_df$year, "double")
  expect_type(contagious_diseases_df$weeks_reporting, "double")
  expect_type(contagious_diseases_df$count, "double")
  expect_type(contagious_diseases_df$population, "double")
})
