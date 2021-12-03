#' Harmonisation taxonomique au niveau espèce
#'
#' @param data liste floristique dans le bon format
#'
#' @return liste floristique au niveau taxonomique espèce
#' @export
#' @import dplyr
#' @examples
#' listflor <- tibble::tibble(id_prelevement=1,
#' taxons=c("NITZ","ADPA","ABAS","PBTH","PHAO","PSDG","NXDS","GLAT",
#' "DSTE","RABB","COCE","ENCM","PSBR","PLTD","ADEU","AUPU"),
#' ab=c(202,20,2,26,12,5,6,74,5,2,3,3,15,10,5,20))
#' fibdl_listflor_transcode(listflor)
#'
fibdl_listflor_transcode <- function(data){
  table_listflor_transcode <- data %>%
    dplyr::left_join(table_transcodage %>%
                dplyr::select(abre, code_espece_boucle2, denominations_sans_auteur.y,niveau2),
              by = c("taxons" = "abre")
    ) %>%
    dplyr::rename("ex_taxons" = "taxons", "taxons" = "code_espece_boucle2") %>%
    dplyr::group_by(id_prelevement, taxons,denominations_sans_auteur.y, niveau2) %>%
    dplyr::summarise(ab = sum(ab)) %>%
    dplyr::ungroup()
  return(table_listflor_transcode)
}
