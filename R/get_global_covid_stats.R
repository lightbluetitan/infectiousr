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

#' Get Global COVID-19 Statistics
#'
#' Retrieves real-time global statistics on COVID-19 from the 'disease.sh' API.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{updated}: Last updated time (as a human-readable date-time).
#'   \item \code{cases}: Total confirmed cases worldwide.
#'   \item \code{newCases}: Number of new confirmed cases today.
#'   \item \code{deaths}: Total confirmed deaths worldwide.
#'   \item \code{recovered}: Total number of recovered patients.
#'   \item \code{newRecov}: Number of recovered patients today.
#'   \item \code{active}: Current active cases.
#'   \item \code{critical}: Current number of critical cases.
#'   \item \code{tests}: Total number of tests performed.
#'   \item \code{pop}: Estimated global population.
#'   \item \code{countries}: Number of countries affected.
#' }
#' Returns \code{NULL} if the API is unavailable or an error occurs.
#'
#' @details
#' This function sends a GET request to the 'disease.sh' API and parses the returned JSON
#' into a structured and user-friendly data frame. The timestamp is converted to a readable
#' date-time format (in UTC).
#' Requires an active internet connection.
#'
#' @examples
#' \dontrun{
#' global_stats <- get_global_covid_stats()
#' if (!is.null(global_stats)) {
#'   print(global_stats)
#' }
#' }
#'
#' @note An internet connection is required to use this function. Function fails gracefully if API is unavailable.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_all
#'
#' @importFrom httr GET content timeout
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @export
get_global_covid_stats <- function() {
  url <- "https://disease.sh/v3/covid-19/all"

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
    data <- jsonlite::fromJSON(content_raw)

    # Build data frame with error handling for missing fields
    df <- data.frame(
      updated = as.Date(lubridate::as_datetime(
        ifelse(is.null(data$updated), NA, data$updated / 1000)
      )),
      cases = ifelse(is.null(data$cases), NA, data$cases),
      newCases = ifelse(is.null(data$todayCases), NA, data$todayCases),
      deaths = ifelse(is.null(data$deaths), NA, data$deaths),
      recovered = ifelse(is.null(data$recovered), NA, data$recovered),
      newRecov = ifelse(is.null(data$todayRecovered), NA, data$todayRecovered),
      active = ifelse(is.null(data$active), NA, data$active),
      critical = ifelse(is.null(data$critical), NA, data$critical),
      tests = ifelse(is.null(data$tests), NA, data$tests),
      pop = ifelse(is.null(data$population), NA, data$population),
      countries = ifelse(is.null(data$affectedCountries), NA, data$affectedCountries),
      stringsAsFactors = FALSE
    )

    return(df)
  }, error = function(e) {
    message("Failed to parse API response. The data format may have changed.")
    message("Error details: ", e$message)
    return(NULL)
  })

  return(result)
}
