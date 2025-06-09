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

# covid_mortality_df

library(testthat)

# Test 1: Confirm it is a data frame
test_that("covid_mortality_df is a data frame", {
  expect_s3_class(covid_mortality_df, "data.frame")
})

# Test 2: Check column names
test_that("covid_mortality_df has correct column names", {
  expect_named(covid_mortality_df, c("study", "beta", "se"))
})

# Test 3: Check number of columns
test_that("covid_mortality_df has 3 columns", {
  expect_equal(length(covid_mortality_df), 3)
})

# Test 4: Check number of rows
test_that("covid_mortality_df has 6 rows", {
  expect_equal(nrow(covid_mortality_df), 6)
})

# Test 5: Check column types
test_that("covid_mortality_df columns have correct types", {
  expect_type(covid_mortality_df$study, "character")
  expect_type(covid_mortality_df$beta, "double")
  expect_type(covid_mortality_df$se, "double")
})
