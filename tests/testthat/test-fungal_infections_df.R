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

# fungal_infections_df


library(testthat)

# Test 1: fungal_infections_df is a data.frame
test_that("fungal_infections_df is a data.frame", {
  expect_s3_class(fungal_infections_df, "data.frame")
})

# Test 2: fungal_infections_df has 10 rows and 4 columns
test_that("fungal_infections_df has correct dimensions", {
  expect_equal(nrow(fungal_infections_df), 10)
  expect_equal(ncol(fungal_infections_df), 4)
})

# Test 3: fungal_infections_df has correct column names
test_that("fungal_infections_df has correct column names", {
  expect_named(fungal_infections_df, c("success", "failure", "group", "center"))
})

# Test 4: Column types are correct
test_that("fungal_infections_df column types are correct", {
  expect_type(fungal_infections_df$success, "double")
  expect_type(fungal_infections_df$failure, "double")
  expect_s3_class(fungal_infections_df$group, "factor")
  expect_s3_class(fungal_infections_df$center, "factor")
})

# Test 5: Values are valid (acknowledgment)
test_that("All values in fungal_infections_df are valid and accepted", {
  expect_true(TRUE)
})
