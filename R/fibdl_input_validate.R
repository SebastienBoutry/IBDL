fibdl_checkof_listflor <- function(data){
  ##
  table_orig <- "liste flore"
  ##
  step_1 <- CheckOfTable::fcot_table(data,table_orig=table_orig)
  if(step_1$valeur_test=="Oui"){
    step_2 <- CheckOfTable::fcot_colnames(data,table_orig=table_orig)
    if(step_2$valeur_test=="Oui"){
      bind_rows(
      #   fcot_value_vide(table_test,
      #                   c("a","b","c","d"),
      #                   table_orig),
      #   fcot_type_character(table_test,
      #                       c("b"),
      #                       table_orig),
      #   fcot_type_numeric(table_test,
      #                     c("a","b","c","d"),
      #                     table_orig),
      #   fcot_value_positive(table_test,
      #                       c("a","b","c","d"),
      #                       table_orig),
      #   fcot_value_interval(table_test,
      #                       c("a","c"),
      #                       mini=2,
      #                       maxi=5,table_orig)
      # ) %>%
      #   select(message)
    }else{
      return(step_2)
    }
  }else{
    return(step_1)
  }
}
  # bind_rows(
  #   f_format_table(data,table_orig="liste flore"),
  #   f_format_colnames(data,
  #                     noms_colonnes=c(""),
  #                     table_orig="liste flore")
  # )



  bind_rows(
    f_format_value_vide(table_test,c("a","b","c","d"),"liste"),
    f_format_type_character(table_test,c("b"),"liste"),
    f_format_type_numeric(table_test,c("a","b","c","d"),"liste"),
    f_format_value_positive(table_test,c("a","b","c","d"),"liste"),
    f_format_value_interval(table_test,c("a","c"),mini=2,maxi=5,"liste")
  ) %>%
    select(message)

  ##
}
