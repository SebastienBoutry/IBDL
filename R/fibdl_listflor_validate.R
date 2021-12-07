
#' Validation des listes floristiques
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
fibdl_listflor_validate <- function(data){
  ## create table validation
  table_validation <- fibdl_listflor_qualify(data,seuil_nbr_valves = 350, seuil_pour_valves_sp = 0.25, seuil_pour_taxons_indiciels = 0.75)
  ##
  table_listflor_validate <- data %>%
    dplyr::left_join(table_validation,by="id_prelevement") %>%
    dplyr::filter(Validation==TRUE) %>%
    dplyr::select(id_prelevement,taxons,ab) %>%
    return(table_listflor_validate)
}
