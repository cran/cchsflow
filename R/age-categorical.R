#' @title Derived categorical age
#'
#' @description This is a derived categorical age variable (DHHGAGE_C) that
#'  groups various age categories across all CCHS cycles. This is based on the
#'  continuous age variable (DHHGAGE_cont) that is harmonious across all CCHS
#'  cycles.
#'
#'  The categories of this new age variable are as follows:
#'
#'  \enumerate{
#'    \item 12 to 14 years
#'    \item 15 to 17 years
#'    \item 18 to 19 years
#'    \item 20 to 24 years
#'    \item 25 to 29 years
#'    \item 30 to 34 years
#'    \item 35 to 39 years
#'    \item 40 to 44 years
#'    \item 45 to 49 years
#'    \item 50 to 54 years
#'    \item 55 to 59 years
#'    \item 60 to 64 years
#'    \item 65 to 69 years
#'    \item 70 to 74 years
#'    \item 75 to 79 years
#'    \item 80 years or more
#'  }
#'
#' @details The categories in the grouped age variable (DHHGAGE) vary between
#'  CCHS cycles. As such, a continuous age variable (DHHGAGE_cont) was created
#'  that harmonized age across all CCHS cycles by taking the midpoint of each
#'  age category. This new age variable (DHHGAGE_C) categorizes age based on the
#'  categories used in CCHS cycles from 2007 to 2014.
#'
#' @param DHHGAGE_cont continuous age variable
#'
#' @return a categorical age variable (DHHGAGE_C)
#'
#' @examples
#' # Using age_cat_fun() to create categorical age values from DHHGAGE_cont
#' # age_cat_fun() is specified in variable_details.csv along with the CCHS
#' # variables and cycles included.
#'
#' # To generate DHHGAGE_C in a cycle, use rec_with_table() and specify
#' # DHHGAGE_C along with DHHGAGE_cont.
#'
#' library(cchsflow)
#'
#' cat_age2009_2010 <- rec_with_table(
#'    cchs2009_2010_p,  c(
#'      "DHHGAGE_cont", "DHHGAGE_C"
#'      )
#'    )
#'
#' @export
age_cat_fun <- function(DHHGAGE_cont) {
  age_cat <-
    if_else2(
      dplyr::between(DHHGAGE_cont, 12, 14), 1,
      if_else2(
        dplyr::between(DHHGAGE_cont, 15, 17), 2,
        if_else2(
          dplyr::between(DHHGAGE_cont, 18, 19), 3,
          if_else2(
            dplyr::between(DHHGAGE_cont, 20, 24), 4,
            if_else2(
              dplyr::between(DHHGAGE_cont, 25, 29), 5,
              if_else2(
                dplyr::between(DHHGAGE_cont, 30, 34), 6,
                if_else2(
                  dplyr::between(DHHGAGE_cont, 35, 39), 7,
                  if_else2(
                    dplyr::between(DHHGAGE_cont, 40, 44), 8,
                    if_else2(
                      dplyr::between(DHHGAGE_cont, 45, 49), 9,
                      if_else2(
                        dplyr::between(DHHGAGE_cont, 50, 54), 10,
                        if_else2(
                          dplyr::between(DHHGAGE_cont, 55, 59), 11,
                          if_else2(
                            dplyr::between(DHHGAGE_cont, 60, 64), 12,
                            if_else2(
                              dplyr::between(DHHGAGE_cont, 65, 69), 13,
                              if_else2(
                                dplyr::between(DHHGAGE_cont, 70, 74), 14,
                                if_else2(
                                  dplyr::between(DHHGAGE_cont, 75, 79), 15,
                                  if_else2((DHHGAGE_cont >= 80), 16,
                                           "NA(b)")
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  return(age_cat)
}
