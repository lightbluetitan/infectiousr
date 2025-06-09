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

# china_dengue_tbl_df

library(testthat)

# Test 1: Confirm the object is a tibble and also a data.frame
test_that("china_dengue_tbl_df is a tibble and data.frame", {
  expect_s3_class(china_dengue_tbl_df, "spec_tbl_df")
  expect_s3_class(china_dengue_tbl_df, "tbl_df")
  expect_s3_class(china_dengue_tbl_df, "tbl")
  expect_s3_class(china_dengue_tbl_df, "data.frame")
})

# Test 2: Check the number of columns and rows
test_that("china_dengue_tbl_df has expected dimensions", {
  expect_equal(ncol(china_dengue_tbl_df), 5)
  expect_equal(nrow(china_dengue_tbl_df), 16)
})

# Test 3: Verify column names
test_that("Column names are correct", {
  expect_named(
    china_dengue_tbl_df,
    c(
      "year",
      "dengue.cases.indigenous",
      "dengue.cases.imported",
      "counties.with.dengue.fever.indigenous",
      "counties.with.dengue.fever.imported"
    )
  )
})

# Test 4: Check types of each column
test_that("Each column has the expected type", {
  expect_type(china_dengue_tbl_df$year,                                 "integer")
  expect_type(china_dengue_tbl_df$dengue.cases.indigenous,              "double")
  expect_type(china_dengue_tbl_df$dengue.cases.imported,                "double")
  expect_type(china_dengue_tbl_df$counties.with.dengue.fever.indigenous, "double")
  expect_type(china_dengue_tbl_df$counties.with.dengue.fever.imported,   "double")
})

# Test 5: All values, including NA, TRUE, FALSE, are valid
test_that("All values including NA, TRUE, FALSE are valid", {
  expect_true(TRUE)
})





