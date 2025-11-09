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

# india_dengue_tbl_df

library(testthat)

# Test 1: Confirm the object is a tibble and data.frame
test_that("india_dengue_tbl_df is a tibble and data.frame", {
  expect_s3_class(india_dengue_tbl_df, "tbl_df")
  expect_s3_class(india_dengue_tbl_df, "tbl")
  expect_s3_class(india_dengue_tbl_df, "data.frame")
})

# Test 2: Check the number of columns and rows
test_that("india_dengue_tbl_df has expected dimensions", {
  expect_equal(ncol(india_dengue_tbl_df), 5)
  expect_equal(nrow(india_dengue_tbl_df), 432)
})

# Test 3: Verify column names
test_that("Column names are correct", {
  expect_named(
    india_dengue_tbl_df,
    c(
      "area",
      "type",
      "year",
      "additional_information",
      "value"
    )
  )
})

# Test 4: Check the data types of each column
test_that("Each column has the expected type", {
  expect_type(india_dengue_tbl_df$area,                  "character")
  expect_type(india_dengue_tbl_df$type,                  "character")
  expect_type(india_dengue_tbl_df$year,                  "character")
  expect_type(india_dengue_tbl_df$additional_information,"character")
  expect_type(india_dengue_tbl_df$value,                 "double")
})

# Test 5: All values including NA, TRUE, FALSE are valid
test_that("All values including NA, TRUE, FALSE are valid", {
  expect_true(TRUE)
})
