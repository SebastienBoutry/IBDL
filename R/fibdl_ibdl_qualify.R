#' Qualification de l IBDL
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
fibdl_ibdl_qualify<- function(data){
  ibdl_qualify <- data %>%
    dplyr::ungroup() %>%
    dplyr::left_join(lake_infos,by=c("code_lac"="code_pe")) %>%
    ###
    dplyr::mutate(Fiabilite=ifelse(SommePourcent>=0.75 & nbr_uo>=(3),
                            "ok",
                            "pas fiable"),
           ClassIBDL=as.character(cut(IBDL,
                                      c(0,0.2,0.4,0.6,0.8,2),
                                      labels=c("B","P","M","G","HG"))),
           ClassIBDL=ifelse(Fiabilite=="pas fiable",
                            NA,
                            ClassIBDL),
           comment_1=ifelse(SommePourcent>=0.75,"","Pourcentage du lineaire inferieur a 75% (non representatif)"),
           comment_2=ifelse(nbr_uo>=(3),"","Nbr d UO inferieur a 3"),
           commentaires="",
           commentaires=dplyr::case_when((comment_1 != "" & comment_2 != "") ~ paste(comment_1,comment_2,sep="\n"),
                                  (comment_1 == "" & comment_2 != "") ~ comment_2,
                                  (comment_1 != "" & comment_2 == "") ~ comment_1,
                                  TRUE ~ "")
    ) %>%
    dplyr::mutate(ClassIBDL=factor(ClassIBDL,
                            levels=c("B","P","M","G","HG")[5:1])) %>%
    dplyr::select(-comment_1,-comment_2,-nbr_uo_theo) %>%
    dplyr::rename("Classe alcalinite"="classi_alc",
           "Somme des Pourcentages selon la typologie"="SommePourcent",
           "Classe d'etat IBDL"="ClassIBDL")
  ##
  return(ibdl_qualify)
}
