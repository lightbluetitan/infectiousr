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

# utils.R


utils::globalVariables(c(
  # Variables of the get_covid_stats_by_continent function
  "continent", "updated", "cases", "todayCases", "deaths", "todayDeaths", "population",

  # Variables of the get_covid_stats_by_country_name function
  "country", "updated", "cases", "todayCases", "deaths", "recovered", "population",


  # Variables of the get_covid_stats_by_country function
  "country", "updated", "cases", "todayCases", "deaths", "todayDeaths", "population",

  # Variables of the get_covid_stats_for_state function
  "state", "updated", "cases", "todayCases", "deaths", "todayDeaths", "population",

  # Variables of the get_global_covid_stats function
  "updated", "cases", "newCases", "deaths", "recovered", "newRecov", "active", "critical", "tests", "pop", "countries",

    # Variables of the get_influenza_cdc_ili function
  "updated", "source", "week", "age 5-24", "age 25-49", "age 50-64", "age 64+", "totalILI", "totalPatients",


  # Variables of the get_us_states_covid_stats function
  "state", "cases", "todayCases", "deaths", "todayDeaths", "active", "population"


))

utils::globalVariables(c("data"))
