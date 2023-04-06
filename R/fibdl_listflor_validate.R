
#' Validation des listes floristiques
#'
#' @param data listes floristiques harmonisées via la fonction fibdl_listflor_transcode
#'
#' @return tableau des listes floristiques validées selon trois critères :
#'
#' @export
#'
#' @examples
fibdl_listflor_validate <- function(data){
  ## create table validation
  table_validation <- fibdl_listflor_qualify(data)
  ##
  table_listflor_validate <- data %>%
    dplyr::left_join(table_validation,
                     by="id_prelevement") %>%
    dplyr::filter(Validation==TRUE) %>%
    dplyr::select(id_prelevement,taxons,ab)
  ##
  return(table_listflor_validate)
}
