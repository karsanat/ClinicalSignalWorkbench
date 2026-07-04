# Clinical Signal Engine
# Foundation implementation. Additional analytics will be added in future commits.

signal_summary <- function(data, value_col, group_cols=NULL){
  stopifnot(value_col %in% names(data))
  if(is.null(group_cols)){
    return(data.frame(
      N=sum(!is.na(data[[value_col]])),
      Mean=safe_mean(data[[value_col]]),
      SD=safe_sd(data[[value_col]]),
      Min=min(data[[value_col]],na.rm=TRUE),
      Median=stats::median(data[[value_col]],na.rm=TRUE),
      Max=max(data[[value_col]],na.rm=TRUE)
    ))
  }
  data |>
    dplyr::group_by(dplyr::across(dplyr::all_of(group_cols))) |>
    dplyr::summarise(
      N=sum(!is.na(.data[[value_col]])),
      Mean=safe_mean(.data[[value_col]]),
      SD=safe_sd(.data[[value_col]]),
      CV=cv_percent(.data[[value_col]]),
      Min=min(.data[[value_col]],na.rm=TRUE),
      Median=stats::median(.data[[value_col]],na.rm=TRUE),
      Max=max(.data[[value_col]],na.rm=TRUE),
      .groups='drop')
}

trend_direction <- function(x){
  ok<-!is.na(x)
  x<-x[ok]
  if(length(x)<3) return('Insufficient')
  s<-coef(stats::lm(x~seq_along(x)))[2]
  if(s>0) 'Increasing' else if(s<0) 'Decreasing' else 'Stable'
}

peak_info <- function(x){
  i<-which.max(x)
  list(index=i,peak=x[i])
}
