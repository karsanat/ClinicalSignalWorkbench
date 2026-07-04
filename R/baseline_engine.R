# Baseline analysis engine

baseline_records <- function(data, id_col='USUBJID', visit_col='AVISIT', baseline_label='Baseline'){
 data[data[[visit_col]]==baseline_label,,drop=FALSE]
}

change_from_baseline <- function(data, id_col='USUBJID', value_col='AVAL', base_col='BASE'){
 data$CHG <- data[[value_col]] - data[[base_col]]
 data
}
