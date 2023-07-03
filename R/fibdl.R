#' Fonction integratrice pour le calcul de Indice Biologique Diatomees en Lac (IBDL)
#'
#' @param listflor tableau renseignant les listes floristiques avec trois colonnes id_prelevement, taxons, et ab
#' @param add_information_station tableau d informations complementaires sur le prelevement.
#'
#' @return
#' @export
#'
#' @examples


fibdl <- function(listflor, add_information_station) {

  info_uo<-add_information_station

  test <- fibdl_checkof_inputs(listflor, info_uo)

  if(test[[1]] == TRUE){
  ##
  table_ibdl <- listflor %>%
    fibdl_listflor_transcode() %>%
    fibdl_listflor_validate() %>%
    fibdl_listflor_metrics() %>%
    fibdl_listflor_EQR(data=.,add_information_station=info_uo) %>%
    fibdl_listflor_EQR_standard() %>%
    fibdl_uo_score(listflor=listflor) %>%
    fibdl_ibdl() %>%
    fibdl_ibdl_qualify()

  }else{

    table_ibdl<-test[[2]]

  }
  return(table_ibdl)
}
