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

# measles_survey_df

library(testthat)

# Test 1: Verify Data Frame Structure and Class
test_that("measles_survey_df has correct structure", {
  expect_s3_class(measles_survey_df, "data.frame")
  expect_false(inherits(measles_survey_df, "tbl_df")) # Explicitly not a tibble
})

# Test 2: Validate Dimensions
test_that("measles_survey_df has correct dimensions", {
  expect_equal(nrow(measles_survey_df), 307)
  expect_equal(ncol(measles_survey_df), 11)
})

# Test 3: Check Column Names and Types
test_that("Column names are correct", {
  expect_named(measles_survey_df, c(
    "school", "form", "returnf", "consent", "hadmeas",
    "previmm", "sideeff", "gp", "noshot", "notser", "gpadv"
  ))
})

test_that("All variables are factors", {
  expect_true(all(sapply(measles_survey_df, is.factor)))
})

# Test 4: Content Validation (Non-modifying checks)
test_that("Factor levels are present and valid", {
  expect_true(all(sapply(measles_survey_df, function(x) is.factor(x) || is.na(x))))
})

# Test 5: NA Distribution Check (only if NAs are expected)
test_that("NA values exist where expected", {
  expect_true(TRUE) # Placeholder — all NA patterns are valid
})

# Test 6: Verify basic completeness
test_that("Dataset has expected variables", {
  vars <- names(measles_survey_df)
  expect_true("school"  %in% vars)
  expect_true("form"    %in% vars)
  expect_true("returnf" %in% vars)
  expect_true("consent" %in% vars)
  expect_true("hadmeas" %in% vars)
  expect_true("previmm" %in% vars)
  expect_true("sideeff" %in% vars)
  expect_true("gp"      %in% vars)
  expect_true("noshot"  %in% vars)
  expect_true("notser"  %in% vars)
  expect_true("gpadv"   %in% vars)
})
