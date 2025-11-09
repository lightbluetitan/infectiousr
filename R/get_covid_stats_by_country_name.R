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

#' Get COVID-19 Statistics for a Specific Country
#'
#' Retrieves COVID-19 totals for a given country using the 'disease.sh' API.
#'
#' @param country Character. A country name, ISO2, ISO3 code, or country ID.
#' @param yesterday Logical. If \code{TRUE}, gets data reported from the previous day. Default is \code{FALSE}.
#' @param twoDaysAgo Logical. If \code{TRUE}, gets data reported two days ago. Default is \code{FALSE}.
#' @param strict Logical. If \code{TRUE} (default), disables fuzzy matching (e.g., avoids confusion between "Oman" and "Romania").
#' @param allowNull Logical. If \code{TRUE}, allows null values (returned as \code{NA}). Default is \code{FALSE}.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{country}: Country name.
#'   \item \code{updated}: Timestamp of last update (POSIXct in UTC).
#'   \item \code{cases}: Total confirmed cases.
#'   \item \code{todayCases}: New confirmed cases today.
#'   \item \code{deaths}: Total deaths.
#'   \item \code{recovered}: Total recoveries.
#'   \item \code{population}: Estimated population.
#' }
#' Returns \code{NULL} if the API is unavailable, the country is not found, or an error occurs.
#'
#' @details
#' This function accesses COVID-19 data for a specific country based on its name or ISO code.
#' Requires an active internet connection.
#'
#' @examples
#' \dontrun{
#' # Get data for Brazil
#' brazil_data <- get_covid_stats_by_country_name("Brazil")
#' if (!is.null(brazil_data)) {
#'   print(brazil_data)
#' }
#'
#' # Get data for the USA using ISO2 code
#' usa_data <- get_covid_stats_by_country_name("US", yesterday = TRUE)
#' }
#'
#' @note Requires internet connection. Function fails gracefully if API is unavailable.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_countries__country_
#'
#' @importFrom httr GET content timeout
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @export
get_covid_stats_by_country_name <- function(country,
                                            yesterday = FALSE,
                                            twoDaysAgo = FALSE,
                                            strict = TRUE,
                                            allowNull = FALSE) {
  # Validate input
  if (missing(country) || !nzchar(country)) {
    stop("Please provide a valid country name or ISO code.")
  }

  # Prepare URL and query parameters
  base_url <- "https://disease.sh/v3/covid-19/countries"
  url <- paste0(base_url, "/", utils::URLencode(country))

  query_params <- list(
    yesterday = tolower(as.character(yesterday)),
    twoDaysAgo = tolower(as.character(twoDaysAgo)),
    strict = tolower(as.character(strict)),
    allowNull = tolower(as.character(allowNull))
  )

  # Try to make the API request with error handling
  response <- tryCatch({
    httr::GET(url, query = query_params, httr::timeout(10))
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
  if (response$status_code == 404) {
    message(sprintf("Country '%s' not found. Please check the country name or use a valid ISO code.", country))
    return(NULL)
  }

  if (response$status_code != 200) {
    message(sprintf("API request returned status code %d. The service may be temporarily unavailable.",
                    response$status_code))
    message("Please try again later or check https://disease.sh/")
    return(NULL)
  }

  # Parse JSON response with error handling
  result <- tryCatch({
    json_text <- httr::content(response, as = "text", encoding = "UTF-8")
    parsed_data <- jsonlite::fromJSON(json_text, flatten = TRUE)

    # Select relevant columns
    required_columns <- c("country", "updated", "cases", "todayCases",
                          "deaths", "recovered", "population")

    # Check if all required columns exist
    missing_cols <- setdiff(required_columns, names(parsed_data))
    if (length(missing_cols) > 0) {
      for (col in missing_cols) {
        parsed_data[[col]] <- NA
      }
    }

    result_df <- parsed_data[required_columns]
    result_df$updated <- lubridate::as_datetime(result_df$updated / 1000)

    return(as.data.frame(result_df))
  }, error = function(e) {
    message("Failed to parse API response. The data format may have changed.")
    message("Error details: ", e$message)
    return(NULL)
  })

  return(result)
}
