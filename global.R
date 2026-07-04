# Global configuration for Clinical Signal Workbench

options(shiny.maxRequestSize = 1024^3)
options(stringsAsFactors = FALSE)

required_packages <- c(
  'shiny','bslib','plotly','DT','reactable','dplyr','tidyr','ggplot2','data.table','haven','future','promises'
)

invisible(lapply(required_packages, function(pkg){
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(sprintf('Required package %s is not installed.', pkg), call. = FALSE)
  }
  library(pkg, character.only = TRUE)
}))

APP_TITLE <- 'Clinical Signal Intelligence Workbench'
APP_VERSION <- '0.1.0'

clinical_env <- new.env(parent = emptyenv())
clinical_env$adam <- list()
clinical_env$metadata <- list()
