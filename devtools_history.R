usethis::use_package("magrittr")
usethis::use_package("tibble")
usethis::use_package("dplyr")
usethis::use_package("base")
usethis::use_package("purrr")
usethis::use_package("tidyr")
usethis::use_pkgdown()
## data
# usethis::use_data(tableau1,tableau2,tableau3,   internal = TRUE, overwrite = TRUE)
# Run once to configure your package to use pkgdown
# usethis::use_pkgdown()
# # Run to build the website
pkgdown::build_site()
devtools::document() # mettre à jour le namespace
