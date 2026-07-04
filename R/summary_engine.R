# Summary engine

parameter_summary <- function(data, parameter_col, value_col){
 data |>
 dplyr::group_by(.data[[parameter_col]]) |>
 dplyr::summarise(N=dplyr::n(),Mean=safe_mean(.data[[value_col]]),SD=safe_sd(.data[[value_col]]),Median=stats::median(.data[[value_col]],na.rm=TRUE),.groups='drop')
}
