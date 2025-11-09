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

# view_datasets_infectiousR


library(testthat)
library(infectiousR)

test_that("view_datasets_infectiousR works when package is loaded", {
  result <- view_datasets_infectiousR()
  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("view_datasets_infectiousR prints correct message", {
  output <- capture_messages(view_datasets_infectiousR())
  expect_match(
    output[1],
    "Datasets available in the 'infectiousR' package:",
    fixed = TRUE
  )
})

test_that("view_datasets_infectiousR returns expected datasets", {
  datasets <- view_datasets_infectiousR()
  expected_datasets <- c(
    "flu_enrich_df",
    "influenza_pneumonia_ts",
    "influenza_vax_survey_df",
    "campy_infections_ts",
    "ecoli_infections_df",
    "influenza_infections_df",
    "measles_infections_df",
    "ehec_infections_df",
    "covid_mortality_df",
    "covid_severity_df",
    "us_covid_cases_df",
    "contagious_diseases_df",
    "measles_survey_df",
    "rubella_peru_df",
    "influenza_ice_df",
    "gonorrhea_ma_df",
    "diphtheria_philly_df",
    "malaria_mice_df",
    "active_hepatitis_df",
    "hepatitisA_df",
    "rubella_austria_df",
    "china_dengue_tbl_df",
    "india_dengue_tbl_df",
    "korea_dengue_tbl_df",
    "zika_girardot_df",
    "zika_sanandres_df",
    "sars_canada_df",
    "smallpox_nigeria_df",
    "ebola_survey_tbl_df",
    "ebola_cases_df",
    "ebola_sleone_df",
    "streptomycin_tbl_df",
    "bcg_vaccine_df",
    "meningitis_df",
    "aids_azt_df",
    "fungal_infections_df",
    "covid_new_york_df",
    "spanish_flu_df"


  )
  # Check if all expected datasets are present
  missing_datasets <- setdiff(expected_datasets, datasets)
  expect_true(
    length(missing_datasets) == 0,
    info = paste("Missing datasets:", paste(missing_datasets, collapse = ", "))
  )
})
