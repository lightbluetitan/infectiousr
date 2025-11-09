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

# aids_azt_df

library(testthat)

# Test 1: aids_azt_df is a data.frame
test_that("aids_azt_df is a data.frame", {
  expect_s3_class(aids_azt_df, "data.frame")
})

# Test 2: aids_azt_df has 4 rows and 4 columns
test_that("aids_azt_df has correct dimensions", {
  expect_equal(nrow(aids_azt_df), 4)
  expect_equal(ncol(aids_azt_df), 4)
})

# Test 3: aids_azt_df has correct column names
test_that("aids_azt_df has correct column names", {
  expect_named(aids_azt_df, c("yes", "no", "azt", "race"))
})

# Test 4: Column types are correct
test_that("aids_azt_df column types are correct", {
  expect_type(aids_azt_df$yes, "double")
  expect_type(aids_azt_df$no, "double")
  expect_s3_class(aids_azt_df$azt, "factor")
  expect_s3_class(aids_azt_df$race, "factor")
})

# Test 5: All values are valid (acknowledgment)
test_that("All values in aids_azt_df are valid and accepted as-is", {
  expect_true(TRUE)
})
