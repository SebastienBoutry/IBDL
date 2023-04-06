#' Contrôle du tableau liste floristique pour le calcul de l'IBDL
#'
#' @param data tableau représentant la liste floristique
#'
#' @return
#' @export
#' @import CheckOfTable
#'
#' @examples
#' list_flor <- read.csv2(system.file("listflor.csv", package = "IBDL"),fileEncoding = "utf-8")
#' fibdl_checkof_listflor(list_flor)

fibdl_checkof_listflor <- function(data){
  ##
  table_orig <- "liste flore"
  ##
  step_1 <- CheckOfTable::fcot_table(data,table_orig=table_orig)
  sortie <- step_1
  if(step_1$valeur_test=="oui"){
    step_2 <- CheckOfTable::fcot_colnames(data,
                                          noms_colonnes = c("id_prelevement","taxons","ab"),
                                          table_orig=table_orig)
    sortie <- dplyr::bind_rows(sortie,step_2)
    if(step_2$valeur_test=="oui"){
      step_3 <- dplyr::bind_rows(
        CheckOfTable::fcot_value_empty(data,
                                       c("id_prelevement","taxons","ab"),
                                       table_orig),
        CheckOfTable::fcot_type_character(data,
                                          c("taxons"),
                                          table_orig),
        CheckOfTable::fcot_type_numeric(data,
                                        c("id_prelevement","ab"),
                                        table_orig),
        CheckOfTable::fcot_value_positive(data,
                                          c("id_prelevement","ab"),
                                          table_orig),
        CheckOfTable::fcot_value_interval(data,
                                          c("ab"),
                                          mini=1,
                                          maxi=400,
                                          table_orig)
      )
      step_3 <- step_3 %>%
        dplyr::mutate(nom_test = nom_test_precis) %>%
        dplyr::select(-nom_test_precis)
      sortie <- dplyr::bind_rows(sortie,step_3)
      #   select(message)
    }else{
    }
  }else{

  }
  return(sortie)
}
