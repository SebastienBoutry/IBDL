#' Qualification des listes floristiques
#'
#' @param data tableau representant la liste floristique
#' @param seuil_nbr_valves nombre de valves compte dans le prelevement. Dans la norme, il est demande de compter 400 valves.
#' @param seuil_pour_valves_sp  seuil en pourcentage de valves determinees au rang taxonomique espece dans le prelevement.
#' Petite specificite, on ne prend pas compte le code taxon ADMI (complexe taxonomique).
#' @param seuil_pour_taxons_indiciels seuil en pourcentage des taxons indiciels dans le prelevement
#' @param table_tax_alerts tableau de reference au format binaire des taxons d'alertes et indiciels, par defaut Table_taxons_alertes (table interne embarquee)
#'
#' @return tableau avec les informations liees au prelevement. La colonne validation renseigne la selection finale.
#' @export
#' @import dplyr
#'
#' @examples
#' list_flor <- read.csv2(system.file("listflor.csv", package = "IBDL"),fileEncoding = "utf-8") %>%
#' IBDL::fibdl_listflor_transcode()
#' fibdl_listflor_qualify(data=list_flor)
#'
#'
fibdl_listflor_qualify <- function(data,
                                   seuil_nbr_valves = 350,
                                   seuil_pour_valves_sp = 0.50,
                                   seuil_pour_taxons_indiciels = 0.75,
                                   table_tax_alerts = IBDL:::Table_taxons_alertes){
  ## create table validation
  table_validation <- data %>%
    ## récupération des taxons d'alertes
    dplyr::left_join(table_tax_alerts,
                     by = c("taxons" = "taxons_indiciels")
    ) %>%
    ## validation des taxons
    dplyr::mutate(indiciel=ifelse(is.na(indiciel),0,indiciel)) %>%
    dplyr::group_by(id_prelevement) %>%
    dplyr::summarise(tot=sum(ab),
                     r_esp=sum(ab[! rang %in% c("erreur","gn",NA_character_)])/tot,
                     r_ADMI = sum(ab[!taxons %in% "ADMI"]) / tot,
                     Ab_tot_indiciel = sum(ab[indiciel==1])) %>%
    dplyr::mutate(r_esp=r_esp/tot,
                  pour_taxons_indiciels=Ab_tot_indiciel/tot) %>%
    dplyr::mutate(nbr_valves =ifelse(tot>=seuil_nbr_valves,
                                     TRUE,
                                     FALSE)) %>%
    dplyr::mutate(r_esp = ifelse(r_esp >=seuil_pour_valves_sp ,
                                 TRUE,
                                 FALSE)) %>%
    # dplyr::mutate(r_taxons_indiciels = ifelse(pour_taxons_indiciels >= seuil_pour_taxons_indiciels,
    #                                           TRUE,
    #                                           FALSE)) %>%
    dplyr::mutate(Validation=ifelse(r_esp==TRUE &
                                      nbr_valves ==TRUE,
                                    # r_taxons_indiciels==TRUE,
                                    TRUE,
                                    FALSE))
  ## identifaction des prelevement ayant une liste floristique avec beaucoup trop ADMI
  id_prelevement_admi <- table_validation %>%
    mutate(Validation_admi = ifelse(r_ADMI >= 0.5, TRUE, FALSE)) %>%
    filter(Validation_admi == FALSE) %>%
    pull(id_prelevement)

  ##
  return(table_validation)
}
