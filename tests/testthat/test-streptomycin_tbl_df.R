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

# streptomycin_tbl_df

library(testthat)

# Test 1: streptomycin_tbl_df is a tibble (tbl_df, tbl, data.frame)
test_that("streptomycin_tbl_df is a tibble", {
  expect_s3_class(streptomycin_tbl_df, "tbl_df")
  expect_s3_class(streptomycin_tbl_df, "tbl")
  expect_s3_class(streptomycin_tbl_df, "data.frame")
})

# Test 2: streptomycin_tbl_df has 107 rows and 13 columns
test_that("streptomycin_tbl_df has correct dimensions", {
  expect_equal(nrow(streptomycin_tbl_df), 107)
  expect_equal(ncol(streptomycin_tbl_df), 13)
})

# Test 3: Column names are correct
test_that("streptomycin_tbl_df has correct column names", {
  expect_named(streptomycin_tbl_df, c(
    "patient_id", "arm", "dose_strep_g", "dose_PAS_g", "gender",
    "baseline_condition", "baseline_temp", "baseline_esr",
    "baseline_cavitation", "strep_resistance", "radiologic_6m",
    "rad_num", "improved"
  ))
})

# Test 4: Column types are correct
test_that("streptomycin_tbl_df column types are correct", {
  expect_type(streptomycin_tbl_df$patient_id, "character")
  expect_s3_class(streptomycin_tbl_df$arm, "factor")
  expect_type(streptomycin_tbl_df$dose_strep_g, "double")
  expect_type(streptomycin_tbl_df$dose_PAS_g, "double")
  expect_s3_class(streptomycin_tbl_df$gender, "factor")
  expect_s3_class(streptomycin_tbl_df$baseline_condition, "factor")
  expect_s3_class(streptomycin_tbl_df$baseline_temp, "factor")
  expect_s3_class(streptomycin_tbl_df$baseline_esr, "factor")
  expect_s3_class(streptomycin_tbl_df$baseline_cavitation, "factor")
  expect_s3_class(streptomycin_tbl_df$strep_resistance, "factor")
  expect_s3_class(streptomycin_tbl_df$radiologic_6m, "factor")
  expect_type(streptomycin_tbl_df$rad_num, "double")
  expect_type(streptomycin_tbl_df$improved, "logical")
})

# Test 5: All values are valid as provided
test_that("All values in streptomycin_tbl_df are valid", {
  expect_true(TRUE)
})
