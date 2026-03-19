#' Plot Out-of-School Children Rate
#'
#' @param data A tibble from \code{get_ghana_education()}
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' data <- get_ghana_education()
#' plot_out_of_school(data)
plot_out_of_school <- function(data) {

  data |>
    dplyr::filter(!is.na(out_of_school)) |>
    ggplot2::ggplot(ggplot2::aes(x = year, y = out_of_school)) +
    ggplot2::geom_col(fill = "#E74C3C", alpha = 0.8) +
    ggplot2::labs(
      title   = "Out-of-School Children Rate - Ghana",
      x       = "Year",
      y       = "Out-of-School Rate (%)",
      caption = "Source: World Bank WDI"
    ) +
    ggplot2::theme_minimal()
}
