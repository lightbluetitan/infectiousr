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

# flu_enrich_df


library(testthat)

# Test 1: Verify Data Frame Structure and Class
test_that("flu_enrich_df has correct structure", {
  expect_s3_class(flu_enrich_df, "data.frame")
  expect_false(inherits(flu_enrich_df, "tbl_df")) # Explicitly not a tibble
})

# Test 2: Validate Dimensions
test_that("flu_enrich_df has correct dimensions", {
  expect_equal(nrow(flu_enrich_df), 5719)
  expect_equal(ncol(flu_enrich_df), 3)
})

# Test 3: Check Column Names and Order
test_that("flu_enrich_df has expected column names", {
  expect_named(flu_enrich_df, c("nflugenes", "setsize", "GO_terms"))
})

# Test 4: Validate Column Types
test_that("Column types are correct", {
  expect_type(flu_enrich_df$nflugenes, "double")  # numeric
  expect_type(flu_enrich_df$setsize, "integer")   # integer
  expect_s3_class(flu_enrich_df$GO_terms, "factor")  # factor
})

# Test 5: Content Validation - Allow all numeric and NA values
test_that("Numeric columns contain valid numeric or NA values", {
  expect_true(all(is.numeric(flu_enrich_df$nflugenes) | is.na(flu_enrich_df$nflugenes)))
  expect_true(all(is.integer(flu_enrich_df$setsize) | is.na(flu_enrich_df$setsize)))
})

# Test 6: Content Validation - Factor variable validity
test_that("Factor column GO_terms has correct levels", {
  expect_s3_class(flu_enrich_df$GO_terms, "factor")
  expect_equal(length(levels(flu_enrich_df$GO_terms)), 5719)
})

# Test 7: Basic Column Presence Check
test_that("All expected variables exist in dataset", {
  expect_true(all(c("nflugenes", "setsize", "GO_terms") %in% names(flu_enrich_df)))
})

# Test 8: Placeholder for NA distribution (NA values are considered valid)
test_that("NA values are acceptable in flu_enrich_df", {
  expect_true(TRUE) # All patterns of NA are considered valid
})
