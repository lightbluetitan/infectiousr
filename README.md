# infectiousR

The `infectiousR` package provides a seamless interface to **access real-time data on infectious diseases through the disease.sh API, a RESTful API offering global health statistics**. 
The package enables users to explore up-to-date information on disease outbreaks, vaccination progress, and surveillance metrics across countries, continents, and U.S. states.

It includes a set of API-related functions to retrieve **real-time statistics on COVID-19, influenza-like illnesses from the Centers for Disease Control and Prevention (CDC), and vaccination coverage worldwide**.

## Installation

You can install the `infectiousR` package from CRAN with the following R function:

```R

install.packages("infectiousR")

```

## Load the Package

```R

library(infectiousR)

```

## Functions for infectiousR

The `infectiousR` package provides several core functions to retrieve real-time infectious disease data from the disease.sh API. Below is a list of the main API-access functions included in the package:

- `get_global_covid_stats()` – Retrieves global COVID-19 statistics, including total cases, deaths, recoveries, and more.

- `get_covid_stats_by_country_name()` – Fetches COVID-19 statistics for a specific country by name (e.g., "Brazil", "India").

- `get_covid_stats_by_country()` – Retrieves COVID-19 data for all countries.

- `get_covid_stats_by_continent()` – Retrieves COVID-19 data grouped by continent.

- `get_us_states_covid_stats()` – Returns COVID-19 statistics for all U.S. states.

- `get_covid_stats_for_state()` – Retrieves data for specified U.S. states (e.g., "NEW YORK", "california").

- `get_influenza_cdc_ili()` – Accesses influenza-like illness (ILI) data from the CDC.

- `view_datasets_infectiousR()` – Lists all curated datasets available in the infectiousR package.

## Dataset Suffixes

Each dataset in `infectiousR` is labeled with a `suffix` to indicate its type and structure:

- `_df`: A standard data frame.

- `_tbl_df`: A tibble, a modern version of a data frame with better formatting and functionality.

- `_ts`: A time series.

## Datasets Included in infectiousR

In addition to API functions, `infectiousR` includes several preloaded datasets that provide valuable insights into various aspects of infectious diseases such as influenza, measles, dengue, Ebola, tuberculosis, meningitis,AIDS, and others:

- `spanish_flu_df`: Contains daily mortality records from the 1918 influenza pandemic.

- `fungal_infections_df`: Provides clinical treatment outcomes for systemic fungal infections.

- `aids_azt_df`: Documents AIDS symptom progression and zidovudine (AZT) treatment responses.

- `meningitis_df`: Records meningococcal disease cases with treatment response metadata (includes missing data indicators).

## Example Code:

```R

# Load the package

library(infectiousR)

# List all datasets in the package

view_datasets_infectiousR()

# Load dataset

data(spanish_flu_df)

# Preview the dataset

head(spanish_flu_df)

# Open in Viewer

View(spanish_flu_df)

```
