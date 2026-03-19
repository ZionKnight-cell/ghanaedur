#' Get West Africa Education Data from World Bank
#'
#' @param start Start year (default 2000)
#' @param end End year (default 2023)
#'
#' @return A cleaned tibble of education indicators for West African countries
#' @export
#'
#' @examples
#' data <- get_west_africa_education(start = 2000, end = 2023)
get_west_africa_education <- function(start = 2000, end = 2023) {

  indicators <- c(
    enrollment_primary   = "SE.PRM.ENRR",
    enrollment_secondary = "SE.SEC.ENRR",
    out_of_school        = "SE.PRM.UNER.ZS",
    pupil_teacher_ratio  = "SE.PRM.ENRL.TC.ZS"
  )

  countries <- c("GH", "NG", "SN", "CI", "BF", "ML", "GN")

  raw <- WDI::WDI(
    country   = countries,
    indicator = indicators,
    start     = start,
    end       = end
  )

  clean <- raw |>
    dplyr::select(country, year, names(indicators)) |>
    dplyr::filter(!is.na(enrollment_primary))

  clean
}
