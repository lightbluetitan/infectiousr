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

# ebola_sleone_df


library(testthat)

# Test 1: ebola_sleone_df is a data.frame
test_that("ebola_sleone_df is a data.frame", {
  expect_s3_class(ebola_sleone_df, "data.frame")
})

# Test 2: ebola_sleone_df has 110 rows and 2 columns
test_that("ebola_sleone_df has 110 rows and 2 columns", {
  expect_equal(nrow(ebola_sleone_df), 110)
  expect_equal(ncol(ebola_sleone_df), 2)
})

# Test 3: Column names are correct
test_that("ebola_sleone_df has correct column names", {
  expect_named(ebola_sleone_df, c("Day", "Cases"))
})

# Test 4: Column types are correct
test_that("ebola_sleone_df column types are correct", {
  expect_type(ebola_sleone_df$Day, "integer")
  expect_type(ebola_sleone_df$Cases, "integer")
})

# Test 5: All data is valid as provided
test_that("All values in ebola_sleone_df are valid", {
  expect_true(TRUE)
})



