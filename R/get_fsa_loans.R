##' FSA loans topic
##'
##' Recipients and amounts
##' Information on "loan_type"s such as:
##' - Subsidized Direct Loan&ndash,Undergraduate
##' - Subsidized Direct Loan&ndash,Graduate
##' - Subsidized Direct Loan&ndash,Total
##' - Unsubsidized Direct Loan&ndash,Undergraduate
##' - Unsubsidized Direct Loan&ndash,Graduate
##' - Unsubsidized Direct Loan&ndash,Total
##' - Direct Loan Parent PLUS
##' - Direct Loan Grad PLUS
##' - Direct Loan PLUS (sum of Parent PLUS and Grad PLUS)
##' - Subsidized Federal Family Education Loans
##' - Unsubsidized Federal Family Education Loans
##' - Parent PLUS Federal Family Education Loans
##' - Grad PLUS Federal Family Education Loans
##' - PLUS Federal Family Education Loans
##'
##' @title fsa_grants
##' @param year integer vector of years
##' @param opeid character vector of OPE IDs
##' @return tibble
##' @author Brian Vancil
##' @export
get_fsa_loans <- function(year, opeid) {
  year <- base::intersect(year, 1999:2018)
  filters <- list() %>%
    add_to_filters(year = year, opeid = opeid)

  get_education_data(
    level = 'college-university',
    source = 'fsa',
    topic = 'loans',
    filters = filters,
    add_labels = TRUE
  ) %>%
    tibble::as_tibble()
}
