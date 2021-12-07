#' Calcul de l'IBDL et la classe d'état
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
fibdl_ibdl<- function(data){
  table_ibdl <- data %>%
    dplyr::group_by(code_pe,id_campagne,datedebut) %>%
    dplyr::mutate(nbr_uo=length(id_uo)) %>%
    dplyr::ungroup() %>%
    tidyr::unite("join",c("code_pe","type_dominant"),remove=FALSE) %>%
    dplyr::select(-type_dominant) %>%
    ##
    dplyr::left_join(Pourcent_typologie_lacs_macrophytes,
              by="join") %>%
    dplyr::select(-join,-code_lac) %>%
    dplyr::rename("code_lac"="code_pe") %>%
    ##
    dplyr::group_by(id_campagne,datedebut,code_lac,pourcentage,value,nbr_uo) %>%
    dplyr::summarise(Moy_type=mean(Note_UO,na.rm=TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(id_campagne) %>%
    dplyr::mutate(Note_type=Moy_type*(value/100)) %>%
    ##
    dplyr::group_by(id_campagne,datedebut,code_lac,nbr_uo) %>%
    dplyr::summarise(IBDL=sum(Note_type),
              SommePourcent=sum(value/100)) %>%
    dplyr::mutate(ClassIBDL=cut(IBDL,c(0,0.2,0.4,0.6,0.8,1),
                         labels=c("B","P","M","G","HG"))) %>%
    dplyr::mutate(IBDL=IBDL/SommePourcent) %>%
    dplyr::ungroup()
  ##
  return(table_ibdl)
}
