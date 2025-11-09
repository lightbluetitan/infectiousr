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

# campy_infections_ts

library(testthat)

# Test 1: Confirm the object is a time series
test_that("campy_infections_ts is a ts object", {
  expect_s3_class(campy_infections_ts, "ts")
  expect_true(is.ts(campy_infections_ts))
})

# Test 2: Confirm its length is exactly 140
test_that("campy_infections_ts has length 140", {
  expect_equal(length(campy_infections_ts), 140)
})

# Test 3: Confirm its start date, end date, and frequency
test_that("campy_infections_ts has correct time range and frequency", {
  expect_equal(start(campy_infections_ts), c(1990, 1))
  expect_equal(end(campy_infections_ts), c(2000, 10))
  expect_equal(frequency(campy_infections_ts), 13)
})

# Test 4: Confirm all values are either numeric or NA (not character, logical, etc.)
test_that("campy_infections_ts contains only numeric or NA values", {
  expect_true(all(is.na(campy_infections_ts) | is.numeric(campy_infections_ts)))
})

# Test 5: Confirm that values were not accidentally coerced into character
test_that("campy_infections_ts has no character values", {
  expect_false(any(is.character(campy_infections_ts)))
})
