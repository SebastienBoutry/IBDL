#' Calcul du score au niveau de l'unité d'observation
#'
#' @param data tableau de sortie de la fonction fibdl_listflor_EQR_standard, correspondant à un tableau de résultats des métriques exprimées en EQR standardisées.
#'
#' @return tableau des métriques au niveau de l'unité d'observation (moyenne des EQR) puis la valeur minimale entre les deux type de substrat.
#'
#' @export
#'
#' @examples
fibdl_uo_score <- function(data){
  ##
  table_score_ibdl <- data %>%
    dplyr::group_by(id_prelevement,code_pe,nature_substrat,id_uo,type_dominant,id_campagne,datedebut) %>%
    dplyr::summarise(Moy_EQR=mean(EQR)) %>% # moyenne des métriques selon le uo et le substrat
    dplyr::ungroup() %>%
    dplyr::arrange(id_uo) %>%
    dplyr::group_by(code_pe,id_uo,type_dominant,id_campagne,datedebut) %>%
    dplyr::summarise(Note_UO=min(Moy_EQR)) %>% # la valeur minimale selon les deux substrat sur l'UO
    dplyr::ungroup()
  ##

  return(table_score_ibdl)
}
