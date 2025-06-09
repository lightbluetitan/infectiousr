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

#' Get Global COVID-19 Statistics
#'
#' Retrieves real-time global statistics on COVID-19 from the 'disease.sh' API.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{updated}: Last updated time (as a human-readable date-time).
#'   \item \code{cases}: Total confirmed cases worldwide.
#'   \item \code{todayCases}: Number of new confirmed cases today.
#'   \item \code{deaths}: Total confirmed deaths worldwide.
#'   \item \code{recovered}: Total number of recovered patients.
#'   \item \code{todayRecovered}: Number of recovered patients today.
#'   \item \code{active}: Current active cases.
#'   \item \code{critical}: Current number of critical cases.
#'   \item \code{tests}: Total number of tests performed.
#'   \item \code{population}: Estimated global population.
#'   \item \code{affectedCountries}: Number of countries affected.
#' }
#'
#' @details
#' This function sends a GET request to the 'disease.sh' API and parses the returned JSON
#' into a structured and user-friendly data frame. The timestamp is converted to a readable
#' date-time format (in UTC).
#'
#' @examples
#' \dontrun{
#' global_stats <- get_global_covid_stats()
#' print(global_stats)
#' }
#'
#' @note An internet connection is required to use this function.
#'
#' @references API Docs: https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_all
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr select
#' @importFrom lubridate as_datetime
#' @export
get_global_covid_stats <- function() {
  url <- "https://disease.sh/v3/covid-19/all"
  response <- httr::GET(url)

  if (response$status_code != 200) {
    warning(paste("Error: Received status code", response$status_code))
    return(NULL)
  }

  content_raw <- httr::content(response, as = "text", encoding = "UTF-8")
  data <- jsonlite::fromJSON(content_raw)

  df <- data.frame(
    updated = as.Date(lubridate::as_datetime(data$updated / 1000)),
    cases = data$cases,
    newCases = data$todayCases,
    deaths = data$deaths,
    recovered = data$recovered,
    newRecov = data$todayRecovered,
    active = data$active,
    critical = data$critical,
    tests = data$tests,
    pop = data$population,
    countries = data$affectedCountries,
    stringsAsFactors = FALSE
  )

  return(df)
}
