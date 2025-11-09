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

# influenza_vax_survey_df

library(testthat)

# Test 1: Class and structure
test_that("influenza_vax_survey_df is a valid data.frame with 6 variables and 117 rows", {
  expect_s3_class(influenza_vax_survey_df, "data.frame")
  expect_equal(ncol(influenza_vax_survey_df), 6)
  expect_equal(nrow(influenza_vax_survey_df), 117)
  expect_equal(length(influenza_vax_survey_df), 6)
})

# Test 2: Column names check
test_that("influenza_vax_survey_df has the correct column names", {
  expected_names <- c("survey", "freq", "subject", "response", "start_date", "end_date")
  expect_equal(names(influenza_vax_survey_df), expected_names)
})

# Test 3: Data types check
test_that("influenza_vax_survey_df columns have expected data types", {
  expect_s3_class(influenza_vax_survey_df$survey, "factor")
  expect_type(influenza_vax_survey_df$freq, "integer")
  expect_type(influenza_vax_survey_df$subject, "integer")
  expect_s3_class(influenza_vax_survey_df$response, "factor")
  expect_s3_class(influenza_vax_survey_df$start_date, "Date")
  expect_s3_class(influenza_vax_survey_df$end_date, "Date")
})

# Test 4: Integrity test - No changes after common operations
test_that("influenza_vax_survey_df remains unchanged after inspection", {
  original <- influenza_vax_survey_df

  # Non-modifying operations
  head(influenza_vax_survey_df)
  summary(influenza_vax_survey_df)
  table(influenza_vax_survey_df$survey)

  expect_identical(influenza_vax_survey_df, original)
})
