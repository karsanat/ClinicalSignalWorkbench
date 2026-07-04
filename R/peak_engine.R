# Peak and nadir analytics

find_peak_nadir <- function(data, value_col, visit_col){
 stopifnot(all(c(value_col, visit_col) %in% names(data)))
 vals <- data[[value_col]]
 peak_idx <- which.max(vals)
 nadir_idx <- which.min(vals)
 data.frame(
 PeakValue=vals[peak_idx],
 PeakVisit=data[[visit_col]][peak_idx],
 NadirValue=vals[nadir_idx],
 NadirVisit=data[[visit_col]][nadir_idx]
 )
}

peak_change <- function(baseline, values){
 p <- max(values, na.rm=TRUE)
 data.frame(AbsoluteChange=p-baseline, PercentChange=100*(p-baseline)/baseline)
}

detect_large_changes <- function(values, threshold_sd=2){
 d <- diff(values)
 z <- d/stats::sd(d, na.rm=TRUE)
 which(abs(z)>=threshold_sd)+1
}
