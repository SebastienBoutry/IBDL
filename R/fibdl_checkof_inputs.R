#' Check of inputs to calculate IBDL
#'
#' @param list_flor tableau representant la liste floristique
#' @param info_uo tableau representant les informations complementaires sur l unite d observation
#'
#'
#' @return
#' @export
#' @import dplyr
#'
#' @examples
#' list_flor <- read.csv2(system.file("listflor.csv", package = "IBDL"),fileEncoding = "utf-8")
#' info_uo<- utils::read.csv2(system.file("info_uo.csv", package = "IBDL"),fileEncoding = "utf-8")

#' fibdl_checkof_inputs(list_flor=list_flor,info_uo=info_uo)


fibdl_checkof_inputs <- function(list_flor,info_uo){
  sortie_infoscomp <- IBDL::fibdl_checkof_infoscomp(info_uo)
  output <- list()

  if(sum(sortie_infoscomp$valeur_test=="oui") == nrow(sortie_infoscomp)){
    output[[1]] <- TRUE
  }else{
    output[[1]] <- sortie_infoscomp %>%
      dplyr::filter(valeur_test=="non") %>%
      dplyr::pull(message)
  }

  sortie_list_flor <- IBDL::fibdl_checkof_listflor(list_flor)

  if(sum(sortie_list_flor$valeur_test=="oui") == nrow(sortie_list_flor)){
    output[[2]] <- TRUE
  }else{
    output[[2]] <- sortie_list_flor %>%
      dplyr::filter(valeur_test=="non") %>%
      dplyr::pull(message)
  }
  ##
  sortie <- list()
  ##
  sortie[[1]] <- dplyr::case_when(output[[1]]==TRUE & output[[2]]==TRUE ~ TRUE,
             output[[1]]!=TRUE & output[[2]]==TRUE ~ FALSE,
             output[[1]]==TRUE & output[[2]]!=TRUE ~ FALSE,
             output[[1]]!=TRUE & output[[2]]!=TRUE ~ FALSE,
             TRUE ~ FALSE
             )
  sortie[[2]] <- dplyr::case_when((output[[1]] == TRUE & output[[2]] == TRUE) ~ NA_character_,
                                  (output[[1]] != TRUE & output[[2]] == TRUE) ~ as.character(output[[1]]),
                                  (output[[1]] == TRUE & output[[2]] != TRUE) ~ as.character(output[[2]]),
                                  (output[[1]] != TRUE & output[[2]] != TRUE) ~ c(as.character(output[[1]]),as.character(output[[2]])),
                                  TRUE ~ NA_character_
  )
  ##
  return(sortie)
}
