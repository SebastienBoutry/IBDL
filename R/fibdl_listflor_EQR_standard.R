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
    dplyr::mutate(EQR=dplyr::case_when(EQR>=0.968 & metrics=="DBO5"~EQR*6.348627-5.348627,
                         EQR<0.968 & metrics=="DBO5"~EQR*0.8260221 ,
                         EQR>=0.972 & metrics=="MES"~EQR*7.139655-6.139655,
                         EQR<0.972 & metrics=="MES"~EQR*0.8230559 ,
                         EQR>=0.981 & metrics=="NKJ"~EQR*10.701637 -9.701637,
                         EQR<0.981 & metrics=="NKJ"~EQR*0.8152357,
                         EQR>=0.955 & metrics=="Ptot"~EQR*4.453086 -3.453086 ,
                         EQR<0.955 & metrics=="Ptot"~EQR* 0.8376197 )) %>%
    dplyr::mutate(EQR=ifelse(EQR>1,1,EQR)) %>%
    dplyr::select(id_prelevement,metrics,id_uo,nature_substrat,type_dominant,id_campagne,code_pe,datedebut,classi_alc,EQR)
  return(table_listflor_EQR_standard)
}
