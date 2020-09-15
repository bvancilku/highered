##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param ipeds_efte
##' @param ipeds_enrollment_headcount
##' @return
##' @author Brian Vancil
##' @export
get_ipeds_joined <- function(ipeds_efte, ipeds_enrollment_headcount) {
  dataset <-
    dplyr::inner_join(
      ipeds_efte,
      ipeds_enrollment_headcount %>%
        dplyr::group_by(unitid, year, level_of_study) %>%
        dplyr::summarise(headcount = sum(headcount, na.rm = TRUE)) %>%
        dplyr::ungroup(),
      by = c("unitid", "year", "level_of_study")
    ) %>%
    dplyr::select(-level_of_study)

  dataset
}

