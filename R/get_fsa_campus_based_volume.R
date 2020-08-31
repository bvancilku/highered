##' FSA campus-based-volume topic
##'
##' Amounts by unit and number of recipients for 3 award types:
##' - Federal Supplemental Educational Opportunity Grants
##' - Federal Work-Study
##' - Perkins Loans
##'
##' @title fsa_campus_based_volume
##' @param year integer vector of years
##' @param opeid character vector of OPE IDs
##' @return tibble
##' @author Brian Vancil
##' @export
get_fsa_campus_based_volume <- function(year, opeid = NULL) {
  year <- base::intersect(year, 2001:2017)
  filters <- list() %>%
    add_to_filters(year = year, opeid = opeid)

  get_education_data(
    level = 'college-university',
    source = 'fsa',
    topic = 'campus-based-volume',
    filters = filters,
    add_labels = TRUE
  ) %>%
    tibble::as_tibble()
}
