usethis::use_package("magrittr")
usethis::use_package("tibble")
usethis::use_package("dplyr")
# usethis::use_package("tidyverse",type="Depends")
usethis::use_package("base")
usethis::use_package("purrr")
usethis::use_package("tidyr")
usethis::use_package("gt")
usethis::use_package("CheckOfTable")
usethis::use_pkgdown()
## data
# usethis::use_data(table_transcodage,lake_infos,SES_ref_type,Pourcent_typologie_lacs_macrophytes,Table_taxons_alertes,internal = TRUE, overwrite = TRUE)
# Run once to configure your package to use pkgdown
# usethis::use_pkgdown()
# # Run to build the website
pkgdown::build_site()
devtools::document() # mettre à jour le namespace
devtools::build_vignettes()


# repo_url <- "https://github.com/SebastienBoutry/IBDL.git"
# usethis::use_git_remote(url = repo_url)
