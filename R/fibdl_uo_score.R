fibdl_uo_score <- function(data){
  table_score_ibdl <- data %>%
    dplyr::group_by(id_prelevement,code_pe,nature_substrat,id_uo,type_dominant,id_campagne,datedebut) %>%
    dplyr::summarise(Moy_EQR=mean(EQR)) %>% # moyenne des métriques selon le uo et le substrat
    dplyr::ungroup() %>%
    dplyr::arrange(id_uo) %>%
    dplyr::group_by(code_pe,id_uo,type_dominant,id_campagne,datedebut) %>%
    dplyr::summarise(Note_UO=min(Moy_EQR)) %>% # pire note selon l'UO
    dplyr::ungroup()
  return(table_score_ibdl)
}
