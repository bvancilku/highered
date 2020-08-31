##' FSA grants topic
##'
##' Recipients and amounts
##' Information on "grant_type"s such as:
##' - Academic Competitiveness Grant
##' - Iraq and Afghanistan Service Grant
##' - National SMART Program
##' - Pell Grant
##' - TEACH Program
##'
##' @title fsa_grants
##' @param year integer vector of years
##' @param opeid character vector of OPE IDs
##' @return tibble
##' @author Brian Vancil
##' @export
get_fsa_grants <- function(year, opeid) {
  year <- base::intersect(year, 1999:2018)
  filters <- list() %>%
    add_to_filters(year = year, opeid = opeid)

  get_education_data(
    level = 'college-university',
    source = 'fsa',
    topic = 'grants',
    filters = filters,
    add_labels = TRUE
  ) %>%
    tibble::as_tibble()
}
