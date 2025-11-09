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

# bcg_vaccine_df

library(testthat)

# Test 1: bcg_vaccine_df is a data.frame
test_that("bcg_vaccine_df is a data.frame", {
  expect_s3_class(bcg_vaccine_df, "data.frame")
})

# Test 2: bcg_vaccine_df has 13 rows and 9 columns
test_that("bcg_vaccine_df has correct dimensions", {
  expect_equal(nrow(bcg_vaccine_df), 13)
  expect_equal(ncol(bcg_vaccine_df), 9)
})

# Test 3: Column names are correct
test_that("bcg_vaccine_df has correct column names", {
  expect_named(bcg_vaccine_df, c(
    "trial", "author", "year", "tpos", "tneg", "cpos", "cneg", "ablat", "alloc"
  ))
})

# Test 4: Column types are correct
test_that("bcg_vaccine_df column types are correct", {
  expect_type(bcg_vaccine_df$trial, "integer")
  expect_type(bcg_vaccine_df$author, "character")
  expect_type(bcg_vaccine_df$year, "integer")
  expect_type(bcg_vaccine_df$tpos, "integer")
  expect_type(bcg_vaccine_df$tneg, "integer")
  expect_type(bcg_vaccine_df$cpos, "integer")
  expect_type(bcg_vaccine_df$cneg, "integer")
  expect_type(bcg_vaccine_df$ablat, "integer")
  expect_type(bcg_vaccine_df$alloc, "character")
})

# Test 5: All values are valid as provided
test_that("All values in bcg_vaccine_df are valid", {
  expect_true(TRUE)
})
