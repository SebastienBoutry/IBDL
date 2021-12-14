fibdl_input_validate <- function(data,add_information_station){
  ##

  ##
}

f_format_table <- function(data,table_orig){
  test <- NULL
  if(sum(class(data) %in% "data.frame")==0){
    test <- tibble(test="1.1",
                   valeur_test="non",
                   nom_test="data.frame_format",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="1.1",
                   # test="format_data.frame",
                   message=paste0("Le tableau (",
                                  table_orig,
                                  ") n'est pas un data.frame.")
                   # )
    )
  }else{
    test <- tibble(test="1.1",
                   valeur_test="oui",
                   nom_test="data.frame_format",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="1.1",
                   # test="format_data.frame",
                   message="")
    # )
  }
  return(test)
}
###
f_format_colnames <- function(data,noms_colonnes,table_orig){
  ##
  test <- f_format_table(data,table_orig)
  ##
  data <- data %>%
    # rename_with(str_to_upper) %>%
    rename_with(str_trim)
  ##
  if(test$valeur_test == "oui"){
    verif <- which(! (noms_colonnes %in% names(data)))
    if(length(verif)==0){
      test <- tibble(test="1.2",
                     valeur_test="oui",
                     nom_test="data.frame_colnames",
                     table_orig=table_orig,
                     # sortie=data.frame(
                     test_precis="1.2",
                     # test="format_data.frame",
                     message="")
      # )
    }else{
      test <- tibble(test="1.2",
                     valeur_test="non",
                     nom_test="data.frame_colnames",
                     table_orig=table_orig,
                     # sortie=data.frame(
                     test_precis="1.2",
                     # test="format_data.frame",
                     message=paste0("Les noms des colonnes ne sont pas identifiés : ",
                                    paste0(noms_colonnes[verif],collapse=", ")
                     )
                     # )
      )
    }

  }else{
    test <- tibble(test="1.2",
                   valeur_test="non",
                   nom_test="colnames_data.frame",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="1.2",
                   # test="format_data.frame",
                   message=paste0("Test non effectué car le format du ",table_orig," non valide")
    )
    # )

  }
  ##
  return(test)
}


f_format_type_numeric <- function(data,noms_colonnes,table_orig){
  ##
  verif <- which(
    sapply(noms_colonnes,
           function(i)
             ! is.numeric(data %>% pull(i)))
  )
  ##
  if(length(verif)==0){
    test <- tibble(noms_colonnes_non_conforme="",
                   test="2.1",
                   valeur_test="oui",
                   nom_test="colnames_type",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="2.1.2",
                   nom_test_precis="colnames_type_numeric",
                   # test="format_data.frame",
                   message=paste0("")
                   # )
    )
  }else{
    test <- tibble(noms_colonnes_non_conforme=noms_colonnes[verif],
                   test="2.1",
                   valeur_test="non",
                   nom_test="colnames_type",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   # test_precis=paste0("2.1.2_",i),
                   # test="format_data.frame",
                   nom_test_precis="colnames_type_numeric") %>%
      mutate( test_precis=paste0("2.1.2_",noms_colonnes_non_conforme),
        message=paste0("La variable suivante ",
                            noms_colonnes_non_conforme,
                            " n'est pas dans le bon type de données (numeric).")
             # )
      )
  }
  return(test %>% select(-noms_colonnes_non_conforme))
}

f_format_type_character <- function(data,noms_colonnes,table_orig){
  ##
  verif <- which(
    sapply(noms_colonnes,
           function(i)
             ! is.character(data %>% pull(i)))
  )
  ##
  if(length(verif)==0){
    test <- tibble(noms_colonnes_non_conforme="",
                   test="2.1",
                   valeur_test="oui",
                   nom_test="colnames_type",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="2.1.1",
                   # test="format_data.frame",
                   nom_test_precis="colnames_type_character",
                   message=paste0("")
                   # )
    )
  }else{
    test <- tibble(noms_colonnes_non_conforme=noms_colonnes[verif],
                   test="2.1",
                   valeur_test="non",
                   nom_test="colnames_type",
                   table_orig=table_orig,
                   test_precis=paste0("2.1.1",i),
                   # test="format_data.frame",
                   nom_test_precis="colnames_type_character") %>%
      mutate(test_precis=paste0("2.2.1",noms_colonnes_non_conforme),
             message=paste0("La variable suivante ",
                            noms_colonnes_non_conforme,
                            " n'est pas dans le bon type de données (chaîne de caractères).")
      )
  }
  return(test %>% select(-noms_colonnes_non_conforme))
}


f_format_value_positive <- function(data,noms_colonnes,table_orig){
  ##
  test <- NULL
  ##
  verif <- sapply(noms_colonnes,
                  function(i)
                    (
                      sum(data %>% pull(i)>0,na.rm=TRUE) == nrow(data)
                    )
  )
  ##
  if(sum(verif) == length(noms_colonnes)){
    test <- tibble(test="2.2",
                   valeur_test="oui",
                   nom_test="colnames_value",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis=paste0("2.2.1_",i),
                   nom_test_precis="colnames_value_positive",
                   # test="format_data.frame",
                   message=paste0("")
                   # )
    )
  }else{
    for(i in noms_colonnes[verif==FALSE]){
      verif <- which(
        (data %>% pull(i)<0)
      )

      ##
      test <- bind_rows(test,
                        tibble(test="2.2",
                               valeur_test="non",
                               nom_test="colnames_value",
                               table_orig=table_orig,
                               # sortie=data.frame(
                               test_precis=paste0("2.2.1_",i),
                               # test="format_data.frame",
                               nom_test_precis="colnames_value_positive",
                               message=paste0("La variable suivante ",
                                              i,
                                              " possèdent ",length(verif)," valeur(s) négative(s).")
                        )
      )
    }
  }
  return(test)
}

