##' Make a plot of recipients of different forms of financial aid
##'
##'
##' @title
##' @param fsa_combined
##' @return ggplot2 object
##' @author Brian Vancil
##' @export
get_fsa_recipients_plot <- function(fsa_combined) {
  fsa_combined %>%
    ggplot2::ggplot() +
    ggplot2::facet_wrap(facets = ggplot2::vars(type, subtype), scales = "free_y") +
    ggplot2::aes(x = year, y = num_recipients) +
    ggplot2::geom_line() +
    ggplot2::xlab("Year") +
    ggplot2::ylab("Number of aid recipients") +
    ggplot2::theme_minimal()
}
