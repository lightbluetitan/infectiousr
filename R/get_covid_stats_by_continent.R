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

#' Get COVID-19 Statistics for All Continents
#'
#' Retrieves real-time COVID-19 totals for all continents from the 'disease.sh' API.
#'
#' @param yesterday Logical. If \code{TRUE}, retrieves data reported from the previous day. Default is \code{FALSE}.
#' @param twoDaysAgo Logical. If \code{TRUE}, retrieves data reported two days ago. Default is \code{FALSE}.
#' @param sort Character. Field to sort results by. Options include: \code{"cases"}, \code{"todayCases"}, \code{"deaths"}, \code{"recovered"}, \code{"active"}, etc.
#' @param allowNull Logical. If \code{TRUE}, missing values are returned as \code{NA} instead of \code{0}. Default is \code{FALSE}.
#'
#' @return A data frame containing:
#' \itemize{
#'   \item \code{continent}: Continent name.
#'   \item \code{updated}: Last updated timestamp (as POSIXct in UTC).
#'   \item \code{cases}: Total confirmed cases.
#'   \item \code{todayCases}: New confirmed cases today.
#'   \item \code{deaths}: Total deaths.
#'   \item \code{todayDeaths}: New deaths today.
#'   \item \code{population}: Continent population estimate.
#' }
#' Returns \code{NULL} if the API is unavailable or an error occurs.
#'
#' @details
#' This function retrieves COVID-19 summary data for each continent.
#' You may specify whether to get data from today, yesterday, or two days ago.
#' Requires an active internet connection.
#'
#' @examples
#' \dontrun{
#' # Get current COVID-19 stats for all continents
#' stats <- get_covid_stats_by_continent()
#' if (!is.null(stats)) {
#'   print(stats)
#' }
#'
#' # Get yesterday's data sorted by number of cases
#' stats_yesterday <- get_covid_stats_by_continent(yesterday = TRUE, sort = "cases")
#' }
#'
#' @note Requires internet access. Function fails gracefully if API is unavailable.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_continents
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @export
get_covid_stats_by_continent <- function(yesterday = FALSE,
                                         twoDaysAgo = FALSE,
                                         sort = NULL,
                                         allowNull = FALSE) {
  url <- "https://disease.sh/v3/covid-19/continents"

  # Prepare query parameters
  query_params <- list()
  if (yesterday) query_params$yesterday <- "true"
  if (twoDaysAgo) query_params$twoDaysAgo <- "true"
  if (!is.null(sort)) query_params$sort <- sort
  if (allowNull) query_params$allowNull <- "true"

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
    required_columns <- c("continent", "updated", "cases", "todayCases",
                          "deaths", "todayDeaths", "population")
    missing_cols <- setdiff(required_columns, names(parsed_data))

    if (length(missing_cols) > 0) {
      for (col in missing_cols) {
        parsed_data[[col]] <- NA
      }
    }

    result_df <- parsed_data[, required_columns, drop = FALSE]
    result_df$updated <- lubridate::as_datetime(result_df$updated / 1000)

    return(result_df)
  }, error = function(e) {
    message("Failed to parse API response. The data format may have changed.")
    message("Error details: ", e$message)
    return(NULL)
  })

  return(result)
}
