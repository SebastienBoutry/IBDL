#' Calcul de l'IBDL et la classe d'état
#'
#' @param data tableau de sortie de la fonction fibdl_uo_score
#'
#' @return tableau d'évaluation au niveau du lac avec l'IBDL et la classe d'état
#' @export
#'
#' @examples
fibdl_ibdl<- function(data){
  ## à modifier pour la prise en compte de données externes sur le pourcentage de linéaire selon la typologie des rives
  table_pourcentage_type <- Pourcent_typologie_lacs_macrophytes
  ##
  table_ibdl <- data %>%
    dplyr::group_by(code_pe,id_campagne,datedebut) %>%
    dplyr::mutate(nbr_uo=length(id_uo)) %>%
    dplyr::ungroup() %>%
    tidyr::unite("join",c("code_pe","type_dominant"),
                 remove=FALSE) %>%
    dplyr::select(-type_dominant) %>%
    ##
    dplyr::left_join(table_pourcentage_type,
              by="join") %>%
    dplyr::select(-join,-code_lac) %>%
    dplyr::rename("code_lac"="code_pe") %>%
    filter(!(str_detect(commentaires, "pas fiable"))) %>%
    ##
    group_by(id_campagne, datedebut, code_lac, pourcentage, value, nbr_uo) %>%
    mutate(nbr_uo_type = n()) %>%
    ungroup() %>%
    ##
    dplyr::group_by(id_campagne,datedebut,code_lac,pourcentage,value,nbr_uo,nbr_uo_type) %>%
    dplyr::summarise(Min_type=min(Note_UO,na.rm=TRUE),
                     commentaires_sep = paste0(commentaires, collapse = "_")) %>%
    # filter(!(str_detect(commentaires_sep, "pas fiable") & nbr_uo_type >= 1)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(id_campagne) %>%
    dplyr::mutate(Note_type=Min_type*(value/100)) %>%
    ##
    dplyr::group_by(id_campagne,datedebut,code_lac,nbr_uo) %>%
    dplyr::summarise(IBDL=sum(Note_type),
              SommePourcent=sum(value/100),
              IBDL=(IBDL)# arrondi à deux décimales après la virgule
              ) %>%
    dplyr::ungroup() |>
    dplyr::mutate(ClassIBDL=cut(IBDL,c(0,0.2,0.4,0.6,0.8,1),
                         labels=c("B","P","M","G","HG"))) %>%
    dplyr::mutate(IBDL=round((IBDL/SommePourcent),2)) %>%  # arrondi à deux décimales après la virgule
    dplyr::ungroup()
  ##
  return(table_ibdl)
}
