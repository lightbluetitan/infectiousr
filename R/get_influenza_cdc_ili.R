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
#' Returns \code{NULL} if the API is unavailable or an error occurs.
#'
#' @details
#' This endpoint provides historical data for flu-like symptoms reported in the United States, sourced from the CDC ILINet.
#' Requires an active internet connection.
#'
#' @examples
#' \dontrun{
#' ili_data <- get_influenza_cdc_ili()
#' if (!is.null(ili_data)) {
#'   print(ili_data$updated)
#'   head(ili_data$data)
#' }
#' }
#'
#' @note Requires internet connection. Function fails gracefully if API is unavailable.
#'
#' @references API Docs: https://disease.sh/docs/#/Influenza/get_v3_influenza_cdc_ILINet
#'
#' @importFrom httr GET content timeout
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate as_datetime
#' @export
get_influenza_cdc_ili <- function() {
  url <- "https://disease.sh/v3/influenza/cdc/ILINet"

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
    raw_json <- httr::content(response, as = "text", encoding = "UTF-8")
    parsed <- jsonlite::fromJSON(raw_json, flatten = TRUE)

    # Extract and validate components
    updated <- if (!is.null(parsed$updated)) {
      lubridate::as_datetime(parsed$updated / 1000)
    } else {
      NA
    }

    source <- if (!is.null(parsed$source)) {
      parsed$source
    } else {
      NA_character_
    }

    # Select required columns from data, handling missing columns
    required_cols <- c("week", "age 5-24", "age 25-49", "age 50-64",
                       "age 64+", "totalILI", "totalPatients")

    if (!is.null(parsed$data) && is.data.frame(parsed$data)) {
      available_cols <- intersect(required_cols, names(parsed$data))

      if (length(available_cols) > 0) {
        data_df <- parsed$data[, available_cols, drop = FALSE]

        # Add missing columns as NA
        missing_cols <- setdiff(required_cols, available_cols)
        for (col in missing_cols) {
          data_df[[col]] <- NA
        }

        # Reorder to match expected column order
        data_df <- data_df[, required_cols, drop = FALSE]
      } else {
        data_df <- as.data.frame(matrix(NA, nrow = 0, ncol = length(required_cols)))
        names(data_df) <- required_cols
      }
    } else {
      data_df <- as.data.frame(matrix(NA, nrow = 0, ncol = length(required_cols)))
      names(data_df) <- required_cols
    }

    return(list(
      updated = updated,
      source = source,
      data = data_df
    ))
  }, error = function(e) {
    message("Failed to parse API response. The data format may have changed.")
    message("Error details: ", e$message)
    return(NULL)
  })

  return(result)
}
