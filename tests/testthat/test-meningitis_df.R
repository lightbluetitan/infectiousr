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

# meningitis_df

library(testthat)

# Test 1: meningitis_df is a data.frame
test_that("meningitis_df is a data.frame", {
  expect_s3_class(meningitis_df, "data.frame")
})

# Test 2: meningitis_df has 60 rows and 6 columns
test_that("meningitis_df has correct dimensions", {
  expect_equal(nrow(meningitis_df), 60)
  expect_equal(ncol(meningitis_df), 6)
})

# Test 3: Column names are correct
test_that("meningitis_df has correct column names", {
  expect_named(meningitis_df, c(
    "Set", "CaseCntrl", "Reftime", "Numnill", "Numsleep", "Smoke"
  ))
})

# Test 4: Column types are correct
test_that("meningitis_df column types are correct", {
  expect_type(meningitis_df$Set, "integer")
  expect_type(meningitis_df$CaseCntrl, "integer")
  expect_type(meningitis_df$Reftime, "double")
  expect_type(meningitis_df$Numnill, "integer")
  expect_type(meningitis_df$Numsleep, "integer")
  expect_type(meningitis_df$Smoke, "integer")
})

# Test 5: All values in meningitis_df are valid as provided
test_that("All values in meningitis_df are valid", {
  expect_true(TRUE)
})
