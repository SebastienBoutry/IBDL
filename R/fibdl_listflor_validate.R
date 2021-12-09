
#' Validation des listes floristiques
#'
#' @param data listes floristiques harmonisées via la fonction fibdl_listflor_transcode
#'
#' @return tableau des listes floristiques validées selon trois critères :
#' - un nombre total de valves comptés supérieur à 350
#' - un ratio de valves déterminées au rang taxonomique de l'espère surpérieur à 25%
#' - un ratio de valves comptées étant indiciels surpérieur à 75%
#'
#' @export
#'
#' @examples
fibdl_listflor_validate <- function(data){
  ## create table validation
  table_validation <- fibdl_listflor_qualify(data,
                                             seuil_nbr_valves = 350,
                                             seuil_pour_valves_sp = 0.25,
                                             seuil_pour_taxons_indiciels = 0.75)
  ##
  table_listflor_validate <- data %>%
    dplyr::left_join(table_validation,
                     by="id_prelevement") %>%
    dplyr::filter(Validation==TRUE) %>%
    dplyr::select(id_prelevement,taxons,ab)
  ##
  return(table_listflor_validate)
}