f_format_type_character <- function(data,noms_colonnes,table_orig){
  ##
  verif <- which(
    sapply(noms_colonnes,
           function(i)
             ! is.character(data %>% pull(i)))
  )
  ##
  if(length(verif)==0){
    test <- tibble(noms_colonnes_non_conforme="",
                   test="2.1",
                   valeur_test="oui",
                   nom_test="colnames_type",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="2.1.1",
                   # test="format_data.frame",
                   nom_test_precis="colnames_type_character",
                   message=paste0("")
                   # )
    )
  }else{
    test <- tibble(noms_colonnes_non_conforme=noms_colonnes[verif],
                   test="2.1",
                   valeur_test="non",
                   nom_test="colnames_type",
                   table_orig=table_orig,
                   # test_precis=paste0("2.1.1",i),
                   # test="format_data.frame",
                   nom_test_precis="colnames_type_character") %>%
      mutate(test_precis=paste0("2.1.1",noms_colonnes_non_conforme),
             message=paste0("La variable suivante ",
                            noms_colonnes_non_conforme,
                            " n'est pas dans le bon type de données (chaîne de caractères).")
      )
  }
  return(test %>% select(-noms_colonnes_non_conforme))
}


f_format_value_vide <- function(data,noms_colonnes,table_orig){
  ##
  test <- NULL
  ##
  verif <- sapply(noms_colonnes,
                  function(i)
                    (
                      sum(!(data %>% pull(i) %in% c(NA,""))) == nrow(data)
                    )
  )
  ##
  if(sum(verif) == length(noms_colonnes)){
    test <- tibble(test="2.2",
                   valeur_test="oui",
                   nom_test="colnames_value",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="2.2.1",
                   nom_test_precis="colnames_value_empty",
                   # test="format_data.frame",
                   message=paste0("")
                   # )
    )
  }else{
    for(i in noms_colonnes[verif==FALSE]){
      verif <- which(
        (data %>% pull(i) %in% c(NA,""))
      )

      ##
      test <- bind_rows(test,
                        tibble(test="2.2",
                               valeur_test="non",
                               nom_test="colnames_value",
                               table_orig=table_orig,
                               # sortie=data.frame(
                               test_precis=paste0("2.2.1_",i),
                               # test="format_data.frame",
                               nom_test_precis="colnames_value_empty",
                               message=paste0("La variable suivante ",
                                              i,
                                              " possèdent ",length(verif)," valeur(s) vide(s).")
                        )
      )
    }
  }
  return(test)
}


f_format_value_interval <- function(data,noms_colonnes,mini,maxi,table_orig){
  ##
  test <- NULL
  ##
  verif <- sapply(noms_colonnes,
                  function(i)
                    (
                      sum(dplyr::between(data %>%
                                           pull(i),
                                         left = mini,
                                         right = maxi),
                          na.rm=TRUE) == nrow(data)
                    )
  )
  ##
  if(sum(verif) == length(noms_colonnes)){
    test <- tibble(test="2.3",
                   valeur_test="oui",
                   nom_test="colnames_value",
                   table_orig=table_orig,
                   # sortie=data.frame(
                   test_precis="2.3.1",
                   nom_test_precis="colnames_value_interval",
                   # test="format_data.frame",
                   message=paste0("")
                   # )
    )
  }else{
    for(i in noms_colonnes[verif==FALSE]){
      verif <- which(
        (dplyr::between(data %>%
                          pull(i),
                        left = mini,
                        right = maxi) %in% c(NA,FALSE))
      )

      ##
      test <- bind_rows(test,
                        tibble(test="2.3",
                               valeur_test="non",
                               nom_test="colnames_value",
                               table_orig=table_orig,
                               # sortie=data.frame(
                               test_precis=paste0("2.3.1_",i),
                               # test="format_data.frame",
                               nom_test_precis="colnames_value_interval",
                               message=paste0("La variable suivante ",
                                              i,
                                              " possèdent ",length(verif)," valeur(s) non comprises dans l'intervalle [",mini,";",maxi,"].\n Lignes :",paste0(verif,collapse = ", "))
                        )
      )
    }
  }
  return(test)
}
# f_format_colnames(data=table_test,noms_colonnes=c("a"),table_orig="tibblee flore")

table_test<- tibble(a=c(1:5,NA,-2),
                    b=letters[1:7],
                    c=c(-12,2:6,-2),
                    d=c(1:6,"a")
)

# f_format_value_positive(table_test,
#                         "a",
#                         table_orig="liste floristique") %>%
#   select(message)




bind_rows(
    f_format_table(table_test,table_orig="tibble flore"),
    f_format_colnames(table_test,
                      noms_colonnes=c("a","b","c","d","e"),
                      table_orig="tibble flore")
)



bind_rows(
  f_format_value_vide(table_test,c("a","b","c","d"),"liste"),
  f_format_type_character(table_test,c("b"),"liste"),
  f_format_type_numeric(table_test,c("a","b","c","d"),"liste"),
  f_format_value_positive(table_test,c("a","b","c","d"),"liste"),
  f_format_value_interval(table_test,c("a","c"),mini=2,maxi=5,"liste")
)


# library(tidyverse)

