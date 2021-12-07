#' Qualification des listes floristiques
#'
#' @param data
#' @param seuil_nbr_valves
#' @param seuil_pour_valves_sp
#' @param seuil_pour_taxons_indiciels
#'
#' @return
#' @export
#'
#' @examples
fibdl_listflor_qualify <- function(data,
                                   seuil_nbr_valves = 350,
                                   seuil_pour_valves_sp = 0.25,
                                   seuil_pour_taxons_indiciels = 0.75){
  ## create table validation
  table_validation <- data %>%
    ## récupération des taxons d'alertes
    dplyr::left_join(Table_taxons_alertes,
              by = c("taxons" = "taxons_indiciels")
    ) %>%
    ## validation des taxons
    dplyr::mutate(indiciel=ifelse(is.na(indiciel),0,indiciel)) %>%
    dplyr::group_by(id_prelevement) %>%
    dplyr::summarise(tot=sum(ab),
              tot_sans_ADMI=sum(ab[taxons!="ADMI" &! rang %in% c("erreur","gn",NA_character_)]),
              Ab_tot_indiciel = sum(ab[indiciel==1])) %>%
    dplyr::mutate(r_esp=tot_sans_ADMI/tot,
           pour_taxons_indiciels=Ab_tot_indiciel/tot) %>%
    dplyr::mutate(nbr_valves =ifelse(tot>=seuil_nbr_valves,
                                     TRUE,
                                     FALSE)) %>%
    dplyr::mutate(r_esp = ifelse(r_esp >=seuil_pour_valves_sp ,
                                 TRUE,
                                 FALSE)) %>%
    dplyr::mutate(r_taxons_indiciels = ifelse(pour_taxons_indiciels >= seuil_pour_taxons_indiciels,
                                              TRUE,
                                              FALSE)) %>%
    dplyr::mutate(Validation=ifelse(r_esp==TRUE &
                                      nbr_valves ==TRUE &
                                      r_taxons_indiciels==TRUE,
                                    TRUE,
                                    FALSE))
  return(table_validation)
}
