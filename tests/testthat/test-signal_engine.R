library(testthat)

source('R/utils.R')
source('R/signal_engine.R')

test_that('trend_direction works',{
 expect_equal(trend_direction(c(1,2,3,4)), 'Increasing')
 expect_equal(trend_direction(c(4,3,2,1)), 'Decreasing')
})

test_that('peak_info returns max',{
 p<-peak_info(c(2,5,3))
 expect_equal(p$peak,5)
 expect_equal(p$index,2)
})
