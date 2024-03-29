% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/immigration.R
\name{immigration_fun}
\alias{immigration_fun}
\title{Immigration by ethnicity and settlement}
\usage{
immigration_fun(SDCFIMM, SDCGCBG, SDCGCGT, SDCGRES)
}
\arguments{
\item{SDCFIMM}{Immigrant status (1-immigrant, 2-non-immigrant)}

\item{SDCGCBG}{Country of birth (1-Canada, 2-Outside of Canada)}

\item{SDCGCGT}{Cultural or racial origin (1-white, 2-visible minority)}

\item{SDCGRES}{Length/time in Canada since immigration (1- 0-9 years, 2- 10+ 
years)}
}
\value{
Categorical variable (immigration_der) with six categories:

 \itemize{
  \item 1 - White Canada-born
  \item 2 - Non-white Canadian born
  \item 3 - White immigrant born outside of Canada (0-9 years in Canada)
  \item 4 - Non-white immigrant born outside of Canada (0-9 years in Canada)
  \item 5 - White immigrant born outside of Canada (10+ years in Canada)
  \item 6 - Non-white immigrant born outside of Canada (10+ years in Canada)
}
}
\description{
This function creates a categorical variable based on 
immigrant status (SDCFIMM), country of birth (SDCGCBG), ethnicity (SDCGCGT), 
and time in Canada (SDCGRES).
}
\details{
immigration_der uses the CCHS variables that have been transformed by 
cchsflow. In order to generate a value for BMI across CCHS cycles, 
the following SDC variables must be transformed and harmonized.
}
\examples{
# Using immigration_fun() to create immigration_der values across CCHS cycles
# immigration_fun() is specified in variable_details.csv along with the
# CCHS variables and cycles included.

# To transform immigration_der, use rec_with_table() for each CCHS cycle
# and specify immigration_der, along with the various SDC variables.
# Then by using merge_rec_data() you can combine immigration_der across cycles.

library(cchsflow)
immigration2001 <- rec_with_table(
  cchs2001_p, c(
    "SDCFIMM", "SDCGCBG", "SDCGCGT", "SDCGRES", "immigration_der"
  )
)

head(immigration2001)

immigration2009_2010 <- rec_with_table(
  cchs2009_2010_p, c(
    "SDCFIMM", "SDCGCBG", "SDCGCGT", "SDCGRES", "immigration_der"
  )
)

tail(immigration2009_2010)

combined_immigration <- merge_rec_data(immigration2001, immigration2009_2010)

head(combined_immigration)

tail(combined_immigration)

}
