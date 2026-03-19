#' Plot Regional Comparison of Primary Enrollment
#'
#' @param data A tibble from \code{get_west_africa_education()}
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' data <- get_west_africa_education()
#' plot_regional_comparison(data)
plot_regional_comparison <- function(data) {

  data |>
    dplyr::filter(!is.na(enrollment_primary)) |>
    ggplot2::ggplot(ggplot2::aes(
      x      = year,
      y      = enrollment_primary,
      colour = country,
      group  = country
    )) +
    ggplot2::geom_line(linewidth = 1.1) +
    ggplot2::geom_point(size = 1.5) +
    ggplot2::labs(
      title   = "Primary Enrollment - West Africa Comparison",
      x       = "Year",
      y       = "Gross Enrollment Rate (%)",
      colour  = "Country",
      caption = "Source: World Bank WDI"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "bottom")
}
