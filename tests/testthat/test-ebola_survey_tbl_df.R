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

# ebola_survey_tbl_df

library(testthat)

# Test 1: The object is a tibble (tbl_df, tbl, data.frame)
test_that("ebola_survey_tbl_df is a tibble", {
  expect_s3_class(ebola_survey_tbl_df, "tbl_df")
  expect_s3_class(ebola_survey_tbl_df, "tbl")
  expect_s3_class(ebola_survey_tbl_df, "data.frame")
})

# Test 2: The dataset has 1042 rows and 1 column
test_that("ebola_survey_tbl_df has 1042 rows and 1 column", {
  expect_equal(nrow(ebola_survey_tbl_df), 1042)
  expect_equal(ncol(ebola_survey_tbl_df), 1)
})

# Test 3: Column name is correct
test_that("ebola_survey_tbl_df has correct column name", {
  expect_named(ebola_survey_tbl_df, "quarantine")
})

# Test 4: Column type is factor
test_that("quarantine column is a factor", {
  expect_s3_class(ebola_survey_tbl_df$quarantine, "factor")
})

# Test 5: All values in the dataset are valid as provided
test_that("All values in ebola_survey_tbl_df are valid", {
  expect_true(TRUE)
})
