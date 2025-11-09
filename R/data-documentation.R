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


#' Flu Enrichment Gene Data
#'
#' This dataset, flu_enrich_df, is a data frame containing gene-set enrichment information
#' for genes that have been identified as having an effect on influenza-virus replication.
#'
#' The dataset name has been kept as 'flu_enrich_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name flu_enrich_df
#' @format A data frame with 5719 observations and 3 variables:
#' \describe{
#'   \item{nflugenes}{Numeric vector representing gene identifiers with an effect on influenza-virus replication}
#'   \item{setsize}{Integer vector representing the size of each gene set}
#'   \item{GO_terms}{Factor vector representing Gene Ontology terms associated with each gene set}
#' }
#' @source Data taken from the rvalues package version 0.7.1
#' @usage data(flu_enrich_df)
#' @export
load("data/flu_enrich_df.rda")
NULL


#' US Pneumonia and Influenza Death Rates
#'
#' This dataset, \code{influenza_pneumonia_ts}, is a time series containing monthly pneumonia and influenza deaths
#' per 10,000 people in the United States over a period of 11 years, from 1968 to 1978.
#'
#' The dataset name has been kept as \code{influenza_pneumonia_ts} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' \pkg{infectiousR} package and assists users in identifying its specific characteristics.
#' The suffix \code{_ts} indicates that the dataset is a time series object. The original content has not been modified
#' in any way.
#'
#' @name influenza_pneumonia_ts
#' @format A time series object with 132 monthly observations:
#' \describe{
#'   \item{value}{Monthly pneumonia and influenza deaths per 10,000 people in the United States from 1968 to 1978.}
#' }
#' @source Data taken from the \pkg{astsa} package version 2.2.
#' @usage data(influenza_pneumonia_ts)
#' @export
load("data/influenza_pneumonia_ts.rda")
NULL


#' Influenza Vaccination Survey
#'
#' This dataset, influenza_vax_survey_df, is a data frame containing aggregated responses
#' from three RAND American Life Panel (ALP) surveys regarding individuals' probability of
#' vaccinating for influenza. The responses were discretized to "Never" (0\%), "Always" (100\%),
#' or "Sometimes" (any other value). After merging, missing responses were coded as "Missing",
#' and respondents were grouped and counted by all three coded responses.
#'
#' The dataset name has been kept as 'influenza_vax_survey_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name influenza_vax_survey_df
#' @format A data frame with 117 observations and 6 variables:
#' \describe{
#'   \item{survey}{Factor indicating which of the three ALP surveys the response came from}
#'   \item{freq}{Integer indicating frequency count of grouped respondents}
#'   \item{subject}{Integer identifier for each subject}
#'   \item{response}{Factor with 4 levels: "Never", "Sometimes", "Always", and "Missing"}
#'   \item{start_date}{Date indicating the start of the survey}
#'   \item{end_date}{Date indicating the end of the survey}
#' }
#' @source Data taken from the ggalluvial package version 0.12.5
#' @usage data(influenza_vax_survey_df)
#' @export
load("data/influenza_vax_survey_df.rda")
NULL

#' Campylobacter Infections Time Series
#'
#' This dataset, campy_infections_ts, is a time series object containing the number of cases
#' of campylobacter infections in the north of the province Quebec (Canada) in four week intervals
#' from January 1990 to the end of October 2000. It contains 13 observations per year and 140
#' observations in total.
#'
#' The dataset name has been kept as 'campy_infections_ts' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'ts' indicates that the dataset is a time series object. The original content
#' has not been modified in any way.
#'
#' @name campy_infections_ts
#' @format A time series object of class \code{ts} with 140 observations, frequency 13,
#' starting from 1990 to 2000 (end of October).
#' @source Data taken from the tscount package version 1.4.3. Original study:
#' Ferland, R., Latour, A. and Oraichi, D. (2006) Integer-valued GARCH process.
#' \emph{Journal of Time Series Analysis} 27(6), 923--942.
#' @usage data(campy_infections_ts)
#' @export
load("data/campy_infections_ts.rda")
NULL

#' E. coli Infections Time Series
#'
#' This dataset, ecoli_infections_df, is a data frame containing the weekly number of reported
#' disease cases caused by \emph{Escherichia coli} in the state of North Rhine-Westphalia (Germany)
#' from January 2001 to May 2013. The data excludes cases of EHEC (enterohemorrhagic
#' \emph{E. coli}) and HUS (hemolytic uremic syndrome).
#'
#' The dataset name has been kept as 'ecoli_infections_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name ecoli_infections_df
#' @format A data frame with 646 observations and 3 variables:
#' \describe{
#'   \item{year}{Numeric variable indicating the calendar year of observation}
#'   \item{week}{Numeric variable indicating the calendar week (1 to 52 or 53)}
#'   \item{cases}{Numeric variable representing the number of reported \emph{E. coli} cases}
#' }
#' @source Data taken from the tscount package version 1.4.3
#' @usage data(ecoli_infections_df)
#' @export
load("data/ecoli_infections_df.rda")
NULL


