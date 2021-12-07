
#' Title
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
fibdl_listflor_metrics <- function(data){
  params <- c("MES","DBO5","NKJ","Ptot")
  data %>%
    ## récupération des taxons d'alertes
    dplyr::left_join(Table_taxons_alertes,
              by = c("taxons" = "taxons_indiciels")
    ) %>%
    ## calcul des métriques
    dplyr::mutate(indiciel = tidyr::replace_na(indiciel, 0)) %>%
    dplyr::mutate_at(dplyr::vars(params),
                     dplyr::funs(tidyr::replace_na(., 0))) %>%
    dplyr::filter(indiciel == 1) %>%
    dplyr::group_by(id_prelevement) %>%
    dplyr::mutate(tot=sum(ab)) %>%
    dplyr::mutate(ab_rel = ab / tot) %>%
    dplyr::mutate_at(dplyr::vars(params),
                     dplyr::funs(. * ab_rel)) %>%
    dplyr::group_by(id_prelevement) %>%
    dplyr::summarise_at(dplyr::vars(params),
                        dplyr::funs(1 - sum(.))) %>%
    tidyr::pivot_longer(cols=params,
                 names_to="metrics",
                 values_to="value") %>%
    dplyr::select(id_prelevement,metrics,value)
}
