% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smoking.R
\name{SMKG040_fun}
\alias{SMKG040_fun}
\title{Age started smoking daily - daily/former daily smokers}
\usage{
SMKG040_fun(SMKG203_cont, SMKG207_cont)
}
\arguments{
\item{SMKG203_cont}{age started smoking daily. Variable asked to daily
smokers.}

\item{SMKG207_cont}{age started smoking daily. Variable asked to former
daily smokers.}
}
\value{
value for age started smoking daily for daily/former daily smokers in
the SMKG040_cont variable
}
\description{
This function creates a continuous derived variable 
(SMKG040_fun) that calculates the approximate age that a daily or former 
daily smoker began smoking daily.
}
\details{
SMKG203 (daily smoker) and SMKG207 (former daily) are present in
CCHS 2001-2014, and are separate variables. For CCHS 2015 and onward, SMKG040 
(daily/former daily) combines the two previous variables. SMKG040_fun takes 
the continuous functions (SMKG203_cont and SMKG207_cont) to create SMKG040 
for 2001-2014.
}
\note{
In previous cycles, both SMKG203 and SMKG207 included respondents who 
did not state their smoking status. From CCHS 2015 and onward, SMKG040 only
included respondents who specified daily smoker or former daily smoker. As 
a result, SMKG040 has a large number of missing respondents for CCHS 2015 
survey cycles and onward.
}
\examples{
 
# Using SMKG040_fun() to create age values across CCHS cycles
# SMKG040_fun() is specified in variable_details.csv under SMKG040_cont.

# To create a continuous harmonized variable for SMKG040, use rec_with_table() 
# for each CCHS cycle and specify SMKG040_cont.

library(cchsflow)

age_smoke_dfd_2009_2010 <- rec_with_table(
  cchs2009_2010_p, c(
    "SMKG203_cont", "SMKG207_cont","SMKG040_cont"
  )
)

head(age_smoke_dfd_2009_2010)

age_smoke_dfd_2011_2012 <- rec_with_table(
  cchs2011_2012_p,c(
    "SMKG203_cont", "SMKG207_cont","SMKG040_cont"
  )
)

tail(age_smoke_dfd_2011_2012)

combined_age_smoke_dfd <- suppressWarnings(merge_rec_data
(age_smoke_dfd_2009_2010,age_smoke_dfd_2011_2012))

head(combined_age_smoke_dfd)
tail(combined_age_smoke_dfd)
}