#' Influenza Infections Time Series
#'
#' This dataset, influenza_infections_df, is a data frame containing the weekly number of reported
#' influenza cases in the state of North Rhine-Westphalia (Germany) from January 2001 to May 2013.
#'
#' The dataset name has been kept as 'influenza_infections_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name influenza_infections_df
#' @format A data frame with 646 observations and 3 variables:
#' \describe{
#'   \item{year}{Numeric variable indicating the calendar year of observation}
#'   \item{week}{Numeric variable indicating the calendar week (1 to 52 or 53)}
#'   \item{cases}{Numeric variable representing the number of reported influenza cases}
#' }
#' @source Data taken from the tscount package version 1.4.3
#' @usage data(influenza_infections_df)
#' @export
load("data/influenza_infections_df.rda")
NULL


#' Measles Infections Time Series
#'
#' This dataset, measles_infections_df, is a data frame containing the weekly number of reported
#' measles infections in the state of North Rhine-Westphalia (Germany) from January 2001 to May 2013.
#'
#' The dataset name has been kept as 'measles_infections_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name measles_infections_df
#' @format A data frame with 646 observations and 3 variables:
#' \describe{
#'   \item{year}{Numeric variable indicating the calendar year of observation}
#'   \item{week}{Numeric variable indicating the calendar week (1 to 52 or 53)}
#'   \item{cases}{Numeric variable representing the number of reported measles cases}
#' }
#' @source Data taken from the tscount package version 1.4.3
#' @usage data(measles_infections_df)
#' @export
load("data/measles_infections_df.rda")
NULL


#' EHEC Infections Time Series
#'
#' This dataset, ehec_infections_df, is a data frame containing the weekly number of reported
#' EHEC/HUS infections in the state of North Rhine-Westphalia (Germany) from January 2001 to May 2013.
#'
#' The dataset name has been kept as 'ehec_infections_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name ehec_infections_df
#' @format A data frame with 646 observations and 3 variables:
#' \describe{
#'   \item{year}{Numeric variable indicating the calendar year of observation}
#'   \item{week}{Numeric variable indicating the calendar week (1 to 52 or 53)}
#'   \item{cases}{Numeric variable representing the number of reported EHEC/HUS cases}
#' }
#' @source Data taken from the tscount package version 1.4.3
#' @usage data(ehec_infections_df)
#' @export
load("data/ehec_infections_df.rda")
NULL

#' COVID-19 Cardiovascular Mortality
#'
#' This dataset, \code{covid_mortality_df}, is a data frame containing several effect
#' estimates (\eqn{\beta}) and their standard errors for the impact of cardiovascular
#' disease on the mortality of COVID-19 reported in the literature.
#'
#' The dataset name has been kept as \code{covid_mortality_df} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix \code{_df} indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name covid_mortality_df
#' @format A data frame with 6 observations and 3 variables:
#' \describe{
#'   \item{study}{Character vector with the name or reference of each study}
#'   \item{beta}{Numeric vector representing the estimated effect size (\eqn{\beta})}
#'   \item{se}{Numeric vector representing the standard error associated with each estimate}
#' }
#' @source Data taken from the PRP package version 0.1.1
#' @usage data(covid_mortality_df)
#' @export
load("data/covid_mortality_df.rda")
NULL


#' COVID-19 Cardiovascular Severity
#'
#' This dataset, \code{covid_severity_df}, is a data frame containing several effect
#' estimates (\eqn{\beta}) and their standard errors for the impact of cardiovascular
#' disease on the severe case rate of COVID-19 as reported in the literature.
#'
#' The dataset name has been kept as \code{covid_severity_df} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix \code{_df} indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name covid_severity_df
#' @format A data frame with 6 observations and 3 variables:
#' \describe{
#'   \item{study}{Character vector with the name or reference of each study}
#'   \item{beta}{Numeric vector representing the estimated effect size (\eqn{\beta})}
#'   \item{se}{Numeric vector representing the standard error associated with each estimate}
#' }
#' @source Data taken from the PRP package version 0.1.1
#' @usage data(covid_severity_df)
#' @export
load("data/covid_severity_df.rda")
NULL

