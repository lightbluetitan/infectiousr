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
#'
#' @details
#' This function accesses COVID-19 data for a specific country based on its name or ISO code.
#'
#' @examples
#' \dontrun{
#' # Get data for Brazil
#' get_covid_stats_by_country_name("Brazil")
#'
#' # Get data for the USA using ISO2 code
#' get_covid_stats_by_country_name("US", yesterday = TRUE)
#' }
#'
#' @note Requires internet connection.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_countries__country_
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @export
get_covid_stats_by_country_name <- function(country,
                                            yesterday = FALSE,
                                            twoDaysAgo = FALSE,
                                            strict = TRUE,
                                            allowNull = FALSE) {
  if (missing(country) || !nzchar(country)) {
    stop("Please provide a valid country name or ISO code.")
  }

  base_url <- "https://disease.sh/v3/covid-19/countries"
  url <- paste0(base_url, "/", utils::URLencode(country))

  query_params <- list(
    yesterday = tolower(as.character(yesterday)),
    twoDaysAgo = tolower(as.character(twoDaysAgo)),
    strict = tolower(as.character(strict)),
    allowNull = tolower(as.character(allowNull))
  )

  response <- httr::GET(url, query = query_params)

  if (response$status_code != 200) {
    warning(sprintf("API request failed with status code %d", response$status_code))
    return(NULL)
  }

  json_text <- httr::content(response, as = "text", encoding = "UTF-8")
  parsed_data <- jsonlite::fromJSON(json_text, flatten = TRUE)

  result <- parsed_data[c("country", "updated", "cases", "todayCases", "deaths", "recovered", "population")]
  result$updated <- lubridate::as_datetime(result$updated / 1000)

  return(as.data.frame(result))
}
