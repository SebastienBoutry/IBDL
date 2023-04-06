#' Standardisation des EQR au niveau du prélèvement
#'
#' @param data tableau de sortie de la fonction fibdl_listflor_EQR()
#'
#' @return tableau des résultats en EQR standardisés, avec des répartitions identiques et donc des seuils identiques
#'
#' @export
#' @import tibble
#' @import dplyr
#'
#' @examples

fibdl_listflor_EQR_standard <- function(data){
  table_listflor_EQR_standard <- data %>%
    dplyr::mutate(EQR=dplyr::case_when(EQR>=0.968 & metrics=="DBO5"~EQR*6.35-5.35,
                         EQR<0.968 & metrics=="DBO5"~EQR*0.826,
                         EQR>=0.972 & metrics=="MES"~EQR*7.14-6.14,
                         EQR<0.972 & metrics=="MES"~EQR*0.823,
                         EQR>=0.981 & metrics=="NKJ"~EQR*10.7-9.70,
                         EQR<0.981 & metrics=="NKJ"~EQR*0.815,
                         EQR>=0.955 & metrics=="Ptot"~EQR*4.45-3.45,
                         EQR<0.955 & metrics=="Ptot"~EQR*0.838)) %>%
    dplyr::mutate(EQR=ifelse(EQR>1,1,EQR)) %>%
    dplyr::select(id_prelevement,metrics,id_uo,nature_substrat,type_dominant,id_campagne,code_pe,datedebut,classi_alc,EQR)
  return(table_listflor_EQR_standard)
}
