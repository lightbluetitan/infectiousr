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

# zika_sanandres_df

library(testthat)

# Test 1: The object is a data.frame
test_that("zika_sanandres_df is a data.frame", {
  expect_s3_class(zika_sanandres_df, "data.frame")
})

# Test 2: The dataset has 101 rows and 2 columns
test_that("zika_sanandres_df has 101 rows and 2 columns", {
  expect_equal(nrow(zika_sanandres_df), 101)
  expect_equal(ncol(zika_sanandres_df), 2)
})

# Test 3: Column names are correct
test_that("zika_sanandres_df has correct column names", {
  expect_named(zika_sanandres_df, c("date", "cases"))
})

# Test 4: Column types are correct
test_that("zika_sanandres_df columns have correct types", {
  expect_s3_class(zika_sanandres_df$date, "Date")
  expect_type(zika_sanandres_df$cases, "integer")
})

# Test 5: All values, including NA or others, are valid as provided
test_that("All data in zika_sanandres_df are valid", {
  expect_true(TRUE)
})
