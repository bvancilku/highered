##' FSA financial-responsibility topic
##'
##' Content is missing for all schools
##' This is garbage: financial_resp_score is NA for all schools.
##'
##' @title fsa_financial_responsibility
##' @param year
##' @param opeid
##' @return tibble
##' @author Brian Vancil
##' @export
get_fsa_financial_responsibility <- function(year, opeid = NULL) {
  year <- base::intersect(year, 2006:2016)
  filters <- list() %>%
    add_to_filters(year = year, opeid = opeid)

  get_education_data(
    level = 'college-university',
    source = 'fsa',
    topic = 'financial-responsibility',
    filters = filters,
    add_labels = TRUE
  ) %>%
    tibble::as_tibble()
}
