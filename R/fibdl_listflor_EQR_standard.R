#' Standardisation des EQR au niveau du prélèvement
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
fibdl_listflor_EQR_standard <- function(data){
  table_listflor_EQR_standard <- data %>%
    dplyr::mutate(EQR=dplyr::case_when(EQR>=0.934 & metrics=="DBO5"~EQR*3.05-2.05,
                         EQR<0.934 & metrics=="DBO5"~EQR*0.856,
                         EQR>=0.958 & metrics=="MES"~EQR*4.73-3.73,
                         EQR<0.958 & metrics=="MES"~EQR*0.835,
                         EQR>=0.951 & metrics=="NKJ"~EQR*4.1-3.10,
                         EQR<0.951 & metrics=="NKJ"~EQR*0.841,
                         EQR>=0.952 & metrics=="Ptot"~EQR*4.13-3.13,
                         EQR<0.952 & metrics=="Ptot"~EQR*0.841)) %>%
    dplyr::mutate(EQR=ifelse(EQR>1,1,EQR)) %>%
    dplyr::select(id_prelevement,metrics,id_uo,nature_substrat,type_dominant,id_campagne,code_pe,datedebut,classi_alc,EQR)
  return(table_listflor_EQR_standard)
}
