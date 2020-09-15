##' IPEDS enrollment headcount
##'
##' @title
##' @param year
##' @param level_of_study
##' @return
##' @author Brian Vancil
##' @export
get_ipeds_enrollment_headcount <- function(year, level_of_study) {

  year <- base::intersect(year, 1996:2016)
  filters <- list() %>%
    add_to_filters(year = year, level_of_study = level_of_study)

  get_education_data(
    level = 'college-university',
    source = 'ipeds',
    topic = 'enrollment-headcount',
    filters = filters,
    add_labels = TRUE
  ) %>%
    tibble::as_tibble()

}
