##' IPEDS fall-retention
##'
##' @title
##' @param year
##' @return
##' @author Brian Vancil
##' @export
get_ipeds_fall_retention <- function(year) {

  year <- base::intersect(year, 2003:2017)
  filters <- list() %>%
    add_to_filters(year = year)

  dataset <- get_education_data(
    level = 'college-university',
    source = 'ipeds',
    topic = 'fall-retention',
    filters = filters,
    add_labels = TRUE
  ) %>%
    tibble::as_tibble()

}
