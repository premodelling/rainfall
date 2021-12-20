# Title     : Install Packages
# Objective : Install Packages
# Created by: Think
# Created on: 19/10/2021

InstallPackages <- function (){

  # A list of packages
  #   docstrings: roxygen
  #   latex: latex2exp
  packages <- c('data.table', 'tidyverse', 'ggplot2', 'roxygen2', 'latex2exp', 'moments', 'rmarkdown', 'stringr',
                'mapview', 'healthcareai', 'equatiomatic', 'rstatix')

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
  lapply(packages[!(packages %in% c('tidyverse', 'healthcareai', 'equatiomatic'))], .activate)

  # Active libraries
  sessionInfo()

}