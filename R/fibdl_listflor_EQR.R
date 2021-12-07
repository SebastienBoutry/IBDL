#' Transformation en EQR au niveau du prélèvement
#'
#' @param data
#' @param add_information_station
#'
#' @return
#' @export
#'
#' @examples
fibdl_listflor_EQR<- function(data,add_information_station){
  ###
  data <- data %>%
    dplyr::left_join(Typo_UO,
              by="id_prelevement") %>%
    dplyr::left_join(lake_infos,
              by="code_pe")
  ###
  table_listflor_EQR <- data %>%
    dplyr::filter(!is.na(classi_alc)) %>%
    tidyr::unite("join",c("metrics","classi_alc","nature_substrat"),sep="_",remove=FALSE) %>%
    dplyr::left_join(add_information_station,by="join") %>%
    dplyr::mutate(SES=(value-Mtype)/SDtype) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(SESnor=dplyr::case_when(metrics=="DBO5"~ (SES-(-4.25))/(1.00-(-4.25)),
                            metrics=="MES" ~ (SES-( -5.33))/(1.02-( -5.33)),
                            metrics=="NKJ" ~ (SES-(-5.21))/(1.00-(-5.21)),
                            metrics=="Ptot" ~ (SES-(-3.73))/(1.41-(-3.73))
    )
    ) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(EQR=dplyr::case_when(metrics=="DBO5"~SESnor/0.915,
                         metrics=="MES"~SESnor/0.918,
                         metrics=="NKJ"~SESnor/0.912,
                         metrics=="Ptot"~SESnor/0.855
    )
    ) %>%
    dplyr::select(-join,-Mtype,-SDtype)
  return(table_listflor_EQR)
}
