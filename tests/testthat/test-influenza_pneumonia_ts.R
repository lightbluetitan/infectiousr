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

# influenza_pneumonia_ts

library(testthat)

# Test 1: Confirm class and structure
test_that("influenza_pneumonia_ts is a time series with correct class and length", {
  expect_s3_class(influenza_pneumonia_ts, "ts")
  expect_true(is.ts(influenza_pneumonia_ts))
  expect_equal(length(influenza_pneumonia_ts), 132)
})

# Test 2: Check time series start, end, and frequency
test_that("influenza_pneumonia_ts has expected time series properties", {
  expect_equal(start(influenza_pneumonia_ts), c(1968, 1))
  expect_equal(end(influenza_pneumonia_ts), c(1978, 12))
  expect_equal(frequency(influenza_pneumonia_ts), 12)
})

# Test 3: Validate data type and value characteristics
test_that("influenza_pneumonia_ts values are numeric and non-negative or NA", {
  expect_type(influenza_pneumonia_ts, "double")
  expect_true(all(influenza_pneumonia_ts >= 0 | is.na(influenza_pneumonia_ts)))
})

# Test 4: Immutability check — ensure the object is not modified by inspection
test_that("influenza_pneumonia_ts remains unchanged after operations", {
  original_data <- influenza_pneumonia_ts
  original_summary <- summary(influenza_pneumonia_ts)

  # Perform non-modifying operations
  window(influenza_pneumonia_ts, start = c(1970, 1), end = c(1970, 12))
  cycle(influenza_pneumonia_ts)
  mean(influenza_pneumonia_ts, na.rm = TRUE)

  expect_identical(influenza_pneumonia_ts, original_data)
  expect_identical(summary(influenza_pneumonia_ts), original_summary)
})
