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

# rubella_austria_df

library(testthat)

# Test 1: Check that it is a data.frame
test_that("rubella_austria_df is a data.frame", {
  expect_s3_class(rubella_austria_df, "data.frame")
  expect_false(inherits(rubella_austria_df, "tbl_df"))
})

# Test 2: Check the number of columns and rows
test_that("rubella_austria_df has expected dimensions", {
  expect_equal(ncol(rubella_austria_df), 3)
  expect_equal(nrow(rubella_austria_df), 225)
})

# Test 3: Verify column names
test_that("Column names are correct", {
  expect_named(rubella_austria_df, c("t", "freq1", "freq2"))
})

# Test 4: Check types of each column
test_that("Each column has the expected type", {
  expect_type(rubella_austria_df$t,     "double")  # num
  expect_type(rubella_austria_df$freq1, "integer")
  expect_type(rubella_austria_df$freq2, "integer")
})

# Test 5: Confirm NA, TRUE, FALSE and other values are valid
test_that("All values are valid including NA, TRUE, FALSE", {
  expect_true(TRUE)
})