#' US Lab-Confirmed COVID-19 Cases
#'
#' This dataset, \code{us_covid_cases_df}, is a data frame containing the number of
#' laboratory-confirmed COVID-19 cases in the United States, as reported by the
#' Centers for Disease Control and Prevention (CDC), between January 1, 2020 and
#' May 11, 2023, the end of the public health emergency declaration.
#'
#' The dataset name has been kept as \code{us_covid_cases_df} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix \code{_df} indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name us_covid_cases_df
#' @format A data frame with 1227 observations and 2 variables:
#' \describe{
#'   \item{date}{Date of report (class \code{Date})}
#'   \item{cases}{Integer vector indicating the number of confirmed cases reported on each date}
#' }
#' @source Data taken from the cpr package version 0.4.0
#' @usage data(us_covid_cases_df)
#' @export
load("data/us_covid_cases_df.rda")
NULL



#' Contagious Disease Data for US States
#'
#' This dataset, \code{contagious_diseases_df}, is a data frame containing yearly counts
#' for Hepatitis A, Measles, Mumps, Pertussis, Polio, Rubella, and Smallpox for US states.
#' The original data is courtesy of the Tycho Project.
#'
#' The dataset name has been kept as \code{contagious_diseases_df} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix \code{_df} indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name contagious_diseases_df
#' @format A data frame with 16,065 observations and 6 variables:
#' \describe{
#'   \item{disease}{Factor with 7 levels indicating the disease type}
#'   \item{state}{Factor with 51 levels indicating the US state}
#'   \item{year}{Numeric vector indicating the year of observation}
#'   \item{weeks_reporting}{Numeric vector indicating the number of weeks reported}
#'   \item{count}{Numeric vector indicating the number of cases reported}
#'   \item{population}{Numeric vector indicating the population of the state in that year}
#' }
#' @source Data taken from the dslabs package version 0.8.0. Original data courtesy of the Tycho Project (\url{http://www.tycho.pitt.edu/}).
#' @usage data(contagious_diseases_df)
#' @export
load("data/contagious_diseases_df.rda")
NULL


#' Measles Non-Vaccination Parent Survey
#'
#' This dataset, \code{measles_survey_df}, is a data frame containing the results of a survey
#' conducted by Roberts et al. (1995) on parents whose children had not been immunized
#' against measles during a recent campaign targeting all children in the first five years
#' of secondary school.
#'
#' The dataset name has been kept as \code{measles_survey_df} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix \code{_df} indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name measles_survey_df
#' @format A data frame with 307 observations and 11 variables:
#' \describe{
#'   \item{school}{Factor with 10 levels indicating the school}
#'   \item{form}{Factor with 2 levels indicating school form}
#'   \item{returnf}{Factor with 2 levels indicating if the form was returned}
#'   \item{consent}{Factor with 2 levels indicating if consent was given}
#'   \item{hadmeas}{Factor with 2 levels indicating if the child had measles}
#'   \item{previmm}{Factor with 2 levels indicating previous immunization}
#'   \item{sideeff}{Factor with 2 levels indicating concerns about side effects}
#'   \item{gp}{Factor with 2 levels indicating whether GP advised}
#'   \item{noshot}{Factor with 2 levels indicating general refusal to vaccinate}
#'   \item{notser}{Factor with 2 levels indicating the child was not seriously ill}
#'   \item{gpadv}{Factor with 2 levels indicating GP advice against immunization}
#' }
#' @source Data taken from the SDaA package version 0.1-5
#' @usage data(measles_survey_df)
#' @export
load("data/measles_survey_df.rda")
NULL


#' Rubella in Peru Data
#'
#' This dataset, \code{rubella_peru_df}, is a data frame containing rubella incidence data
#' by age as studied by Metcalf et al. (2011) in Peru.
#'
#' The dataset name has been kept as \code{rubella_peru_df} to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix \code{_df} indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name rubella_peru_df
#' @format A data frame with 95 observations and 4 variables:
#' \describe{
#'   \item{age}{Numeric vector indicating the age of individuals}
#'   \item{incidence}{Integer vector indicating the number of rubella cases per age group}
#'   \item{cumulative}{Integer vector indicating the cumulative number of cases by age}
#'   \item{n}{Integer vector representing the sample size for each age group}
#' }
#' @source Data taken from the epimdr package version 0.6-5
#' @usage data(rubella_peru_df)
#' @export
load("data/rubella_peru_df.rda")
NULL

#' Monthly Influenza Incidence in Iceland
#'
#' This dataset, influenza_ice_df, is a data frame containing monthly incidence
#' data of influenza-like illness (ILI) in Iceland between 1980 and 2009.
#'
#' The dataset name has been kept as 'influenza_ice_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name influenza_ice_df
#' @format A data frame with 360 observations and 3 variables:
#' \describe{
#'   \item{month}{Integer vector representing the month of observation (1--12)}
#'   \item{year}{Integer vector representing the year of observation (1980--2009)}
#'   \item{ili}{Integer vector representing the monthly incidence of influenza-like illness}
#' }
#' @source Data taken from the epimdr package version 0.6-5
#' @usage data(influenza_ice_df)
#' @export
load("data/influenza_ice_df.rda")
NULL

