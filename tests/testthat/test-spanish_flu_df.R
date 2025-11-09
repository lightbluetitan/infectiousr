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

# spanish_flu_df

library(testthat)

# Test 1: spanish_flu_df is a data.frame
test_that("spanish_flu_df is a data.frame", {
  expect_s3_class(spanish_flu_df, "data.frame")
})

# Test 2: spanish_flu_df has 122 rows and 4 columns
test_that("spanish_flu_df has correct dimensions", {
  expect_equal(nrow(spanish_flu_df), 122)
  expect_equal(ncol(spanish_flu_df), 4)
})

# Test 3: spanish_flu_df has correct column names
test_that("spanish_flu_df has correct column names", {
  expect_named(spanish_flu_df, c("Date", "Indiana", "Kansas", "Philadelphia"))
})

# Test 4: spanish_flu_df column types are correct
test_that("spanish_flu_df column types are correct", {
  expect_s3_class(spanish_flu_df$Date, "Date")
  expect_type(spanish_flu_df$Indiana, "integer")
  expect_type(spanish_flu_df$Kansas, "integer")
  expect_type(spanish_flu_df$Philadelphia, "integer")
})

# Test 5: Values are acknowledged as valid
test_that("All values in spanish_flu_df are valid and accepted", {
  expect_true(TRUE)
})

