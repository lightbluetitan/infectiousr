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

# covid_severity_df

library(testthat)

# Test 1: Confirm the object is a data frame
test_that("covid_severity_df is a data frame", {
  expect_s3_class(covid_severity_df, "data.frame")
})

# Test 2: Check that it has the correct column names
test_that("covid_severity_df has correct column names", {
  expect_named(covid_severity_df, c("study", "beta", "se"))
})

# Test 3: Check the number of columns
test_that("covid_severity_df has 3 columns", {
  expect_equal(length(covid_severity_df), 3)
})

# Test 4: Check the number of rows
test_that("covid_severity_df has 6 rows", {
  expect_equal(nrow(covid_severity_df), 6)
})

# Test 5: Check data types of each column
test_that("covid_severity_df column types are correct", {
  expect_type(covid_severity_df$study, "character")
  expect_type(covid_severity_df$beta, "double")
  expect_type(covid_severity_df$se, "double")
})
