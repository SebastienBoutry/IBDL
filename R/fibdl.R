#' Fonction intégratrice
#'
#' @param listflor table renseignant les listes floristiques avec trois colonnes id_prelevement, taxons, et ab
#' @param info_uo table d'informations complémentaires sur le prélevement.
#'
#' @return
#' @export
#'
#' @examples
fibdl <- function(listflor, info_uo) {
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
}
