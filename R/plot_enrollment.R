#' Plot Primary vs Secondary Enrollment Trends
#'
#' @param data A tibble from \code{get_ghana_education()}
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' data <- get_ghana_education()
#' plot_enrollment(data)
plot_enrollment <- function(data) {

  data |>
    dplyr::select(year, enrollment_primary, enrollment_secondary) |>
    tidyr::pivot_longer(-year, names_to = "level", values_to = "enrollment") |>
    dplyr::mutate(level = dplyr::recode(level,
                                        "enrollment_primary"   = "Primary",
                                        "enrollment_secondary" = "Secondary"
    )) |>
    ggplot2::ggplot(ggplot2::aes(x = year, y = enrollment, colour = level)) +
    ggplot2::geom_line(linewidth = 1.2) +
    ggplot2::geom_point(size = 2) +
    ggplot2::labs(
      title   = "Ghana School Enrollment Rates",
      x       = "Year",
      y       = "Enrollment Rate (%)",
      colour  = "Level",
      caption = "Source: World Bank WDI"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "bottom")
}
