# Longitudinal trend utilities

calculate_visit_slopes <- function(data, id_col, visit_col, value_col){
  data |>
    dplyr::arrange(.data[[id_col]], .data[[visit_col]]) |>
    dplyr::group_by(.data[[id_col]]) |>
    dplyr::mutate(
      CHANGE = .data[[value_col]] - dplyr::lag(.data[[value_col]]),
      PCT_CHANGE = 100 * CHANGE / dplyr::lag(.data[[value_col]])
    ) |>
    dplyr::ungroup()
}

classify_trend <- function(values){
  d <- trend_direction(values)
  if(d == 'Increasing') return('Worsening')
  if(d == 'Decreasing') return('Improving')
  'Stable'
}

visit_summary <- function(data, visit_col, value_col){
  data |>
    dplyr::group_by(.data[[visit_col]]) |>
    dplyr::summarise(
      N=dplyr::n(),
      Mean=safe_mean(.data[[value_col]]),
      SD=safe_sd(.data[[value_col]]),
      Median=stats::median(.data[[value_col]], na.rm=TRUE),
      .groups='drop')
}
