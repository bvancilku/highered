add_to_filters <- function(old_filter, ...) {
  list(...) %>%
    purrr::discard(base::is.null) %>%
    c(old_filter, .)
}
