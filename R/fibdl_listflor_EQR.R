#' Transformation en EQR au niveau du prélèvement
#'
#' @param data tableau de sortie de la fonction fibdl_listflor_metrics()
#' @param add_information_station tableau d'entrée renseignant sur les la nature du substrat et la classe d'alcalinité du plan d'eau échantillonné.
#'
#' @return
#' @export
#'
#' @examples
fibdl_listflor_EQR<- function(data,add_information_station){
  ###
  data <- data %>%
    dplyr::left_join(add_information_station,
              by="id_prelevement") %>%
    dplyr::left_join(lake_infos,
              by="code_pe")
  ###
  table_listflor_EQR <- data %>%
    dplyr::filter(!is.na(classi_alc)) %>%
    tidyr::unite("join",c("metrics","classi_alc","nature_substrat"),sep="_",remove=FALSE) %>%
    dplyr::left_join(SES_ref_type,by="join") %>%
    dplyr::mutate(SES=(value-Mtype)/SDtype) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(SESnor=dplyr::case_when(metrics=="DBO5"~ (SES-(-4.25))/(0.9-(-4.25)),
                            metrics=="MES" ~ (SES-( -4.16))/(1.00-(  -4.16)),
                            metrics=="NKJ" ~ (SES-(-4.80))/(1.00-(-4.80)),
                            metrics=="Ptot" ~ (SES-(-3.56))/(1.17-(-3.56))
    )
    ) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(EQR=dplyr::case_when(metrics=="DBO5"~SESnor/0.936,
                         metrics=="MES"~SESnor/0.908,
                         metrics=="NKJ"~SESnor/0.914,
                         metrics=="Ptot"~SESnor/0.888
    )
    ) %>%
    dplyr::select(-join,-Mtype,-SDtype)
  ##
  # table_listflor_EQR<-table_listflor_EQR |>
  #   # mutate(EQR = ifelse(
  #   #   EQR >= Lim_HG_G,
  #   #   EQR * coeff_a + coeff_b,
  #   #   EQR * coeff
  #   # )) %>%
  #   mutate(EQR = EQR) %>%
  #   mutate(EQR = ifelse(EQR > 1, 1, EQR))

  ##
  return(table_listflor_EQR)
}
