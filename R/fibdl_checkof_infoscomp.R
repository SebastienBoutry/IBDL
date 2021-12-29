#' Controle du tableau informations complementaires sur le site pour le calcul de l IBDL
#'
#' @param data tableau representant les informations complementaires sur l unite d observation
#'
#' @return
#' @export
#' @import CheckOfTable
#' @import dplyr
#' @import tibble
#'
#' @examples
#' infos_uo <- read.csv2(system.file("info_uo.csv", package = "IBDL"),fileEncoding = "utf-8")
#' fibdl_checkof_infoscomp(infos_uo)

fibdl_checkof_infoscomp <- function(data){
  ##
  table_orig <- "informations complementaires sur l uo"
  ##
  step_1 <- CheckOfTable::fcot_table(data,table_orig=table_orig)
  sortie <- step_1
  if(step_1$valeur_test=="oui"){
    step_2 <- CheckOfTable::fcot_colnames(data,
                                          noms_colonnes = c("id_prelevement", "id_uo", "nature_substrat", "id_campagne", "type_dominant", "code_pe",  "datedebut"),
                                          table_orig=table_orig)
    sortie <- dplyr::bind_rows(sortie,step_2)
    if(step_2$valeur_test=="oui"){
      step_3 <- dplyr::bind_rows(
        CheckOfTable::fcot_value_empty(data,
                                       c("id_prelevement", "id_uo", "nature_substrat", "id_campagne", "type_dominant", "code_pe",  "datedebut"),
                                       table_orig),
        CheckOfTable::fcot_type_character(data,
                                          c("nature_substrat","code_pe"),
                                          table_orig),
        CheckOfTable::fcot_type_numeric(data,
                                        c("id_prelevement", "id_uo", "id_campagne", "type_dominant"),
                                        table_orig),
        CheckOfTable::fcot_value_positive(data,
                                          c("id_prelevement", "id_uo", "id_campagne", "type_dominant"),
                                          table_orig),
        CheckOfTable::fcot_value_interval(data,
                                          c("type_dominant"),
                                          mini=1,
                                          maxi=4,
                                          table_orig)
      )
      step_3 <- step_3 %>%
        dplyr::mutate(nom_test = nom_test_precis) %>%
        dplyr::select(-nom_test_precis)
      sortie <- dplyr::bind_rows(sortie,step_3)
    }else{
    }
  }else{

  }
  return(sortie)
}
