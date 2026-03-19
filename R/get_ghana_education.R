#' Get Ghana Education Data from World Bank
#'
#' @param start Start year (default 2000)
#' @param end End year (default 2023)
#'
#' @return A cleaned tibble of Ghana education indicators by year
#' @export
#'
#' @examples
#' data <- get_ghana_education(start = 2000, end = 2023)
get_ghana_education <- function(start = 2000, end = 2023) {

  indicators <- c(
    enrollment_primary   = "SE.PRM.ENRR",
    enrollment_secondary = "SE.SEC.ENRR",
    enrollment_primary_f = "SE.PRM.ENRR.FE",
    enrollment_primary_m = "SE.PRM.ENRR.MA",
    out_of_school        = "SE.PRM.UNER.ZS",
    literacy_rate        = "SE.ADT.LITR.ZS",
    pupil_teacher_ratio  = "SE.PRM.ENRL.TC.ZS"
  )

  raw <- WDI::WDI(
    country   = "GH",
    indicator = indicators,
    start     = start,
    end       = end
  )

  clean <- raw |>
    dplyr::group_by(year) |>
    dplyr::summarise(
      dplyr::across(names(indicators), \(x) mean(x, na.rm = TRUE)),
      .groups = "drop"
    ) |>
    dplyr::mutate(
      dplyr::across(names(indicators), \(x) ifelse(is.nan(x), NA, x))
    )

  clean
}
