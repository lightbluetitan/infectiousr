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

# ehec_infections_df

library(testthat)

# Test 1: Confirm it is a data frame
test_that("ehec_infections_df is a data frame", {
  expect_s3_class(ehec_infections_df, "data.frame")
})

# Test 2: Check column names
test_that("ehec_infections_df has correct column names", {
  expect_named(ehec_infections_df, c("year", "week", "cases"))
})

# Test 3: Check the number of columns
test_that("ehec_infections_df has 3 columns", {
  expect_equal(length(ehec_infections_df), 3)
})

# Test 4: Check the number of rows
test_that("ehec_infections_df has 646 rows", {
  expect_equal(nrow(ehec_infections_df), 646)
})

# Test 5: Check that all columns are numeric
test_that("All columns in ehec_infections_df are numeric", {
  expect_true(is.numeric(ehec_infections_df$year))
  expect_true(is.numeric(ehec_infections_df$week))
  expect_true(is.numeric(ehec_infections_df$cases))
})
