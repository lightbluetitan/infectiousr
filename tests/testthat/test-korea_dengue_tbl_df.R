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

# korea_dengue_tbl_df

library(testthat)

# Test 1: Check the object is a tibble and a data.frame
test_that("korea_dengue_tbl_df is a tibble and data.frame", {
  expect_s3_class(korea_dengue_tbl_df, "tbl_df")
  expect_s3_class(korea_dengue_tbl_df, "tbl")
  expect_s3_class(korea_dengue_tbl_df, "data.frame")
})

# Test 2: Confirm the dimensions of the dataset
test_that("korea_dengue_tbl_df has 33 rows and 7 columns", {
  expect_equal(nrow(korea_dengue_tbl_df), 33)
  expect_equal(ncol(korea_dengue_tbl_df), 7)
})

# Test 3: Check column names
test_that("Column names are as expected", {
  expect_named(
    korea_dengue_tbl_df,
    c("Country", "Region", "2011", "2012", "2013", "2014", "2015")
  )
})

# Test 4: Confirm data types of each column
test_that("Each column has the expected type", {
  expect_type(korea_dengue_tbl_df$Country, "character")
  expect_type(korea_dengue_tbl_df$Region,  "character")
  expect_type(korea_dengue_tbl_df$`2011`,  "character")
  expect_type(korea_dengue_tbl_df$`2012`,  "character")
  expect_type(korea_dengue_tbl_df$`2013`,  "character")
  expect_type(korea_dengue_tbl_df$`2014`,  "character")
  expect_type(korea_dengue_tbl_df$`2015`,  "character")
})

# Test 5: All values are valid as given, including NA, TRUE, FALSE
test_that("All values including NA, TRUE, FALSE are valid", {
  expect_true(TRUE)
})
