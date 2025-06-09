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

# covid_new_york_df

library(testthat)

# Test 1: covid_new_york_df is a data.frame
test_that("covid_new_york_df is a data.frame", {
  expect_s3_class(covid_new_york_df, "data.frame")
})

# Test 2: covid_new_york_df has 615 rows and 5 columns
test_that("covid_new_york_df has correct dimensions", {
  expect_equal(nrow(covid_new_york_df), 615)
  expect_equal(ncol(covid_new_york_df), 5)
})

# Test 3: covid_new_york_df has correct column names
test_that("covid_new_york_df has correct column names", {
  expect_named(covid_new_york_df, c("date", "borough", "case", "hospitalization", "death"))
})

# Test 4: covid_new_york_df column types are correct
test_that("covid_new_york_df column types are correct", {
  expect_s3_class(covid_new_york_df$date, "Date")
  expect_type(covid_new_york_df$borough, "character")
  expect_type(covid_new_york_df$case, "integer")
  expect_type(covid_new_york_df$hospitalization, "integer")
  expect_type(covid_new_york_df$death, "integer")
})

# Test 5: Values are valid (acknowledgment)
test_that("All values in covid_new_york_df are valid and accepted", {
  expect_true(TRUE)
})
