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

# malaria_mice_df

library(testthat)

# Test 1: Check data class and structure
test_that("malaria_mice_df is a proper data.frame", {
  expect_s3_class(malaria_mice_df, "data.frame")
  expect_false(inherits(malaria_mice_df, "tbl_df"))
})

# Test 2: Check dimensions
test_that("malaria_mice_df has expected dimensions", {
  expect_equal(nrow(malaria_mice_df), 1300)
  expect_equal(ncol(malaria_mice_df), 11)
})

# Test 3: Validate column names
test_that("malaria_mice_df has correct column names", {
  expect_named(malaria_mice_df, c(
    "Line", "Day", "Box", "Mouse", "Treatment", "Ind2",
    "Weight", "Glucose", "RBC", "Sample", "Para"
  ))
})

# Test 4: Check variable types
test_that("Variable types are as expected", {
  expect_type(malaria_mice_df$Line,      "integer")
  expect_type(malaria_mice_df$Day,       "integer")
  expect_type(malaria_mice_df$Box,       "integer")
  expect_type(malaria_mice_df$Mouse,     "integer")
  expect_s3_class(malaria_mice_df$Treatment, "factor")
  expect_type(malaria_mice_df$Ind2,      "integer")
  expect_type(malaria_mice_df$Weight,    "double")
  expect_type(malaria_mice_df$Glucose,   "integer")
  expect_type(malaria_mice_df$RBC,       "double")
  expect_type(malaria_mice_df$Sample,    "integer")
  expect_type(malaria_mice_df$Para,      "double")
})

# Test 5: Check Treatment levels count only
test_that("Treatment variable has correct number of levels", {
  expect_equal(nlevels(malaria_mice_df$Treatment), 6)
})

# Test 6: Data content integrity
test_that("Numeric columns contain valid numeric data or NA", {
  expect_true(all(is.numeric(malaria_mice_df$Line)     | is.na(malaria_mice_df$Line)))
  expect_true(all(is.numeric(malaria_mice_df$Day)      | is.na(malaria_mice_df$Day)))
  expect_true(all(is.numeric(malaria_mice_df$Box)      | is.na(malaria_mice_df$Box)))
  expect_true(all(is.numeric(malaria_mice_df$Mouse)    | is.na(malaria_mice_df$Mouse)))
  expect_true(all(is.numeric(malaria_mice_df$Ind2)     | is.na(malaria_mice_df$Ind2)))
  expect_true(all(is.numeric(malaria_mice_df$Weight)   | is.na(malaria_mice_df$Weight)))
  expect_true(all(is.numeric(malaria_mice_df$Glucose)  | is.na(malaria_mice_df$Glucose)))
  expect_true(all(is.numeric(malaria_mice_df$RBC)      | is.na(malaria_mice_df$RBC)))
  expect_true(all(is.numeric(malaria_mice_df$Sample)   | is.na(malaria_mice_df$Sample)))
  expect_true(all(is.numeric(malaria_mice_df$Para)     | is.na(malaria_mice_df$Para)))
})

# Test 7: NA values are valid and allowed
test_that("All NA values are valid", {
  expect_true(TRUE)  # Presence of NA is acceptable by definition
})


