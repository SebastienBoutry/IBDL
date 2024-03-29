% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fibdl_checkof_listflor.R
\name{fibdl_checkof_listflor}
\alias{fibdl_checkof_listflor}
\title{Contrôle du tableau liste floristique pour le calcul de l'IBDL}
\usage{
fibdl_checkof_listflor(data)
}
\arguments{
\item{data}{tableau représentant la liste floristique}
}
\description{
Contrôle du tableau liste floristique pour le calcul de l'IBDL
}
\examples{
list_flor <- read.csv2(system.file("listflor.csv", package = "IBDL"),fileEncoding = "utf-8")
fibdl_checkof_listflor(list_flor)
}
