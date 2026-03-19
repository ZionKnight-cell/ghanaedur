# ghanaedur

<!-- badges: start -->
<!-- badges: end -->

`ghanaedur` is an R package for accessing and analysing Ghana education 
data from the World Bank. It provides clean, ready-to-use functions for 
pulling indicators, cleaning data, and visualising trends.

## Installation

You can install the development version of ghanaedur from GitHub:
``` r
# install.packages("devtools")
devtools::install_github("ZionKnight-cell/ghanaedur")
```

## Example
``` r
library(ghanaedur)

# Get Ghana education data
data <- get_ghana_education(start = 2000, end = 2023)

# Plot enrollment trends
plot_enrollment(data)
```

## Functions

- `get_ghana_education()` — Pull education indicators from World Bank
- `plot_enrollment()` — Plot primary vs secondary enrollment trends
- `plot_gender_gap()` — Plot gender gap in primary enrollment
- `plot_out_of_school()` — Plot out-of-school children rate
- `plot_pupil_teacher()` — Plot pupil-teacher ratio over time