#' Weekly Gonorrhea Cases in Massachusetts
#'
#' This dataset, gonorrhea_ma_df, is a data frame containing weekly cases
#' of gonorrhea in Massachusetts between 2006 and 2015.
#'
#' The dataset name has been kept as 'gonorrhea_ma_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name gonorrhea_ma_df
#' @format A data frame with 422 observations and 4 variables:
#' \describe{
#'   \item{number}{Integer vector representing the number of weekly gonorrhea cases}
#'   \item{year}{Numeric vector representing the year of observation (2006--2015)}
#'   \item{week}{Numeric vector representing the epidemiological week (1--52)}
#'   \item{time}{Numeric vector representing the continuous time index}
#' }
#' @source Data taken from the epimdr package version 0.6-5
#' @usage data(gonorrhea_ma_df)
#' @export
load("data/gonorrhea_ma_df.rda")
NULL



#' Weekly Diphtheria Incidence in Philadelphia
#'
#' This dataset, diphtheria_philly_df, is a data frame containing the weekly incidence
#' of diphtheria in Philadelphia between 1914 and 1947.
#'
#' The dataset name has been kept as 'diphtheria_philly_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name diphtheria_philly_df
#' @format A data frame with 1774 observations and 4 variables:
#' \describe{
#'   \item{YEAR}{Integer vector representing the year of observation (1914--1947)}
#'   \item{WEEK}{Integer vector representing the epidemiological week (1--52)}
#'   \item{PHILADELPHIA}{Integer vector representing the weekly incidence of diphtheria in Philadelphia}
#'   \item{TIME}{Numeric vector representing the continuous time index}
#' }
#' @source Data taken from the epimdr package version 0.6-5
#' @usage data(diphtheria_philly_df)
#' @export
load("data/diphtheria_philly_df.rda")
NULL


#' Daily Measures of Malaria-Infected Mice
#'
#' This dataset, malaria_mice_df, is a data frame containing daily data on
#' laboratory mice infected with various strains of *Plasmodium chaubaudi*.
#'
#' The dataset name has been kept as 'malaria_mice_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name malaria_mice_df
#' @format A data frame with 1300 observations and 11 variables:
#' \describe{
#'   \item{Line}{Integer vector indicating the parasite line}
#'   \item{Day}{Integer vector representing the day of observation}
#'   \item{Box}{Integer vector identifying the box where the mouse was housed}
#'   \item{Mouse}{Integer vector identifying the individual mouse}
#'   \item{Treatment}{Factor indicating the treatment group (6 levels)}
#'   \item{Ind2}{Integer vector used to identify individual measurements}
#'   \item{Weight}{Numeric vector indicating the weight of the mouse}
#'   \item{Glucose}{Integer vector indicating glucose levels}
#'   \item{RBC}{Numeric vector representing red blood cell counts}
#'   \item{Sample}{Integer vector identifying sample number}
#'   \item{Para}{Numeric vector indicating parasitemia levels}
#' }
#' @source Data taken from the epimdr package version 0.6-5
#' @usage data(malaria_mice_df)
#' @export
load("data/malaria_mice_df.rda")
NULL


#' Chronic Active Hepatitis Clinical Trial
#'
#' This dataset, active_hepatitis_df, is a data frame containing information from
#' a clinical trial of 44 patients with chronic active hepatitis. Patients were randomized
#' to receive either the drug prednisolone or no treatment (control group).
#'
#' The dataset name has been kept as 'active_hepatitis_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name active_hepatitis_df
#' @format A data frame with 44 observations and 3 variables:
#' \describe{
#'   \item{treatment}{Integer vector indicating treatment group: 1 for prednisolone, 0 for control}
#'   \item{time}{Integer vector representing the time to event or censoring (in days)}
#'   \item{status}{Integer vector indicating status: 1 for death, 0 for censored}
#' }
#' @source Data taken from the collett package version 0.1.0
#' @usage data(active_hepatitis_df)
#' @export
load("data/active_hepatitis_df.rda")
NULL


#' Hepatitis A Prevalence in Bulgaria
#'
#' This dataset, hepatitisA_df, is a data frame containing information from a cross-sectional
#' survey conducted in 1964 on the prevalence of hepatitis A in individuals from Bulgaria.
#' The surveyed population includes individuals aged between 1 and 86 years.
#'
#' The dataset name has been kept as 'hepatitisA_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name hepatitisA_df
#' @format A data frame with 83 observations and 3 variables:
#' \describe{
#'   \item{t}{Integer vector indicating the age of the individuals}
#'   \item{freq1}{Integer vector representing the frequency of individuals tested}
#'   \item{freq2}{Integer vector representing the frequency of individuals with antibodies to hepatitis A}
#' }
#' @source Data taken from the curstatCI package version 0.1.1
#' @usage data(hepatitisA_df)
#' @export
load("data/hepatitisA_df.rda")
NULL


