#' Calcul des métriques MES, DBO5, NKJ et Ptot au niveau du prélèvement
#'
#' @param data listes floristiques harmonisées via la fonction fibdl_listflor_transcode
#' @param table_tax_alerts tableau de référence au format binaire des taxons d'alertes et indiciels, par défaut Table_taxons_alertes (table interne embarquée)
#'
#' @return tableau avec l'id_prelevement, la métrique (metrics) et la valeur (value)
#' @export
#'
#' @examples
fibdl_listflor_metrics <- function(data,table_tax_alerts=Table_taxons_alertes){

  params <- c("MES","DBO5","NKJ","Ptot")
  ##

 table_listflor_metrics <-  data %>%
    ## récupération des taxons d'alertes
    dplyr::left_join(table_tax_alerts,
              by = c("taxons" = "taxons_indiciels")
    ) %>%
    ## calcul des métriques
    dplyr::mutate(indiciel = tidyr::replace_na(indiciel, 0)) %>%
    dplyr::mutate_at(params,~tidyr::replace_na(., 0)) %>%
    dplyr::filter(indiciel == 1) %>%
    dplyr::group_by(id_prelevement) %>%
    dplyr::mutate(tot=sum(ab)) %>%
    dplyr::mutate(ab_rel = ab / tot) %>%
    dplyr::mutate_at(params,
                     ~(. * ab_rel)) %>%
    dplyr::group_by(id_prelevement) %>%
    dplyr::summarise_at(params,
                        ~(1 - sum(.))) %>%
    tidyr::pivot_longer(cols=params,
                 names_to="metrics",
                 values_to="value") %>%
    dplyr::select(id_prelevement,metrics,value)
 ##
 return(table_listflor_metrics)
}
