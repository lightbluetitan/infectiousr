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

#' Get COVID-19 Statistics for Specific US State(s)
#'
#' Retrieves real-time COVID-19 totals for one or more U.S. states from the 'disease.sh' API.
#'
#' @param states A character string with the name of a U.S. state or a comma-separated list of state names. Names must be spelled correctly.
#' @param yesterday Logical. If \code{TRUE}, returns data from the previous day. Default is \code{FALSE}.
#' @param allowNull Logical. If \code{TRUE}, missing values are returned as \code{NA} instead of \code{0}. Default is \code{FALSE}.
#'
#' @return A data frame containing the following columns:
#' \itemize{
#'   \item \code{state}: State name.
#'   \item \code{updated}: Last updated timestamp (converted to human-readable datetime in UTC).
#'   \item \code{cases}: Total confirmed cases.
#'   \item \code{todayCases}: New confirmed cases today.
#'   \item \code{deaths}: Total deaths.
#'   \item \code{todayDeaths}: New deaths today.
#'   \item \code{population}: State population estimate.
#' }
#'
#' @details
#' This function sends a GET request to the 'disease.sh' API for COVID-19 statistics in one or more U.S. states.
#' If multiple states are passed, they must be comma-separated and correctly spelled.
#' The 'updated' field is returned in milliseconds and is converted to a POSIXct datetime.
#'
#' @examples
#' \dontrun{
#' # Retrieve COVID-19 data for California
#' ca <- get_covid_stats_for_state("California")
#'
#' # Retrieve yesterday's data for New York and Texas
#' ny_tx <- get_covid_stats_for_state("New York,Texas", yesterday = TRUE)
#' }
#'
#' @note Requires an internet connection.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_states__states_
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @importFrom utils URLencode
#' @export
get_covid_stats_for_state <- function(states, yesterday = FALSE, allowNull = FALSE) {
  if (missing(states) || !nzchar(states)) {
    stop("You must provide at least one state name using the 'states' argument.")
  }

  base_url <- "https://disease.sh/v3/covid-19/states/"
  encoded_states <- URLencode(states)
  url <- paste0(base_url, encoded_states)

  query_params <- list()
  if (yesterday) query_params$yesterday <- "true"
  if (allowNull) query_params$allowNull <- "true"

  response <- httr::GET(url, query = query_params)

  if (response$status_code != 200) {
    warning(sprintf("API request failed with status code %d", response$status_code))
    return(NULL)
  }

  json_text <- httr::content(response, as = "text", encoding = "UTF-8")
  parsed_data <- jsonlite::fromJSON(json_text, flatten = TRUE)

  if (!is.data.frame(parsed_data)) {
    parsed_data <- as.data.frame(parsed_data, stringsAsFactors = FALSE)
  }

  required_columns <- c("state", "updated", "cases", "todayCases", "deaths", "todayDeaths", "population")

  missing_cols <- setdiff(required_columns, names(parsed_data))
  if (length(missing_cols) > 0) {
    for (col in missing_cols) {
      parsed_data[[col]] <- NA
    }
  }

  result <- parsed_data[, required_columns, drop = FALSE]
  result$updated <- lubridate::as_datetime(result$updated / 1000)

  return(result)
}