#' Rubella Prevalence in Austrian Males
#'
#' This dataset, rubella_austria_df, is a data frame containing prevalence data of rubella
#' in 230 Austrian males older than three months, for whom the exact date of birth was known.
#' Each individual was tested at the Institute of Virology, Vienna during the period 1–25 March 1988
#' for immunization against Rubella.
#'
#' The dataset name has been kept as 'rubella_austria_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name rubella_austria_df
#' @format A data frame with 225 observations and 3 variables:
#' \describe{
#'   \item{t}{Numeric vector representing age or time (in months or years as recorded)}
#'   \item{freq1}{Integer vector representing frequency count 1}
#'   \item{freq2}{Integer vector representing frequency count 2}
#' }
#' @source Data taken from the curstatCI package version 0.1.1
#' @usage data(rubella_austria_df)
#' @export
load("data/rubella_austria_df.rda")
NULL


#' Dengue Cases in Mainland China (2005–2020)
#'
#' This dataset, china_dengue_tbl_df, is a tibble containing annual records of
#' indigenous and imported dengue cases in mainland China from 2005 to 2020.
#'
#' The dataset name has been kept as 'china_dengue_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name china_dengue_tbl_df
#' @format A tibble with 16 observations and 5 variables:
#' \describe{
#'   \item{year}{Integer year of observation (2005–2020)}
#'   \item{dengue.cases.indigenous}{Numeric vector of indigenous dengue cases}
#'   \item{dengue.cases.imported}{Numeric vector of imported dengue cases}
#'   \item{counties.with.dengue.fever.indigenous}{Numeric vector of counties with reported indigenous dengue fever}
#'   \item{counties.with.dengue.fever.imported}{Numeric vector of counties with reported imported dengue fever}
#' }
#' @source Data taken from the denguedatahub package version 2.1.1
#' @usage data(china_dengue_tbl_df)
#' @export
load("data/china_dengue_tbl_df.rda")
NULL



#' Dengue/DHF Situation in India Since 2017
#'
#' This dataset, india_dengue_tbl_df, is a tibble containing state and union territory-wise
#' annual dengue/DHF (Dengue Hemorrhagic Fever) cases and deaths in India since 2017.
#'
#' The dataset name has been kept as 'india_dengue_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble (enhanced data frame). The original content has not been modified
#' in any way.
#'
#' @name india_dengue_tbl_df
#' @format A tibble with 432 observations and 5 variables:
#' \describe{
#'   \item{area}{Character vector indicating the State or Union Territory}
#'   \item{type}{Character vector indicating whether the entry refers to 'cases' or 'deaths'}
#'   \item{year}{Character vector indicating the year of observation}
#'   \item{additional_information}{Character vector providing supplemental information}
#'   \item{value}{Numeric vector indicating the number of cases or deaths}
#' }
#' @source Data taken from the denguedatahub package version 2.1.1
#' @usage data(india_dengue_tbl_df)
#' @export
load("data/india_dengue_tbl_df.rda")
NULL


#' Imported Dengue Cases in Korea
#'
#' This dataset, korea_dengue_tbl_df, is a tibble containing information on imported dengue cases
#' in Korea from the years 2011 to 2015. The data were collected by the Korea Centers for Disease Control and Prevention (KCDC).
#'
#' The dataset name has been kept as 'korea_dengue_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name korea_dengue_tbl_df
#' @format A tibble with 33 observations and 7 variables:
#' \describe{
#'   \item{Country}{Character vector indicating the country of origin of the dengue cases}
#'   \item{Region}{Character vector indicating the region within the country}
#'   \item{2011}{Character vector indicating the number of imported cases in 2011}
#'   \item{2012}{Character vector indicating the number of imported cases in 2012}
#'   \item{2013}{Character vector indicating the number of imported cases in 2013}
#'   \item{2014}{Character vector indicating the number of imported cases in 2014}
#'   \item{2015}{Character vector indicating the number of imported cases in 2015}
#' }
#' @source Data taken from the denguedatahub package version 2.1.1
#' @usage data(korea_dengue_tbl_df)
#' @export
load("data/korea_dengue_tbl_df.rda")
NULL


