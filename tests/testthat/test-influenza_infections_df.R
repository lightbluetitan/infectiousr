# infectiousR - Access Infectious and Epidemiological Data via 'disease.sh API'
# Version 0.1.1
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

# influenza_infections_df


library(testthat)

# Test 1: Confirm that the object is a data frame
test_that("influenza_infections_df is a data frame", {
  expect_s3_class(influenza_infections_df, "data.frame")
})

# Test 2: Confirm that the data frame has the correct column names
test_that("influenza_infections_df has expected column names", {
  expect_named(influenza_infections_df, c("year", "week", "cases"))
})

# Test 3: Confirm that the data frame has exactly 3 columns
test_that("influenza_infections_df has 3 columns", {
  expect_equal(length(influenza_infections_df), 3)
})

# Test 4: Confirm that the data frame has 646 rows
test_that("influenza_infections_df has 646 rows", {
  expect_equal(nrow(influenza_infections_df), 646)
})

# Test 5: Confirm that all columns are of numeric type
test_that("All columns in influenza_infections_df are numeric", {
  expect_true(is.numeric(influenza_infections_df$year))
  expect_true(is.numeric(influenza_infections_df$week))
  expect_true(is.numeric(influenza_infections_df$cases))
})





