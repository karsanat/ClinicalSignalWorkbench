# Utility functions

`%||%` <- function(x,y) if (is.null(x)) y else x

validate_adam <- function(dat, required){
 miss <- setdiff(required, names(dat))
 if(length(miss)) stop(sprintf('Missing columns: %s', paste(miss, collapse=', ')), call.=FALSE)
 TRUE
}

safe_mean <- function(x){
 if(all(is.na(x))) return(NA_real_)
 mean(x, na.rm=TRUE)
}

safe_sd <- function(x){
 if(sum(!is.na(x))<2) return(NA_real_)
 stats::sd(x, na.rm=TRUE)
}

cv_percent <- function(x){
 m <- safe_mean(x)
 s <- safe_sd(x)
 if(is.na(m)||m==0) return(NA_real_)
 100*s/m
}

rescale01 <- function(x){
 r <- range(x, na.rm=TRUE)
 (x-r[1])/(r[2]-r[1])
}