#' Zika in Girardot, Colombia, 2015
#'
#' This dataset, zika_girardot_df, is a data frame containing the daily incidence of
#' Zika virus disease in Girardot, Colombia, during 2015.
#'
#' The dataset name has been kept as 'zika_girardot_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name zika_girardot_df
#' @format A data frame with 93 observations and 2 variables:
#' \describe{
#'   \item{date}{Date object representing the date of reported Zika cases}
#'   \item{cases}{Integer vector indicating the number of daily reported Zika cases}
#' }
#' @source Data taken from the outbreaks package version 1.9.0
#' @usage data(zika_girardot_df)
#' @export
load("data/zika_girardot_df.rda")
NULL


#' Zika in San Andres, Colombia, 2015
#'
#' This dataset, zika_sanandres_df, is a data frame containing the daily incidence of
#' Zika virus disease in San Andres, Colombia, during 2015.
#'
#' The dataset name has been kept as 'zika_sanandres_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name zika_sanandres_df
#' @format A data frame with 101 observations and 2 variables:
#' \describe{
#'   \item{date}{Date object representing the date of reported Zika cases}
#'   \item{cases}{Integer vector indicating the number of daily reported Zika cases}
#' }
#' @source Data taken from the outbreaks package version 1.9.0
#' @usage data(zika_sanandres_df)
#' @export
load("data/zika_sanandres_df.rda")
NULL


#' Severe Acute Respiratory Syndrome in Canada, 2003
#'
#' This dataset, sars_canada_df, is a data frame containing information on the daily incidence of
#' SARS (Severe Acute Respiratory Syndrome) cases in Canada during the 2003 outbreak. The data include
#' new cases attributed to travel, household transmission, healthcare settings, and other sources.
#'
#' The dataset name has been kept as 'sars_canada_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name sars_canada_df
#' @format A data frame with 110 observations and 5 variables:
#' \describe{
#'   \item{date}{Date object representing the reporting date}
#'   \item{cases_travel}{Integer vector indicating new SARS cases linked to travel}
#'   \item{cases_household}{Integer vector indicating new SARS cases from household transmission}
#'   \item{cases_healthcare}{Integer vector indicating new SARS cases from healthcare settings}
#'   \item{cases_other}{Integer vector indicating new SARS cases from other or unknown sources}
#' }
#' @source Data taken from the outbreaks package version 1.9.0
#' @usage data(sars_canada_df)
#' @export
load("data/sars_canada_df.rda")
NULL


#' Smallpox in Abakaliki, Nigeria, 1967
#'
#' This dataset, smallpox_nigeria_df, is a data frame containing data on 32 cases
#' of smallpox that occurred in Abakaliki, Nigeria, in 1967. These cases were first
#' described by Thompson and Foege (1968) and occurred predominantly in a religious group
#' that refused medical interventions.
#'
#' The dataset name has been kept as 'smallpox_nigeria_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name smallpox_nigeria_df
#' @format A data frame with 32 observations and 8 variables:
#' \describe{
#'   \item{case_ID}{Integer identifier for each smallpox case}
#'   \item{date_of_onset}{Date of symptom onset}
#'   \item{age}{Age of the individual (integer)}
#'   \item{gender}{Factor with two levels indicating gender}
#'   \item{vaccinated}{Factor with two levels indicating if the individual was vaccinated}
#'   \item{vaccscar}{Factor with two levels indicating presence of vaccination scar}
#'   \item{ftc}{Factor with two levels; additional epidemiological classification}
#'   \item{compound}{Factor with nine levels indicating compound of residence}
#' }
#' @source Data taken from the outbreaks package version 1.9.0
#' @usage data(smallpox_nigeria_df)
#' @export
load("data/smallpox_nigeria_df.rda")
NULL



#' Survey on Ebola Quarantine
#'
#' This dataset, ebola_survey_tbl_df, is a tibble containing responses from a poll conducted in New York City
#' between October 26th and 28th, 2014. The poll was conducted shortly after a doctor who had treated Ebola patients
#' in Guinea was diagnosed with Ebola in New York City. Participants were asked whether they favored a "mandatory
#' 21-day quarantine for anyone who has come in contact with an Ebola patient". The survey included responses from
#' 1,042 adults residing in New York.
#'
#' The dataset name has been kept as 'ebola_survey_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble.
#' The original content has not been modified in any way.
#'
#' @name ebola_survey_tbl_df
#' @format A tibble with 1,042 observations and 1 variable:
#' \describe{
#'   \item{quarantine}{Factor with two levels indicating whether the respondent supports a mandatory
#'   21-day quarantine for individuals who have come in contact with an Ebola patient}
#' }
#' @source Data taken from the openintro package version 2.5.0
#' @usage data(ebola_survey_tbl_df)
#' @export
load("data/ebola_survey_tbl_df.rda")
NULL


