#' Plot Pupil-Teacher Ratio
#'
#' @param data A tibble from \code{get_ghana_education()}
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' data <- get_ghana_education()
#' plot_pupil_teacher(data)
plot_pupil_teacher <- function(data) {

  data |>
    dplyr::filter(!is.na(pupil_teacher_ratio)) |>
    ggplot2::ggplot(ggplot2::aes(x = year, y = pupil_teacher_ratio)) +
    ggplot2::geom_line(linewidth = 1.2, colour = "#2ECC71") +
    ggplot2::geom_hline(yintercept = 40, linetype = "dashed", colour = "red") +
    ggplot2::annotate("text", x = 2001, y = 41,
                      label = "UNESCO threshold (40)",
                      colour = "red", size = 3) +
    ggplot2::labs(
      title   = "Pupil-Teacher Ratio - Ghana Primary Schools",
      x       = "Year",
      y       = "Pupils per Teacher",
      caption = "Source: World Bank WDI"
    ) +
    ggplot2::theme_minimal()
}
