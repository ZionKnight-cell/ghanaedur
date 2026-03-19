#' Plot Gender Gap in Primary Enrollment
#'
#' @param data A tibble from \code{get_ghana_education()}
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' data <- get_ghana_education()
#' plot_gender_gap(data)
plot_gender_gap <- function(data) {

  data |>
    dplyr::select(year, enrollment_primary_f, enrollment_primary_m) |>
    tidyr::pivot_longer(-year, names_to = "gender", values_to = "enrollment") |>
    dplyr::mutate(gender = dplyr::recode(gender,
                                         "enrollment_primary_f" = "Female",
                                         "enrollment_primary_m" = "Male"
    )) |>
    ggplot2::ggplot(ggplot2::aes(x = year, y = enrollment, colour = gender)) +
    ggplot2::geom_line(linewidth = 1.2) +
    ggplot2::geom_point(size = 2) +
    ggplot2::scale_colour_manual(values = c("Female" = "#E91E8C", "Male" = "#1E90FF")) +
    ggplot2::labs(
      title   = "Gender Gap in Primary Enrollment - Ghana",
      x       = "Year",
      y       = "Enrollment Rate (%)",
      colour  = "Gender",
      caption = "Source: World Bank WDI"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "bottom")
}