#' Time Series Counts of Ebola Cases
#'
#' This dataset, ebola_cases_df, is a data frame containing daily time series counts of new individuals
#' exhibiting clinical signs of Ebola virus disease, as well as the number of daily removals (e.g., deaths or recoveries),
#' during the 1995 Ebola epidemic in the Democratic Republic of Congo (DRC).
#'
#' The dataset name has been kept as 'ebola_cases_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name ebola_cases_df
#' @format A data frame with 192 observations and 3 variables:
#' \describe{
#'   \item{time}{Integer indicating the number of days since the beginning of observation}
#'   \item{clin_signs}{Integer indicating the number of new individuals with clinical signs of Ebola}
#'   \item{removals}{Integer indicating the number of new removals (e.g., deaths or recoveries)}
#' }
#' @source Data taken from the SimBIID package version 0.2.2
#' @usage data(ebola_cases_df)
#' @export
load("data/ebola_cases_df.rda")
NULL

#' Ebola Cases in Sierra Leone, Africa
#'
#' This dataset, ebola_sleone_df, is a data frame containing the cumulative number of
#' Ebola virus disease cases in Sierra Leone, Africa, recorded from May 1, 2014 to
#' December 16, 2015.
#'
#' The dataset name has been kept as 'ebola_sleone_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name ebola_sleone_df
#' @format A data frame with 110 observations and 2 variables:
#' \describe{
#'   \item{Day}{Integer indicating the number of days since May 1, 2014}
#'   \item{Cases}{Integer representing the cumulative number of Ebola cases reported}
#' }
#' @source Data taken from the MMAC package version 0.1.2
#' @usage data(ebola_sleone_df)
#' @export
load("data/ebola_sleone_df.rda")
NULL


#' Tuberculosis Streptomycin RCT (1948)
#'
#' This dataset, streptomycin_tbl_df, is a tibble containing the results of a randomized,
#' placebo-controlled, prospective 2-arm trial evaluating the use of streptomycin
#' (2 grams daily) versus placebo in the treatment of tuberculosis among 107 young patients.
#' The study was conducted by the Streptomycin in Tuberculosis Trials Committee and
#' published in the British Medical Journal in 1948.
#'
#' The dataset name has been kept as 'streptomycin_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble (a modern form of data frame).
#' The original content has not been modified in any way.
#'
#' @name streptomycin_tbl_df
#' @format A tibble with 107 observations and 13 variables:
#' \describe{
#'   \item{patient_id}{Character identifier for each patient}
#'   \item{arm}{Factor indicating treatment arm: streptomycin (A2) or placebo (A1)}
#'   \item{dose_strep_g}{Numeric dose of streptomycin in grams}
#'   \item{dose_PAS_g}{Numeric dose of para-aminosalicylic acid (PAS) in grams}
#'   \item{gender}{Factor with two levels indicating patient gender}
#'   \item{baseline_condition}{Factor indicating the baseline clinical condition of the patient}
#'   \item{baseline_temp}{Factor indicating baseline temperature category}
#'   \item{baseline_esr}{Factor indicating baseline erythrocyte sedimentation rate (ESR) category}
#'   \item{baseline_cavitation}{Factor indicating the presence or absence of lung cavitation at baseline}
#'   \item{strep_resistance}{Factor indicating the level of resistance to streptomycin}
#'   \item{radiologic_6m}{Factor describing radiological outcomes at 6 months}
#'   \item{rad_num}{Numeric radiologic score at 6 months}
#'   \item{improved}{Logical indicator of clinical improvement}
#' }
#' @source Data taken from the medicaldata package version 0.2.0
#' @usage data(streptomycin_tbl_df)
#' @export
load("data/streptomycin_tbl_df.rda")
NULL



#' BCG Vaccine Effectiveness Against Tuberculosis
#'
#' This dataset, bcg_vaccine_df, is a data frame containing results from 13 studies
#' examining the effectiveness of the Bacillus Calmette-Guerin (BCG) vaccine against tuberculosis.
#'
#' The dataset name has been kept as 'bcg_vaccine_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name bcg_vaccine_df
#' @format A data frame with 13 observations and 9 variables:
#' \describe{
#'   \item{trial}{Integer identifier for each study}
#'   \item{author}{Character vector indicating the lead author of each study}
#'   \item{year}{Integer year in which the study was published}
#'   \item{tpos}{Integer count of tuberculosis cases in the treatment group}
#'   \item{tneg}{Integer count of non-cases in the treatment group}
#'   \item{cpos}{Integer count of tuberculosis cases in the control group}
#'   \item{cneg}{Integer count of non-cases in the control group}
#'   \item{ablat}{Integer representing absolute latitude of study location}
#'   \item{alloc}{Character string describing the method of allocation}
#' }
#' @source Data taken from the metadat package version 1.4-0
#' @usage data(bcg_vaccine_df)
#' @export
load("data/bcg_vaccine_df.rda")
NULL


