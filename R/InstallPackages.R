# Title     : Install Packages
# Objective : Install Packages
# Created by: Think
# Created on: 19/10/2021

InstallPackages <- function (){

  # A list of packages
  #   docstrings: roxygen
  #   latex: latex2exp
  packages <- c('data.table', 'tidyverse', 'ggplot2', 'roxygen2', 'latex2exp')

  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages, .activate)

  # Active libraries
  sessionInfo()

}