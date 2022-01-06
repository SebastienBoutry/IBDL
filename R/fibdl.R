#' Fonction integratrice pour le calcul de Indice Biologique Diatomees en Lac (IBDL)
#'
#' @param listflor tableau renseignant les listes floristiques avec trois colonnes id_prelevement, taxons, et ab
#' @param add_information_station tableau d informations complementaires sur le prelevement.
#'
#' @return
#' @export
#'
#' @examples
#' list_flor <- read.csv2(system.file("listflor.csv", package = "IBDL"),fileEncoding = "utf-8")
#' info_uo<- utils::read.csv2(system.file("info_uo.csv", package = "IBDL"),fileEncoding = "utf-8")
#'
#' fibdl(list_flor, info_uo)

fibdl <- function(listflor, add_information_station) {

  test <- fibdl_checkof_inputs(listflor, info_uo)

  if(test[[1]] == TRUE){
  ##
  table_ibdl <- listflor %>%
    fibdl_listflor_transcode() %>%
    fibdl_listflor_validate() %>%
    fibdl_listflor_metrics() %>%
    fibdl_listflor_EQR(data=.,add_information_station=info_uo) %>%
    fibdl_listflor_EQR_standard() %>%
    fibdl_uo_score() %>%
    fibdl_ibdl() %>%
    fibdl_ibdl_qualify()

  return(table_ibdl)

  }else{

      return(test[[2]])

  }
}
