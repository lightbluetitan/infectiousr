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

#' Get COVID-19 Statistics for U.S. States and Territories
#'
#' Retrieves real-time COVID-19 totals from the 'disease.sh' API for all 50 U.S. states,
#' as well as U.S. territories (e.g., Puerto Rico, Guam), special jurisdictions
#' (e.g., Veteran Affairs, U.S. Military), and others (e.g., cruise ships, repatriated individuals).
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{state}: Name of the U.S. state.
#'   \item \code{cases}: Total confirmed cases in the state.
#'   \item \code{todayCases}: New confirmed cases today.
#'   \item \code{deaths}: Total deaths in the state.
#'   \item \code{todayDeaths}: New deaths today.
#'   \item \code{active}: Current active cases.
#'   \item \code{population}: Estimated state population.
#' }
#' Returns \code{NULL} if the API is unavailable or an error occurs.
#'
#' @details
#' This function sends a GET request to the 'disease.sh' API endpoint for US state-level COVID-19
#' statistics and parses the response into a structured data frame.
#' The timestamp is converted to a readable date-time format (in UTC).
#' Requires an active internet connection.
#'
#' @examples
#' \dontrun{
#' us_states_stats <- get_us_states_covid_stats()
#' if (!is.null(us_states_stats)) {
#'   head(us_states_stats)
#' }
#' }
#'
#' @note An internet connection is required to use this function. Function fails gracefully if API is unavailable.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19:%20Worldometers/get_v3_covid_19_states
#'
#' @importFrom httr GET content timeout
#' @importFrom jsonlite fromJSON
#' @export
get_us_states_covid_stats <- function() {
  url <- "https://disease.sh/v3/covid-19/states"

  # Try to make the API request with error handling
  response <- tryCatch({
    httr::GET(url, httr::timeout(10))
  }, error = function(e) {
    message("Failed to connect to disease.sh API. Please check your internet connection.")
    message("Error details: ", e$message)
    return(NULL)
  })

  # If connection failed, return NULL
  if (is.null(response)) {
    return(NULL)
  }

  # Check HTTP status code
  if (response$status_code != 200) {
    message(sprintf("API request returned status code %d. The service may be temporarily unavailable.",
                    response$status_code))
    message("Please try again later or check https://disease.sh/")
    return(NULL)
  }

  # Parse JSON response with error handling
  result <- tryCatch({
    content_raw <- httr::content(response, as = "text", encoding = "UTF-8")
    data_df <- jsonlite::fromJSON(content_raw, flatten = TRUE)

    # Expected columns
    expected_cols <- c("state", "cases", "todayCases", "deaths",
                       "todayDeaths", "active", "population")

    # Available columns
    available_cols <- intersect(expected_cols, names(data_df))

    # Extract available columns
    if (length(available_cols) > 0) {
      df <- data_df[, available_cols, drop = FALSE]
    } else {
      # If no expected columns exist, create empty data frame
      df <- data.frame(matrix(ncol = 0, nrow = nrow(data_df)))
    }

    # Add missing columns with NA
    missing_cols <- setdiff(expected_cols, names(df))
    for (col in missing_cols) {
      df[[col]] <- NA
    }

    # Reorder columns to match expected order
    df <- df[, expected_cols, drop = FALSE]

    return(df)
  }, error = function(e) {
    message("Failed to parse API response. The data format may have changed.")
    message("Error details: ", e$message)
    return(NULL)
  })

  return(result)
}
