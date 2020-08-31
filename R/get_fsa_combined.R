##' Union of data sources
##'
##'
##' @title
##' @param fsa_campus_based_volume
##' @param fsa_grants
##' @param fsa_loans
##' @return tibble
##' @author Brian Vancil
##' @export
get_fsa_combined <- function(
  fsa_campus_based_volume,
  fsa_grants,
  fsa_loans
) {
  dplyr::bind_rows(
    fsa_campus_based_volume %>%
      dplyr::select(
        year,
        opeid,
        inst_name_fsa,
        subtype = award_type,
        num_recipients = campus_award_recipients_opeid,
        value_disbursed = value_campus_disbursed_opeid,
        value_fed_contr = campus_award_fed_contr_opeid
      ) %>%
      dplyr::distinct() %>%
      dplyr::mutate(type = "campus-based"),
    fsa_grants %>%
      dplyr::select(
        year,
        opeid,
        inst_name_fsa,
        subtype = grant_type,
        num_recipients = grant_recipients_opeid,
        value_disbursed = value_grants_disbursed_opeid
      ) %>%
      dplyr::distinct() %>%
      dplyr::mutate(type = "grant"),
    fsa_loans %>%
      dplyr::select(
        year,
        opeid,
        inst_name_fsa,
        subtype = loan_type,
        num_recipients = loan_recipients_opeid,
        num_originated = num_loans_originated_opeid,
        num_disbursed = num_loans_disbursed_opeid,
        value_originated = value_loans_originated_opeid,
        value_disbursed = value_loan_disbursements_opeid
      ) %>%
      dplyr::distinct() %>%
      dplyr::mutate(type = "loan")
  ) %>%
    dplyr::mutate(type = base::factor(
      type,
      levels = c("campus-based", "grant", "loan"),
      ordered = FALSE
    )) %>%
    dplyr::select(
      year,
      opeid,
      inst_name_fsa,
      type,
      subtype,
      dplyr::everything()
    ) %>%
    dplyr::mutate(
      subtype = forcats::fct_relabel(subtype, function(f) {
        stringr::str_replace_all(f, "&ndash,", "-")
      })
    )
}