#' Meningococcal Data with Missing Response
#'
#' This dataset, meningitis_df, is a data frame containing data from a brief outbreak
#' of meningococcal disease at the University of Illinois, Urbana-Champaign campus during the years 1991 and 1992.
#'
#' The dataset name has been kept as 'meningitis_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name meningitis_df
#' @format A data frame with 60 observations and 6 variables:
#' \describe{
#'   \item{Set}{Integer indicating the matched set identifier}
#'   \item{CaseCntrl}{Integer indicator variable for case (1) or control (0)}
#'   \item{Reftime}{Numeric value representing the reference time (e.g., time of exposure)}
#'   \item{Numnill}{Integer indicating the number of ill roommates}
#'   \item{Numsleep}{Integer indicating the number of roommates who slept in the room}
#'   \item{Smoke}{Integer indicator for whether the subject smokes (1 = yes, 0 = no)}
#' }
#' @source Data taken from the glmfitmiss package version 2.1.0
#' @usage data(meningitis_df)
#' @export
load("data/meningitis_df.rda")
NULL



#' AIDS Symptoms and AZT Use Data
#'
#' This dataset, aids_azt_df, is a data frame containing cross-classified counts of AIDS symptoms
#' and AZT use by race of the patients, as reported in a 1991 New York Times article.
#'
#' The dataset name has been kept as 'aids_azt_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name aids_azt_df
#' @format A data frame with 4 observations and 4 variables:
#' \describe{
#'   \item{yes}{Numeric vector indicating the number of patients showing AIDS symptoms}
#'   \item{no}{Numeric vector indicating the number of patients not showing AIDS symptoms}
#'   \item{azt}{Factor with 2 levels indicating AZT use (\code{yes}, \code{no})}
#'   \item{race}{Factor with 2 levels indicating patient race (\code{white}, \code{black})}
#' }
#' @source Data taken from the cond package version 1.2-4
#' @usage data(aids_azt_df)
#' @export
load("data/aids_azt_df.rda")
NULL




#' Fungal Infections Treatment Data
#'
#' This dataset, fungal_infections_df, is a data frame containing results from a clinical trial
#' on the success of a particular treatment for fungal infections across five research units.
#' Interest in the study focuses on the treatment effect.
#'
#' The dataset name has been kept as 'fungal_infections_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name fungal_infections_df
#' @format A data frame with 10 observations and 4 variables:
#' \describe{
#'   \item{success}{Numeric vector indicating the number of treatment successes}
#'   \item{failure}{Numeric vector indicating the number of treatment failures}
#'   \item{group}{Factor with 2 levels indicating treatment group (\code{control}, \code{treated})}
#'   \item{center}{Factor with 5 levels indicating the research center where the trial was conducted}
#' }
#' @source Data taken from the cond package version 1.2-4
#' @usage data(fungal_infections_df)
#' @export
load("data/fungal_infections_df.rda")
NULL


#' New York City COVID-19 Data
#'
#' This dataset, covid_new_york_df, is a data frame containing daily proportions of COVID-19 cases,
#' hospitalizations, and deaths by borough in New York City through 2020-06-30.
#'
#' The dataset name has been kept as 'covid_new_york_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name covid_new_york_df
#' @format A data frame with 615 observations and 5 variables:
#' \describe{
#'   \item{date}{Date of observation}
#'   \item{borough}{Character vector indicating the borough (e.g., Manhattan, Bronx, etc.)}
#'   \item{case}{Integer vector representing the number of reported COVID-19 cases}
#'   \item{hospitalization}{Integer vector representing the number of hospitalizations}
#'   \item{death}{Integer vector representing the number of deaths}
#' }
#' @source Data taken from the incidental package version 0.1
#' @usage data(covid_new_york_df)
#' @export
load("data/covid_new_york_df.rda")
NULL



#' Daily 1918 Flu Deaths
#'
#' This dataset, spanish_flu_df, is a data frame containing daily mortality data
#' from the 1918 flu pandemic covering the period from 1918-09-01 through 1918-12-31
#' in Indiana, Kansas, and Philadelphia.
#'
#' The dataset name has been kept as 'spanish_flu_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' infectiousR package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name spanish_flu_df
#' @format A data frame with 122 observations and 4 variables:
#' \describe{
#'   \item{Date}{Date of recorded mortality}
#'   \item{Indiana}{Integer vector representing daily flu-related deaths in Indiana}
#'   \item{Kansas}{Integer vector representing daily flu-related deaths in Kansas}
#'   \item{Philadelphia}{Integer vector representing daily flu-related deaths in Philadelphia}
#' }
#' @source Data taken from the incidental package version 0.1
#' @usage data(spanish_flu_df)
#' @export
load("data/spanish_flu_df.rda")
NULL





