#' @title Body Mass Index (BMI) derived variable
#'
#' @description This function creates a harmonized BMI variable. The BMI
#'  variable provided by the CCHS calculates BMI using methods that vary across
#'  cycles, leading to measurement error when using multiple CCHS cycles. In
#'  certain CCHS cycles (2001-2003, 2007+), there are age restrictions in which
#'  respondents under the age of 20 and over the age of 64 were not included.
#'  Across all CCHS cycles, female respondents who identified as being pregnant
#'  were excluded; and in certain CCHS cycles (2003-2007, 2013-2014), females
#'  who did not answer the pregnancy question were coded as NS (not stated) for
#'  HWTGBMI. As well, in certain CCHS cycles (2001-2003, 2009-2014), respondents
#'  outside certain height and weight ranges (0.914-2.108m for height,
#'  0-260kg for weight) were excluded from HWTGBMI.
#'
#'  bmi_fun() creates a derived variable (HWTGBMI_der) that is harmonized across
#'  all CCHS cycles. This function divides weight by the square of height.
#'
#' @details For HWTGBMI_der, there are no restrictions to age, height, weight,
#'  or pregnancy status. While pregnancy was consistent across all CCHS cycles,
#'  its variable (MAM_037) was not available in the PUMF CCHS datasets so it
#'  could not be harmonized and included into the function.
#'
#'  For any single CCHS survey year, it is appropriate to use the CCHS BMI
#'  variable (HWTGBMI) that is also available on cchsflow. HWTGBMI_der is
#'  recommended when using multiple survey cycles.
#'
#'  HWTGBMI_der uses the CCHS variables for height and weight that have been
#'  transformed by cchsflow. In order to generate a value for BMI across CCHS
#'  cycles, height and weight must be transformed and harmonized.
#'
#' @note In earlier CCHS cycles (2001 and 2003), height was collected in inches;
#'  while in later CCHS cycles (2005+) it was collected in meters. To harmonize
#'  values across cycles, height was converted to meters (to 3 decimal points).
#'  Weight was collected in kilograms across all CCHS cycles, so no
#'  transformations were required in the harmonization process.
#'
#' @param HWTGHTM CCHS variable for height (in meters)
#'
#' @param HWTGWTK CCHS variable for weight (in kilograms)
#'
#' @return numeric value for BMI in the HWTGBMI_der variable
#'
#' @examples
#' # Using bmi_fun() to create BMI values between cycles
#' # bmi_fun() is specified in variable_details.csv along with the
#' # CCHS variables and cycles included.
#'
#' # To transform the derived BMI variable, use rec_with_table() for each cycle
#' # and specify HWTGBMI_der, along with height (HWTGHTM) and weight (HWTGWTK).
#' # Then by using dplyr::bind_rows(), you can combined HWTGBMI_der across
#' # cycles.
#'
#' library(cchsflow)
#' bmi2010 <- rec_with_table(
#'   cchs2010, c(
#'     "HWTGHTM",
#'     "HWTGWTK", "HWTGBMI_der"
#'   )
#' )
#'
#' head(bmi2010)
#'
#' bmi2012 <- rec_with_table(
#'   cchs2012, c(
#'     "HWTGHTM",
#'     "HWTGWTK", "HWTGBMI_der"
#'   )
#' )
#'
#' tail(bmi2012)
#'
#' combined_bmi <- bind_rows(bmi2010, bmi2012)
#' head(combined_bmi)
#' tail(combined_bmi)
#'
#' # Using bmi_fun() to generate a BMI value with user inputted height and
#' # weight values. bmi_fun() can also generate a value for BMI if you input a
#' # value for height and weight. Let's say your height is 170cm (1.7m) and
#' # your weight is 50kg, your BMI can be calculated as follows:
#'
#' library(cchsflow)
#' BMI <- bmi_fun(HWTGHTM = 1.7, HWTGWTK = 50)
#' print(BMI)
#' @export
bmi_fun <-
  function(HWTGHTM, HWTGWTK) {
    if_else2(
      (!is.na(HWTGHTM)) & (!is.na(HWTGWTK)), (HWTGWTK / (HWTGHTM * HWTGHTM)),
      NA
    )
  }