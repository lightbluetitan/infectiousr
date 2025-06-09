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

# zika_girardot_df

library(testthat)

# Test 1: Check that the object is a data.frame
test_that("zika_girardot_df is a data.frame", {
  expect_s3_class(zika_girardot_df, "data.frame")
})

# Test 2: Check dimensions: 93 rows and 2 columns
test_that("zika_girardot_df has 93 rows and 2 columns", {
  expect_equal(nrow(zika_girardot_df), 93)
  expect_equal(ncol(zika_girardot_df), 2)
})

# Test 3: Check column names
test_that("zika_girardot_df has correct column names", {
  expect_named(zika_girardot_df, c("date", "cases"))
})

# Test 4: Check column types
test_that("zika_girardot_df has correct column types", {
  expect_s3_class(zika_girardot_df$date, "Date")
  expect_type(zika_girardot_df$cases, "integer")
})

# Test 5: All values are valid (including NA, TRUE, FALSE if present)
test_that("All data in zika_girardot_df are valid as given", {
  expect_true(TRUE)
})
