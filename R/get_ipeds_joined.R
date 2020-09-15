##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param ipeds_efte
##' @param ipeds_enrollment_headcount
##' @param n_students_hyp for hi/lo error estimates using Laplace-like smoothing.
##' @return
##' @author Brian Vancil
##' @export
get_ipeds_joined <- function(ipeds_efte, ipeds_enrollment_headcount, ipeds_fall_retention, n_students_hyp = 4L) {
  dataset <-
    dplyr::inner_join(
      ipeds_efte,
      ipeds_enrollment_headcount %>%
        dplyr::group_by(unitid, year, level_of_study) %>%
        dplyr::summarise(headcount = sum(headcount, na.rm = TRUE)) %>%
        dplyr::ungroup(),
      by = c("unitid", "year", "level_of_study")
    ) %>%
    dplyr::select(-level_of_study) %>%
    dplyr::inner_join(
      ipeds_fall_retention %>%
        dplyr::filter(ftpt == 'Total') %>%
        dplyr::mutate(
          retention_rate_lo = returning_students / (prev_cohort_adj + n_students_hyp),
          retention_rate_hi = (returning_students + n_students_hyp) / (prev_cohort_adj + n_students_hyp)
        ) %>%
        dplyr::select(unitid, year, retention_rate_lo, retention_rate_hi, retention_rate, cohort = prev_cohort_adj),
      by = c("unitid", "year")
    )

  dataset
}

