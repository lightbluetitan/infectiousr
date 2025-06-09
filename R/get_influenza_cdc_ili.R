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

#' Get CDC Influenza-like Illness (ILI) Data
#'
#' Retrieves ILI data for the 2019 and 2020 influenza outbreaks from the US CDC.
#'
#' @return A list containing:
#' \itemize{
#'   \item \code{updated}: Last update timestamp (POSIXct).
#'   \item \code{source}: Source of the data.
#'   \item \code{data}: A data frame with the following columns:
#'   \itemize{
#'     \item \code{week}: Week of reporting.
#'     \item \code{age 5-24}, \code{age 25-49}, \code{age 50-64}, \code{age 64+}: ILI counts per age group.
#'     \item \code{totalILI}: Total ILI cases.
#'     \item \code{totalPatients}: Total patients.
#'   }
#' }
#'
#' @details
#' This endpoint provides historical data for flu-like symptoms reported in the United States, sourced from the CDC ILINet.
#'
#' @examples
#' \dontrun{
#' get_influenza_cdc_ili()
#' }
#'
#' @note Requires internet connection.
#'
#' @references API Docs: https://disease.sh/docs/#/Influenza/get_v3_influenza_cdc_ILINet
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @export
get_influenza_cdc_ili <- function() {
  url <- "https://disease.sh/v3/influenza/cdc/ILINet"
  response <- httr::GET(url)

  if (response$status_code != 200) {
    warning(sprintf("API request failed with status code %d", response$status_code))
    return(NULL)
  }

  raw_json <- httr::content(response, as = "text", encoding = "UTF-8")
  parsed <- jsonlite::fromJSON(raw_json, flatten = TRUE)

  updated <- lubridate::as_datetime(parsed$updated / 1000)
  source <- parsed$source
  data <- parsed$data[, c("week", "age 5-24", "age 25-49", "age 50-64", "age 64+", "totalILI", "totalPatients")]

  return(list(
    updated = updated,
    source = source,
    data = data
  ))
}
