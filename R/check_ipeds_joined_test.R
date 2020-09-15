##' Validate ipeds_joined
##'
##' @title
##' @param ipeds_joined
##' @return
##' @author Brian Vancil
##' @export
check_ipeds_joined_test <- function(ipeds_joined) {
  agent <- ipeds_joined %>%
    pointblank::create_agent(
      name = "Validate ipeds_joined",
      actions = pointblank::action_levels(warn_at = 1)
    ) %>%
    pointblank::rows_distinct(c("unitid", "year")) %>%
    pointblank::col_is_factor(c("fips", "acttype")) %>%
    pointblank::col_is_numeric(c("unitid", "year", "credit_hours", "contact_hours", "est_fte", "rep_fte", "headcount")) %>%
    # pointblank::col_vals_gte(
    #   pointblank::vars(diff),
    #   0,
    #   preconditions = ~ . %>% dplyr::mutate(diff = headcount - est_fte)
    # ) %>%
    pointblank::interrogate()

  agent
}
