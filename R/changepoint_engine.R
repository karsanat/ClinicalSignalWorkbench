# Change-point detection utilities

find_mean_changepoint <- function(values){
 if(!requireNamespace('changepoint', quietly=TRUE)) stop('Package changepoint required.')
 fit <- changepoint::cpt.mean(values, method='PELT')
 list(index=changepoint::cpts(fit), fit=fit)
}

annotate_changepoints <- function(data, value_col){
 cp <- find_mean_changepoint(data[[value_col]])$index
 data$CHANGEPOINT <- FALSE
 if(length(cp)>0) data$CHANGEPOINT[cp] <- TRUE
 data
}
