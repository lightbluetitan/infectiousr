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

# us_covid_cases_df

library(testthat)

# Test 1: Check that the object is a data frame
test_that("us_covid_cases_df is a data frame", {
  expect_s3_class(us_covid_cases_df, "data.frame")
})

# Test 2: Check that the column names are correct
test_that("us_covid_cases_df has correct column names", {
  expect_named(us_covid_cases_df, c("date", "cases"))
})

# Test 3: Check number of columns
test_that("us_covid_cases_df has 2 columns", {
  expect_equal(length(us_covid_cases_df), 2)
})

# Test 4: Check number of rows
test_that("us_covid_cases_df has 1227 rows", {
  expect_equal(nrow(us_covid_cases_df), 1227)
})

# Test 5: Check data types of each column
test_that("us_covid_cases_df has correct column types", {
  expect_s3_class(us_covid_cases_df$date, "Date")
  expect_type(us_covid_cases_df$cases, "integer")
})
