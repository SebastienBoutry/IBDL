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

  id_prelevement_admi<-fibdl_listflor_qualify(listflor %>%
                           fibdl_listflor_transcode())[[2]]
  ##
  table_score_ibdl <- data %>%
    dplyr::group_by(id_prelevement,code_pe,nature_substrat,id_uo,type_dominant,id_campagne,datedebut) %>%
    dplyr::summarise(Moy_EQR=mean(EQR)) %>% # moyenne des métriques selon le uo et le substrat
    dplyr::ungroup() %>%
    dplyr::arrange(id_uo) %>%
    ## identification admi
    dplyr::mutate(commentaires = if_else(!id_prelevement %in% id_prelevement_admi, "ok", "pas fiable")) %>%
    dplyr::group_by(code_pe, id_uo, id_campagne) %>%
    dplyr::mutate(nbr_prel = n()) %>%
    dplyr::ungroup() |>
    ##
    dplyr::group_by(code_pe,id_uo,type_dominant,id_campagne,datedebut,nbr_prel) %>%
    dplyr::summarise(Note_UO=min(Moy_EQR),
                     commentaires_sep = paste0(commentaires, collapse = "_")
                     ) %>% # la valeur minimale selon les deux substrat sur l'UO
    dplyr::ungroup()
    ## suppression de colonnes
    # dplyr::filter(!(stringr::str_detect(commentaires_sep , "pas fiable") & nbr_prel == 2)) %>%
    # dplyr::ungroup() %>%
    # dplyr::mutate(id_uo = as.numeric(id_uo)) %>%
    # dplyr::select(-commentaires_sep, -nbr_prel)
  ##
  return(table_score_ibdl)
}
